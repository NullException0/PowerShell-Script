# import required modules

Import-Module ActiveDirectory

$exit = ""

while($exit -ne "q"){

	# Store users first name into variable

	$firstname = Read-Host -Prompt "Please enter your first name"

	$lastname = Read-Host -Prompt "Please enter your last name"

	$password = Read-Host -Prompt "Please enter your password"


	# Output the users information

	echo "Your full name is $firstname $lastname"


	# Specify where to store the user account

	# OU path : 
	# Server Manager > Tools > Active Directory Users and Computers
	# Active Directory Users and Computers > View > Advanced Features
	#	+ on OU, Right click > Properties > Attribute Editor > distinguishedName
	# distinguishedName is the path of the specific OU is stored


	$OUpath = "OU=PowerShellUsers,DC=testdomain,DC=com"

	# Convert the password to a secure string

	$securePassword = ConvertTo-SecureString $password -AsPlainText -Force


	# Create the user account

	New-ADUser -Name "$firstname $lastname" -GivenName $firstname -Surname $lastname -UserPrincipalName "$firstname.$lastname" -Path $OUpath -AccountPassword $securePassword -ChangePasswordAtLogon $True -Enabled $True
	
	# Exit the script
	$exit = Read-Host -Prompt "Type 'q' to stop creating user accounts, ENTER to continue."
}
