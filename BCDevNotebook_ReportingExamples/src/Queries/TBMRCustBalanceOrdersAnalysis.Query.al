query 70162 "TBMR_CustBalanceOrdersAnalysis"
{
    Caption = 'Customer Balance and Open Sales Orders';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(CustomerNo; "No.") { }
            column(CustomerName; Name) { }
            column(County; County) { Caption = 'State'; }
            column(Balance; Balance) { }

            dataitem(SalesHeader; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                DataItemTableFilter = "Document Type" = CONST(Order);
                SqlJoinType = FullOuterJoin;

                column(OrderNo; "No.") { }
                column(OrderDate; "Order Date") { }

                column(SumAmount; Amount)
                {
                    Method = Sum;
                    Caption = 'Open Orders Amount (Sum)';
                }
            }
        }
    }
}