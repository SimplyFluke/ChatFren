# Hide terminal
$Script:showWindowAsync = Add-Type -MemberDefinition @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@ -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru

Function Hide-Powershell()
{
    $null = $showWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 2)
}

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
[reflection.assembly]::loadwithpartialname('System.Drawing')


Function CSV_Uploader_Form(){
    $get_Email = whoami /upn

    # Main form
    $CSV_form = New-Object System.Windows.Forms.Form
    $CSV_form.Text = 'CSV Uploader'
    $CSV_form.Width = 450
    $CSV_form.Height = 200
    $CSV_form.StartPosition = 'CenterScreen'
    $CSV_form.MaximizeBox = $false
    $CSV_form.Topmost = $true
    $mainIcon = New-Object System.Drawing.Icon ($PSScriptRoot + "\icons\document.ico")
    $CSV_form.Icon = $mainIcon
    $CSV_form.BackColor = "#e7e7e7"
    $CSV_form.MaximizeBox = $false

    # Force size
    $CSV_form.MinimumSize = New-Object System.Drawing.Size(450,200)
    $CSV_form.MaximumSize = New-Object System.Drawing.Size(450,200)

    # Add recipient textbox
    $mail_Textbox = New-Object System.Windows.Forms.TextBox
    $mail_Textbox.Location = New-Object System.Drawing.Point(20,40)
    $mail_Textbox.Size = New-Object System.Drawing.Size(280,20)
    $mail_Textbox.Text = $get_Email
    $CSV_form.Controls.Add($mail_Textbox)
    $mail_Textbox.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)

    # Add recipient label
    $csv_Label = New-Object System.Windows.Forms.Label
    $csv_Label.Location = New-Object System.Drawing.Point(20,20)
    $csv_Label.Size = New-Object System.Drawing.Size(280,20)
    $csv_Label.Text = 'Recipient:'
    $csv_Label.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)
    $CSV_form.Controls.Add($csv_Label)

    # Add send-button
    $send_Button = New-Object System.Windows.Forms.Button
    $send_Button.Location = New-Object System.Drawing.Size(330, 37)
    $send_Button.Size = New-Object System.Drawing.Size(70,25)
    $send_Button.Text = "Send"
    $send_Button.BackColor = "#eeeeee"
    $CSV_form.Controls.Add($send_Button)

    # Run Python script on click
    $send_Button.Add_Click({
        if ("" -eq $csv_Textbox.Text){
            [System.Windows.MessageBox]::Show('Velg en CSV-fil.','CSV Uploader','OK','Error')
            return
        }
        Write-Host ("Running csvToSheet.py...")
        $csv_Script = $PSScriptRoot + '\csvToSheet.py'
        python.exe $csv_Script $get_Email $FileBrowser.FileName $FileBrowser.SafeFileName | Out-Host
        Write-Host($get_Email + " -- " + $FileBrowser.FileName + " -- " + $fileBrowser.SafeFileName)
    })

    # Add file selection textbox
    $csv_Textbox = New-Object System.Windows.Forms.TextBox
    $csv_Textbox.Location = New-Object System.Drawing.Point(20,100)
    $csv_Textbox.Size = New-Object System.Drawing.Size(280,20)
    $CSV_form.Controls.Add($csv_Textbox)
    $csv_Textbox.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)

    # Add file selection label
    $file_Label = New-Object System.Windows.Forms.Label
    $file_Label.Location = New-Object System.Drawing.Point(20,80)
    $file_Label.Size = New-Object System.Drawing.Size(280,20)
    $file_Label.Text = 'File:'
    $file_Label.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)
    $CSV_form.Controls.Add($file_Label)

    # Add file selection button
    $file_Button = New-Object System.Windows.Forms.Button
    $file_Button.Location = New-Object System.Drawing.Size(330, 97)
    $file_Button.Size = New-Object System.Drawing.Size(70,25)
    $file_Button.Text = "Select"
    $file_Button.BackColor = "#eeeeee"
    $CSV_form.Controls.Add($file_Button)

    # Choose .csv on button click
    $file_Button.Add_Click({
        $global:FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
            InitialDirectory = [Environment]::('Downloads')
            Filter = 'Documents (*.csv)|*.csv'
        }
        $FileBrowser.ShowDialog()
        $csv_Textbox.Text = $FileBrowser.FileName})


    if ($null -eq (Get-Command "Python" -ErrorAction SilentlyContinue)){
        [System.Windows.MessageBox]::Show('CSV Uploader krever Python. Dette kan installeres via Firmaportal. Avslutter.','CSV Uploader','OK','Error')
        return
    }
    # Clean up on form close
    $CSV_form.Add_Closing({param($e)
        $systray_CSV.Checked = $false
        })

    # Check for python modules
    $gSpread = pip show gspread
    $formatting = pip show gspread_formatting

    if ($null -eq $gSpread -and $null -eq $formatting){
        $msgBox = [System.Windows.MessageBox]::Show('Installer manglende Python-moduler: gspread, gspread_formatting','CSV Uploader','YesNo','Error')
        if ($msgBox -eq "Yes"){
            pip install gspread
            pip install gspread_formatting
        } else {
            return
        }
    } 
    ElseIf ($null -eq $gSpread){
        $msgBox = [System.Windows.MessageBox]::Show('Installer manglende Python-modul: gspread','CSV Uploader','YesNo','Error')
        if ($msgBox -eq "Yes"){
            pip install gspread
        } else {
            return
        }
    } 
    ElseIf ($null -eq $formatting){
        $msgBox = [System.Windows.MessageBox]::Show('Installer manglende Python-modul: gspread_formatting','CSV Uploader','YesNo','Error')
        if ($msgBox -eq "Yes"){
            pip install gspread_formatting
        } else {
            return
        }
    }

    $CSV_form.ShowDialog()
}


Hide-Powershell
CSV_Uploader_Form
