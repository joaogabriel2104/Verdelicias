using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.lib
{
    public partial class inserirModoPreparo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                try
                {
                    using (StreamReader reader = new StreamReader(Request.InputStream))
                    {
                        string json = reader.ReadToEnd();
                        var modoPreparo = JsonConvert.DeserializeObject<List<ModoPreparo>>(json);

                        string user = Session["user"].ToString();

                        for (int i = 0; i < modoPreparo.Count; i++)
                        {
                            ModoPreparo modoDePreparo = new ModoPreparo(modoPreparo[i].Descricao);
                            modoDePreparo.CriarModoPreparo(user, modoPreparo[i].Descricao);
                        }

                        string resposta = "{'situacao':'true'}";
                        Response.Write(resposta.Replace("\'", "\""));
                    }
                }
                catch (Exception)
                {
                    string resposta = "{'situacao':'false'}";
                    Response.Write(resposta.Replace("\'", "\""));
                }
            }
            else
            {
                string resposta = "{'situacao':'false'}";
                Response.Write(resposta.Replace("\'", "\""));
            }
        }
    }
}