namespace TBM.RecreateSalesLine;
using Microsoft.Sales.Document;

codeunit 70104 "TBM_RecreateSalesLine"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnCreateSalesLineOnBeforeTransferFieldsFromTempSalesLine, '', false, false)]
    local procedure Table_SalesHeader_OnCreateSalesLineOnBeforeTransferFieldsFromTempSalesLine(var SalesLine: Record "Sales Line"; var TempSalesLine: Record "Sales Line" temporary; var SalesHeader: Record "Sales Header")
    var
        RecreateSetup: Record "TBM_Recreate Setup";
    begin
        RecreateSetup.GetRecordOnce();
        if not RecreateSetup."Enable Event Subscriber" then
            exit;

        // Transfer custom fields
        SalesLine.TBM_CustomDescription := TempSalesLine.TBM_CustomDescription;
    end;
}