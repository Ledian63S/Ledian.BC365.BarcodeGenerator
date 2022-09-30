page 60000 "Barcode Setup"
{
    ApplicationArea = All;
    Caption = 'Barcode Setup';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Barcode Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {

                field("Barcode URL"; Rec."Barcode URL")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Barcode URL field.';
                }
                field("Barcode Type"; Rec."Barcode Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Barcode Type field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;
}
