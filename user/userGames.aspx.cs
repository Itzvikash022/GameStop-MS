using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace GameStop_MS.user
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                if (!IsPostBack)
                {
                    fnBindDataList();
                }
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
        }
        
        protected void fnConnect()
        {
            try
            {
                string ConStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(ConStr);

                if(conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    //lblStatus.Text = "Database Connected";
                }
                else
                {
                    lblStatus.Text = "Database Connection Failed";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnSearch()
        {
            try
            {
                fnConnect();
                string game = txtSearch.Text.Trim();
                string qry = "SELECT * FROM tblGames WHERE GameName LIKE '%' + @game + '%'";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("game", game);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dlGames.DataSource = ds;
                dlGames.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();

            }
        }
        protected void fnBindDataList()
        {
            fnConnect();
            try
            {
                string qry = "SELECT GameName, GameId,Price, ImageUrl FROM tblGames";
                cmd = new SqlCommand(qry, conn);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dlGames.DataSource = ds;
                dlGames.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            fnSearch();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("userLogin.aspx");
        }
    }
}