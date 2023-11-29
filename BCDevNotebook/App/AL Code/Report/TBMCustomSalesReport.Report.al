report 70100 "TBM_Custom Sales Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = TBMRDLCLayout;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No; "No.") { }
            column(TermsConditions; TermsConditionsVar) { }
        }
    }
    rendering
    {
        layout(TBMRDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './App/AL Code/Report/Layouts/TBMCustomSalesReport.Layout.rdl';
        }
        layout(TBMWordLayout)
        {
            Type = Word;
            LayoutFile = '.App//AL Code/Report/Layouts/TBMCustomSalesReport.Layout.docx';
        }
    }

    trigger OnInitReport()
    begin
        SalesSetup.Get();
        TermsConditionsVar := SalesSetup.TBM_GetSalesOrderTermsConditions();
        Message(TermsConditionsVar);
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        TermsConditionsVar: Text;
}