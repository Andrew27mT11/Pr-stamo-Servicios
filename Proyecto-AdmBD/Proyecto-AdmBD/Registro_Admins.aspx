<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro_Admins.aspx.cs" Inherits="Proyecto_AdmBD.Registro_Admins" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar Administrador</title>
    <link rel="stylesheet" type="text/css" href="Estilos/Estilo_RegistrarAdm.css">
</head>
<body>
    <form id="form1" runat="server">
                    <input type="text" name="cedula" placeholder="Cedula" required>

                    <input type="text" name="nombre" placeholder="Nombre" required>

                    <input type="text" name="apellido1" placeholder="Primer Apellido" required>

                    <input type="text" name="apellido2" placeholder="Segundo Apellido">

                    <input type="text" name="correo" placeholder="Correo Electronico" required>

                    <input type="text" name="telefono" placeholder="Telefono" required>

                    <input type="text" name="usuario" placeholder="Nombre Usuario" required>

                    <input type="password" placeholder="Contraseña" name="contrasena" required><br />

                    <div>
                        <br />
                          <asp:Button ID="btnAgregar" runat="server" Text="Aceptar" OnClick="btnAgregar_Click" />
                    <asp:Label ID="lblRespu" runat="server"></asp:Label>
                </form>
        </div>
    </form>
</body>
</html>
