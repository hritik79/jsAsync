<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asyncAwait.aspx.cs" Inherits="jsAsync.asyncAwait" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script>
        async function hritik() {
            let delhiWeather = new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve("27 Deg")
                }, 1000)
            })
            let bangaloreWeather = new Promise((resolve, reject) => {
                setTimeout(() => {
                    resolve("21 Deg")
                }, 2000)
            })

            /*delhiWeather.then(alert);
            bangaloreWeather.then(alert);*/
            console.log("fetching Delhi weather please wait ...");
            let delhiW = await delhiWeather;
            console.log("Fetched delhi weather: " + delhiW);

            console.log("fetching bangalore weather please wait ...");
            let bangaloreW = await bangaloreWeather;
            console.log("Fetched bangalore weather: " + bangaloreW);

            return [delhiW, bangaloreW];
        }
        const cherry = async () => {
            console.log("Hey I am cherry and i am waiting")
        }

        const main1 = async () => {
            console.log("Welcome to weather control room");
            let a = await hritik();
            let b = await cherry();
        }
        main1();
    </script>
</body>
</html>
