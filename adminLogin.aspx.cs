using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter sda;
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void fnConnectDb()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    //Response.Write("Connected");
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

        protected void fnLogin()
        {
            try
            {
                fnConnectDb();

            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }
    }
}