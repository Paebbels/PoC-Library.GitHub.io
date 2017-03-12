
Write-Host "Renaming directories"
foreach ($dir in (dir _* -Directory))
{	Write-Host "  $dir"
	mv $dir $dir.Name.Substring(1)
}

Write-Host "Processing files ..."
foreach ($file in (dir *.html -Recurse))
{	Write-Host "  $file"
	$fileContent = cat $file -Raw -Encoding UTF8
	$fileContent2 = $fileContent -replace '(src|href)="((?:\.\./)*)_(images|modules|sources|static)','$1="$2$3'
	$fileContent2 | Out-File $file -Encoding utf8
}
