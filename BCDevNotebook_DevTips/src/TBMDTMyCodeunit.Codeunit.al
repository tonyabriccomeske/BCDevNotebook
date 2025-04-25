codeunit 70200 "TBMDT_MyCodeunit"
{
    var
        MyText: Text;
        TempSalesLine: Record "Sales Line" temporary;
        SalesPost: Codeunit "Sales-Post";

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", OnBeforeSaveAttachment, '', false, false)]
    local procedure Table_DocumentAttachment_OnBeforeSaveAttachment(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FileName: Text; var TempBlob: Codeunit "Temp Blob")
    begin
        if DocumentAttachment."Table ID" = Database::"Transfer Header" then
            DocumentAttachment.Validate("No.", RecRef.Field(1).Value) else
            if DocumentAttachment."Table ID" = Database::"Transfer Receipt Header" then
                DocumentAttachment.Validate("No.", RecRef.Field(1).Value) else
                if DocumentAttachment."Table ID" = Database::"Transfer Shipment Header" then
                    DocumentAttachment.Validate("No.", RecRef.Field(1).Value) else
                    if DocumentAttachment."Table ID" = Database::"Sales Shipment Header" then
                        DocumentAttachment.Validate("No.", RecRef.Field(3).Value);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", OnBeforeDrillDown, '', false, false)]
    local procedure Page_DocumentAttachmentFactbox_OnBeforeDrilldown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        TransferHeader: Record "Transfer Header";
        TransferReceiptHeader: Record "Transfer Receipt Header";
        TransferShipmentHeader: Record "Transfer Shipment Header";
        SalesShipmentHeader: Record "Sales Shipment Header";
    begin
        if DocumentAttachment."Table ID" = Database::"Transfer Header" then begin
            RecRef.Open(Database::"Transfer Header");
            if TransferHeader.Get(DocumentAttachment."No.") then
                RecRef.GetTable(TransferHeader);
        end else
            if DocumentAttachment."Table ID" = Database::"Transfer Receipt Header" then begin
                RecRef.Open(Database::"Transfer Receipt Header");
                if TransferHeader.Get(DocumentAttachment."No.") then
                    RecRef.GetTable(TransferHeader);
            end else
                if DocumentAttachment."Table ID" = Database::"Transfer Shipment Header" then begin
                    RecRef.Open(Database::"Transfer Shipment Header");
                    if TransferShipmentHeader.Get(DocumentAttachment."No.") then
                        RecRef.GetTable(TransferShipmentHeader);
                end else
                    if DocumentAttachment."Table ID" = Database::"Sales Shipment Header" then begin
                        RecRef.Open(Database::"Sales Shipment Header");
                        if SalesShipmentHeader.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(SalesShipmentHeader);
                    end;
    end;

    local procedure MyProcedure()
    var
        SalesHeader: Record "Sales Header";
    begin
        SalesPost.InitProgressWindow(SalesHeader);
        if not TempSalesLine.IsTemporary then exit;

        Page.Run(Page::"Sales Order");
    end;

}