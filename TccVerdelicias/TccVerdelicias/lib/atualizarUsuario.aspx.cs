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
    public partial class atualizarUsuario : System.Web.UI.Page
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
                        var usuario = JsonConvert.DeserializeObject<List<Usuario>>(json);

                        Usuario novoUsuario = new Usuario();

                        //if (novoUsuario.VerificarExistenciaUsuario(usuario[0].User) == false)
                        //{
                            for (int i = 0; i < usuario.Count; i++)
                            {
                                novoUsuario.AtualizarUsuario(usuario[i].User, usuario[i].Email, usuario[i].Telefone, usuario[i].NomeUsuario, usuario[i].Nascimento, Session["user"].ToString());
                                Session["user"] = usuario[i].User.ToString();
                            }

                            string resposta = "{'situacao':'true', 'user':'true'}";
                            Response.Write(resposta.Replace("\'", "\""));
                        //}
                        //else if (novoUsuario.VerificarExistenciaUsuario(usuario[0].User) == true)
                        //{
                        //    string resposta = "{'situacao':'true', 'user':'false'}";
                        //    Response.Write(resposta.Replace("\'", "\""));
                        //}
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