using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using static DnD_Site.App_Code.MyAdoHelperAccess;

namespace DnD_Site.WebPages.ActionPages
{
    public partial class Editor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Attribute = Request.Form["Attribute"];
            DataRow UserData = GetDataTableByQuery(SELECT($"ID={Session["UserID"]}")).Rows[0];
            Session["CurrentVal"] = UserData[Attribute];

            switch(Attribute)
            {
                case ("birthday"):
                    Session["CurrentVal"] = SqlDateToHTML(Session["CurrentVal"].ToString());
                    break;

                case ("PhoneNumber"):
                    Session["CurrentVal"] = "0" + Session["CurrentVal"].ToString();
                    break;
            }




            Session["EditName"] = ColumnToHeader[Attribute];
        }
    }
}