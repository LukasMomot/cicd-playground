[string[]]$diff = git diff HEAD^..HEAD --name-only
#$diff
#$diff.GetType()

$data = @(
  [pscustomobject] @{Name = 'CICD'; Path = '.github/workflows/' }
  [pscustomobject] @{Name = 'IAC'; Path = 'terraform/' }
  [pscustomobject] @{Name = 'Frontend'; Path = 'angular/' }

)

$affectedProjects = @()
foreach ($proj in $data) {
  [bool] $contains = $diff -match $proj.Path
  if ($contains) {
    $affectedProjects += $proj
  }

  Write-Output "Project ${diff.Name} is in diff: $contains"
}


Write-Output "Affected Projects:"
$affectedProjects
