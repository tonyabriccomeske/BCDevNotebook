namespace TBM.RecreateSalesLine;

page 70104 "TBM_Recreate Setup"
{

    PageType = Card;
    SourceTable = "TBM_Recreate Setup";
    Caption = 'TBM Recreate Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    UsageCategory = Administration;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Enable Event Subscriber"; Rec."Enable Event Subscriber") { }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
