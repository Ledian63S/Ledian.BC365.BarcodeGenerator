table 60000 "Barcode Setup"
{
    Caption = 'Barcode Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[1])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(10; "Barcode URL"; Text[250])
        {
            Caption = 'Barcode URL';
            DataClassification = CustomerContent;
        }
        field(20; "Barcode Type"; Text[30])
        {
            Caption = 'Barcode Type';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Code")
        {
            Clustered = true;
        }
    }

    var
        RecordHasBeenRead: Boolean;

    procedure GetRecordOnce()
    begin
        if RecordHasBeenRead then
            exit;
        Rec.Get();
        RecordHasBeenRead := true;
    end;

    procedure InsertIfNotExists()
    var
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert(true);
        end;
    end;
}
