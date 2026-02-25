namespace TBM.RecreateSalesLine;
using Microsoft.Sales.Document;

pageextension 70113 "TBM_SalesOrderSubform" extends "Sales Order Subform"
{
    layout
    {
        addafter(Description)
        {
            field(TBM_CustomDescription; Rec.TBM_CustomDescription)
            {
                ApplicationArea = All;
            }
        }
    }
}