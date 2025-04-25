tableextension 70102 "TBM_SalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(70100; "TBM_Terms and Conditions"; Blob)
        {
            Caption = 'Terms & Conditions';
            DataClassification = CustomerContent;
        }
    }
    var
        TBMReadingDataSkippedMsg: Label 'Loading field %1 will be skipped because there was an error when reading the data.\To fix the current data, contact your administrator.\Alternatively, you can overwrite the current data by entering data in the field.', Comment = '%1=field caption';

    procedure TBM_SetSalesOrderTermsConditions(NewTermsCond: Text)
    var
        OutStream: OutStream;
    begin
        Clear("TBM_Terms and Conditions");
        "TBM_Terms and Conditions".CreateOutStream(OutStream, TEXTENCODING::UTF8);
        OutStream.WriteText(NewTermsCond);
        Modify();
    end;

    procedure TBM_GetSalesOrderTermsConditions() TermsConditions: Text
    var
        TypeHelper: Codeunit "Type Helper";
        InStream: InStream;
    begin
        CalcFields("TBM_Terms and Conditions");
        "TBM_Terms and Conditions".CreateInStream(InStream, TEXTENCODING::UTF8);
        if not TypeHelper.TryReadAsTextWithSeparator(InStream, TypeHelper.LFSeparator(), TermsConditions) then
            Message(TBMReadingDataSkippedMsg, FieldCaption("TBM_Terms and Conditions"));
    end;
}