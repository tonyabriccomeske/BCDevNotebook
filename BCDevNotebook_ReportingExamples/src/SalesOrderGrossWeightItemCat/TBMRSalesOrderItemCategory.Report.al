report 70151 "TBMR_SalesOrderItemCategory"
{

    ApplicationArea = All;
    Caption = 'Sales Order Item Category';
    UsageCategory = Documents;
    DataAccessIntent = ReadOnly;
    DefaultRenderingLayout = ExcelRefreshViaAPI;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            DataItemTableView = sorting("Document Type", "No.") where("Document Type" = const(Order));
            RequestFilterFields = "Order Date", "Location Code", "Sell-to Customer No.";
            PrintOnlyIfDetail = true;

            column(DocumentType; "Document Type") { }
            column(DocumentNo; "No.") { }
            column(SelltoCustomerNo; "Sell-to Customer No.") { }
            column(OrderDate; "Order Date") { }
            column(ShippingAgentCode; "Shipping Agent Code") { }
            column(ShippingAgentServiceCode; "Shipping Agent Service Code") { }
            column(LocationCode; "Location Code") { }

            dataitem(SalesLine; "Sales Line")
            {
                DataItemLinkReference = SalesHeader;
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                DataItemTableView = sorting("Document No.", "Line No.") where(Type = const(Item), Quantity = filter(> 0));

                column(Quantity; "Quantity") { }
                column(Gross_Weight; "Gross Weight") { }

                dataitem(Item; Item)
                {
                    DataItemLinkReference = SalesLine;
                    DataItemLink = "No." = field("No.");
                    RequestFilterFields = "Item Category Code";

                    column(ItemCategoryCode; "Item Category Code") { }
                }
            }
        }
    }
    requestpage
    {
        AboutText = 'This report shows the Gross Weight of Sales Orders broken down by Item Category.';
        SaveValues = true;
    }

    rendering
    {
        layout(ExcelRefreshViaAPI)
        {
            Caption = 'Excel Refresh via API';
            Type = Excel;
            LayoutFile = './src/SalesOrderGrossWeightItemCat/TBMRSalesOrderItemCategory_ExcelRefresh.xlsx';
        }
        layout(Excel)
        {
            Caption = 'Excel Refresh via API';
            Type = Excel;
            LayoutFile = './src/SalesOrderGrossWeightItemCat/TBMRSalesOrderItemCategory.xlsx';
        }
    }
}
