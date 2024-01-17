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
    public partial class redirecionarPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string resposta = "";
            if (Request.HttpMethod == "POST")
            {
                try
                {
                    using (StreamReader reader = new StreamReader(Request.InputStream))
                    {
                        string json = reader.ReadToEnd();
                        var usuario = JsonConvert.DeserializeObject<List<Usuario>>(json);

                        resposta = "{'situacao':'true'}";

                        Session["user"] = usuario[0].User.ToString();
                        Session["email"] = usuario[0].Email.ToString();
                        Session["nome"] = usuario[0].NomeUsuario.ToString();
                        Session["dtCriacao"] = DateTime.Now.ToString("dd/MM/yyyy");

                        string user = Session["user"].ToString();

                        resposta = $"{{'situacao':'true', 'user':'{user}'}}";

                        Response.Write(resposta.Replace("'", "\""));
                    }
                }
                catch (Exception)
                {
                    resposta = "{'situacao':'false'}";
                    Response.Write(resposta.Replace("\'", "\""));
                }
            }
            else
            {
                resposta = "{'situacao':'else'}";
            }
        }
    }
}