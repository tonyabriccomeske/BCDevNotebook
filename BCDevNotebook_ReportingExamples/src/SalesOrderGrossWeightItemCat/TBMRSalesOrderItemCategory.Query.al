query 70199 "TBMR_SalesOrderItemCategory"
{
    Caption = 'Sales Order Item Category';
    QueryType = API;
    APIGroup = 'sales';
    APIPublisher = 'bcdevnotebook';
    APIVersion = 'v1.0';
    EntityName = 'salesOrderItemCategory';
    EntitySetName = 'salesOrderItemCategories';
    DataAccessIntent = ReadOnly;
    Permissions = tabledata "Sales Header" = r, tabledata "Sales Line" = r, tabledata Item = r;
    AboutTitle = 'Sales Order Item Category';
    AboutText = 'This query shows the Gross Weight of Sales Orders broken down by Item Category.';

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableFilter = "Document Type" = const(Order);

            column(documentType; "Document Type") { }
            column(documentNo; "No.") { }
            column(sellToCustomerNo; "Sell-to Customer No.") { }
            column(orderDate; "Order Date") { }
            column(shippingAgentCode; "Shipping Agent Code") { }
            column(shippingAgentServiceCode; "Shipping Agent Service Code") { }
            column(locationCode; "Location Code") { }
            column(shipmentDate; "Shipment Date") { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLink = "Document Type" = SalesHeader."Document Type", "Document No." = SalesHeader."No.";
                DataItemTableFilter = Type = const(Item), Quantity = filter(> 0);
                SqlJoinType = InnerJoin;

                column(itemNo; "No.") { }
                column(quantity; "Quantity") { }
                column(grossWeight; "Gross Weight") { }

                dataitem(Item; Item)
                {
                    DataItemLink = "No." = SalesLine."No.";
                    column(itemCategoryCode; "Item Category Code") { }
                }
            }
        }
    }
}
