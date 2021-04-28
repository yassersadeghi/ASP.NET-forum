using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication7.admin
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            MembershipUserCollection users =     Membership.GetAllUsers();
            if (!Page.IsPostBack)
            {
                userlist.DataSource = users;
                userlist.DataBind();
            }
        }

        protected void rest_Click(object sender, EventArgs e)
        {
            if (dp.Text != "")
            {
                MembershipUser user = Membership.GetUser(dp.Text.Trim());

                dp.Text = user.ResetPassword();
            }
        }

        protected void userlist_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void delette_Click(object sender, EventArgs e)
        {
            if (dp.Text != "")
            {


                Membership.DeleteUser(dp.Text.Trim());
            }

        }
    }
}