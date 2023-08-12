tableextension 70100 "TBM_PurchaseLine" extends "Purchase Line"
{
    fields
    {
        field(50100; TBM_Color; Enum "TBM_Colors")
        {
            Caption = 'Color';
            DataClassification = ToBeClassified;
        }
        field(70101; "TBM_My Integer"; Integer)
        {
            Caption = 'My Integer';
            DataClassification = ToBeClassified;
        }
    }
}
