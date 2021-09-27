permissionset 81000 "DET Data Editor Tool"
{
    Assignable = true;
    Caption = 'Data Editor Tool';
    Permissions =
        table "DET Data Editor Buffer" = X,
        tabledata "DET Data Editor Buffer" = RMID;
    IncludedPermissionSets = SUPER;
}
