pageextension 70102 "TBM_SalesQuote" extends "Sales Quote"
{
    layout
    {
        modify("Work Description")
        {
            Visible = false;
        }
        addafter(General)
        {
            group(TBM_WorkDescriptionGroup)
            {
                Caption = 'Work Description';

                usercontrol(WorkDescUserControl; "Microsoft.Dynamics.Nav.Client.WebPageViewer")
                {
                    ApplicationArea = All;

                    trigger ControlAddInReady(callbackUrl: Text)
                    begin
                        IsReady := true;
                        FillAddIn();
                    end;

                    trigger Callback(data: Text)
                    begin
                        MyWorkDescription := data;
                        Rec.SetWorkDescription(MyWorkDescription);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        MyWorkDescription := Rec.GetWorkDescription();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        if IsReady then
            FillAddIn();
    end;

    local procedure FillAddIn()
    begin
        CurrPage.WorkDescUserControl.SetContent(StrSubstNo('<textarea Id="TextArea" maxlength="%2" style="width:100%;height:100%;resize: none; font-family:Segoe UI Segoe WP, Segoe, device-segoe, Tahoma, Helvetica, Arial, sans-serif; font-size: 12pt;" OnChange="window.parent.WebPageViewerHelper.TriggerCallback(document.getElementById(''TextArea'').value)">%1</textarea>', MyWorkDescription, 2048));
    end;

    var
        MyWorkDescription: Text;
        IsReady: Boolean;
}