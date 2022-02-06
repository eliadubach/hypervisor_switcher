#  ============== Hyperswitch PS GUI=======================================

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -Assembly System.Drawing 
$Form = New-Object system.Windows.Forms.Form

$Form.ShowIcon = $True
$Form.Icon = New-Object system.drawing.icon 'C:\Users\eliad\Downloads\images.ico'
                         
[int32]$height = 80
[int32]$width = 360
$Form.ClientSize                 = "$width,$height"
$Form.text                       = "Hyperswitch"
$Form.TopMost                    = $false


$button = New-Object system.Windows.Forms.Button
$button.width                   = 100	
$button.height                  = 50
$button.text					= "Hyper-V"
$button.location                = New-Object System.Drawing.Point(50,10)
$button.Font                    = 'Microsoft Sans Serif,10'
$button.Add_Click({

bcdedit /set hypervisorlaunchtype off | Out-Null
$remember=[System.Windows.Forms.MessageBox]::Show("$($selection.Application) Successfully changed! The PC must be restarted. Do you want to restart now?" , "Restart" , 4)
if ($remember -eq "Yes") {restart-Computer}else {write-host "Bye"}


})
$button2 = New-Object system.Windows.Forms.Button
$button2.width                  = 100	
$button2.height                 = 50
$button2.text					= "Vmware"
$button2.location               = New-Object System.Drawing.Point(200,10)
$button2.Font                   = 'Microsoft Sans Serif,10'
$button2.Add_Click({

bcdedit /set hypervisorlaunchtype auto | Out-Null
$remember=[System.Windows.Forms.MessageBox]::Show("$($selection.Application) Successfully changed! The PC must be restarted. Do you want to restart now?" , "Restart" , 4)
if ($remember -eq "Yes") {restart-Computer}else {write-host "Bye"}

})
$Form.controls.Add($button)
$Form.controls.Add($button2)
#Start form 
[void]$Form.ShowDialog()