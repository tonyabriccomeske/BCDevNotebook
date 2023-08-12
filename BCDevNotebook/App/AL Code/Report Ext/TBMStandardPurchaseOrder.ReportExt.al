reportextension 70100 "TBM_StandardPurchaseOrder" extends "Standard Purchase - Order"
{
    dataset
    {
        add("Purchase Header")
        {
            column(TBM_Probability; TBM_Probability) { }
        }
    }
    rendering
    {
        layout(TBMCustomLayout)
        {
            Caption = 'TBM Custom Purchase Order Layout';
            Type = Word;
            LayoutFile = './App/AL Code/Report Ext/Layouts/TBMStandardPurchaseOrder.ReportLayout.docx';
        }
    }
}