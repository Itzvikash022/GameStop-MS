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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter sda;
        SqlConnection conn;
        public static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDb();
            if (Session["id"] != null)
            {
                id = (int)Session["id"];
            }
            fn_bind_grid();
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

        protected void fn_bind_grid()
        {
            try
            {
                string qry = "SELECT * FROM tblAdminProfile";
                cmd = new SqlCommand(qry,conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                fvAdmin.DataSource = ds;
                fvAdmin.DataBind();
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}