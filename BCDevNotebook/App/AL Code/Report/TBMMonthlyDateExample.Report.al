report 70101 "TBM_MonthlyDateExample"
{
    // This Report will show all of the dates for the month for whatever Date Filter that is entered on the Request Page. (It does default to the Work Date.)

    ApplicationArea = All;
    Caption = 'Monthly Purchase Orders';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = MonthlyDateExampleRDL;

    dataset
    {
        dataitem(DateDataItem; Date)
        {
            column(ReportDateFilter; ReportDateFilter) { }
            column(StartofMonth; StartofMonth) { }
            column(EndofMonth; EndofMonth) { }
            column(TheDate; "Period Start") { }
            column(PeriodNo; "Period No.") { }
            column(WeekNo; System.Date2DWY("Period Start", 2)) { }
            column(InvoicesDue; DueDateCount) { }

            trigger OnPreDataItem() //DateDataItem
            begin
                SetRange("Period Type", DateDataItem."Period Type"::Date);
                SetFilter("Period Start", '%1..%2', StartofMonth, EndofMonth);
            end;

            trigger OnAfterGetRecord() //DateDataItem
            begin
                DueDateCount := 0;
                PurchInvHeader.Reset();
                PurchInvHeader.SetRange("Due Date", "Period Start");
                PurchInvHeader.SetLoadFields("Due Date");
                DueDateCount := PurchInvHeader.Count;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(ReportDateFltr; ReportDateFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Report Date Filter';
                    }
                }
            }
        }
        trigger OnOpenPage()
        begin
            ReportDateFilter := WorkDate();
        end;
    }

    rendering
    {
        layout(MonthlyDateExampleRDL)
        {
            Type = RDLC;
            LayoutFile = './App/AL Code/Report/Layouts/TBMMonthlyDateExample.rdl';
        }
    }

    trigger OnPreReport()
    begin
        StartofMonth := CalcDate('<-CM>', ReportDateFilter);
        EndofMonth := CalcDate('<CM>', ReportDateFilter);
    end;

    var
        PurchInvHeader: Record "Purch. Inv. Header";
        DueDateCount: Integer;
        StartofMonth: Date;
        EndofMonth: Date;
        ReportDateFilter: Date;
}