page 70150 "TBMR_Utility"
{
    PageType = List;
    ApplicationArea = All;
    Caption = 'Utility';

    actions
    {
        area(Processing)
        {
            action(TBMR_CustBalanceOpenOrdersAnalysis)
            {
                ApplicationArea = All;
                Caption = 'Customer Balance Open Orders Analysis';
                ToolTip = 'Make sure you set a breakpoint, and you can see some SQL Insights while debugging!';
                Image = PrintReport;
                trigger OnAction()
                var
                    CustBalanceOpenOrders: Query "TBMR_CustBalanceOrdersAnalysis";
                    oStream: OutStream;
                begin
                    CustBalanceOpenOrders.Open();
                    CustBalanceOpenOrders.Read();
                    CustBalanceOpenOrders.Close();
                end;
            }
            action(SaveQueryAsJson)
            {
                ApplicationArea = All;
                Caption = 'Save Query as JSON';
                ToolTip = 'Saves the current query as a JSON file.';
                Image = Download;
                trigger OnAction()
                var
                    oStream: OutStream;
                    iStream: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    FileName: Text[250];
                begin
                    TempBlob.CreateOutStream(oStream);
                    if Query.SaveAsJson(Query::TBMR_SalesOrderItemCategory, oStream) then begin
                        FileName := 'SalesOrderItemCategory.json';
                        TempBlob.CreateInStream(iStream);
                        DownloadFromStream(iStream, '', '', '', FileName);
                    end
                end;
            }
            action(SaveQueryAsXML)
            {
                ApplicationArea = All;
                Caption = 'Save Query as XML';
                ToolTip = 'Saves the current query as an XML file.';
                Image = XMLFile;
                trigger OnAction()
                var
                    oStream: OutStream;
                    iStream: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    FileName: Text[250];
                begin
                    TempBlob.CreateOutStream(oStream);
                    if Query.SaveAsXml(Query::TBMR_SalesOrderItemCategory, oStream) then begin
                        FileName := 'SalesOrderItemCategory.xml';
                        TempBlob.CreateInStream(iStream);
                        DownloadFromStream(iStream, '', '', '', FileName);
                    end
                end;
            }
            action(SaveQueryAsCsv)
            {
                ApplicationArea = All;
                Caption = 'Save Query as CSV';
                ToolTip = 'Saves the current query as a CSV file.';
                Image = Download;
                trigger OnAction()
                var
                    oStream: OutStream;
                    iStream: InStream;
                    TempBlob: Codeunit "Temp Blob";
                    FileName: Text[250];
                begin
                    TempBlob.CreateOutStream(oStream);
                    if Query.SaveAsCsv(Query::TBMR_SalesOrderItemCategory, oStream) then begin
                        FileName := 'SalesOrderItemCategory.csv';
                        TempBlob.CreateInStream(iStream);
                        DownloadFromStream(iStream, '', '', '', FileName);
                    end
                end;
            }
        }
    }
}