***********************.
*rename file for consistency in folder meinzer/projects/ssi/pending
pull out ssi and formated date
add files into combinedexcelfiles.sav'.
insert file='k:/meinzer/production/ps/modules/SSIPrep.sps'.


*HAND DELETE bad matches.

insert file='k:/meinzer/production/ps/modules/SSIPrep2.sps'.

*hand select best ssi close matches.

save outfile='k:/temp/IAR with keep.sav'.
*select if keep =1.
*look for obvious names regardless of ssn and less obviuos with confirmatory sssn.

save outfile='k:/temp/IARnamematched.sav' /keep ssiNumber SSIcountyReportAA .

add files
/file='I:\temp\MatchedSSN.sav' 
/file='k:/temp/IARnamematched.sav' /drop ssnSSI SSIcountyReport.

SAVE TRANSLATE /TYPE=ODBC
  /CONNECT='DSN=SSI;DBQ=I:\Wong\SSI Advocacy Referrals 02-01-2012.mdb;DriverId=25;FIL=MS '+
    'Access;MaxBufferSize=2048;PageTimeout=5;'
 /table= 'ClientUpdateStaging' /MAP/REPLACE
 /SQL='Update Clients master ' +
 'INNER JOIN ClientUpdateStaging stage ON master.SSInumber= Stage.ssiNumber ' +
'SET master.SSIcountyReport=stage.SSIcountyReportAA'.

*get file='I:\SSI\SSIqueue\IARpendingSSI.sav'.

*SAVE TRANSLATE /TYPE=ODBC
  /CONNECT='DSN=SSI;DBQ=I:\Wong\SSI Advocacy Referrals '+
    '02-01-2012.mdb;DriverId=25;FIL=MS Access;MaxBufferSize=2048;PageTimeout=5;'
   /TABLE='IARreports' /MAP/append.


