query 70153 "TBMR_WhereUsed"
{
    Caption = 'Where Used';
    QueryType = Normal;
    DataAccessIntent = ReadOnly;
    Access = Public;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(Item; Item)
        {
            column(ItemNo; "No.")
            {
                Caption = 'Item No.';
            }
            column(ItemDescription; Description)
            {
                Caption = 'Item Description';
            }

            dataitem(ProductionBOMLine; "Production BOM Line")
            {
                DataItemLink = "No." = Item."No.";

                column(ProdBomLine_No; "No.")
                {
                    Caption = 'Part No.';
                }
                column(ProdBomLine_Quantity; Quantity)
                {
                    Caption = 'Quantity';
                }
                column(ProdBomLine_UOM; "Unit of Measure Code")
                {
                    Caption = 'Part UOM';
                }
                column(ProdBomLine_Starting_Date; "Starting Date")
                {
                    Caption = 'Item Start Date';
                }
                column(ProdBomLine_Ending_Date; "Ending Date")
                {
                    Caption = 'Item End Date';
                }
                column(ProdBomLine_Version; "Version Code")
                {
                    Caption = 'Prod. BOM Line Version Code';
                }
                column(ProdBomLine_Type; Type)
                {
                    Caption = 'Type';
                }

                dataitem(ProductionBomVersion; "Production BOM Version")
                {
                    DataItemLink = "Production BOM No." = ProductionBOMLine."Production BOM No.", "Version Code" = ProductionBOMLine."Version Code";
                    SqlJoinType = LeftOuterJoin;

                    column(Version_Status; Status)
                    {
                        Caption = 'Version Status';
                    }
                    column(Version_Code; "Version Code")
                    {
                        Caption = 'Version Code';
                    }
                    column(Version_StartingDate; "Starting Date")
                    {
                        Caption = 'Version Start Date';
                    }

                    dataitem(ProductionBOMHeader; "Production BOM Header")
                    {
                        DataItemLink = "No." = ProductionBOMLine."Production BOM No.";

                        column(ProductionBomHeader_No; "No.")
                        {
                            Caption = 'Production BOM';
                        }
                        column(BOM_Description; Description)
                        {
                            Caption = 'BOM Description';
                        }
                        column(BOM_UnitofMeasureCode; "Unit of Measure Code")
                        {
                            Caption = 'BOM UOM';
                        }
                        column(BOM_Status; Status)
                        {
                            Caption = 'Status';
                        }
                    }
                }
            }
        }
    }
}
