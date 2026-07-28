pageextension 70107 "TBM_UserSetup" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("TBM_Favorite Cat Breed"; Rec."TBM_Favorite Cat Breed")
            {
                ApplicationArea = All;
            }
        }
    }
}