namespace TBM.RecreateSalesLine;

using Microsoft.Sales.Document;

tableextension 70114 "TBM_SalesLine" extends "Sales Line" //37
{
    fields
    {
        field(70100; TBM_CustomDescription; Text[100])
        {
            Caption = 'Custom Description';
            DataClassification = CustomerContent;
        }
    }
}