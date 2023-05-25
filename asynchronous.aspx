<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="asynchronous.aspx.cs" Inherits="jsAsync.asynchronous" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>JavaScript Functions</h1>
    <h2>Function Sequence</h2>
    <p>JavaScript functions are executed in the sequence they are called.</p>

    <p>The result of the calculation is:</p>
    <p id="demo"></p>
    <p id="demoo"></p>
    <p id="demo1"></p>
<p id="demo2"></p>
    <p id="abc"></p>

    <script>
        function myDisplayer(some) {
            debugger
            document.getElementById("demo").innerHTML = some;
        }

        function myCalculator(num1, num2) {
            debugger
            let sum = num1 + num2;
            return sum;
        }

        let result = myCalculator(10, 5);
        myDisplayer(result);

        setTimeout(function () { myFunction("I love You !!!"); }, 3000);

        function myFunction(value) {
            debugger
            document.getElementById("demoo").innerHTML = value;
        }

        setInterval(myFunction1, 5000);

        function myFunction1() {
            debugger
            let d = new Date();
            document.getElementById("demo1").innerHTML =
                d.getHours() + ":" +
                d.getMinutes() + ":" +
                d.getSeconds();
        }

        function myDisplayer(some) {
            document.getElementById("demo2").innerHTML = some;
        }

        let myPromise = new Promise(function (myResolve, myReject) {
            let x = 0;

            // some code (try to change x to 5)

            if (x == 0) {
                myResolve("OK");
            } else {
                myReject("Error");
            }
        });

        myPromise.then(
            function (value) { myDisplayer(value); },
            function (error) { myDisplayer(error); }
        );

        async function myDisplay() {
            let myPromise = new Promise(function (resolve) {
                resolve("I love You !!");
            });
            document.getElementById("abc").innerHTML = await myPromise;
        }

        myDisplay();
    </script>
</body>
</html>
