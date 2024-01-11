
# Admin flag to test all Admin accounts
# Pass Flag to set string


$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
  
$PDC = ($domainObj.PdcRoleOwner).Name

$SearchString = "LDAP://"
$SearchString += $PDC + "/"

$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"

$SearchString += $DistinguishedName

New-Object System.DirectoryServices.DirectoryEntry($SearchString, $username, $password)
