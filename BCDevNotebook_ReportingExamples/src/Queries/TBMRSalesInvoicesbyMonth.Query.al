query 70164 "TBMR_Sales Invoices by Month"
{
    // This query groups invoices by month and includes customer name, total invoice amount, and count of invoices
    // Ideal for monthly sales dashboards.

    QueryType = Normal;
    Caption = 'Sales Invoices by Month';
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            column(InvoiceMonth; "Posting Date")
            {
                Method = Month;
                Caption = 'Invoice Month';
            }
            column(CustomerName; "Sell-to Customer Name")
            {
                Caption = 'Customer Name';
            }
            column(InvoiceAmount; "Amount")
            {
                Method = Sum;
                Caption = 'Invoice Amount (Sum)';
            }
            column(InvoiceCount)
            {
                Method = Count;
                Caption = 'Invoice Count';
            }
        }
    }
}


