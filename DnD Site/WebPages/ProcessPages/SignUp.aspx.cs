using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site
{
    public partial class ServcerSide : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["FirstName"] = Request.Form["Firstname"];
            Session["LastName"] = Request.Form["LastName"];
            Session["Username"] = Request.Form["Username"];
            Session["SignedIn"] = true;
            Session["Admin"] = false;

            if (Application["VisitCount"] == null)
            {
                Application["VisitCount"] = 0;
            }

            Application["VisitCount"] = (int)Application["VisitCount"] + 1; ;

            string DbName = "Database.accdb";
            ConnectToDb(DbName);
            string Command = INSERT( TakeVals("FirstName", "LastName", 
                "Username", "email", "birthday", "PhoneNumber", "gender", "Password"));
            ExecuteNonQuery(Command);
            Session["UserID"] = GetValueByQuery("ID", $"Username='{Session["Username"]}'");
            Session["UserTable"] = GetTableWithEdit("../../ActionPages/Editor",
                DefaultColumns,
                new string[] { (bool)Session["Admin"] ? "" : "admin" },
                SELECT(new string[] { "*" },
                EqualCheck("AND", "Username", "Password")));
            Response.Redirect("../Visitables/SignedIn/HomePage");
        }


        string[][] TakeVals(params string[] Keys)
        {
            string[][] result = new string[Keys.Length][];
            for (int i = 0; i < Keys.Length; i++)
            {
                string Key = (string)Keys[i];
                result[i] = new string[2];
                result[i][0] = Key;

                if (Key == "Password")
                {
                    result[i][0] = AdjustReserved(Key);
                }

                string Value = String.Empty;

                if(Key != "birthday" && Key != "PhoneNumber")
                {
                    Value += "'";
                }

                if (Key == "PhoneNumber")
                {
                    Value += Request.Form["PhonePrefix"] + Request.Form[Key];
                }

                else if(Key == "birthday")
                {
                    Value = AdjustDate(Request.Form[Key]);
                }

                else
                {
                    Value += Request.Form[Key];
                }

                if (Key != "birthday" && Key != "PhoneNumber")
                {
                    Value += "'";
                }

                result[i][1] = Value;
            }

            return result;
        }

        string AdjustReserved(string Header)
        {
            return $"[{Header}]";
        }


        string EqualCheck(string Operator, string key1, string key2)
        {
            return $"{key1} = '{Request.Form[key1]}' {Operator} {key2} = '{Request.Form[key2]}'";
        }
    }
}