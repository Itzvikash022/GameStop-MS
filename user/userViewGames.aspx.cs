using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography.X509Certificates;
using System.IO;

namespace GameStop_MS.user
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter sda;
        public static int gameId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["GameID"] != null)
                {
                    gameId = Convert.ToInt32(Request.QueryString["GameID"]);
                    fnBindDataList();
                }
                else
                {
                    Response.Redirect("userGames.aspx");
                }
            }
        }

        protected void fnConnect()
        {
            try
            {
                string ConStr = ConfigurationManager.ConnectionStrings["myConStr"].ConnectionString;
                conn = new SqlConnection(ConStr);

                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                    Response.Write("Connected");
                }
                else
                {
                    Response.Write("Connection failed");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void fnBindDataList()
        {
            fnConnect();
            try
            {
                string qry = "SELECT * FROM tblGames WHERE GameId = @gid";
                cmd = new SqlCommand(qry, conn);
                cmd.Parameters.AddWithValue("gid", gameId);
                sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                dlGameDetails.DataSource = ds;
                dlGameDetails.DataBind();
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
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

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Session["GameIdBuy"] = gameId;
            Response.Redirect("#");
        }

        protected void btnCart_Click(object sender, EventArgs e)
        {
            Session["GameIdCart"] = gameId;
            Response.Redirect("#");
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            fnDownload();
        }
    }
}
