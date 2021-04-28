using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;

namespace WebApplication7
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        public class pro
        {
            public string proposal { get; set; }
            public int count { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string scr = "function userValid()" ;
            scr += "{ var j; ";
            scr += "    j = document.getElementById(\"jobno\").value; ";
            // if (j == null)
            scr += "   alert(\"لطفاً شماره کار را وارد کنید\"); ";
            scr += "   return false; }";
           
            
          //  ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "msg", scr, true);


           

            string i = Request.QueryString["ind"];
            if (!Page.IsPostBack)
            {

                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                conn.Open();
                
                SqlDataReader rd;
                string command = "SELECT type FROM topics WHERE index1 = '" + i + "'";
                SqlCommand comm = new SqlCommand(command, conn);
                rd = comm.ExecuteReader();

                plist.DataSource = rd;
                plist.DataTextField = "type";
                plist.DataValueField = "type";
                // if (!Page.IsPostBack)
                plist.DataBind();
                conn.Close();
                if (plist.Items.Count == 0)
                    plist.Items.Add("ATMhardware");
                string f = plist.Items[0].ToString().Trim();
                command = "SELECT " + f + " FROM propose WHERE "+f+ " IS NOT NULL";
                SqlCommand comn = new SqlCommand(command, conn);
                conn.Open();
                SqlDataReader rf = comn.ExecuteReader();
                SqlDataReader rf1 = rf;
                // if (!Page.IsPostBack)
                plist.Items.Clear();

                plist.DataSource = rf1;
                var dt = new DataTable();

                List<DataRow> ls = dt.AsEnumerable().ToList();
                plist.DataTextField = f.Trim();
                plist.DataValueField = f.Trim();
                //  if (!Page.IsPostBack)
                plist.DataBind();
                dt.Load(rf);
                conn.Close();
                // Chart1.DataSource = rf;

                comn.CommandText = "INSERT INTO topicview (userid , topic , date) VALUES ('" + User.Identity.Name + "' , '" + i + "' , '" + DateTime.Now.ToString() + " ')";

                conn.Open();
                comn.ExecuteNonQuery();
                conn.Close();


               


            }

            SqlConnection conn2 = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
            SqlDataReader rpropose;
                string  command2 = "SELECT propose , COUNT(propose) AS thecount FROM (SELECT propose FROM comment WHERE topicIndex = '" + i + "' and propose IS NOT NULL ) AS C  GROUP BY propose";
                SqlCommand com1 = new SqlCommand(command2, conn2);
                conn2.Open();
                rpropose = com1.ExecuteReader();

                var sr = Chart1.Series[0];

              //  List<pro> proposedlist = new List<pro>();





                DataTable dp = new DataTable();
                dp.Load(rpropose);
                List<DataRow> lps = new List<DataRow>();
                lps = dp.AsEnumerable().ToList();
 
       /*                

            foreach (DataRow r in lps)
            {
                if (proposedlist.Count > 0)
                    for (int j = 0; j < proposedlist.Count; j++)
                        if ((r[0].ToString()) == ((proposedlist[j].proposal.Trim())))
                            proposedlist[j].count = proposedlist[j].count + 1;
                        else
                            proposedlist.Add(new pro { proposal = r[0].ToString().Trim(), count = 1 });
                else
                    proposedlist.Add(new pro { proposal = r[0].ToString().Trim(), count = 1 });
               
            }
            */

                foreach (DataRow p in lps)
                    sr.Points.AddXY(p[0].ToString(), System.Convert.ToInt32( p[1].ToString()));


                // string[] list1 = new string[plist.Items.Count ];
                //  plist.Items.CopyTo(list1, 0);
                /*
                DataTable dp = new DataTable();
                dp.Load(rpropose);
                List<DataRow> lps = new List<DataRow>();
                lps = dp.AsEnumerable().ToList();
                foreach (DataRow  s in ls  )
                {
                    var query = from DataRow  c in lps
                                where ((c[0].ToString().Trim()) == (s[0].ToString().Trim()))
                                select c;
                    if(query != null )
                        sr.Points.AddXY(s[0].ToString(), query.Count());
                  //  sr.Points.AddXY("sofware", 6);


                }
                */
                conn2.Close();

            // System.Web.UI.DataVisualization.Charting.Series sr = new System.Web.UI.DataVisualization.Charting.Series();

            //    sr.Points.AddXY("sofware", 2);
            // sr.Points.AddXY("hardware", 1);
            //   sr.Points.AddXY("hardware", 1);

            // Chart1.Series.Add(sr);

            // Chart1.Series["Series1"].YValueMembers = "propose";
            //Chart1.Series["Series1"].XValueMember = "propose";
            // Chart1.DataBind();
            //  Chart1.DataBindCrossTable(rf, f, f,f,f);

            Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;

        }

        protected void text3_TextChanged(object sender, EventArgs e)
        {

        }

        protected void send_Click(object sender, EventArgs e)
        {

            if ((text3.Text.Trim().Length > 20 ) && (jobno.Text.Trim().Length > 8))
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                conn.Open();
                string i = Request.QueryString["ind"];
                string text = text3.Text.Trim();
                byte[] utf8Bytes = Encoding.UTF8.GetBytes(text);
                text = Encoding.UTF8.GetString(utf8Bytes);
                string proposed = plist.SelectedItem.Value.Trim();
                SqlParameter t = new SqlParameter("t", text.Trim());
                SqlParameter j = new SqlParameter("j", jobno.Text.Trim());
                string command = "INSERT INTO comment ( topicIndex , creater , text , date , propose , jobno) VALUES (" + i.ToString() + " , '" + User.Identity.Name + "' , @t , '" +   DateTime.Now.ToString() + "' , N'"+ proposed  +"' , @j )";
                SqlCommand comm = new SqlCommand(command, conn);
                comm.Parameters.Add(t);
                comm.Parameters.Add(j);

                if (comm.ExecuteNonQuery() > 0)
                    message.Visible = true;

                conn.Close();
                text3.Text = "";
                jobno.Text = "";
                
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            text3.Text = "";
            jobno.Text = "";
            message.Visible = false;
        }

        protected void plist_TextChanged(object sender, EventArgs e)
        {

        }
    }
}