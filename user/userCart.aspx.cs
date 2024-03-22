using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameStop_MS.user
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int gameId;
        public static int cartId;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                if (!Page.IsPostBack)
                {
                    fnBindDataList();
                }
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
        }

        public void fnConnectDb()
        {
            try
            {
                string constr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(constr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    /*lblStatus.Text = "Connection Successfull";*/
                }
                else
                {
                    lblStatus.Text = "Connection Failed";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnBindDataList()
        {
            fnConnectDb();
            try
            {
                string qry = "SELECT * FROM tblGamesCart WHERE CustomerEmail = @email ";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("email", Session["userEmail"]);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gdGamesList.DataSource = ds;
                gdGamesList.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnDelete()
        {
            try
            {
                fnConnectDb();
                string qry = "DELETE FROM tblGamesCart WHERE CartId = @id";

                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", cartId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Removed from Cart";
                }
                else
                {
                    lblStatus.Text = "Failed to Remove from Cart";
                }
                gdGamesList.DataBind();
                fnBindDataList();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void gdGamesList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "DeleteRow")
            {
                cartId = Convert.ToInt32(e.CommandArgument);
                fnDelete();
            }
            if (e.CommandName == "SelectRow")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                Session["GameIdBuy"] = gameId;
                Response.Redirect("~/user/userSales.aspx");
            }
        }
    }
}