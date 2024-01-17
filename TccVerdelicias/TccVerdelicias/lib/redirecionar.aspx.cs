using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;

namespace TccVerdelicias.lib
{
    public partial class redirecionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string resposta = "";
            if (Request.HttpMethod == "POST")
            {
                resposta = "{'situacao':'true'}";

                ImagemReceitaAdicionar addImg = new ImagemReceitaAdicionar();

                string user = Session["user"].ToString();
                int valor = addImg.AdicionarImagemReceita(user);

                if (valor > 0)
                {
                    resposta = $"{{'situacao':'true', 'valor':{valor}, 'user':'{user}'}}";
                }
                else
                {
                    resposta = "{'situacao':'false'}";
                }

                Response.Write(resposta.Replace("'", "\""));
            }
            else
            {
                resposta = "{'situacao':'else'}";
            }
        }
    }
}