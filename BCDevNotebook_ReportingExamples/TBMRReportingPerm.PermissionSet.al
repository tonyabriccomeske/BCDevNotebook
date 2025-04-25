permissionset 70150 "TBMR_ReportingPerm"
{
    Caption = 'TBM Reporting Permissions';
    Assignable = true;
    Permissions = report TBMR_OverdueCustomerInvoices = X,
        report TBMR_SalesOrderItemCategory = X,
        page TBMR_Utility = X,
        query TBMR_AverageSalesAmount = X,
        query TBMR_BinLotNoExpiration = X,
        query TBMR_CountCustSalesDocType = X,
        query TBMR_CustBalanceOrdersAnalysis = X,
        query TBMR_GetStates = X,
        query TBMR_MaxQuantityOrdered = X,
        query TBMR_MinItemSalesPrice = X,
        query TBMR_OpenCustomerLedgerEntries = X,
        query TBMR_SaleOrdersByCustAnalysis = X,
        query TBMR_SalesDocTypeCustAnalysis = X,
        query TBMR_SalesOrderAPI = X,
        query TBMR_SalesOrderItemCategory = X,
        query "TBMR_Top Customer Overview" = X,
        query TBMR_WhereUsed = X;
}