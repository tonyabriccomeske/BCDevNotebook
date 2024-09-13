query 70155 "TBMR_SalesOrderAPI"
{
    APIGroup = 'reporting';
    APIPublisher = 'bcdevnotebook';
    APIVersion = 'v2.0';
    EntityName = 'salesOrder';
    EntitySetName = 'salesOrders';
    QueryType = API;

    elements
    {
        dataitem(salesHeader; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = const(Order);

            column(documentType; "Document Type") { }
            filter(documentNoFilter; "No.") { }
            column(no; "No.") { }
            column(billToCustomerNo; "Bill-to Customer No.") { }
            column(billToAddress; "Bill-to Address") { }
            column(billToAddress2; "Bill-to Address 2") { }
            column(billToCity; "Bill-to City") { }
            column(billToCounty; "Bill-to County") { }
            column(billToName; "Bill-to Name") { }
            column(billToName2; "Bill-to Name 2") { }
            column(billToPostCode; "Bill-to Post Code") { }
            column(sellToCustomerNo; "Sell-to Customer No.") { }
            column(sellToAddress; "Sell-to Address") { }
            column(sellToAddress2; "Sell-to Address 2") { }
            column(sellToCity; "Sell-to City") { }
            column(sellToCounty; "Sell-to County") { }
            column(sellToCustomerName; "Sell-to Customer Name") { }
            column(sellToCustomerName2; "Sell-to Customer Name 2") { }
            column(orderDate; "Order Date") { }
            column(externalDocumentNo; "External Document No.") { }
        }
    }
}
