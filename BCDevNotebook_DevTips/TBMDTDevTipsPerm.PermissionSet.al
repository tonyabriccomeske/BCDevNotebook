permissionset 70200 "TBMDT_DevTipsPerm"
{
    Caption = 'TBM Dev Tips Permission Set';

    Assignable = true;
    Permissions = tabledata TBMDT_Royalties = RIMD,
        table TBMDT_Royalties = X,
        codeunit TBMDT_MyCodeunit = X,
        page "TBMDT_Royalties List" = X;
}