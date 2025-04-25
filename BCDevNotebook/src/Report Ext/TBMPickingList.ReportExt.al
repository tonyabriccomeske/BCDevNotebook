reportextension 70103 "TBM_PickingList" extends "Picking List"
{
    dataset
    {

    }

    rendering
    {
        layout(TBMCustomRDLC)
        {
            Caption = 'TBM Custom Picking List Layout';
            Type = RDLC;
            LayoutFile = './src/Report Ext/Layouts/TBMPickingList.rdl';
        }
    }
}