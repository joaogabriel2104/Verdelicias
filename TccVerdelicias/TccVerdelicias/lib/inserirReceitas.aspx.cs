using MySql.Data.MySqlClient;
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
    public partial class inserirReceitas : System.Web.UI.Page
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
                        var receitaVar = JsonConvert.DeserializeObject<List<Receita>>(json);

                        string user = Session["user"].ToString();

                        Receitas classReceita = new Receitas();

                        for (int i = 0; i < receitaVar.Count; i++)
                        {
                            classReceita.PostarReceita(user, receitaVar[i].NomeReceita, receitaVar[i].TempoPreparo, receitaVar[i].Rendimento);
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