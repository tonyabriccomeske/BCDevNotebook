query 70156 "TBMR_MaxQuantityOrdered"
{
    Caption = 'Max Quantity Ordered';
    UsageCategory = ReportsAndAnalysis;
    AboutText = 'Displays the highest Quantity (Base) ordered of each item.';

    elements
    {
        dataitem(Sales_Line; "Sales Line")
        {
            DataItemTableFilter = Type = const(Item);

            column(itemNo; "No.")
            {
                Caption = 'Item No.';
            }
            column(maxQtyBase; "Quantity (Base)")
            {
                Method = Max;
                Caption = 'Max Quantity (Base)';
            }
        }
    }
}

