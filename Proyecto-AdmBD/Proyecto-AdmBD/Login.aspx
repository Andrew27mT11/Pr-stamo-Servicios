<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Proyecto_AdmBD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Login</title>
    <link rel="stylesheet" href="Estilos/Estilo-1.css">

    <style type="text/css">
            
        </style>
</head>
<body>
    <div id="contenedor">
        <div id="central">
            <div id="login">
                <div class="titulo">
                    Bienvenido
                </div>
                <form id="loginform" runat="server">
                    <input type="text" name="usuario" placeholder="Nombre Usuario" required>

                    <input type="password" placeholder="Contraseña" name="password" required>

                    <asp:Label ID="lblRespu" runat="server"></asp:Label>

                    <asp:Button ID="btnValidar" runat="server" BackColor="Orange" Text="Login" OnClick="btnValidar_Click" />

                    &nbsp;
                </form>
                <div class="pie-form">
                    <a href="Registrarse.aspx">¿No tienes Cuenta? Registrate</a>
                </div>
            </div>

        </div>
    </div>
</body>
</html>
