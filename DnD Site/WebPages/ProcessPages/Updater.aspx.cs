using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.WebPages.ActionPages
{
    public partial class Updater : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Identifier = $"ID={Session["UserID"]}";
            switch ((string)Session["Attribute"])
            {
                case ("birthday"):
                    ExecuteNonQuery(
                        UPDATE("birthday", //Header
                        AdjustDate(Request.Form["NewValue"]), //NewValue
                        Identifier)); //
                    break;
                case ("PhoneNumber"):
                    ExecuteNonQuery(
                        UPDATE(
                            "PhoneNumber",
                            Request.Form["PhonePrefix"] + Request.Form["NewValue"],
                            Identifier));
                    break;
                default:
                    ExecuteNonQuery(
                        UPDATE(
                            (string)Session["Attribute"],
                            $"'{Request.Form["NewValue"]}'",
                            Identifier));
                    break;
            }

            Session["UserTable"] = GetTableWithEdit(
                "../../ActionPages/Editor",
                DefaultColumns,
                new string[] { (bool)Session["Admin"] ? "" : "admin" },
                SELECTAll(Identifier));
                Response.Redirect("../Visitables/SignedIn/Profile");
        }
    }
}