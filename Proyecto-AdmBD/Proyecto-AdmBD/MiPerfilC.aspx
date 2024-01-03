<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MiPerfilC.aspx.cs" Inherits="Proyecto_AdmBD.MiPerfil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Mi Perfil</title>
     <link rel="stylesheet" href="Estilos/Estilo_PerfilCli.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblCedulaCli" runat="server" Text=""></asp:Label>
            <input type="text" id="txtNombreCli" runat="server" name="NombreCli" placeholder="Nombre">
            <input type="text" id="txt1ApellidoCli" runat="server" name="1ApellidoCli" placeholder="Primer Apellido">
            <input type="text" id="txt2ApellidoCli" runat="server" name="2ApellidoCli" placeholder="Segundo Apellido">
            <input type="text" id="txtCorreoCli" runat="server" name="CorreoCli" placeholder="Correo Electrónico">
            <input type="text" id="txtTelefonoCli" runat="server" name="TelefonoCli" placeholder="Teléfono">
            <input type="text" name="fechaNac" placeholder="Fecha Nacimiento">


            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" />

            <asp:Label ID="lblRespu" runat="server" Text=""></asp:Label>
             <p class="signup-link"><a href="MenuCli.aspx">VOLVER AL INICIO</a></p>
        </div>
    </form>
</body>
</html>
