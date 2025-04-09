
query 70160 "TBMR_CountCustSalesDocType"
{
    QueryType = Normal;
    Caption = 'Number of Open Customer Sales by Document Type';

    elements
    {
        dataitem(Customer; Customer)
        {

            column(CustomerNo; "No.") { }
            column(Name; Name) { }

            dataitem(Sales_Header; "Sales Header")
            {
                DataItemLink = "Sell-to Customer No." = Customer."No.";
                SqlJoinType = LeftOuterJoin;

                column(Document_Type; "Document Type") { }


                column(Count)
                {
                    Method = Count;
                }
            }

        }
    }
}
