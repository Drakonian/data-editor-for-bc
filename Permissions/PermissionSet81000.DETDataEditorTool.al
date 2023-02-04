permissionset 81000 "DET Data Editor Tool"
{
    Assignable = true;
    Caption = 'Data Editor Tool';
    Permissions = table "DET Data Editor Buffer" = X,
        tabledata "DET Data Editor Buffer" = RMID,
        tabledata "DET Field" = RIMD,
        table "DET Field" = X,
        codeunit "DET Single Instance Storage" = X,
        page "DET Data Editor" = X,
        page "DET Data Editor Buffer" = X,
        page "DET Edit Value" = X,
        page "DET Insert New Record" = X,
        page "DET Run Editor From Filter" = X,
        page "DET Select Fields" = X;
}