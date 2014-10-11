<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MergeColsTest.aspx.cs"
    Inherits="Plugins.JQTable.MergeColsTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/jquery.mytables.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.mask.css" rel="stylesheet" type="text/css" />
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
    <script type="text/javascript">
        $(function () {
            var datasource = { "PageIndex": 1, "PageSize": 5, "DataCount": 215, "SortType": "desc", "SortCol": "UserName", "DataList": [{ "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": "True" }, { "UserId": 456, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "李四", "IsParent": "False" }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": false }, { "UserId": 456, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "李四", "IsParent": false }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": false}] };
            var userId; //操做主ID
            $("#divBrowse").JTables({
                dataSource: datasource,
                sAjaxSource: "Ajax/Ajax.aspx",
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
                        "cText": "姓名",
                        "fnRender": function (obj) {
                            return "<a href=\"" + userId + "\">" + obj + "</a>";
                        },
                        "cSort": true
                    },
                    { "cName": "UserAge", "cText": "年龄", "cSort": true, "cHide": false,
                        "fnRender": function (obj) {
                            return "<span childrenTag='" + $$.mergeTdTag + "'>" + obj + "</span>";
                        }
                    },
                    { "cName": "UserSex", "cText": "性别", "cSort": true, "cClass": "test" },
                    { "cName": "WorkAge", "cText": "工龄", "cSort": true },
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
                bSelectAll: false,
                bSelectCol: "UserId", //选定的ID
                bShowPage: true, //不显示分页
                fnBeforeCallback: function (dataObj) {
                    debugger;
                    console.log(dataObj.DataList.length);
                },
                fnCallback: function () {
                    $("td[parentTag]").click(function () {
                        debugger;
                        $("span[childrenTag]").parent().parent().hide();
                    })
                },
                oPageSize: 30,
                oSortType: "desc",
                oSortCol: "UserName",
                bProcessing: true,
                mask_height: "100px",
                bSelectPageSize: true,
                bLockTableHead: true,
                lockTHScrollC: window,
                bHaveParent: true, //处理是否带父级元素的数据
                parentColumnName: "IsParent", //父级元素的列名
                oMergeCols: [0, 3], //合并列 begin-length
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
</body>
</html>
