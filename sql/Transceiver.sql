PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE CONFIG ( KEYSTRING TEXT UNIQUE NOT NULL, VALUESTRING TEXT, STATIC INTEGER DEFAULT 0, OPTIONAL INTEGER DEFAULT 0, COMMENTS TEXT DEFAULT '');
-- Set debug level at "INFO".
INSERT INTO "CONFIG" VALUES('Log.Level','INFO',0,0,'Default logging level when no other level is defined for a file.');
-- IP address for Transceiver to bind to.
INSERT INTO "CONFIG" VALUES('TRX.IP','127.0.0.1',1,0,'IP address of the transceiver application.  Static.');
-- Port the Transceiver will bind to.
INSERT INTO "CONFIG" VALUES('TRX.Port','5700',1,0,'IP port of the transceiver application.  Static.');
COMMIT;
