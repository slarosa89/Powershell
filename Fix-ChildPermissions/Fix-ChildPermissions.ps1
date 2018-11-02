$TOP_LEVEL_FOLDER = "\\Some\Folder\on\the\network"
$GOOD_PERMISSIONS = Get-Acl -Path $TOP_LEVEL_FOLDER

ForEach ($File_Or_Folder in Get-ChildItem -Recurse $TOP_LEVEL_FOLDER) {

    $GOOD_PERMISSIONS | Set-Acl -Path $File_Or_Folder.FullName
}