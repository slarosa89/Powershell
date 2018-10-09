#Security Groups by Department

$GROUPS_BY_DEPT = @{}

foreach ($USER in Get-ADUser -Filter * -Properties *) {
    $TITLE = $USER.Title
    $USER_NAME = $USER.samaccountname
    if ($TITLE -ne $NULL) {
        if ($GROUPS_BY_DEPT.ContainsKey($TITLE)) {
            $GROUPS_BY_DEPT[$TITLE]["USERS"]  += $USER_NAME
        }
        else {
            $GROUPS_BY_DEPT[$TITLE] = @{}
            $GROUPS_BY_DEPT[$TITLE]["USERS"] = @()
            $GROUPS_BY_DEPT[$TITLE]["USERS"] += $USER_NAME
        }
        
        foreach ($SECURITY_GROUP in Get-ADPrincipalGroupMembership $USER_NAME) {
            $SECURITY_GROUP_NAME = $SECURITY_GROUP.name
            if ($GROUPS_BY_DEPT[$TITLE].ContainsKey($SECURITY_GROUP_NAME)) {
                $GROUPS_BY_DEPT[$TITLE][$SECURITY_GROUP_NAME] += 1
            }
            else {
                $GROUPS_BY_DEPT[$TITLE][$SECURITY_GROUP_NAME] = 0
                $GROUPS_BY_DEPT[$TITLE][$SECURITY_GROUP_NAME] += 1
            }
        }
    }
}

foreach ($ITEM_1 in $GROUPS_BY_DEPT.GetEnumerator() | sort -Property Name) {
    $TITLE = $ITEM_1.name
    Write-Host $TITLE
    foreach ($ITEM_2 in $GROUPS_BY_DEPT[$TITLE].GetEnumerator() | sort -Property Value -Descending) {
        $GRP = $ITEM_2.name
        $VAL = $ITEM_2.value
        Write-Host "    " $GRP
        Write-Host "        " $VAL
    }
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}
