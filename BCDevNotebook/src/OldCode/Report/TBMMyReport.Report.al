report 70102 "TBM_MyReport"
{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'TBM My Report';
    ApplicationArea = All;


    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";

            column(No_; "No.") { }
        }
    }

    requestpage
    {
        // These properties are part of the ReportMetadataValues on the "Aggregated Metadata" sheet of Excel Report Layouts
        AboutTitle = 'This displays on an Excel Report ''About This Report Title''';
        AboutText = 'This displays on an Excel Report ''About This Report Text''';
        HelpLink = 'https://learn.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/devenv-howto-excel-report-layout';
    }
}




