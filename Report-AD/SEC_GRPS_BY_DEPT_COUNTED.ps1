#Security Groups by Department

$GROUPS_BY_DEPT = @{}

foreach ($USER in Get-ADUser -Filter * -Properties *) {
    $DEPT = $USER.Department
    $USER_NAME = $USER.samaccountname
    if ($DEPT -ne $NULL) {
        if ($GROUPS_BY_DEPT.ContainsKey($DEPT)) {
            $GROUPS_BY_DEPT[$DEPT]["USERS"]  += $USER_NAME
        }
        else {
            $GROUPS_BY_DEPT[$DEPT] = @{}
            $GROUPS_BY_DEPT[$DEPT]["USERS"] = @()
            $GROUPS_BY_DEPT[$DEPT]["USERS"] += $USER_NAME
        }
        
        foreach ($SECURITY_GROUP in Get-ADPrincipalGroupMembership $USER_NAME) {
            $SECURITY_GROUP_NAME = $SECURITY_GROUP.name
            if ($GROUPS_BY_DEPT[$DEPT].ContainsKey($SECURITY_GROUP_NAME)) {
                $GROUPS_BY_DEPT[$DEPT][$SECURITY_GROUP_NAME] += 1
            }
            else {
                $GROUPS_BY_DEPT[$DEPT][$SECURITY_GROUP_NAME] = 0
                $GROUPS_BY_DEPT[$DEPT][$SECURITY_GROUP_NAME] += 1
            }
        }
    }
}

foreach ($ITEM_1 in $GROUPS_BY_DEPT.GetEnumerator() | sort -Property Name) {
    $DEPT = $ITEM_1.name
    Write-Host $DEPT
    foreach ($ITEM_2 in $GROUPS_BY_DEPT[$DEPT].GetEnumerator() | sort -Property Value -Descending) {
        $GRP = $ITEM_2.name
        $VAL = $ITEM_2.value
        Write-Host "    " $GRP
        Write-Host "        " $VAL
    }
    Write-Host "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
}
