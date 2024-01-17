using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Usuario : Banco
    {
        public string User { get; set; }
        public string NomeUsuario { get; set; }
        public string Email { get; set; }
        public Int64 Telefone { get; set; }
        public string Senha { get; set; }
        public DateTime Nascimento { get; set; }
        public TipoUsuario tipoUsuario { get; set; }
        public DateTime Criacao { get; set; }
        public bool Bloqueado { get; set; }
        public double NotaUsuario { get; set; }
        public int NumeroDeReceitas { get; set; }

        public Usuario(string user, string nomeUsuario)
        {
            this.User = user;
            this.NomeUsuario = nomeUsuario;
        }

        public Usuario(string user)
        {
            this.User = user;
        }

        public Usuario()
        {
        }

        public Usuario(string user, string nomeUsuario, double notaUsuario, int numeroDeReceitas)
        {
            User = user;
            NomeUsuario = nomeUsuario;
            NotaUsuario = notaUsuario;
            NumeroDeReceitas = numeroDeReceitas;
        }

        public void InfoLoginUsuario(string pEmail, string pSenha)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro email = new Parametro("pEmail", pEmail.ToString());
            Parametro senha = new Parametro("pSenha", pSenha.ToString());
            Parametros.Add(email);
            Parametros.Add(senha);

            MySqlDataReader dados = Consultar("InfoLoginUsuario", Parametros);
            if (dados.Read())
            {
                User = dados.GetString(0);
                Email = dados.GetString(1);
                NomeUsuario = dados.GetString(2);
                Criacao = dados.GetDateTime(3);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirDadosPerfil(string pLogin)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro user = new Parametro("pLogin", pLogin.ToString());
            Parametros.Add(user);

            MySqlDataReader dados = Consultar("ExibirDadosPerfil", Parametros);
            if (dados.Read())
            {
                User = dados.GetString(1);
                NomeUsuario = dados.GetString(0);
                Criacao = dados.GetDateTime(2);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public void ExibirInformacoesPerfil(string pLogin)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro user = new Parametro("pLogin", pLogin.ToString());
            Parametros.Add(user);

            MySqlDataReader dados = Consultar("ExibirInformacoesPerfil", Parametros);
            if (dados.Read())
            {
                User = dados.GetString(0);
                Email = dados.GetString(1);
                Telefone = dados.GetInt64(2);
                NomeUsuario = dados.GetString(3);
                Nascimento = dados.GetDateTime(4);
            }
            if (!dados.IsClosed)
            {
                dados.Close();
            }
            Desconectar();
        }

        public bool VerificarExistenciaUsuario(string pLogin)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro user = new Parametro("pLogin", pLogin);
            Parametros.Add(user);

            MySqlDataReader dados = Consultar("VerificarExistenciaUsuario", Parametros);
            if (dados.Read())
            {
                return true;
            }
            else
            {
                return false;
            }
        }

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

        public void AtualizarUsuario(string pLoginNovo, string pEmail, Int64 pTelefone, string pNomePerfil, DateTime pDataNascimento, string pLogin)
        {
            List<Parametro> parametros = new List<Parametro>();

            Parametro loginNovo = new Parametro("pLoginNovo", pLoginNovo);
            Parametro email = new Parametro("pEmail", pEmail);
            Parametro telefone = new Parametro("pTelefone", pTelefone.ToString());
            Parametro nomePerfil = new Parametro("pNomePerfil", pNomePerfil);
            Parametro dataNascimento = new Parametro("pDataNascimento", pDataNascimento.ToString("yyyy/MM/dd"));
            Parametro login = new Parametro("pLogin", pLogin);

            parametros.Add(loginNovo);
            parametros.Add(email);
            parametros.Add(telefone);
            parametros.Add(nomePerfil);
            parametros.Add(dataNascimento);
            parametros.Add(login);

            Executar("AtualizarUsuario", parametros);
        }
    }
}