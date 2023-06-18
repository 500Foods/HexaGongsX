unit HexaGongsService;

interface

uses
  System.Classes,
  XData.Service.Common;

type
  [ServiceContract]
  IHexaGongsService = interface(IInvokable)
    ['{1756CAAA-25F4-4380-A6CE-7C514B0C5C06}']

    ///  <summary>
    ///    List of Icon Sets that are available for search and retrieval
    ///  </summary>
    ///  <remarks>
    ///    Returns a JSON array that includes the following.
    ///    - Name of Icon Set
    ///    - License Information
    ///    - Count of Icons included in Set
    ///    - Default Icon Width for Set
    ///    - Default Icon Height for Set
    ///
    ///    The order of the array should be used to identify which sets are to be included or excluded when a search is requested.
    ///  </remarks>
    [HttpGet] function AvailableIconSets:TStream;


    ///  <summary>
    ///    Performs a search for icons, returning whatever icons were found as a JSON array.
    ///  </summary>
    ///  <remarks>
    ///    The returned array is a JSON list of icons, including the SVG parts needed to build the icon.
    ///  </remarks>
    ///  <param name="SearchTerms">
    ///    Up to three terms will be used in conducting the search.  Any more that are passed in will be ignored.
    ///  </param>
    ///  <param name="Results">
    ///    Indicates how many icons are to be returned.  If conducting searches while someone is typing, this should be a much smaller number than if a more deliberate search is being performed.
    ///  </param>
    [HttpGet] function SearchIcons(SearchTerms: String; Results:Integer):TStream;


    ///  <summary>
    ///    List of Audio Clips that are available.
    ///  </summary>
    ///  <remarks>
    ///    Returns a JSON array that includes the following.
    ///    - Name of Audio Clip
    ///    - Type of Audio Clip (wav, mp3, ogg, etc)
    ///    - Filename of Audio Clip - use this to retrieve the audio file
    ///    - Size of Audio Clip in bytes
    ///  </remarks>
    [HttpGet] function AvailableAudioClips:TStream;


    ///  <summary>
    ///    Return an audio file based on the filename from the above list
    ///  </summary>
    ///  <remarks>
    ///    Returns a JSON array that includes the following.
    ///  </remarks>
    ///  <param name="AudioClip">
    ///    Returns the audio file with the specified filename.
    ///  </param>
    [HttpGet] function GetAudioClip(AudioClip: String):TStream;


    ///  <summary>
    ///    This returns the remote file specified.
    ///  </summary>
    ///  <remarks>
    ///    This is a CORS proxy.
    ///  </remarks>
    ///  <param name="RemoteURL">
    ///    Returns the specified file.
    ///  </param>
    [HttpGet] function GetRemoteData(RemoteURL: String):TStream;

  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IHexaGongsService));

end.
