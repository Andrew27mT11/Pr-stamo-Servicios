using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;

namespace Proyecto_AdmBD
{
    public partial class ManteUsuarios : System.Web.UI.Page
    {
        ClaseManteni objMantenimiento = new ClaseManteni();

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            string nombre = Request.Form["NombreUsu"];
            string contraA = Request.Form["contraA"];
            string contraN = Request.Form["contraN"];
            string contraNV = Request.Form["contraNV"];
            string cedula = Request.Form["cedula"];
            

            if (Request.Form["cedulaAd"] != null)
            {
               
                DataTable dataTable = objMantenimiento.ManteUsuariosAdmin(nombre,contraN, cedula, 2);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaCl"] != null)
            {
               
                DataTable dataTable = objMantenimiento.ManteUsuariosCli(nombre, contraN, null,cedula, 2);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaOf"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosOf(nombre, contraN, cedula, 2);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            string nombre = Request.Form["NombreUsu"];
            string contraA = Request.Form["contraA"];
            string contraN = Request.Form["contraN"];
            string contraNV = Request.Form["contraNV"];
            string cedula = Request.Form["cedula"];

            if (Request.Form["cedulaAd"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosAdmin(nombre, contraN, cedula, 3);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaCl"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosCli(nombre, contraN, null,cedula, 3);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaOf"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosOf(nombre, contraN, cedula, 3);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string nombre = Request.Form["NombreUsu"];
            string contraA = Request.Form["contraA"];
            string contraN = Request.Form["contraN"];
            string contraNV = Request.Form["contraNV"];
            string cedula = Request.Form["cedula"];

            if (Request.Form["cedulaAd"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosAdmin(nombre, contraN, cedula, 4);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaCl"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosCli(nombre, contraN,null, cedula, 4);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
            else if (Request.Form["cedulaOf"] != null)
            {
                DataTable dataTable = objMantenimiento.ManteUsuariosOf(nombre, contraN, cedula, 4);
                gvUsuarios.DataSource = dataTable;
                gvUsuarios.DataBind();
            }
        }
    }
}