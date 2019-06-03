﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DnD_Site.ServerSide
{
    public partial class SignInNotFound : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("User Not Found!");
            Response.AddHeader("REFRESH", "2;URL=SignIn.aspx");
        }
    }
}