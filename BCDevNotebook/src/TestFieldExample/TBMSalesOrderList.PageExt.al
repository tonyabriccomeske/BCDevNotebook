pageextension 70106 "TBM_SalesOrderList" extends "Sales Order List"
{
    actions
    {
        addlast(Processing)
        {
            action(TBM_RSMUSverifyCustomerEmail)
            {
                ApplicationArea = All;
                Caption = 'Verify Customer Email';
                Image = ExternalDocument;
                ToolTip = 'Checks to see if the Sell-to Customer''s email is populated.';
                trigger OnAction()
                var
                    Customer: Record Customer;
                begin
                    if Customer.Get(Rec."Sell-to Customer No.") then
                        Customer.TestField("E-Mail");
                end;
            }
        }
        addlast(Category_Process)
        {
            actionref(TBM_RSMUSverifyCustomerEmail_Promoted; TBM_RSMUSverifyCustomerEmail)
            {
            }
        }
    }
}