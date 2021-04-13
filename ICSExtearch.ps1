$ExtensionDictionary = @{
    "rdb" = "relay configuration files"
    "exp"="RTAC project file"
    "hprb"="RTAC HMI Configuration"
    "selaprj"="Architect project file"
    "bkp"="SEL 3620 configuration file"
    "ssnet"="Subnet Solutions project file"
    "ncd"="OrionLX configuration file"
    "ncz"="OrionLX configuration 61850 support file"
    "prj"="Potential Control Builder project file"
    "rcd"="RTU560 configuration"
    "rtu"="RTU560 configuration"
    "SYS_BASCOM"="ABB SYS600 Base System Configuration file"
    "pcmp"="ABB configuration project"
    "pcmi"="ABB PCM600 IEC File"
    "pcmt"="ABB PCM600 Template IED File"
    "spj"="Motorola ACE project file"
    "plz"="Motorola ACE compiled library"
    "adb"="Motorola ACE Application"
    "opt"="Motorola ACE Application"
    "prp"="Motorola ACE Application"
    "scl"="Substation Configuration Language (IEC 61850)"
    "icd"="Substation Configuration Language (IEC 61850)"
    "ied"="Substation Configuration Language (IEC 61850)"
    "cid"="IED Capability Description (IEC 61850)"
    "scd"="Substation Configuration Description (IEC 61850)"
    "ssd"="System Specification Description (IEC 61850)"
    "ctz"="Unknown"
    "ap12"="Number is version of TIA Portal"
    "conf"="Unknown"
    "gz"="Unknown"
    "urs"="GE UR settings file"
    "tcw"="Mark VIe control .tcw file"
    "hmb"="Cimplicity HMI configuration file"
    "m6b"="Binary file used in Speedtronics turbine control"
    "sim"="Virtual controller sim file that holds the project configuration"
    "syl"="Virtual controller sim file that contains named variables and all internal states"
    "cfg"="Unknown"
    "pt2"="Unknown"
    "l5x"="Unknown"
    "xml"="Unknown"
    "pl"="Programmable Logic File (vendor neutral)"
    "paf"="PLC Archive File (vendor neutral)"
    "ini"="Possible configuration file"
    "cin"="ABB MicroSCADA specific file"
    "xrf"="Cross-Reference File"
    "v"="Potential Autocad file"
    "trc"="Trace file type specified in OPC DA"
    "out"="Siemens PSSE output"
    "s5d"="Siemens SIMATIC Step 5 program"
    "s7p"="Siemens SIMATIC Step 7 program"
    "mwp"="Siemens Step 7-micro PLV program"
    "s7f"="Siemens SIMATIC Step 7 project"
    "arj"="Siemens SIMATIC Step 7 compressed project"
    "ekb"="Siemens Automation License Manager data"
    "license"="Potential license data"
    "lic"="FlexNet license files"
    "vstax"="Visual Studio Tools for Applications Template"
    "cv4"="Microsoft CodeView Graphics Data"
    "dtq"="Visual Studio .NET SQL Query"
    "pc5"="RSLogix internal data"
    "eas"="RSLogix 5000 symbol data"
    "l5k"="RSLogix 5000 project export data"
    "apa"="FactoryTalk Project Archive"
    "gsg"="PROFINET General Station Description (german)"
    "gse"="PROFINET General Station Description (english)"
    "gsf"="PROFINET General Station Description (french)"
    "gsi"="PROFINET General Station Description (italian)"
    "gsp"="PROFINET General Station Description (portuguese)"
    "gss"="PROFINET General Station Description (spanish)"
    "gsd"="PROFINET General Station Description"
}
$IncludeExtensions = ""

$ExtensionDictionary.GetEnumerator() | ForEach-Object {
    $IncludeExtensions += "*.$($_.Key)," 
}
 
$IncludeExtensions = $IncludeExtensions.Substring(0,$IncludeExtensions.Length-1)

Write-Host $IncludeExtensions

$FilesDictionary = Get-ChildItem -Path "C:\Users","C:\Program Files" -recurse -Include *.bkp,*.gsf,*.trc,*.hprb,*.arj,*.s7f,*.icd,*.selaprj,*.ssnet,*.rdb,*.gsp,*.lic,*.ekb,*.prp,*.out,*.spj,*.pcmi,*.sim,*.m6b,*.ssd,*.cv4,*.scl,*.gz,*.ap12,*.ini,*.license,*.prj,*.apa,*.plz,*.pcmt,*.ncz,*.gss,*.mwp,*.s7p,*.conf,*.gsg,*.pt2,*.SYS_BASCOM,*.paf,*.rtu,*.eas,*.opt,*.pl,*.rcd,*.scd,*.hmb,*.gsi,*.ctz,*.v,*.ncd,*.pcmp,*.s5d,*.gse,*.cin,*.l5x,*.ied,*.l5k,*.gsd,*.cfg,*.cid,*.xml,*.adb,*.syl,*.tcw,*.pc5,*.exp,*.dtq,*.urs,*.vstax,*.xrf -ErrorAction SilentlyContinue  | Select -ExpandProperty Fullname

foreach ($F in $FilesDictionary.GetEnumerator()) {
    foreach ($E in $ExtensionDictionary.GetEnumerator()) {
        if ($F.split(".")[-1] -eq $E.Name)
        {
            Write-Host "$($F) :$($E.Value)"
        }
    }
}
