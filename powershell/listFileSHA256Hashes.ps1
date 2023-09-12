
# from https://stackoverflow.com/questions/50132201/sort-results-from-get-childitem-with-get-filehash-before-output#50132404
# Replace -Path "" with your path
Get-ChildItem -path "C:\" -Recurse -Force -File | Get-FileHash | Sort-Object -Property 'Path' | Export-Csv -Path "c:\windows\temp\report_file.csv" -NoTypeInformation
