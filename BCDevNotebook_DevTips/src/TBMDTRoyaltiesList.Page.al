page 70200 "TBMDT_Royalties List"
{

    ApplicationArea = All;
    Caption = 'Royalties List';
    PageType = List;
    SourceTable = TBMDT_Royalties;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Royalty Rate"; Rec."Royalty Rate")
                {
                    ApplicationArea = All;
                }
                field("Royalty Type"; Rec."Royalty Type")
                {
                    ApplicationArea = All;
                }
                field("Institution Short Code"; Rec."Institution Short Code")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
