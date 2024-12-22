using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace foodie.User
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            {
                form1.Attributes.Add("class", "sub_page");
            }
            else
            {
                form1.Attributes.Remove("class");
                //Load the Control
                Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl1.ascx");

                //Add the Control to the panel
                PnlSliderUC.Controls.Add(sliderUserControl);
            }
        }
    }
}