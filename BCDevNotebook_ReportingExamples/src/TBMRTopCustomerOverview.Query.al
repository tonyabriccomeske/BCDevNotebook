query 70151 "TBMR_Top Customer Overview"
{
    QueryType = Normal;
    Caption = 'Tonya''s Top Customer Overview';

    // Teaching tip title and text. Available from version 23
    AboutTitle = 'Analyze your customers (slice and dice your data)';
    AboutText = 'Use this data cube to analyze your customers. You can group and/or the data on any dimension you like.';
    ContextSensitiveHelpPage = 'https://bcdevnotebook.com/resources/';

    // Category to show the query under in Tell Me (search) and in role explorer. Available from version 23
    UsageCategory = ReportsAndAnalysis;

    DataAccessIntent = ReadOnly; // use this to read data from the secondary database replica to speed up performance

    elements
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name) { Caption = 'Customer Name'; }
            column(No; "No.") { }
            column(Sales_LCY; "Sales (LCY)") { }
            column(Profit_LCY; "Profit (LCY)") { }
            column(Country_Region_Code; "Country/Region Code") { }
            column(City; City) { }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code") { }
            column(Global_Dimension_2_Code; "Global Dimension 2 Code") { }
            column(Salesperson_Code; "Salesperson Code") { }
            dataitem(Salesperson_Purchaser; "Salesperson/Purchaser")
            {
                DataItemLink = Code = Customer."Salesperson Code";
                column(SalesPersonName; Name) { Caption = 'Salesperson Name'; }
                dataitem(Country_Region; "Country/Region")
                {
                    DataItemLink = Code = Customer."Country/Region Code";
                    column(CountryRegionName; Name) { }
                }
            }
        }
    }
}