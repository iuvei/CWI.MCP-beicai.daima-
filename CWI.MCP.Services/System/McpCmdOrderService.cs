﻿//---------------------------------------------
// 版权信息：版权所有(C) 2015，COOLWI.COM
// 变更历史：
//      姓名       日期                 说明
// --------------------------------------------
//      张友辉     2018/04/23 10:35:00  创建
//---------------------------------------------

using CWI.MCP.Models;
using CWI.MCP.Common;
using System.Collections.Generic;
using CWI.MCP.Common.ORM;
using Evt.Framework.Common;
using System;
using System.Text;
using System.Transactions;
using System.Linq;
using Newtonsoft.Json;
using System.Runtime.Caching;
using System.Threading;

namespace CWI.MCP.Services
{
    public class McpCmdOrderService: BaseService
    {
        /// <summary>
        /// 打印机辅助命令返回命令信息
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public object TcpAssCmd(TcpQueryModel query, out McpPrinterInfo deviceConn)
        {
            return SingleInstance<McpCmdOrderService>.Instance.SenAssdCmdTask(query, out deviceConn);            
        }

        /// <summary>
        /// 【201】发送打印机辅助命令任务信息，如果打印机异常则返回异常状态
        /// </summary>
        /// <param name="query"></param>
        /// <param name="cache"></param>
        /// <param name="deviceConn"></param>
        /// <returns></returns>
        public object SenAssdCmdTask(TcpQueryModel query, out McpPrinterInfo device)
        {
            try
            {
                device = SingleInstance<PrinterService>.Instance.GetPrinter(query.Did);
                if (device == null||device.ConnectionId == 0)
                {
                    //打印机网络故障4：掉线或者未注册
                    LogUtil.Info($"生成命令任务时失败,任务编号{query.Id}");
                    //return PrinterFaultType.NetworkFault.GetHashCode();
                }
                McpCmdOrderInfo cmdorder = GetCmdOrder(query.Id);

                var dic = new Dictionary<string, object>();
                dic.Add("tp", query.Tp);
                dic.Add("err", 0);
                dic.Add("id", cmdorder.OrderId);
                dic.Add("key", cmdorder.OrderKey);
                dic.Add("type", cmdorder.BillType);
                dic.Add("OrderContent", cmdorder.OrderContent);
                return dic;
            }
            catch (Exception ex)
            {
                device = SingleInstance<PrinterService>.Instance.GetPrinter(query.Did);
                LogUtil.Info($"生成命令任务时出现异常,任务编号{device.OrderId}");
                LogUtil.Error($"生成命令任务时出现异常,任务编号{device.OrderId}",ex);
                //打印机网络故障4：掉线或者未注册
                return PrinterFaultType.NetworkFault.GetHashCode();
            }
        }

        /// <summary>
        /// 生成打印机辅助命令
        /// </summary>
        /// <param name="query"></param>
        /// <param name="deviceConn"></param>m>
        /// <returns></returns>
        private object GenTaskAssCmd(int tp, McpCmdOrderPrinterInfo deviceConn)
        {
            var dic = new Dictionary<string, object>();
            dic.Add("tp", tp);
            dic.Add("err", 0);
            dic.Add("id", deviceConn.OrderId);
            dic.Add("key", deviceConn.OrderKey);
            dic.Add("type", deviceConn.BillType);
            dic.Add("content", deviceConn.BillContent);
            LogUtil.Info(string.Format("生成打印机辅助命令:{0}", $"{deviceConn.OrderId}"));
            return dic;
        }

        /// <summary>
        /// 获取201命令任务
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public McpCmdOrderInfo GetCmdOrder(string orderId)
        {
            try
            {
                ConditionCollection cc = new ConditionCollection();
                cc.Add(new Condition("order_id", TryConvertUtil.ToString(orderId)));
                return this.GetRepository<McpCmdOrderInfo>().GetModel(cc);
            }
            catch (Exception ex)
            {
                LogUtil.Info(string.Format("获取命令订单错误，参考信息：{0},order_id:{1}", ex.Message, orderId));
                LogUtil.Error(string.Format($"获取命令订单错误，order_id:{orderId}"),ex);
                return null;
            }
        }

        /// <summary>
        /// 获取201命令任务详情
        /// </summary>
        /// <param name="orderId"></param>
        /// <returns></returns>
        public McpCmdOrderPrinterInfo GetCmdOrderPrint(TcpQueryModel query)
        {
            try
            {
                ConditionCollection cc = new ConditionCollection();
                cc.Add(new Condition("order_id", TryConvertUtil.ToString(query.Id)));
                cc.Add(new Condition("printer_code", TryConvertUtil.ToString(query.Did)));
                return this.GetRepository<McpCmdOrderPrinterInfo>().GetModel(cc);
            }
            catch (Exception ex)
            {
                LogUtil.Info(string.Format("获取命令订单错误，参考信息：{0},order_id:{1}", ex.Message, query.Id));
                LogUtil.Error(string.Format($"获取命令订单错误，order_id:{query.Did}"), ex);
                return null;
            }
        }

        /// <summary>
        /// 修改打印机辅助命令执行状态
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public int UpdateCmdExecuteStatue(TcpQueryModel query)
        {
            var task = GetCmdOrderPrint(query);
            if (task!=null)
            {
                task.OrderStatus = query.Code;
                task.ModifiedOn = CommonUtil.GetDBDateTime();
                int cnt = TcpConsts.SendPrintCmdFailed.GetHashCode();
                //修改设备表域名
                cnt = this.GetRepository<McpCmdOrderPrinterInfo>().Update(task, "order_status,modified_on");
                if (cnt>0)
                {
                    LogUtil.Info($"【{query.Tp}】:更新打印机辅助指令执行状态，更新成功：订单号：{query.Id},打印机编号-{query.Did},状态-{query.Code}");
                    return 0;
                }
                else
                {
                    LogUtil.Info($"【{query.Tp}】:更新打印机辅助指令执行状态，更新失败：订单号：{query.Id},打印机编号-{query.Did},状态-{query.Code}");
                    return TcpConsts.UpStatusFailed;
                }
            }
            else
            {
                return TcpConsts.PrintOrderNotFind;

            }
        }

        /// <summary>
        /// 修改打印机辅助命令推送状态,未使用
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public bool UpdateCmdPushStatue(TcpQueryModel query)
        {
            return false;
        }
    }
}
