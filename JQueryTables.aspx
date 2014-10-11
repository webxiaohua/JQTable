<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JQueryTables.aspx.cs" Inherits="MyTable_JQueryTables" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/jquery.mytables.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.mask.css" rel="stylesheet" type="text/css" />
    <link href="css/magiczoomplus.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body
        {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
        }
        .test
        {
            color: red !important;
            text-align: center !important;
        }
    </style>
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/jquery.mytables.js" type="text/javascript"></script>
    <script src="js/mzp-packed.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var datasource = { "PageIndex": 1, "PageSize": 5, "DataCount": 215, "SortType": "desc", "SortCol": "UserAge", "DataList": [{ "UserId": 123, "UserStatus": "<aaa>", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "<a张三>" }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三" }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三" }, { "UserId": 456, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 24, "UserName": "李四" }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三"}] };
            var userId; //操做主ID
            //datasource.DataList = null;
            $("#divBrowse").JTables({
                showTH: true,
                bshowCaption: true,
                captionContent: '<tr class="M_Thead"><th colspan="4">Title1</th><th colspan="4">Title2</th></tr>',
                dataSource: datasource,
                sAjaxSource: "Ajax/Ajax.aspx",
                sAjaxParams: { "A": "AA" },
                aoColumns: [
                    {
                        "cName": "UserId",
                        "cHide": true,

                        "fnRender": function (obj) {
                            userId = obj;
                        }
                    },
                    {
                        "cName": "UserName",
                        "cEncode": true,
                        "cText": "姓名",
                        "fnRender": function (obj) {
                            //return "<a href=\"" + userId + "\">" + obj + "</a>";
                            return '<a href="http://192.168.0.29:82/uploads/TestPicture/EquipmentPic/20140825163418235.png" class="MagicZoom MagicThumb"> <img src="http://192.168.0.29:82/uploads/TestPicture/EquipmentPic/20140825163418235.png" style="width: 100px; height: 64px;"></a>';
                        },
                        "cSort": true
                    },
                    { "cName": "UserAge", "cText": "年龄", "cSort": true, "cHide": false },
                    { "cName": "UserSex", "cText": "性别", "cSort": true, "cClass": "test" },
                    { "cName": "WorkAge", "cText": "工龄", "cSort": true },
                    { "cName": "WorkArea", "cText": "工作地点", "cSort": true },
                    { "cName": "UserStatus", "cText": "用户状态", "cSort": false, "cEncode": true },
                    {
                        "cText": "操作",
                        "cSort": false,
                        "fnRender": function (obj) {
                            return "<a href=\"javascript:alert(" + userId + ")\" >删除</a>";
                        }
                    }
                ],
                bSelectAll: true,
                bSelectCol: "UserId", //选定的ID
                bShowPage: true, //显示分页
                fnCallback: function () {
                    MagicThumb.init();
                },
                oPageSize: 30,
                oSortType: "desc",
                oSortCol: "UserName",
                bProcessing: true,
                mask_height: "100px",
                bSelectPageSize: true,
                bLockTableHead: true,
                lockTHScrollC: window,
                bPageInBox: false,
                oLanguage: "zh_cn"
            });



            $("#divBrowse2").JTables({
                showTH: true,
                sAjaxSource: "Ajax/Ajax2.aspx",
                sAjaxParams: { "A": "AA", "B": "BB" },
                aoColumns: [
                    {
                        "cName": "UserId",
                        "cHide": true,
                        "fnRender": function (obj) {
                            userId = obj;
                        }
                    },
                    {
                        "cName": "UserName",
                        "cText": "姓名2",
                        "fnRender": function (obj) {
                            return "<a href=\"" + userId + "\">" + obj + "</a>";
                        },
                        "cSort": true
                    },
                    { "cName": "UserAge", "cText": "年龄", "cSort": true, "cHide": false },
                    { "cName": "UserSex", "cText": "性别", "cSort": true },
                    { "cName": "WorkAge", "cText": "工龄", "cSort": true, "cClass": "test" },
                    { "cName": "WorkArea", "cText": "工作地点", "cSort": true },
                    { "cName": "UserStatus", "cText": "用户状态", "cSort": false },
                    {
                        "cText": "操作",
                        "cSort": false,
                        "fnRender": function (obj) {
                            return "<a href=\"javascript:alert(" + userId + ")\" >删除</a>";
                        }
                    }
                ],
                bSelectAll: true,
                bSelectCol: "UserId", //选定的ID
                bShowPage: true, //不显示分页
                fnCallback: function () {
                },
                oPageSize: 30,
                oSortType: "desc",
                oSortCol: "UserName",
                bProcessing: true,
                mask_height: "100px",
                bSelectPageSize: true,
                bLockTableHead: true,
                lockTHScrollC: window,
                oMergeCells: [1, 2],
                oLanguage: "zh_cn"
            });



        })
    </script>
</head>
<body>
    <div style="width: 800px; margin: 0 auto;">
        <div class="M_DivHeader">
            <div class="M_DivHeader_Icon">
            </div>
            <span class="M_DivHeader_Title">实验室记录</span>
        </div>
        <div id="divBrowse" class="M_DivTable">
        </div>
    </div>
    <div style="width: 800px; margin: 0 auto; margin-top: 100px; overflow: auto;">
        <div class="M_DivHeader">
            <div class="M_DivHeader_Icon">
            </div>
            <span class="M_DivHeader_Title">实验室记录</span>
        </div>
        <div id="divBrowse2" class="M_DivTable">
        </div>
    </div>
</body>
</html>
