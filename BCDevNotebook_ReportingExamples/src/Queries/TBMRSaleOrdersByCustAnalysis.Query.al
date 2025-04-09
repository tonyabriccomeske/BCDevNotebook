// =============================================================
//  The filter on Document Type represents the "Outer Join Condurum"
// =============================================================

query 70159 "TBMR_SaleOrdersByCustAnalysis"
{
    QueryType = Normal;
    Caption = 'Sales Orders by Customer Analysis';
    UsageCategory = ReportsAndAnalysis;
    AboutTitle = 'Outer Join Conundrum';
    AboutText = 'This query demonstrates the use of an outer join in a query, filtered where Document Type = Order. If a Customer has zero sales documents (no quotes, orders, invoices or credit memos), they will not show up at all in the list.';

    elements
    {
        dataitem(Sales_Header; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = const(Order);
            column(Document_Type; "Document Type") { }
            column(DocumentDate; "Document Date") { }

            column(Count)
            {
                Method = Count;
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = Sales_Header."Sell-to Customer No.";
                SqlJoinType = RightOuterJoin;

                column(Name; Name) { }
            }
        }
    }
}
