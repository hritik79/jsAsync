<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dateRangePicker.aspx.cs" Inherits="jsAsync.dateRangePicker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />
    <!-- Include Date Range Picker -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
            <input type="text" name="datefilter" value="" />
        </div>
    </form>--%>
    <input id="daterange" />

    <table id="table_1">
        <thead>
            <tr>
                <th>Col1.</th>

                <th>Date</th>

            </tr>
        </thead>
        <tbody>

            <tr>
                <td>Set 1</td>

                <td data-order="1558358405">20 May 2019</td>

            </tr>
            <tr>
                <td>Set2</td>

                <td data-order="1558357779">20 May 2019</td>

            </tr>
            <tr>
                <td>Set3</td>

                <td data-order="1558348464">20 May 2019</td>

            </tr>
            <tr>
                <td>Set4</td>
                <td data-order="1558348282">20 May 2019</td>

            </tr>
            <tr>
                <td>Set5</td>

                <td data-order="1558106170">17 May 2019</td>

            </tr>
            <tr>
                <td>Set6</td>

                <td data-order="1558106062">17 May 2019</td>

            </tr>
            <tr>
                <td>Set7</td>

                <td data-order="1558090241">17 May 2019</td>

            </tr>
            <tr>
                <td>Set8</td>

                <td data-order="1556704125">01 May 2019</td>

            </tr>
        </tbody>
    </table>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>
    <script src="https://cdn.datatables.net/datetime/1.4.1/js/dataTables.dateTime.min.js"></script>
    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
    <script type="text/javascript">
        /*$(function () {

            $('input[name="datefilter"]').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
            });

            $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });

        });*/

        $(function () {
            var table = $("#table_1").DataTable();

            // Date range vars
            minDateFilter = "";
            maxDateFilter = "";

            $("#daterange").daterangepicker();
            $("#daterange").on("apply.daterangepicker", function (ev, picker) {
                minDateFilter = Date.parse(picker.startDate);
                maxDateFilter = Date.parse(picker.endDate);

                $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                    var date = Date.parse(data[1]);

                    if (
                        (isNaN(minDateFilter) && isNaN(maxDateFilter)) ||
                        (isNaN(minDateFilter) && date <= maxDateFilter) ||
                        (minDateFilter <= date && isNaN(maxDateFilter)) ||
                        (minDateFilter <= date && date <= maxDateFilter)
                    ) {
                        return true;
                    }
                    return false;
                });
                table.draw();
            });


        });

        /*var minDate, maxDate;

        // Custom filtering function which will search data in column four between two values
        $.fn.dataTable.ext.search.push(
            function (settings, data, dataIndex) {
                debugger
                var min = minDate;
                var max = maxDate;
                var date = new Date(data[4]);

                if (
                    (min === null && max === null) ||
                    (min === null && date <= max) ||
                    (min <= date && max === null) ||
                    (min <= date && date <= max)
                ) {
                    return true;
                }
                return false;
            }
        );
        
        $(document).ready(function () {
            // Create date inputs
            minDate = new DateTime($('#datefilter'), {
                format: 'MMMM Do YYYY'
            });
            maxDate = new DateTime($('#datefilter'), {
                format: 'MMMM Do YYYY'
            });

            // DataTables initialisation
            var table = $('#example').DataTable();


            $('input[name="datefilter"]').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });
            $('input[name="datefilter"]').on('apply.daterangepicker', function (ev, picker) {
                debugger
                minDate = picker.startDate.format('YYYY/MM/DD');
                maxDate = picker.endDate.format('YYYY/MM/DD');

                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
            });

            $('input[name="datefilter"]').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
            });

            $("#datefilter").on('change', function () {
                debugger
                table.draw();
            });
            *//*// Refilter the table
        $('#min, #max').on('change', function () {
            table.draw();
        });*//*
    });*/
        /*$(document).ready(function () {

            $('#datefilter').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('#datefilter').on('apply.daterangepicker', function (ev, picker) {
                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
                $('#example').DataTable().draw();
            });

            $('#datefilter').on('cancel.daterangepicker', function (ev, picker) {
                $(this).val('');
                $('#example').DataTable().draw();
            });

            $('#example').DataTable();
        });*/

    </script>
</body>
</html>
