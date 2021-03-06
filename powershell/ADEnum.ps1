
# AD enumeration script started as part of going through the OCSP
# Contains lots of comments for pedagogically reason not GOOD programming reasons or practice
# This will probably refactored and translated to Csharp in the future to learn Csharp.
# Additions from the default:
#

###################
# 		  #
# Enumerate Users #
#		  #
###################

#AdminAccount="GillBates_Admin"

# Use the DirectorySearcher Object to query AD using LDAP.
# Prototype path for .NET class DirectorySearcher:
# LDAP://HostName[:PortNumber][/DistinguishedName]
# Get AD current domain information
$domainObj = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
# Assign PdcRoleOwner = DC name
$PDC = ($domainObj.PdcRoleOwner).Name
# Build string for LDAP path referenced above
$SearchString = "LDAP://"

$SearchString += $PDC + "/"

$DistinguishedName = "DC=$($domainObj.Name.Replace('.', ',DC='))"

$SearchString += $DistinguishedName
# Create an DirectorySearcher Object
# Instantiate the DirectorySearcher class with the LDAP provider path
$Searcher = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$SearchString)

$objDomain = New-Object System.DirectoryServices.DirectoryEntry($SearchString, "corp.com\offsec", "lab")
# Search root is the node in the AD hierarchy where search starts
$Searcher.SearchRoot = $objDomain



# Filter through Objects
# Filter through samAccountType attribute
#$Searcher.filter="name=$AdminAccount"
$Searcher.filter="samAccountType=805306368"
# Search results
$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{	
    Foreach($prop in $obj.Properties) # User object attribute are stored in the Properties field 
    {
        $prop
    }
    
    Write-Host "------------------------"
}

# TODO - Recursive list Nested Group in Function, if name is passed search from that group name

###################
# 		  #
# Enumerate Groups #
#		  #
###################


# Resolving Nested groups
# Extract all records, printing the Nname field
$Searcher.filter="(objectClass=Group)"

$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{
    $obj.Properties.name
}

# 
Enumerate_Group_Name="BilloGaltoGroup"
# Enumerate members of a group
$Searcher.filter="(name=$Enumerate_Group_Name)"

$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{
    $obj.Properties.member
}

###################
# 		  #
# Enumerate SPNs  #
#		  #
###################

# TODO spn more suitable or a list of spns...
$Searcher.filter="serviceprincipalname=*http*"

$Result = $Searcher.FindAll()

Foreach($obj in $Result)
{
	    Foreach($prop in $obj.Properties)
	        {
			$prop
		}
}

# if .samaccountname {
# nslookup(.serviceprincipalname) 
