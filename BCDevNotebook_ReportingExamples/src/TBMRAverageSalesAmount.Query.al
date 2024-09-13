query 70154 "TBMR_AverageSalesAmount"
{
    Caption = 'Average Sales Amount by Customer';
    QueryType = Normal;
    DataAccessIntent = ReadOnly;
    UsageCategory = ReportsAndAnalysis;
    AboutTitle = 'Look at the average sales amount by Customer';
    AboutText = 'This query gets the average sales amount by customer by reviewing Posted Sales Invoices.';

    elements
    {
        DataItem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            Column(CustomerNo; "Sell-to Customer No.") { }
            column(SellToCustomerName; "Sell-to Customer Name")
            {
                Caption = 'Sell-to Customer Name';
            }
            Column(Average_Amount; "Amount")
            {
                Method = Average;
                Caption = 'Average Sales Amount';
            }
            column(PostingDate; "Posting Date") { }
            column(PostingDate_Month; "Posting Date")
            {
                Method = Month;
                Caption = 'Posting Date Month';
            }
            column(PostingDate_Day; "Posting Date")
            {
                Method = Day;
                Caption = 'Posting Date Day';
            }
            column(PostingDate_Year; "Posting Date")
            {
                Method = Year;
                Caption = 'Posting Date Year';
            }
        }
    }
}


