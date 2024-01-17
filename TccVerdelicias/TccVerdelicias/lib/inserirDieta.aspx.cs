using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;
using TccVerdelicias.Modelos;

namespace TccVerdelicias.lib
{
    public partial class inserirDieta : System.Web.UI.Page
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
                        var dietaVar = JsonConvert.DeserializeObject<List<DietaReceita>>(json);

                        string user = Session["user"].ToString();

                        DietaReceita dieta = new DietaReceita();

                        for (int i = 0; i < dietaVar.Count; i++)
                        {
                            dieta.CriarDietaReceita(dietaVar[i].Dieta.Codigo, user);
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