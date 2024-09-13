query 70150 "TBMR_BinLotNoExpiration"
{
    Caption = 'Bin Lot No. Expiration';
    OrderBy = ascending(Bin_Code);
    DataAccessIntent = ReadOnly;
    UsageCategory = ReportsAndAnalysis;
    QueryType = Normal;
    Access = Public;

    elements
    {
        dataitem(Warehouse_Entry; "Warehouse Entry")
        {
            column(Bin_Code; "Bin Code") { }
            column(Location_Code; "Location Code") { }
            column(Item_No; "Item No.") { }
            column(Variant_Code; "Variant Code") { }
            column(Unit_of_Measure_Code; "Unit of Measure Code") { }
            column(Lot_No; "Lot No.") { }
            column(Expiration_Date; "Expiration Date") { }
            column(Serial_No; "Serial No.") { }
            column(Sum_Qty_Base; "Qty. (Base)")
            {
                ColumnFilter = Sum_Qty_Base = filter(> 0);
                Method = Sum;
                Caption = 'Qty. (Base)';
            }
            dataitem(Item; "Item")
            {
                DataItemLink = "No." = Warehouse_Entry."Item No.";

                column(Description; "Description") { }
                column(ItemCategoryCode; "Item Category Code") { }
                column(ItemTrackingCode; "Item Tracking Code") { }
            }
        }
    }
}

