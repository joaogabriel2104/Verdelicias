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
    public partial class inserirPreferenciaDieta : System.Web.UI.Page
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
                        var dieta = JsonConvert.DeserializeObject<List<PreferenciaDieta>>(json);

                        PreferenciaDieta preferenciaDieta = new PreferenciaDieta();

                        for (int i = 0; i < dieta.Count; i++)
                        {
                            preferenciaDieta.CriarPreferenciaDieta(dieta[i].Dieta.Codigo, Session["user"].ToString());
                        }

                        string resposta = "{'situacao':'true', 'user':'true'}";
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