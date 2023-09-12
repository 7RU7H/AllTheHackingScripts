# https://serverfault.com/questions/829061/windows-2012-r2-search-for-files-using-md5-hash
$BADHASH
Foreach ($File In Get-ChildItem C:\ -file -recurse) 
{
    If ((Get-FileHash $File.Fullname -Algorithm MD5).Hash -EQ $BadHash)
    {
        Write-Warning "Oh no, bad file detected: $($File.Fullname)"
    }
}
