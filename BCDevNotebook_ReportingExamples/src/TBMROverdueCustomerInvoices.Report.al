report 70150 "TBMR_OverdueCustomerInvoices"
{
    Caption = 'Overdue Customer Invoices';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = RDLCLayout;
    DataAccessIntent = ReadOnly;

    dataset
    {
        dataitem(Integer; Integer)
        {
            column(CustomerName; OpenCLE.CustomerName) { }
            column(CustomerNo; OpenCLE.Customer_No) { }
            column(DueDate; OpenCLE.Due_Date) { }
            column(DocumentNo; OpenCLE.Document_No_) { }
            column(OriginalAmount; OpenCLE.Sum_Original_Amt_LCY) { }
            column(RemainingAmount; OpenCLE.Sum_Remaining_Amt_LCY) { }

            trigger OnPreDataItem()
            begin
                OpenCLE.Open();
            end;

            trigger OnAfterGetRecord()
            begin
                if not OpenCLE.Read() then
                    CurrReport.Break();
            end;
        }
    }
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            Caption = 'Overdue Customer Invoices';
            LayoutFile = './src/TBMROverdueCustomerInvoices.rdl';
        }
    }
    labels
    {
        ReportCaptionLbl = 'Overdue Customer Invoices';
        CustomerNameLbl = 'Customer Name';
        CustomerNoLbl = 'Customer No.';
        DueDateLbl = 'Due Date';
        DocumentNoLbl = 'Document No.';
        OriginalAmountLbl = 'Original Amount';
        RemainingAmountLbl = 'Remaining Amount';
    }

    var
        OpenCLE: Query TBMR_OpenCustomerLedgerEntries;
}