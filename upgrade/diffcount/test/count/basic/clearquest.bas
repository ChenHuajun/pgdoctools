REM //////////////////////////////////////////////////////////////////////
REM //     Copyright (c) 1996-1998 Rational Software Corporation        //
REM //                                                                  //
REM // This file contains proprietary and confidential information and  //
REM // remains the unpublished property of Rational Software Corp. Use, //
REM // disclosure, or reproduction is prohibited except as permitted by //
REM // express written license agreement with Rational Software Corp.   //
REM //////////////////////////////////////////////////////////////////////


REM **  -------------------  CType  -------------------

Public Const PD_C_CHAR = 1
Public Const PD_C_LONGVARCHAR = 2
Public Const PD_C_LONGVARBINARY = 3
Public Const PD_C_SLONG = 4
Public Const PD_C_TIMESTAMP = 5
Public Const PD_C_DOUBLE = 6


REM **  -------------------  SessionType  -------------------


REM **  SHARED_SESSION: more than one client can access this session's data
Public Const AD_SHARED_SESSION = 1

REM **  PRIVATE_SESSION: only one client can access this session's data
Public Const AD_PRIVATE_SESSION = 2

REM **  ADMIN_SESSION: the sysadmin is logged in
Public Const AD_ADMIN_SESSION = 3

REM **  SHARED_METADATA_SESSION: the session that owns only a read-only copy of the metadata to be shared by other shared or private sessions
Public Const AD_SHARED_METADATA_SESSION = 4


REM **  -------------------  EntityType  -------------------


REM **  REQ_ENTITY: request-like entities are "like" bug reports
Public Const AD_REQ_ENTITY = 1

REM **  AUX_ENTITY: common info shared among requests
Public Const AD_AUX_ENTITY = 2

REM **  ANY_ENTITY: for when we don't care or know which kind it is
Public Const AD_ANY_ENTITY = 3


REM **  -------------------  Requiredness  -------------------


REM **  MANDATORY: A value must be provided
Public Const AD_MANDATORY = 1

REM **  OPTIONAL: A value may be provided
Public Const AD_OPTIONAL = 2

REM **  READONLY: The current value (or lack thereof) may not be changed
Public Const AD_READONLY = 3

REM **  USE_HOOK: A hook must be interrogated to determine requiredness
Public Const AD_USE_HOOK = 4


REM **  -------------------  FieldType  -------------------


REM **  SHORT_STRING: Simple text field (100 character limit)
Public Const AD_SHORT_STRING = 1

REM **  MULTILINE_STRING: Arbitrarily long text
Public Const AD_MULTILINE_STRING = 2

REM **  INT: Numbers
Public Const AD_INT = 3

REM **  DATE_TIME: Timestamp
Public Const AD_DATE_TIME = 4

REM **  REFERENCE: "pointer" to another (aux) table
Public Const AD_REFERENCE = 5

REM **  REFERENCE_LIST: list of references
Public Const AD_REFERENCE_LIST = 6

REM **  ATTACHMENT_LIST: list of attached files
Public Const AD_ATTACHMENT_LIST = 7

REM **  ID: special: string ID for entity
Public Const AD_ID = 8

REM **  STATE: special: state of request entity
Public Const AD_STATE = 9

REM **  JOURNAL: special: list of rows in a subtable belonging exclusively to this entity
Public Const AD_JOURNAL = 10

REM **  DBID: special: internal numeric id
Public Const AD_DBID = 11

REM **  STATETYPE: special: package state type of request entity
Public Const AD_STATETYPE = 12

REM **  RECORDTYPE: special: the entitydef name of the entity
Public Const AD_RECORDTYPE = 13

REM **  FLOAT: floating point double precision
Public Const AD_FLOAT = 14


REM **  -------------------  HookEventType  -------------------

Public Const AD_BUTTON_CLICK = 1
Public Const AD_SUBDIALOG_BUTTON_CLICK = 2
Public Const AD_ITEM_SELECTION = 3
Public Const AD_ITEM_DBLCLICK = 4
Public Const AD_CONTEXMENU_ITEM_SELECTION = 5
Public Const AD_CONTEXMENU_ITEM_CONDITION = 6

REM **  -------------------  ActionType  -------------------


REM **  SUBMIT: (modify-like) Make a new entity
Public Const AD_SUBMIT = 1

REM **  MODIFY: (modify-like) Change an entity
Public Const AD_MODIFY = 2

REM **  CHANGE_STATE: (modify-like) Change the state of a request entity
Public Const AD_CHANGE_STATE = 3

REM **  DUPLICATE: (modify-like) Mark entity a duplicate of another
Public Const AD_DUPLICATE = 4

REM **  UNDUPLICATE: (modify-like) Undo DUPLICATE
Public Const AD_UNDUPLICATE = 5

REM **  IMPORT: (modify-like) Import a new entity
Public Const AD_IMPORT = 6

REM **  DELETE: delete (really delete) an entity
Public Const AD_DELETE = 7

REM **  BASE: base action; logical action for defining base hook programs
Public Const AD_BASE = 8

REM **  RECORD_SCRIPT_ALIAS: The action's entire body is specified by
Public Const AD_RECORD_SCRIPT_ALIAS = 9


REM **  -------------------  ChoiceType  -------------------


REM **  CLOSED_CHOICE: Must use a choice option
Public Const AD_CLOSED_CHOICE = 1

REM **  OPEN_CHOICE: Can enter something besides the choice list
Public Const AD_OPEN_CHOICE = 2


REM **  -------------------  DbVendor  -------------------

Public Const AD_SQL_SERVER = 1
Public Const AD_MS_ACCESS = 2
Public Const AD_SQL_ANYWHERE = 3
Public Const AD_ORACLE = 4
Public Const AD_DB2 = 5

REM **  -------------------  AttachmentsUniqueKeySeq  -------------------

Public Const AD_ATTACHMENTS_DBID_UK_SEQ = 1
Public Const AD_ATTACHMENTS_FILENAME_UK_SEQ = 2
Public Const AD_ATTACHMENTS_FILESIZE_UK_SEQ = 3
Public Const AD_ATTACHMENTS_DESCRIPTION_UK_SEQ = 4

REM **  -------------------  HistoryUniqueKeySeq  -------------------

Public Const AD_HISTORY_DBID_UK_SEQ = 1
Public Const AD_HISTORY_ACTION_TIMESTAMP_UK_SEQ = 2
Public Const AD_HISTORY_USER_NAME_UK_SEQ = 3
Public Const AD_HISTORY_ACTION_NAME_UK_SEQ = 4
Public Const AD_HISTORY_OLD_STATE_UK_SEQ = 5
Public Const AD_HISTORY_NEW_STATE_UK_SEQ = 6

REM **  -------------------  MessageKind  -------------------


REM **  TEXT_MSG: a normal message
Public Const AD_TEXT_MSG = 1

Public Const AD_WARNING_MSG = 2
Public Const AD_ERROR_MSG = 3
Public Const AD_EXCEPTION_MSG = 4

REM **  DEBUG_MSG: always delivered to OutputDebugString()
Public Const AD_DEBUG_MSG = 5


REM **  -------------------  UserPrivilegeMaskType  -------------------

Public Const AD_DYNAMIC_LIST_ADMIN = 1
Public Const AD_PUBLIC_FOLDER_ADMIN = 2
Public Const AD_SECURITY_ADMIN = 3
Public Const AD_RAW_SQL_WRITER = 4
Public Const AD_ALL_USERS_VISIBLE = 5
Public Const AD_MULTI_SITE_ADMIN = 6
Public Const AD_SUPER_USER = 7
Public Const AD_APP_BUILDER = 8
Public Const AD_USER_ADMIN = 9


REM **  -------------------  BoolOp  -------------------

Public Const AD_BOOL_OP_AND = 1
Public Const AD_BOOL_OP_OR = 2

REM **  -------------------  CompOp  -------------------

Public Const AD_COMP_OP_EQ = 1
Public Const AD_COMP_OP_NEQ = 2
Public Const AD_COMP_OP_LT = 3
Public Const AD_COMP_OP_LTE = 4
Public Const AD_COMP_OP_GT = 5
Public Const AD_COMP_OP_GTE = 6
Public Const AD_COMP_OP_LIKE = 7
Public Const AD_COMP_OP_NOT_LIKE = 8
Public Const AD_COMP_OP_BETWEEN = 9
Public Const AD_COMP_OP_NOT_BETWEEN = 10
Public Const AD_COMP_OP_IS_NULL = 11
Public Const AD_COMP_OP_IS_NOT_NULL = 12
Public Const AD_COMP_OP_IN = 13
Public Const AD_COMP_OP_NOT_IN = 14

REM **  -------------------  DbAggregate  -------------------

Public Const AD_DB_AGGR_COUNT = 1
Public Const AD_DB_AGGR_SUM = 2
Public Const AD_DB_AGGR_AVG = 3
Public Const AD_DB_AGGR_MIN = 4
Public Const AD_DB_AGGR_MAX = 5

REM **  -------------------  DbFunction  -------------------

Public Const AD_DB_DAY_FUNC = 1
Public Const AD_DB_WEEK_FUNC = 2
Public Const AD_DB_MONTH_FUNC = 3
Public Const AD_DB_YEAR_FUNC = 4

REM **  -------------------  Sort  -------------------

Public Const AD_SORT_ASC = 1
Public Const AD_SORT_DESC = 2

REM **  -------------------  FetchStatus  -------------------

Public Const AD_SUCCESS = 1
Public Const AD_NO_DATA_FOUND = 2
Public Const AD_MAX_ROWS_EXCEEDED = 3
Public Const AD_ROW_DELETED = 4

REM **  -------------------  QueryType  -------------------


REM **  LIST_QUERY: in grid
Public Const AD_LIST_QUERY = 1

REM **  REPORT_QUERY: as report?? maybe this isn't one of these..
Public Const AD_REPORT_QUERY = 2

REM **  CHART_QUERY: as chart
Public Const AD_CHART_QUERY = 3


REM **  -------------------  CursorType  -------------------

Public Const AD_CURSOR_FORWARD_ONLY = 1
Public Const AD_CURSOR_SCROLLING = 2


REM **  -------------------  ValueStatus  -------------------


REM **  HAS_NO_VALUE: Field has no value set
Public Const AD_HAS_NO_VALUE = 1

REM **  HAS_VALUE: Field has a value
Public Const AD_HAS_VALUE = 2

REM **  VALUE_NOT_AVAILABLE: Field cannot respond to request for that value
Public Const AD_VALUE_NOT_AVAILABLE = 3


REM **  -------------------  FieldValidationStatus  -------------------


REM **  KNOWN_VALID: Field's value is known to be valid
Public Const AD_KNOWN_VALID = 1

REM **  KNOWN_INVALID: Field's value is known to be invalid
Public Const AD_KNOWN_INVALID = 2

REM **  NEEDS_VALIDATION: Field's value is plausibly valid but not checked yet
Public Const AD_NEEDS_VALIDATION = 3


REM **  -------------------  EntityStatus  -------------------


REM **  ENTITY_NOT_FOUND: Entity does not exist in the database
Public Const AD_ENTITY_NOT_FOUND = 1

REM **  ENTITY_VISIBLE: Entity exists and is visible to current user
Public Const AD_ENTITY_VISIBLE = 2

REM **  ENTITY_HIDDEN: Entity exists but hidden from current user
Public Const AD_ENTITY_HIDDEN = 3


REM **  -------------------  WorkspaceItemType  -------------------

Public Const AD_WORKSPACE_QUERY = 1
Public Const AD_WORKSPACE_CHART = 2
Public Const AD_WORKSPACE_FOLDER = 3
Public Const AD_WORKSPACE_ERMFORMAT = 4
Public Const AD_WORKSPACE_FAVORITES = 5
Public Const AD_WORKSPACE_QUERY_PARAMETERS = 6
Public Const AD_WORKSPACE_PREFERENCES = 7
Public Const AD_WORKSPACE_INPUT_TEMPLATE = 8
Public Const AD_WORKSPACE_REPORT = 9
Public Const AD_WORKSPACE_REPORT_FMT = 10
Public Const AD_WORKSPACE_STARTUP_BUCKET_ARRAY = 11

REM **  -------------------  WorkspaceFolderType  -------------------


REM **  WORKSPACE_PUBLIC_FOLDER: Public folder items
Public Const AD_WORKSPACE_PUBLIC_FOLDER = 1

REM **  WORKSPACE_USER_FOLDER: Personal folder items
Public Const AD_WORKSPACE_USER_FOLDER = 2


REM **  -------------------  WorkspaceNameOption  -------------------

Public Const AD_WORKSPACE_NAME_NOT_EXTENDED = 1
Public Const AD_WORKSPACE_NAME_EXTENDED = 2
Public Const AD_WORKSPACE_NAME_EXTEND_WHEN_NEEDED = 3


