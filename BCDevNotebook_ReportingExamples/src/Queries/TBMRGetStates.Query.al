query 70161 "TBMR_GetStates"
{
    Caption = 'Get States';
    QueryType = Normal;
    OrderBy = ascending(locationCode, ShipToCounty);

    elements
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(ShipToCounty; "Ship-to County") { }
            column(LocationCode; "Location Code") { }
            column(DocumentType; "Document Type") { }
            column(Count)
            {
                Method = Count;
            }
        }
    }
}