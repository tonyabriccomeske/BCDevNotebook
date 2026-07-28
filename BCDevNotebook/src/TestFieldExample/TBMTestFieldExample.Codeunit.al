codeunit 70101 "TBM_TestFieldExample"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeReleaseSalesDoc, '', false, false)]
    local procedure "Release Sales Document_OnBeforeReleaseSalesDoc"(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var IsHandled: Boolean;
                                                                        var SkipCheckReleaseRestrictions: Boolean; SkipWhseRequestOperations: Boolean)
    begin
        VerifyCustomerEmailAddress(SalesHeader);
        VerifyUserCanReleaseSalesOrder();
    end;

    procedure VerifyCustomerEmailAddress(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
        MissingEmailErrorInfo: ErrorInfo;
    begin
        Customer.Reset();
        Customer.SetRange("No.", Rec."Sell-to Customer No.");
        Customer.SetLoadFields("E-Mail");
        if Customer.FindFirst() then begin
            MissingEmailErrorInfo := ErrorInfo.Create(StrSubstNo(FieldMissingErr, Customer.FieldCaption("E-Mail")), false, Customer, Customer.FieldNo("E-Mail"), Page::"Customer Card", 'E-Mail');
            MissingEmailErrorInfo.AddNavigationAction('Show Customer Card');
            Customer.TestField("E-Mail", MissingEmailErrorInfo);
        end
    end;

    procedure VerifyUserCanReleaseSalesOrder()
    var
        UserSetup: Record "User Setup";
        MissingEmailErrorInfo: ErrorInfo;

    begin
        UserSetup.Get(UserId());
        MissingEmailErrorInfo := ErrorInfo.Create(StrSubstNo(FieldMissingErr, UserSetup.FieldCaption("TBM_Favorite Cat Breed")), false, UserSetup,
                                UserSetup.FieldNo("TBM_Favorite Cat Breed"), Page::"User Setup", 'TBM_Favorite Cat Breed');
        MissingEmailErrorInfo.AddNavigationAction('Show User Setup');
        Error(MissingEmailErrorInfo);
    end;

    var
        FieldMissingErr: Label '%1 is required before you can release the Sales Order.', Comment = '%1 = Field that is required, e.g. Email';



}