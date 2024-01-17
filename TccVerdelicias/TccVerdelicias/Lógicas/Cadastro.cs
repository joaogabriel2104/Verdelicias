using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Lógicas
{
    public class Cadastro : Banco
    {
        public void CadastrarUsuario(string pCodigoLogin, string pEmail, Int64 pTelefone, string pNomePerfil, DateTime pDataNascimento, string pSenha)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro login = new Parametro("pCodigoLogin", pCodigoLogin);
            Parametro email = new Parametro("pEmail", pEmail);
            Parametro telefone = new Parametro("pTelefone", pTelefone.ToString());
            Parametro nomePerfil = new Parametro("pNomePerfil", pNomePerfil);
            Parametro dataNascimento = new Parametro("pDataNascimento", pDataNascimento.ToString("yyyy/MM/dd"));
            Parametro senha = new Parametro("pSenha", pSenha);

            parametros.Add(login);
            parametros.Add(email);
            parametros.Add(telefone);
            parametros.Add(nomePerfil);
            parametros.Add(dataNascimento);
            parametros.Add(senha);

            Executar("CadastrarUsuario", parametros);
        }
    }
}