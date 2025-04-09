
query 70163 "TBMR_SalesDocTypeCustAnalysis"
{
    QueryType = Normal;
    Caption = 'Sales Doc. Type by Customer Analysis';
    UsageCategory = ReportsAndAnalysis;
    AboutTitle = 'Outer Join Conundrum';
    AboutText = 'This query demonstrates the use of an outer join in a query. There is no filter on Document Type.';
    // This query is an expanded version of TBMR_SalesDocTypeByCustomer.

    elements
    {
        dataitem(Sales_Header; "Sales Header")
        {
            column(Document_Type; "Document Type") { }
            column(DocumentNo; "No.") { }
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
