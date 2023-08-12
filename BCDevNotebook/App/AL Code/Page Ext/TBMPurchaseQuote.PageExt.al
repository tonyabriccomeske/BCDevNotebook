pageextension 70101 "TBM_PurchaseQuote" extends "Purchase Quote"
{
    layout
    {
        addlast(General)
        {
            field(TBM_Probability; Rec.TBM_Probability)
            {
                ApplicationArea = All;
                Importance = Promoted;
                ValuesAllowed = 0, 25, 50, 100;
                ToolTip = 'Enter the probability of the quote becoming an order. Accepted values are: 0, 25, 50, 100.';
            }
        }
    }
}
