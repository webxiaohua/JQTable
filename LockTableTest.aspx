<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LockTableTest.aspx.cs"
    Inherits="Plugins.JQTable.LockTableTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
    </style>
    <link href="css/jquery.mytables.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery.mask.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <script src="js/jquery.mask.js" type="text/javascript"></script>
    <script src="js/jquery.mytables.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var datasource = { "PageIndex": 1, "PageSize": 5, "DataCount": 215, "SortType": "desc", "SortCol": "UserName", "DataList": [{ "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": true }, { "UserId": 456, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "李四", "IsParent": false }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": false }, { "UserId": 456, "UserStatus": "正常", "WorkArea": "北京", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "李四", "IsParent": false }, { "UserId": 123, "UserStatus": "正常", "WorkArea": "上海", "WorkAge": 5, "UserSex": "男", "UserAge": 23, "UserName": "张三", "IsParent": false}] };
            // var datasource = { "PageIndex": 1, "PageSize": 5, "DataCount": 0, "SortType": "desc", "SortCol": "UserAge", "DataList": null };
            var userId; //操做主ID

            $("#divBrowse").JTables({
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
                            return "<a href=\"" + userId + "\">" + obj + "</a>";
                        },
                        "cSort": true
                    },
                    { "cName": "UserAge", "cText": "年龄", "cSort": true, "cHide": false },
                    { "cName": "UserSex", "cText": "性别", "cSort": true, "cClass": "test" },
                    { "cName": "WorkAge", "cText": "工龄", "cSort": true },
                    { "cName": "WorkArea", "cText": "工作地点工作地点工作地点工作地点", "cSort": true },
                    { "cName": "UserStatus", "cText": "用户状态用户状态", "cSort": false, "cEncode": true },
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
                fnCallback: function () {
                },
                oPageSize: 30,
                oSortType: "desc",
                oSortCol: "UserName",
                bProcessing: true,
                mask_height: "100px",
                bSelectPageSize: true,
                bLockTableHead: false,
                lockTHScrollC: window,
                bLockTable: true,
                oLockTableParms: [1, 800, 400, 1000, true],
                bHaveParent: true, //处理是否带父级元素的数据
                parentColumnName: "IsParent", //父级元素的列名
                oMergeCols: [0,8], //合并列 begin-length
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
