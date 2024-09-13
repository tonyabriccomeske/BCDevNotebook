query 70152 "TBMR_OpenCustomerLedgerEntries"
{
    Caption = 'Open Customer Ledger Entries';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(CustLedgEntry; "Cust. Ledger Entry")
        {
            DataItemTableFilter = Open = const(true);

            filter(Document_Type; "Document Type") { }
            column(Document_No_; "Document No.") { }
            column(Due_Date; "Due Date") { }
            column(Customer_No; "Customer No.") { }
            filter(Date_Filter; "Date Filter") { }
            column(Sum_Original_Amt_LCY; "Original Amt. (LCY)")
            {
                Method = Sum;
                Caption = 'Original Amount';
            }
            column(Sum_Remaining_Amt_LCY; "Remaining Amt. (LCY)")
            {
                Method = Sum;
                Caption = 'Remaining Amount';
            }
            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = CustLedgEntry."Customer No.";

                column(CustomerName; Name) { }
            }
        }
    }
}

