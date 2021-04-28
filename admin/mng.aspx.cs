using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace WebApplication7.admin
{
    public partial class mng : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if (! Roles.RoleExists("users"))
                Roles.CreateRole("users");
            if (! Roles.RoleExists("manager"))
                Roles.CreateRole("manager");
            if (! Roles.RoleExists("admin"))
                Roles.CreateRole("admin");
            if (!Roles.RoleExists("sl"))
                Roles.CreateRole("sl");

            if (!Page.IsPostBack)
            {
                griduser.DataSource = Membership.GetAllUsers();
                griduser.DataBind();
            }

        }

        protected void griduser_SelectedIndexChanged(object sender, EventArgs e)
        {
            List<MembershipUser> list = new List<MembershipUser>();
            list.Add(Membership.GetUser(griduser.SelectedValue.ToString()));
            detailsuser.DataSource = list;
            detailsuser.DataBind();
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "users");
            
        }

        protected void rest_Click(object sender, EventArgs e)
        {
            if (dp.Text != "")
            {
                MembershipUser user = Membership.GetUser(dp.Text.Trim());

                dp.Text = user.ResetPassword();
            }
        }

        protected void delette_Click(object sender, EventArgs e)
        {
            if (dp.Text != "")
            {


                Membership.DeleteUser(dp.Text.Trim());
            }

        }

        protected void Unlock_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(dp.Text.Trim());
            user.UnlockUser();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Roles.AddUserToRole(dp.Text.Trim(),TextBox1.Text.Trim());
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            
            griduser.DataSource = Membership.FindUsersByName(t1.Text.Trim());
            griduser.DataBind();
        }
    }
}