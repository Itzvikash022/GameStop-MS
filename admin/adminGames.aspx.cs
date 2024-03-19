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
using System.Security.Cryptography;
using System.IO;

namespace GameStop_MS
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection conn = null;
        SqlCommand cmd = null;
        SqlDataAdapter sda = null;
        public static int gameId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminID"] != null)
            {
                if (!Page.IsPostBack)
                {
                    fnBindGrid();
                }
            }
            else
            {
                Response.Redirect("~/admin/adminLogin.aspx");
            }
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
                    //Response.Write("Connected");
                }
                else
                {
                    lblStatus.Text = "Connection Failed";
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindGrid()
        {
            try
            {
                fnConnect();
                string qry = "SELECT * FROM tblGames";
                cmd = new SqlCommand(qry, conn);
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
        protected void gdGamesList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "SelectRow")
            {
                int gameId = Convert.ToInt32(e.CommandArgument);
                Session["gameId"] = gameId;
                Response.Redirect("~/admin/adminGameForm.aspx");
            }

            if(e.CommandName == "DeleteRow")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                fnDelete();
            }

            if (e.CommandName == "DownloadFile")
            {
                gameId = Convert.ToInt32(e.CommandArgument);
                fnDownload();
            }
        }

        protected void fnDownload()
        {
            try
            {
                fnConnect();
                string qry = "SELECT DownloadPath FROM tblGames WHERE GameId = @gameId";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gameId", gameId);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    string path = dr["DownloadPath"].ToString();

                    if (!string.IsNullOrEmpty(path))
                    {
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
        protected void fnDelete()
        {
            try
            {
                fnConnect();
                string qry = "DELETE FROM tblGames WHERE GameId = @gameId";

                cmd = new SqlCommand(qry,conn);
                cmd.Parameters.AddWithValue("gameId", gameId);
                int res = cmd.ExecuteNonQuery();
                if(res>0) 
                {
                    lblStatus.Text = "Game Data Deleted";
                }
                else
                {
                    lblStatus.Text = "Game Data failed to Delete";
                }
                gdGamesList.DataBind();
                fnBindGrid();
                conn.Close();
            }
            catch (Exception ex)
            {
                lblStatus.Text= ex.ToString();
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
                cmd.Parameters.AddWithValue("game",game);
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

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/admin/adminGameForm.aspx");
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            fnSearch();
        }

        protected void gdGamesList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdGamesList.PageIndex = e.NewPageIndex;
            fnBindGrid();
        }
    }
}