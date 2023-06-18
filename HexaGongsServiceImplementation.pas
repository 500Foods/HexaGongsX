unit HexaGongsServiceImplementation;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  XData.Sys.Exceptions,

  System.Classes,
  System.JSON,
  System.SysUtils,
  System.IOUtils,
  System.Generics.Collections,

  System.Net.URLClient,
  System.Net.HttpClientComponent,
  System.Net.HttpClient,

  HexaGongsService;

type
  [ServiceImplementation]
  THexaGongsService = class(TInterfacedObject, IHexaGongsService)
  private
    function AvailableIconSets:TStream;
    function SearchIcons(SearchTerms: String; Results:Integer):TStream;
    function AvailableAudioClips:TStream;
    function GetAudioClip(AudioClip: String):TStream;
    function GetRemoteData(RemoteURL: String):TStream;
  end;

implementation

uses Unit2;

function THexaGongsService.AvailableAudioClips: TStream;
begin
  // Returning JSON, so flag it as such
  TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/json');

  Result := TStringStream.Create(MainForm.AppAudioClips.ToString);
end;

function THexaGongsService.GetAudioClip(AudioClip: String): TStream;
var
  AudioType: String;
  AudioFIle: String;
begin
  AudioFile := MainForm.AppAudioClipsFolder + AudioClip;

  if fileExists(AudioFile) then
  begin
    AudioType := lowercase(StringReplace(TPath.GetExtension(AudioFile),'.','',[rfReplaceAll]));
    if      AudioType = 'mp3' then TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/mpeg')
    else if AudioType = 'wav' then TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/wav')
    else if AudioType = 'ogg' then TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/ogg')
    else if AudioType = 'oga' then TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/ogg')
    else if AudioType = 'acc' then TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/acc')
    else TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'audio/'+AudioType);
  end
  else  raise EXDataHttpUnauthorized.Create('AudioClip was not found.');

 Result := TFileStream.Create(AudioFile,fmOpenRead);
end;

function THexaGongsService.GetRemoteData(RemoteURL: String): TStream;
var
  Client: TNetHTTPClient;
  ContentType: String;
  Response: TStream;
begin
  ContentType := 'undefined';

  if      Pos('.mp3', LowerCase(RemoteURL)) > 0 then ContentType := 'audio/mpeg'
  else if Pos('.wav', LowerCase(RemoteURL)) > 0 then ContentType := 'audio/wav'
  else if Pos('.ogg', LowerCase(RemoteURL)) > 0 then ContentType := 'audio/ogg'
  else if Pos('.oga', LowerCase(RemoteURL)) > 0 then ContentType := 'audio/ogg'
  else if Pos('.acc', LowerCase(RemoteURL)) > 0 then ContentType := 'audio/acc';

  if ContentType = 'undefined' then raise EXDataHttpUnauthorized.Create('RemoteURL must reference an audio file.');

  TXDataOperationContext.Current.Response.Headers.SetValue('content-type', ContentType);

  Client := TNetHTTPClient.Create(nil);
  Client.Asynchronous := False;
  Client.ContentType := ContentType;
  Client.SecureProtocols := [THTTPSecureProtocol.SSL3, THTTPSecureProtocol.TLS12];
  Response := Client.Get(RemoteURL).ContentStream;

//   MainForm.mmInfo.Lines.Add('response size: '+IntToStr(Response.Size));

  Result := TMemoryStream.Create;
  if Response.Size > 0 then
  begin
    Result.CopyFrom(Response, Response.Size);
    Client.Free;
  end
  else
  begin
    Client.Free;
    raise EXDataHttpUnauthorized.Create('RemoteURL returned no data.');
  end;
end;

function THexaGongsService.AvailableIconSets: TStream;
begin
  // Returning JSON, so flag it as such
  TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/json');

  Result := TStringStream.Create(MainForm.AppIconSets);
end;

function THexaGongsService.SearchIcons(SearchTerms: String; Results: Integer): TStream;
var
  IconsFound: TJSONArray;
  IconSet: TJSONObject;
  i: integer;
  j: integer;
  k: integer;
  IconName: String;
  Icon: TJSONArray;
  IconCount: Integer;
  Terms:TStringList;
  Matched: Boolean;
begin
  // Returning JSON, so flag it as such
  TXDataOperationContext.Current.Response.Headers.SetValue('content-type', 'application/json');

  // JSON Array we'll be returning
  IconsFound := TJSONArray.Create;
  IconCount := 0;

  // If all, will just iterate through the sets
  // Otherwise, we'll build a list and only iterate through the contents of that list
  k := Mainform.AppIcons.Count;

  // Sort out Search Terms
  Terms := TStringList.Create;
  Terms.CommaText := StringReplace(Trim(SearchTerms),' ',',',[rfReplaceAll]);

  i := 0;
  while (i < k) and (IconCount < Results) and (Terms.Count > 0) do
  begin

    // Load up an Icon Set to Search
    IconSet := (MainForm.AppIcons.Items[i] as TJSONObject).GetValue('icons') as TJSONObject;

    // Search all the icons in the Set
    for j := 0 to IconSet.Count-1 do
    begin

      if (IconCount < Results) then
      begin

        IconName := (Iconset.Pairs[j].JSONString as TJSONString).Value;

        // See if there is a match using the number of terms we have
        if Terms.Count = 1
        then Matched := (Pos(Terms[0], IconName) > 0)
        else if Terms.Count = 2
             then Matched := (Pos(Terms[0], IconName) > 0) and (Pos(Terms[1], IconName) > 0)
             else Matched := (Pos(Terms[0], IconName) > 0) and (Pos(Terms[1], IconName) > 0) and (Pos(Terms[2], IconName) > 0);

        // Got a match
        if Matched then
        begin
          Icon := TJSONArray.Create;
          Icon.Add(IconName);

          // Need to know what set it is in so we get lookup default width, height, license, set name
          Icon.Add(i);

          // Add in the icon data - the SVG and width/height overrides
          Icon.Add(IconSet.GetValue(IconName) as TJSONObject);

          // Save to our set that we're returning
          IconsFound.Add(Icon);
          IconCount := IconCount + 1;
        end;
      end;
    end;

    i := i + 1;
  end;

  // Return the array of results
  Result := TStringStream.Create(IconsFound.ToString);
end;

initialization
  RegisterServiceType(THexaGongsService);

end.
