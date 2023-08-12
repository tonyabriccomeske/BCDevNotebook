tableextension 70101 "TBM_PurchaseHeader" extends "Purchase Header"
{
    fields
    {
        field(70100; TBM_Probability; Integer)
        {
            Caption = 'Probability';
            DataClassification = CustomerContent;
        }
    }
}