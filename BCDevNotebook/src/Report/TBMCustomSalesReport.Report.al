report 70100 "TBM_Custom Sales Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = TBMRDLCLayout;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterFields = "No.", "Sell-to Customer No.", "No. Printed";
            RequestFilterHeading = 'Sales Order';

            column(No; "No.") { }
            column(TermsConditions; TermsConditionsVar) { }
            column(CustomerLabel; StrSubstNo(CustomerLbl, "Sell-to Customer No.", "Sell-to Customer Name")) { }

            dataitem(Line; "Sales Line")
            {
                DataItemLink = "Document No." = field("No.");
                DataItemLinkReference = SalesHeader;
                DataItemTableView = sorting("Document No.", "Line No.");
                column(LineNo_Line; "Line No.") { }
                column(SalesLine_No; "No.") { }
                column(Description_Line; Description)
                {
                    IncludeCaption = true;
                }
            }
        }
    }
    rendering
    {
        layout(TBMRDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Report/Layouts/TBMCustomSalesReport.Layout.rdl';
        }
        layout(TBMWordLayout)
        {
            Type = Word;
            LayoutFile = './src/Report/Layouts/TBMCustomSalesReport.Layout.docx';
        }
    }
    labels
    {
        SalesOrderLbl = 'Sales Order No.';
        ReportTitle = 'My Test Sales Report';
        ItemNoLbl = 'Item No.';
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
        CustomerLbl: Label 'Customer %1: %2', Comment = '%1 = Customer No., %2 = Customer Name';
}