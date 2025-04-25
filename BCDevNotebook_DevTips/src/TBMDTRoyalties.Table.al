table 70200 "TBMDT_Royalties"
{
    Caption = 'Royalties';
    DataClassification = CustomerContent;


    fields
    {
        field(1; "No."; Code[10])
        {
            Caption = 'No.';
            NotBlank = true;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
        }
        field(20; "Royalty Rate"; Decimal)
        {
            Caption = 'Royalty Rate';
            DecimalPlaces = 2;
        }
        field(21; "Royalty Type"; Option)
        {
            Caption = 'Royalty Type';
            OptionMembers = "Percentage","Fixed Amount";
        }
        field(30; "Institution Short Code"; Text[50])
        {
            Caption = 'Institution Short Code';
        }
        field(40; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = Vendor;
        }
        field(41; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
