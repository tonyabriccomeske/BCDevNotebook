reportextension 70150 "TBMR_StandardSalesInvoice" extends "Standard Sales - Invoice"
{
    dataset
    {
        add(Line)
        {
            column(TBMR_Unit_Cost; "Unit Cost") { }
            column(TBMR_Line_Amount; "Line Amount") { }
        }
    }

    requestpage
    {
        // Add changes to the requestpage here
    }

    rendering
    {
        layout(AgenticExcel)
        {
            Caption = 'Agentic Excel';
            Type = Excel;
            LayoutFile = './src/AgenticExcel/AgenticExcel.xlsx';
            Summary = 'This Excel Layout was built leveraging Copilot Agent mode in Excel.';
        }
    }
}