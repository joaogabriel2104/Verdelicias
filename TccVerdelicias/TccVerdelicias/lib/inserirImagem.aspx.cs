using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TccVerdelicias.Lógicas;

namespace TccVerdelicias.lib
{
    public partial class inserirImagem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.HttpMethod == "POST")
            {
                try
                {
                    using (StreamReader reader = new StreamReader(Request.InputStream))
                    {
                        HttpPostedFile arquivo = Request.Files[0];
                        if(Request.Form["codigo"] != null) {
                            int codigo = int.Parse(Request.Form["codigo"]);
                        }

                        if (arquivo != null && arquivo.ContentLength > 0)
                        {
                            byte[] fileBytes = new byte[arquivo.ContentLength];
                            arquivo.InputStream.Read(fileBytes, 0, arquivo.ContentLength);

                            ImagemReceitaAdicionar addImg = new ImagemReceitaAdicionar();

                            string User = Session["user"].ToString();
                            int CodigoDaReceita = addImg.AdicionarImagemReceita(User);

                            if (Request.Form["codigo"] != null)
                            {
                                CodigoDaReceita = 0;
                                int codigo = int.Parse(Request.Form["codigo"]);
                                CodigoDaReceita = codigo;
                            }
                            else
                            {
                                CodigoDaReceita = addImg.AdicionarImagemReceita(User);
                            }

                            string pastaDestino = Server.MapPath("../images/FotosReceitas");
                            string novoNomeArquivo = $@"{User}-{CodigoDaReceita}.jpg";

                            string caminhoCompletoDestino = Path.Combine(pastaDestino, novoNomeArquivo);

                            if (File.Exists(caminhoCompletoDestino))
                            {
                                File.SetAttributes(caminhoCompletoDestino, FileAttributes.Normal);
                                File.Delete(caminhoCompletoDestino);
                            }

                            File.WriteAllBytes(caminhoCompletoDestino, fileBytes);

                            string resposta = "{'situacao':'true'}";
                            Response.Write(resposta.Replace("\'", "\""));
                        }
                        else
                        {
                            string resposta = "{'situacao':'false'}";
                            Response.Write(resposta.Replace("\'", "\""));
                        }
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