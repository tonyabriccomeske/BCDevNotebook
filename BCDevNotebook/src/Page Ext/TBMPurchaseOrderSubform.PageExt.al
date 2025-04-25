pageextension 70100 "TBM_PurchaseOrderSubform" extends "Purchase Order Subform"
{
    layout
    {
        addlast(Control1)
        {
            field(TBM_Color; Rec.TBM_Color)
            {
                ApplicationArea = All;
                ValuesAllowed = 1, 6;
            }
        }
    }
}
