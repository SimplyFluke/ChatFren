# Hashtable containing wanted output
$outputHash = @{
"Passord Azure" = "https://passwordreset.microsoftonline.com/`r`n`r`n-Skriv epost adresse først`r`n-Velg 'Glemt passord'`r`n-Skriv Telefonnummer deretter`r`n-Skriv inn kode du mottar på SMS`r`n-Lag deg et passord`r`n-Minimum 8 tegn (Store/små bokstaver og tall)`r`n-Ingen spesialtegn eller æøå.";
"Chat - Ingen svar" = "Samtalen lukkes da vi ikke får noe respons tilbake. `r`nHvis du har flere spørsmål kan du benytte Selvbetjeningsportalen, nettprat eller ringe inn til IT-brukerhjelp :-) `r`nHa en fin dag!";
"Henvisning Helsesupport" = "Du må melde en sak til Helsesupport via Selvbetjeningsportalen. `r`nVelg 'Opprett sak' under IT-brukerhjelp, og når du skal velge påvirket tjeneste velger du Helseplattformen. Da går saken direkte til de. :-) `r`nVi har dessverre ikke tilganger eller kunnskap inne i selve Epic, så dette er noe de må sjekke opp.";
"Automatisk Reparasjon" = "- Avanserte alternativer `r`n- Feilsøking `r`n- Tilbakestill PC `r`n- Fjern alt`r`n- Gjenopprettingsnøkkel: `r`n- Lokal ny installasjon`r`n- Fjern filene mine`r`n`r`nDersom dette ikke fungerer må PXE-boot forsøkes:`r`nhttps://docs.google.com/document/d/1LpRE7uEKBZCP1QlzNDFlGHK8C4qoj5DIxrO2IAYe_zc/edit#";
"Henvisning ID-Kontoret" = "Dette må du ta opp med ID-kontoret.`r`n`r`nE-post: id-kontor.postmottak@trondheim.kommune.no`r`nTlf: 991 00 247`r`nSe her for mer informasjon om  ID-kort:`r`nhttps://intranett.trondheim.kommune.no/idkontoret/";
"Henvisning ESA" = "Dette er en problemstilling som skal rettes til ESA-brukerhjelp.`r`n`r`nESA-brukerhjelp kontaktes via Selvbetjeningsportalen:`r`nhttps://trondheim.service-now.com/tk";
"Citrix - Flere skjermer" = "- Høyreklikk på skrivebordet `r`n- Velg skjerminnstillinger`r`n- Sjekk at tallet under 'Skala og oppsett' er det samme på alle på alle skjermer. (f.eks 125%)";
"Guide - PXE Boot" = "https://docs.google.com/document/d/1LpRE7uEKBZCP1QlzNDFlGHK8C4qoj5DIxrO2IAYe_zc/edit#";
"Strømfiks" = "1. Ta ut strøm fra pc om denne står i /evt. ta pc ut fra docking`r`n2. Trykk og hold inn av/på knappen kontinuerlig i 60 sekunder (ikke slipp)`r`n3. Dermed sett strømkabel i pc/docking og skru på maskinen.";
"Google-dokumenter forsvinner" = "- Gå inn på https://drive.google.com `r`n- Trykk på hengelåsen som henger til venstre for nettadressen.`r`n- Velg 'Informasjonskapsler'`r`n- Marker 'drive.google.com' og velg fjern og deretter ferdig.`r`n- Last inn siden på nytt etterpå.";
"KB - Tilbakestille Chrome" = "https://trondheim.service-now.com/tk?id=kb_article_view&sysparm_article=KB0011607";
"KB - TK-Nett Android" = "https://trondheim.service-now.com/tk?id=kb_article_view&sys_kb_id=8931031e4fde17802c8244f18110c7f3";
"KB - TK-Nett iPhone" = "https://trondheim.service-now.com/tk?id=kb_article_view&sys_kb_id=f3afe4b21b420018a32edc27bd4bcb67";
"KB - TKsak Chrome-tillegg (ou)" = "https://trondheim.service-now.com/tk?sys_kb_id=697188821b93d510170aa9b3b24bcbd5&id=kb_article_view&sysparm_rank=1&sysparm_tsqueryId=ab4448821bd3d510170aa9b3b24bcb16";
"KB - TKsak Chrome-tillegg" = "https://trondheim.service-now.com/tk?sys_kb_id=5dd8fb711b13d510170aa9b3b24bcbfe&id=kb_article_view&sysparm_rank=2&sysparm_tsqueryId=ab4448821bd3d510170aa9b3b24bcb16";
"KB - Aktivere 2-trinns" = "https://trondheim.service-now.com/tk?id=kb_article&sys_id=e508ed661b9f9d10dfcd64e0b24bcb74&table=kb_knowledge";
"Chromebook - Tar ikke lading" = "- Sjekk at lader fungerer på en annen Chromebook`r`n- Forsøk med en annen lader. Gjerne to samtidig.`r`n- La lader stå tilkoblet i 24 timer";
"Chromebook - Nettverk / Bruker" = "- Forsøk å slett lokal brukerprofil. Dette gjøres på pila ved siden av navnet til eleven/den ansatte.`r`n- Dersom dette ikke fungerer, må powerwash forsøkes";
"Chromebook - Svart skjerm" = "Chromebook må kobles opp mot en ekstern skjerm. Dersom bilde kommer opp, forsøk en powerwash (tilbakestilling).`r`n- Trykk ned tastene CTRL + SHIFT + ALT + R samtidig når innloggingsskjerm er oppe.`r`n- Velg Restart`r`n- Når Chromebook starter på nytt, velg Powerwash og deretter Continue `r`n- Etter ny omstart, velg Get Started`r`n- Velg TK-gjestenett og trykk Next`r`n- Trykk på Accept and continue ";
"Omnigo Innlogging Spinner" = "- Pass på at 'Bruk Skytjenesten' ikke er valgt.`r`n- Er Cisco AnyConnect koblet til? (Indikeres med en nøkkel oppe i høyre hjørne ved klokken)`r`n- Er telefonen i flymodus? (Indikeres med et fly oppe i høyre hjørne ved klokken)";
}

# Hashtable containing for hyperlinks in SN notes
$snHash = @{
    "Passord Azure" = "-Skriv epost adresse først`r`n-Velg 'Glemt passord'`r`n-Skriv Telefonnummer deretter`r`n-Skriv inn kode du mottar på SMS`r`n-Lag deg et passord`r`n-Minimum 8 tegn (Store/små bokstaver og tall)`r`n-Ingen spesialtegn eller æøå.`r`n`r`nhttps://passwordreset.microsoftonline.com/";
"KB - TK-Nett iPhone" = '[code]<a href="https://trondheim.service-now.com/tk?id=kb_article_view&sys_kb_id=f3afe4b21b420018a32edc27bd4bcb67" target="_blank">TK-nett: tilkobling til nettverk med iPhone</a>[/code]';
"KB - TK-Nett Android" = '[code]<a href="https://trondheim.service-now.com/tk?id=kb_article_view&sys_kb_id=8931031e4fde17802c8244f18110c7f3" target="_blank">TK-nett: tilkobling til nettverk med Android-enheter</a>[/code]';
"KB - Tilbakestille Chrome" = '[code]<a href="https://trondheim.service-now.com/tk?id=kb_article_view&sysparm_article=KB0011607" target="_blank">KB0011607: Chrome - hvordan tilbakestille nettleser </a>[/code]';
"KB - TKsak Chrome-tillegg (ou)" = '[code]<a href="https://trondheim.service-now.com/tk?sys_kb_id=697188821b93d510170aa9b3b24bcbd5&id=kb_article_view&sysparm_rank=1&sysparm_tsqueryId=ab4448821bd3d510170aa9b3b24bcb16" target="_blank">Chrome-tillegg for TKsak - ou</a>[/code]';
"KB - TKsak Chrome-tillegg" = '[code]<a href="https://trondheim.service-now.com/tk?sys_kb_id=5dd8fb711b13d510170aa9b3b24bcbfe&id=kb_article_view&sysparm_rank=2&sysparm_tsqueryId=ab4448821bd3d510170aa9b3b24bcb16" target="_blank">Chrome-tillegg for TKsak</a>[/code]';
"KB - Aktivere 2-trinns" = '[code]<a href="https://trondheim.service-now.com/tk?id=kb_article&sys_id=e508ed661b9f9d10dfcd64e0b24bcb74&table=kb_knowledge" target="_blank">KB: Aktivere 2-trinns</a>[/code]';
"Guide - PXE Boot" = '[code]<a href="https://docs.google.com/document/d/1LpRE7uEKBZCP1QlzNDFlGHK8C4qoj5DIxrO2IAYe_zc/edit#" target="_blank">Guide: PXE Boot</a>[/code]';
}

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
    $options = ('Chat - Ingen svar','Henvisning Helsesupport', 'Passord Azure', 'Automatisk Reparasjon', "Omnigo Innlogging Spinner",
                    'Henvisning ID-Kontoret','Henvisning ESA', 'Citrix - Flere skjermer', 'Guide - PXE Boot', "Strømfiks", 
                    "KB - TKsak Chrome-tillegg", "KB - TKsak Chrome-tillegg (ou)", "Google-dokumenter forsvinner", "Chromebook - Svart skjerm", 
                    "Chromebook - Nettverk / Bruker", "Chromebook - Tar ikke lading", "KB - Tilbakestille Chrome", "KB - TK-Nett Android", "KB - TK-Nett iPhone",
                    "KB - Aktivere 2-trinns")

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
    $checkBox.Text = "SN Note / Chat"

    $checkBox.Add_Click({
        If ($checkBox.Checked -eq $true){
            If ($snHash.ContainsKey($selectedItem)){
                $textBox.Text = $snHash[$selectedItem]
            }
        } Else {
            $textBox.Text = $outputHash[$selectedItem]
        } 
    })

    $chatFren_form.Controls.Add($checkBox)

    # React on comboBox selection
    $comboBox.add_SelectedIndexChanged({
        $global:selectedItem = $ComboBox.SelectedItem
        $textBox.Text = $outputHash[$selectedItem]
        })

    # Copy selection on button click
    $Button.Add_Click({
        If ($null -eq $selectedItem){
            return
        }
        
        If ($checkBox.Checked -eq $true){
        # Check if key exists in case SN Note is checked by accident
            
            If ($snHash.ContainsKey($selectedItem)){
                Set-Clipboard -Value $snHash[$selectedItem]}
            
            Else {
                Set-Clipboard -Value $outputHash[$selectedItem]}}
        Else {
            Set-Clipboard -Value $outputHash[$selectedItem]
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

