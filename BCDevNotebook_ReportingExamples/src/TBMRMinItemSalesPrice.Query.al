query 70158 "TBMR_MinItemSalesPrice"
{
    Caption = 'Min Sales Amount by Item';
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(SalesInvoiceLine; "Sales Invoice Line")
        {
            DataItemTableFilter = "Type" = const(Item);

            column(ItemNo; "No.") { }
            filter(Posting_Date; "Posting Date") { }
            column(MinUnitPrice; "Unit Price")
            {
                Method = Min;
                Caption = 'Min. Unit Price';
            }
        }
    }
}