param(
    [Alias("L")]
    [int]$Length = 15,

    [Alias("S")]
    [switch]$Special,

    [Alias("N")]
    [switch]$Numbers,
	
	[Alias("H", "?")]
	[switch]$Help
)

if ($Help) { 
	Write-output "`n`tPasswordJenny is a super simple PowerShell script that genrates a random password`n`tcustomizable with the following input switches.`n`    
		-H, -? or -Help		Prints this help info`n`
		-L or Length		Customize generated password lenght - default is 15 characters`n`
		-S or -Special		Include special characters if -Special or -S is included`n`
		-N or -Numbers		Inlcude numbers if -Numbers or -N is included`n`n`
		Example: PassworJenny -s -n
		Output: ZkLc*3}]PAAz^F]`n"

} else {
	# Base character set (letters only)
	$chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

	# Add numbers if requested
	if ($Numbers) {
		$chars += '0123456789'
	}

	# Add special characters if requested
	if ($Special) {
		$chars += '!@#$%^&*()-_=+[]{};:,.<>/?'
	}

	# Generate password
	$password = -join ((1..$Length) | ForEach-Object { $chars[(Get-Random -Min 0 -Max $chars.Length)] })

	Write-Output $password
}