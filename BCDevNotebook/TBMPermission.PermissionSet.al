permissionset 70100 "TBM_Permission"
{
    Assignable = true;
    Permissions = report "TBM_Custom Sales Report" = X,
        report TBM_MonthlyDateExample = X,
        report TBM_MyReport = X,
        tabledata "TBM_Recreate Setup" = RIMD,
        table "TBM_Recreate Setup" = X,
        codeunit TBM_RecreateSalesLine = X,
        page "TBM_Recreate Setup" = X;
}