using System.Data;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Collections.Generic;
using static System.Environment;

namespace DnD_Site.App_Code
{
    /// <summary>
    /// Aiding methods for accesingt the database 
    /// </summary>

    public class MyAdoHelperAccess
    {
        public const string DefaultFileName = "Database.accdb";
        public const string DefaultTableName = "tbl_users";
        public const string DefaultSelectAll = "SELECT * FROM tbl_users";
        public static readonly string Indent = new string (' ', 4);
        public static readonly string DoubleIndent = new string (' ', 8);
        public static readonly string[] DefaultColumns = new string[] {"FirstName",
            "LastName", "birthday", "PhoneNumber","gender","email", "Username", "Password", "IDNum"};
        public static readonly string[] DefaultColumnsVisual = new string[] {"No.", "ID",
            "FirstName", "LastName", "birthday", "PhoneNumber","gender",
            "email", "Username", "IDNum", "Password", "Delete Buttons" };
        public static readonly string[] DefaultForbidden = new string[] { "admin" };
        public static readonly Dictionary<string, string> ColumnToHeader = new Dictionary<string, string>
        {
            {"No.", "No." },
            {"ID", "User ID"},
            {"FirstName",  "First Name"},
            {"LastName", "Last Name"},
            {"birthday", "Birthday"},
            {"PhoneNumber", "Phone Number"},
            {"gender", "Gender"},
            {"email", "Email"},
            {"Username", "Username"},
            {"Password", "Password"},
            {"IDNum", "Identification Number"},
            {"Delete Buttons", "Delete Buttons"}
        };

        public static OleDbConnection ConnectToDb(string FileName = DefaultFileName, string ProjectName = "DnD Site")
        {
            string RelativePath = HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.Replace("~/", "");
            string AbsouluteCurrentPath = HttpContext.Current.Server.MapPath(RelativePath); //The Database's path.
            string Path = AbsouluteCurrentPath.Substring(0, AbsouluteCurrentPath.IndexOf(ProjectName) + ProjectName.Length) +
                "/App_Data/";
            Path += FileName;
            //The connection data as code string.
            string ConnString = "Provider=Microsoft.Jet.OLEDB.4.0;Data source=" + Path + ";Persist Security Info=True";
            OleDbConnection Connection = new OleDbConnection(ConnString);
            return Connection;
        }

        /// <summary>
        /// Executes a non-query sql command (Insert/Update/Delete) on the connected databse.
        /// </summary>
        public static int DoQuery(string sql, string fileName = DefaultFileName)
        {
            OleDbConnection Connection = ConnectToDb(fileName);
            Connection.Open();
            OleDbCommand NonQuery = new OleDbCommand(sql, Connection);
            int RowsAffected = NonQuery.ExecuteNonQuery();

            NonQuery.Dispose();
            Connection.Close();

            return RowsAffected;

        }


        /// <summary>
        /// Takes a filenamea and a query.
        ///  Returns false if no value was found.
        ///  Otherwise returns true.
        /// </summary>
        public static bool CanFind(string sql, string FileName = DefaultFileName)
        {

            OleDbConnection Connection = ConnectToDb(FileName);
            Connection.Open();
            OleDbCommand Query = new OleDbCommand(sql, Connection);
            OleDbDataReader data = Query.ExecuteReader();
            bool found;
            found = (bool)data.Read();  // If null - false. Otherwise - true.
            Connection.Close();
            return found;

        }

        public static DataTable GetDataTableByQuery(string sql, string fileName =DefaultFileName)
        {
            OleDbConnection Connection = ConnectToDb(fileName);
            Connection.Open();
            OleDbDataAdapter TableAdapter = new OleDbDataAdapter(sql, Connection);
            DataTable DT = new DataTable();
            TableAdapter.Fill(DT);
            Connection.Close();
            return DT;
        }

        public static void ExecuteNonQuery(string sql, string fileName = DefaultFileName)
        {
            OleDbConnection Connection = ConnectToDb(fileName);
            Connection.Open();
            OleDbCommand Command = new OleDbCommand(sql, Connection);
            Command.ExecuteNonQuery();
            Command.Dispose();
            Connection.Close();
        }


        public static string GetTable(DataTable DataTable, string[] Headers, string[] Forbidden)
        {
            string TableCode = "<table border='1'>";

            TableCode += NewLine + Indent + "<tr>";
            foreach (string Header in Headers)
            {
                TableCode += NewLine + DoubleIndent + "<th>" + ColumnToHeader[Header]
                    + "</th>";
            }
            TableCode += NewLine + Indent + "</tr>";

            foreach (DataRow Row in DataTable.Rows)
            {
                if (!Forbidden.Contains<string>(Row["Username"].ToString()))
                {
                    TableCode += NewLine + Indent + "<tr>";

                    foreach (string Key in Headers)
                    {
                        string UserAttribute = string.Empty;

                        switch (Key)
                        {
                            case ("PhoneNumber"):
                                UserAttribute = "0" + Row[Key];
                                break;
                            case ("birthday"):
                                UserAttribute = Row[Key].ToString().Remove(
                                    Row[Key].ToString().Length - " 00:00:00".Length);
                                break;
                            case ("No."):
                                UserAttribute = (string)Row["Indexer"].ToString();
                                break;
                            default:
                                UserAttribute = (string)Row[Key].ToString();
                                break;
                        }

                        TableCode += NewLine + DoubleIndent + 
                            "<td>" + UserAttribute + "</td>";
                    }

                    TableCode += NewLine + Indent + "</tr>";
                }
            }
            TableCode += NewLine + "</table>";
            return TableCode;
        }

        public static string GetTable(DataTable DataTable)
        {
            return GetTable(DataTable, DefaultColumns,DefaultForbidden);
        }

        public static string GetTable(DataTable DataTable, string[] Headers)
        {
            return GetTable(DataTable, Headers, DefaultForbidden);
        }

        /// <summary>
        /// Returns the HTML code for the tabled selected by input query.
        /// </summary>
        public static string GetTable(string Query, string FileName = DefaultFileName)
        { 
            return GetTable(GetDataTableByQuery(Query, FileName), DefaultColumns, DefaultForbidden);
        }


        /// <summary>
        /// Returns the HTML code for the tabled selected by input query.
        /// </summary>
        public static string GetTable(string Query, string[] Headers, string[] Forbidden, string FileName = DefaultFileName)
        {
            return GetTable(GetDataTableByQuery(Query, FileName), Headers, Forbidden);
        }

        /// <summary>
        /// Returns the HTML code for the tabled selected by input query.
        /// </summary>
        public static string GetTable(string Query, string[] Headers, string FileName = DefaultFileName)
        {
            return GetTable(Query, Headers, DefaultForbidden, FileName);
        }

        public static DataTable GetDataTableWithDel(string DelURL, string Query = DefaultSelectAll, 
            string FileName = DefaultFileName)
        {
            DataTable Table = GetDataTableByQuery(Query);
            string ButtonColumnName = "Delete Buttons";
            string FormTagOpen = 
                   $"<form action=\"{DelURL}\" name=\"DelTable\" method=\"post\">";
            string SubmitButton = $"<input type = \"submit\" name = \"Deleter\" value = \"delete\"/>";
            string FormClose = "</form>";
            Table.Columns.Add(ButtonColumnName);
            Table.Columns.Add("Indexer");
            Table.Columns["Indexer"].SetOrdinal(0);
            int ButtonIndex = Table.Columns.Count;
            for(int i = 0; i < Table.Rows.Count; i++)
            {
                int ID = (int)Table.Rows[i]["ID"];
                Table.Rows[i]["Indexer"] = i + 1;
                string UserIDBox =
                    $"<input type = \"hidden\" value = \"{ID}\" " +
                    $"name = \"ID\" id = \"ID\"/>";
                Table.Rows[i][ButtonColumnName] =
                    FormTagOpen +
                    NewLine +

                    SubmitButton +
                    NewLine +

                    UserIDBox +
                    NewLine +

                    FormClose;
            }

            return Table;
        }

        public static string GetTableWithDel(string DelURL, string Query = DefaultSelectAll,
            string FileName = DefaultFileName)
        {
            return GetTable(GetDataTableWithDel(DelURL, Query, FileName), DefaultColumnsVisual);
        }

        public static string GetTableWithEdit(string EditPage, string[] Columns, string[] Forbidden,
            string Query = DefaultSelectAll, string FileName = DefaultFileName)
        {
            DataTable Table = GetDataTableByQuery(Query);
            Table.Columns.Remove("ID");
            string[] NewRow = new string[Table.Columns.Count];
            string TableCode = GetTable(Table, Columns, Forbidden);
            string FormTagOpen =
                   $"<form action=\"{EditPage}\" name=\"Edit\" method=\"post\">";
            string SubmitButton = $"<input type = \"submit\" name = \"Editor\" value = \"Change\"/>";
            string FormClose = "</form>";
            for (int i = 0; i < Table.Columns.Count; i++)
            {
                string Header = Columns[i];
                string AttributeBox = $"<input type= \"Hidden\" name = \"Attribute\" value=\"{Header}\">";
                NewRow[i] =
                    FormTagOpen +
                    NewLine +
                    Indent +

                    SubmitButton +
                    NewLine +
                    Indent +

                    AttributeBox +
                    NewLine +

                    FormClose;
            }

            TableCode = AddRow(TableCode, NewRow);
            return TableCode;
        }

        public static string GetUserDropDown(string Query, string FileName = DefaultFileName)
        {
            DataTable DT = GetDataTableByQuery(Query, FileName);

            string DropDownCode = "<select dir='rtl' id='users' name='users'>";

            foreach (DataRow Row in DT.Rows)
            {
                DropDownCode += $"<option value='{Row[0].ToString()}'> {Row[0].ToString()} </option>";
            }
            DropDownCode += "</select>";

            return DropDownCode;
        }

        public static object GetValueByQuery(string Header, string EqualCondition,
            string TableName = DefaultTableName, string FileName = DefaultFileName)
        {
            DataTable Table = GetDataTableByQuery(SELECT(new string[] { Header }, EqualCondition));
            return Table.Rows[0][Header];
        }


        public static string AdjustDate(string DateString)
        {
            DateString = DateString.Replace('-', '/');
            int YearEnd = DateString.IndexOf('/');
            string Year = DateString.Substring(0, YearEnd);
            DateString = DateString.Remove(0, YearEnd + 1);
            DateString = $"#{DateString}/{Year}#";
            return DateString;
        }
        
        public static string SqlDateToHTML(string DateString)
        {
            DateString = DateString.Replace(
                DateString.Substring(DateString.Length - " 00:00:00".Length),
                string.Empty);
            int YearStart = DateString.IndexOf('/');
            YearStart = DateString.IndexOf('/',YearStart + 1);
            string Year = DateString.Substring(YearStart + 1);
            DateString = DateString.Remove(YearStart);
            DateString = $"{Year}/{DateString}";
            DateString = DateString.Replace('/', '-');
            return DateString;
        }

        public static string INSERT(string[][] ValueArr, string TableName = DefaultTableName)
        {
            string[] Headers = new string[ValueArr.Length];
            string[] Values = new string[ValueArr.Length];
            for (int i = 0; i < ValueArr.Length; i++)
            {
                string[] Arr = ValueArr[i];
                Headers[i] = ValueArr[i][0];        
                Values[i] = ValueArr[i][1];
            }

            return INSERT(Headers, Values, TableName);
        }

        public static string INSERT(string[] Headers, string[] Values, 
            string TableName = DefaultTableName)
        {
            string Command = $"INSERT INTO {TableName} (";
            for (int i = 0; i < Headers.Length; i++)
            {
                string Header = Headers[i];
                Command += Header;

                if (i != Headers.Length - 1)
                {
                    Command += ", ";
                }
            }

            Command += ") VALUES (";

            for (int i = 0; i < Values.Length; i++)
            {
                Command += Values[i];

                if (i != Values.Length - 1)
                {
                    Command += ", ";
                }

            }

            Command += ");";

            return Command;
        }

        

        public static string SELECT(string[] Columns, string Condition = "TRUE", string filename = DefaultFileName,string TableName = "tbl_users")
        {
            string Command = "SELECT ";

            for (int i = 0; i < Columns.Length; i++)
            {
                Command += Columns[i];

                if (i != Columns.Length - 1)
                {
                    Command += ",";
                }
            }

            Command += $" FROM {TableName} WHERE {Condition};";

            return Command;
        }

        public static string SELECT(string Condition = "TRUE", string filename = DefaultFileName, string TableName = "tbl_users")
        {
            string[] Columns = new string[] {"*"};
            string Command = "SELECT ";

            for (int i = 0; i < Columns.Length; i++)
            {
                Command += Columns[i];

                if (i != Columns.Length - 1)
                {
                    Command += ",";
                }
            }

            Command += $" FROM {TableName} WHERE {Condition};";

            return Command;
        }

        public static string SELECTAll(string Condition = "TRUE", string TableName = DefaultTableName)
        {
            string cmd = $"SELECT * FROM {TableName} WHERE {Condition};";
            return cmd;
        }

        public static string DELETE(string Condition = "TRUE", string TableName = DefaultTableName )
        {
            string Deleter = $"DELETE FROM {TableName} WHERE {Condition}";
            return Deleter;
        }

        public static string UPDATE(string Header, string NewValue, string Condition, 
            string TableName = DefaultTableName)
        {
            return $"UPDATE {TableName} " +
                NewLine +
                $"SET {Header} = {NewValue} " +
                NewLine +
                $"Where {Condition}";
        }

        public static string AddRow(string HTMLTable, string[] Values)
        {
            HTMLTable = HTMLTable.Remove(HTMLTable.Length - "</table>".Length);
            HTMLTable += NewLine + Indent + "<tr>";
            foreach(string Val in Values)
            {
                HTMLTable +=
                    NewLine +
                    DoubleIndent +
                    "<td>" +
                    NewLine + DoubleIndent +
                    Val +
                    NewLine + DoubleIndent +
                    "</td>";
            }

            HTMLTable += NewLine + Indent + "</tr>";
            HTMLTable += NewLine + "</table>";
            return HTMLTable;
        }
    }
}
