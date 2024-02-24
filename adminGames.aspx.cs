using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Caching;

namespace GameStop_MS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnBindRepeater();
        }

        public void fnConnect()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if(conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("Connected");
                }
                else
                {
                    Response.Write("Connection Failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }
        protected void fnBindRepeater()
        {
            fnConnect();
            string qry = "SELECT * FROM tblGames";
            cmd = new SqlCommand(qry,conn);
            sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            rptGameStop.DataSource = dt;
            rptGameStop.DataBind();
            conn.Close();
        }
    }
}