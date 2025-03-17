pageextension 70150 "TBMR_CustomerList" extends "Customer List"
{
    layout
    {
    }

    actions
    {
        addlast(reporting)
        {
            action(TBMR_OverdueCustomerInvoices)
            {
                Image = PrintReport;
                ApplicationArea = All;
                Caption = 'Overdue Customer Invoices';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    OverdueInvoicesReport: Report "TBMR_OverdueCustomerInvoices";
                begin
                    OverdueInvoicesReport.SetCustomerFilter(this.GetSelectionFilter());
                    OverdueInvoicesReport.Run();
                end;
            }
        }
    }
}