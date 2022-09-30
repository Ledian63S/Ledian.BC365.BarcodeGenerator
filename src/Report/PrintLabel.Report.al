report 60000 "Print Label"
{
    ApplicationArea = All;
    Caption = 'Print Label';
    DefaultLayout = RDLC;
    RDLCLayout = './src/Layouts/PrintLabel.rdl';
    UsageCategory = Tasks;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.";
            column(Barcode; CompanyInfo.Picture) { }

            trigger OnAfterGetRecord()
            begin
                GenerateBarcode();
            end;
        }
    }

    trigger OnInitReport()
    begin
        BarcodeSetup.Get();
    end;

    local procedure GenerateBarcode()
    begin
        EncodeBarcodeEAN13 := '805636410511';
        URL := BarcodeSetup."Barcode Url" + EncodeBarcodeEAN13 + '&code=' + BarcodeSetup."Barcode Type" + '&dpi=96';
        if Client.Get(URL, Message) then begin
            Content := Message.Content();
            TempBlob.CreateInStream(InStr);
            CompanyInfo.Picture.CreateOutStream(OutStr);
            Content.ReadAs(Instr);
            CopyStream(OutStr, Instr);
        end;
    end;

    var
        BarcodeSetup: Record "Barcode Setup";
        CompanyInfo: Record "Company Information" temporary;
        TempBlob: Codeunit "Temp Blob";
        EncodeBarcodeEAN13: Text[12];
        Client: HttpClient;
        Content: HttpContent;
        Message: HttpResponseMessage;
        InStr: Instream;
        OutStr: OutStream;
        URL: Text;
}
