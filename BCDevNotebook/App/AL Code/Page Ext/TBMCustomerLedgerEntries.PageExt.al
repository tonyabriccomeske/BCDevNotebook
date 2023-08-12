pageextension 70103 "TBM_CustomerLedgerEntries" extends "Customer Ledger Entries"
{
    views
    {
        addfirst
        {
            view(OpenInvoices)
            {
                Caption = 'Open Invoices';
                SharedLayout = false;
                Filters = where("Document Type" = filter(Invoice), Open = const(true));
                OrderBy = descending("Posting Date", "Customer No.");
                layout
                {
                    moveafter("Customer Name"; "Due Date")

                    modify("Currency Code")
                    {
                        Visible = false;
                    }
                }
            }
            view(YTDPayments)
            {
                Caption = 'YTD Payments';
                SharedLayout = false;
                Filters = where("Document Type" = filter(Payment), "Posting Date" = filter('CY-1Y+1D..'));
                OrderBy = descending("Posting Date", "Customer No.");

                layout
                {
                    modify("Document Type")
                    {
                        Visible = false;
                    }
                    modify("Document No.")
                    {
                        Visible = false;
                    }
                }
            }
        }
    }
}