namespace TBM.RecreateSalesLine;

table 70100 "TBM_Recreate Setup"
{
    Caption = 'TBM Recreate Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {

        }
        field(2; "Enable Event Subscriber"; Boolean)
        {
            Caption = 'Enable Event Subscriber';
            DataClassification = CustomerContent;
            ToolTip = 'Indicates whether the event subscriber for recreating sales lines is enabled. When false, custom fields will not be transferred during sales line recreation.';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    begin
        Reset();
        if not Get() then begin
            Init();
            Insert(true);
        end;
    end;


}