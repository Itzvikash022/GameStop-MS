using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace GameStop_MS.user
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        public static int gameId;
        public static int downloads;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userEmail"] != null)
            {
                    if (!Page.IsPostBack)
                    {
                        fnBindGrid();
                    }
            }
            else
            {
                Response.Redirect("userLogin.aspx");
            }
        }

        public void fnConnect()
        {
            try
            {
                string conStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(conStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    //lblStatus.Text = "Database Connected";
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

        protected void fnBindGrid()
        {
            try
            {
                fnConnect();
                string qry = "SELECT * FROM tblSales WHERE CustomerEmail = @eml";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("eml", Session["userEmail"]);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gdGames.DataSource = ds;
                gdGames.DataBind();
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
                fnConnect();
                string qry = "DELETE FROM tblSales WHERE GameId = @id";

                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("id", gameId);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    lblStatus.Text = "Game Deleted";
                }
                else
                {
                    lblStatus.Text = "Failed to Delete Game";
                }
                fnBindGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void fnDownload()
        {
            try
            {
                fnConnect();
                string qry = "SELECT DownloadPath, Downloads FROM tblGames WHERE GameId = @gameId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gameId", gameId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string path = dr["DownloadPath"].ToString();
                    downloads = (int) dr["Downloads"];

                    if (!string.IsNullOrEmpty(path))
                    {
                        fnUpdateDownloads();
                        Response.ContentType = MimeMapping.GetMimeMapping(path); // Get content type dynamically
                        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(path)); // Set the file name
                        Response.TransmitFile(path); // Transmit the file
                        Response.End(); // End the response
                    }
                    else
                    {
                        lblStatus.Text = "File Not Found";
                    }
                }
                conn.Close();


            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }
        protected void fnUpdateDownloads()
        {
            int val = downloads + 1;
            fnConnect();
            try
            {
                string qry = "UPDATE tblGames SET Downloads = @val WHERE GameId = @gameId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("val", val);
                cmd.Parameters.AddWithValue("gameId", gameId);
                int res = cmd.ExecuteNonQuery();
                if(res == 0)
                {
                    lblStatus.Text = "Error in Incrementing Downloads";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = ex.ToString();
            }
        }

        protected void gdGames_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                fnDelete();
            }

            if (e.CommandName == "Download")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                fnDownload();
            }

            if (e.CommandName == "View")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                Session["GameID"] = gameId;
                Response.Redirect("userViewGames.aspx");
            }
        }
    }
}