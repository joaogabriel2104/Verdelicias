using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TccVerdelicias.Modelos
{
    public class Seguidor : Banco
    {
        public Usuario UserSeguido { get; set; }
        public Usuario UserSeguindo { get; set; }
        public int Quantidade { get; set; }

        public Seguidor(int quantidade)
        {
            Quantidade = quantidade;
        }

        public Seguidor()
        {

        }

        public Seguidor(Usuario userSeguindo)
        {
            UserSeguindo = userSeguindo;
        }

        public void ContarSeguidoresUsuario(string pCodUsuario)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoUsuario = new Parametro("pCodUsuario", pCodUsuario);
            Parametros.Add(CodigoUsuario);
            MySqlDataReader dados = Consultar("ContarSeguidoresUsuario", Parametros);
            if (dados.Read())
            {
                Quantidade = dados.GetInt32(0);
            }
            if (!dados.IsClosed)
                dados.Close();

            Desconectar();
        }

        public void ContarSeguindoUsuario(string pCodUsuario)
        {
            List<Parametro> Parametros = new List<Parametro>();
            Parametro CodigoUsuario = new Parametro("pCodUsuario", pCodUsuario);
            Parametros.Add(CodigoUsuario);
            MySqlDataReader dados = Consultar("ContarSeguindoUsuario", Parametros);
            if (dados.Read())
            {
                Quantidade = dados.GetInt32(0);
            }
            if (!dados.IsClosed)
                dados.Close();

            Desconectar();
        }

        public void VerificarSeguir(string pLoginSeguido, string pLoginSeguindo)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pLoginSeguido", pLoginSeguido);
            Parametro parametro1 = new Parametro("pLoginSeguindo", pLoginSeguindo);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            MySqlDataReader dados = Consultar("VerificarSeguir", parametros);
            if (dados.Read())
            {
                Usuario usuario = new Usuario(dados.GetString(0));
                UserSeguindo = usuario;
            }
            if (!dados.IsClosed)
                dados.Close();

            Desconectar();
        }

        public void BtnSeguir(string pLoginSeguido, string pLoginSeguindo)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pLoginSeguido", pLoginSeguido);
            Parametro parametro1 = new Parametro("pLoginSeguindo", pLoginSeguindo);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            Executar("SeguirUsuario", parametros);
        }

        public void PararSeguir(string pLoginSeguido, string pLoginSeguindo)
        {
            List<Parametro> parametros = new List<Parametro>();
            Parametro parametro = new Parametro("pLoginSeguido", pLoginSeguido);
            Parametro parametro1 = new Parametro("pLoginSeguindo", pLoginSeguindo);

            parametros.Add(parametro);
            parametros.Add(parametro1);
            Executar("PararSeguir", parametros);
        }
    }
}