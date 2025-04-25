pageextension 70104 "TBM_SalesReceivablesSetup" extends "Sales & Receivables Setup"
{
    layout
    {
        addlast(content)
        {
            group(TBM_TermsConditionsGroup)
            {
                Caption = 'Terms and Conditions';

                field(TBM_TBMTermsConditions; TBMTermsConditionsVar)
                {
                    ApplicationArea = All;
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    ShowCaption = false;
                    InstructionalText = 'Enter the terms and conditions for sales orders.';

                    trigger OnValidate()
                    begin
                        Rec.TBM_SetSalesOrderTermsConditions(TBMTermsConditionsVar);
                    end;

                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        TBMTermsConditionsVar := Rec.TBM_GetSalesOrderTermsConditions();
    end;

    var
        TBMTermsConditionsVar: Text;
}


