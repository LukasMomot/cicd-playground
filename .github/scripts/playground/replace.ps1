$jsonData = Get-Content -Path "./config.json" | ConvertFrom-Json -AsHashtable
$yamlTemplate = Get-Content -Path "./deployment2.yaml"
# $jsonData
#$yamlTemplate

$jsonData.GetEnumerator() | ForEach-Object {

  #Write-Host "$($_.Name) $($_.Value)"
  $replaceKey = "##$($_.Name)##"
  $yamlTemplate = $yamlTemplate.Replace($replaceKey, $_.Value)
  # Replace the placeholders in the template YAML with the current entry's values
  #$yamlEntry = $templateYaml.Replace("{{placeholder1}}", $_.Value.property1).Replace("{{placeholder2}}", $_.Value.property2)

  # Append the YAML entry to the output YAML file
  #Add-Content -Path $outputYamlPath -Value $yamlEntry
}
Write-Host "End result after replacement"
Set-Content -Path "./deploy_result.yaml" -Value $yamlTemplate
$yamlTemplate

# $hashtable = @{}
# $jsonData.psobject.properties | Foreach { $hashtable[$_.Name] = $_.Value }
# $hashtable
