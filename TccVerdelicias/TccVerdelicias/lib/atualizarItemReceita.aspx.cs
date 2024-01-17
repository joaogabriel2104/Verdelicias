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
    public partial class atualizarItemReceita : System.Web.UI.Page
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
                        var itensReceita = JsonConvert.DeserializeObject<List<ItemReceita>>(json);

                        string user = Session["user"].ToString();

                        for (int i = 0; i < itensReceita.Count; i++)
                        {
                            ItemReceita itemReceita = new ItemReceita(itensReceita[i].Codigo, itensReceita[i].Receita.Codigo, itensReceita[i].Ingrediente.Nome, itensReceita[i].Medida.Nome, itensReceita[i].Quantidade);
                            itemReceita.AtualizarItemReceita(itensReceita[i].Codigo, itensReceita[i].Receita.Codigo, user, itensReceita[i].Ingrediente.Nome, itensReceita[i].Quantidade, itensReceita[i].Medida.Nome);
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