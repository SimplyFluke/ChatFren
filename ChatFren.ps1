# Hide terminal
$Script:showWindowAsync = Add-Type -MemberDefinition @"
[DllImport("user32.dll")]
public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);
"@ -Name "Win32ShowWindowAsync" -Namespace Win32Functions -PassThru

Function Hide-Powershell()
{
    $null = $showWindowAsync::ShowWindowAsync((Get-Process -Id $pid).MainWindowHandle, 2)
}


# Setup Windows alert
Function winAlert {
    [CmdletBinding()]
    param (
        [Parameter()]    
        $Text,
        [Parameter()]
        $Title
    )
    
    Add-Type -AssemblyName System.Windows.Forms
    [reflection.assembly]::loadwithpartialname('System.Drawing')

    if ($null -eq $Global:balloonToolTip){
        $global:balloonToolTip = New-Object System.Windows.Forms.NotifyIcon #  Leaves one dead icon in systray.
    }

    $balloonToolTip.Icon = [System.Drawing.SystemIcons]::Information
    $balloonToolTip.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
    $balloonToolTip.BalloonTipTitle = $Title
    $balloonToolTip.Visible = $true
    $balloonToolTip.BalloonTipText = $Text
    $balloonToolTip.ShowBalloonTip(5000)
}

Add-Type -assembly System.Windows.Forms
Add-Type -AssemblyName PresentationFramework
[System.Windows.Forms.Application]::EnableVisualStyles()


function Create_Form_Chatfren(){
    $files = @() # Create dropdown options from .txt files
    foreach($file in (Get-ChildItem -path C:\Users\KJOD\Scripts\Powershell\ChatFren\Maler -Filter "*.txt")){   
        $file = $file.Name
        $file = $file.Replace(".txt", "")
        $files += $file
        }

    # Main squeeze
    $chatFren_form = New-Object System.Windows.Forms.Form
    $chatFren_form.Text = 'ChatFren :)'
    $chatFren_form.Width = 375
    $chatFren_form.Height = 280
    $chatFren_form.StartPosition = 'CenterScreen'
    $chatFren_form.MaximizeBox = $false
    $chatFren_form.Topmost = $true
    $mainIcon = New-Object System.Drawing.Icon ($PSScriptRoot + "\icons\chat.ico")
    $chatFren_form.Icon = $mainIcon
    $chatFren_form.BackColor = "#FFFFFF"

    # Force size
    $chatFren_form.MinimumSize = New-Object System.Drawing.Size(375,280)
    $chatFren_form.MaximumSize = New-Object System.Drawing.Size(375,280)

    # Clean up on form close
    $chatFren_form.Add_Closing({param($e)
        $systray_Chatfren.Checked = $false
        })

    # Add combobox
    $ComboBox = New-Object System.Windows.Forms.ComboBox
    $ComboBox.Width = 200
    $ComboBox.Size = New-Object System.Drawing.Size(240)
    $ComboBox.Location = New-Object System.Drawing.Point(65,10)
    $ComboBox.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)
    $ComboBox.AutoCompleteMode = 'Append'
    $ComboBox.AutoCompleteSource = 'ListItems'
    $ComboBox.MaxDropDownItems = 25
    $ComboBox.Sorted = $true
    $chatFren_form.Controls.Add($ComboBox)

    # Add options to ComboBox
    $options = ($files)

    $ComboBox.Items.AddRange($options)

    # Add button
    $Button = New-Object System.Windows.Forms.Button
    $Button.Location = New-Object System.Drawing.Size(115,210)
    $Button.Size = New-Object System.Drawing.Size(70,25)
    $Button.Text = "Copy"
    $Button.BackColor = "#eeeeee"
    $chatFren_form.Controls.Add($Button)

    # Add textbox
    $textBox = New-Object System.Windows.Forms.TextBox
    $textBox.Location = New-Object System.Drawing.Point(20,40)
    $textBox.Size = New-Object System.Drawing.Size(320,160)
    $textBox.Height = 160
    $textBox.Multiline = $true
    $chatFren_form.Controls.Add($textBox)
    $textBox.ReadOnly = $true
    $textBox.Font = New-Object System.Drawing.Font("Verdana",8,[System.Drawing.FontStyle]::Regular)

    # Add checkbox // Wrap URLs for hyperlinking in SN notes
    $checkBox = New-Object System.Windows.Forms.Checkbox
    $checkBox.location = New-Object System.Drawing.Size(210, 210)
    $checkBox.Text = "SN Note"

    $checkBox.Add_Click({
        $content = Get-Content -Path ("C:\Users\KJOD\Scripts\Powershell\ChatFren\Maler\" + $selectedItem + ".txt") -Encoding "utf8" -raw
        If ($checkBox.Checked -eq $true){  
            $textBox.Text = '[code]<a href="' + $content + '" target="_blank">' + $selectedItem + '</a>[/code]'
        
        } Else {
            $textBox.Text = $content
        } 
    })

    $chatFren_form.Controls.Add($checkBox)

    # React on comboBox selection
    $comboBox.add_SelectedIndexChanged({
        $global:selectedItem = $ComboBox.SelectedItem
        $content = Get-Content -Path ("C:\Users\KJOD\Scripts\Powershell\ChatFren\Maler\" + $selectedItem + ".txt") -Encoding "utf8" -raw
        If($checkBox.Checked -eq $true){
            $textBox.Text = '[code]<a href="' + $content + '" target="_blank">' + $selectedItem + '</a>[/code]'
        
        } Else {
        $textBox.Text = $content
        }})

    # Copy selection on button click
    $Button.Add_Click({
        If ($null -eq $selectedItem){
            return
        }

        $content = Get-Content -Path ("C:\Users\KJOD\Scripts\Powershell\ChatFren\Maler\" + $selectedItem + ".txt") -Encoding "utf8" -raw
        If ($checkBox.Checked -eq $true){
            Set-Clipboard -Value ('[code]<a href="' + $content + '" target="_blank">' + $selectedItem + '</a>[/code]')}

        Else {
            Set-Clipboard -Value $content
        }

        if ($systray_alerts.Checked -eq $true){
            winAlert("Copied text: ", $selectedItem)
    }})

    $chatFren_form.ShowDialog()
}


# Add tray icon & options 
$systray_icon = New-Object System.Windows.Forms.NotifyIcon
$systray_icon.Text = "ChatFren"
$systray_icon.Icon = $PSScriptRoot + "\icons\chat.ico"
$systray_icon.Visible = $true

$systray_exit = New-Object System.Windows.Forms.MenuItem
$systray_exit.Text = "Exit"
$systray_exit.Add_Click({
    $systray_icon.Dispose();$chatFren_form.Dispose();$balloonToolTip.Dispose()
})

$systray_alerts = New-Object System.Windows.Forms.MenuItem
$systray_alerts.Text = "Enable alerts"
$systray_alerts.Checked = $true
$systray_alerts.Add_Click({
    if ($systray_alerts.Checked -eq $true){
        $systray_alerts.Checked = $false
    } else {
        $systray_alerts.Checked = $true
    }
})


$systray_CSV = New-Object System.Windows.Forms.MenuItem
$systray_CSV.Text = "CSV Uploader"
$systray_CSV.Add_Click({
        Start-Process PowerShell {.\CSV_Uploader.ps1}
})

$contextmenu = New-Object System.Windows.Forms.ContextMenu
$systray_icon.ContextMenu = $contextmenu
$systray_icon.ContextMenu.MenuItems.AddRange($systray_CSV)
$systray_icon.ContextMenu.MenuItems.AddRange($systray_alerts)
$systray_icon.ContextMenu.MenuItems.AddRange($systray_exit)


Hide-Powershell
Create_Form_Chatfren

