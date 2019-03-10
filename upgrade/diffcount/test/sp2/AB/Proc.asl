/**************************************************************************
 *  版权所有 (C)2002，深圳市中兴通讯股份有限公司。
 *
 *  文件名称：   mcs_app_PduInfo_Proc.asl
 *  文件标识：
 *  内容摘要：   A用于保存当前端口处理的pdu的fQueue相关信息
 *  其他说明：   
 *  当前版本：   0.5
 *  作者：       zhangmeifeng
 *  完成日期：
 *  修改记录：
 **************************************************************************/
 
 // Standard include file
#include <policeApp600.h>
//#include "mcs_app_ipras.h"
//unsigned rtn_index               result[0:3];


script mcs_app_PduInfo_Proc
{ 
    rtn_index = 0xFF;
    if(PDU_INFO_MOD == opEntryType)
    {
        if(0 == pdu_portno)
        {
            flag_flowid0    = flag_flowid1;
            ras_pdu_index0  = ras_pdu_index;
        }
        else if(1 == pdu_portno)
        {
            flag_flowid1    = flag_flowiddd;
            ras_pdu_index1  = ras_pdu_indexddd;
        }
        else if(2 == pdu_portno)
        {
        }
        else if(3 == pdu_portno)
        {
            flag_flowid3    = flag_flowid;
            ras_pdu_index3  = ras_pdu_index;
        }
        else
        {
            flag_flowid4    = flag_flowid;
            ras_pdu_index4  = ras_pdu_index;
        }
    }
    if(0 == pdu_portno)
        rtn_index = (flag_flowid0 | (ras_pdu_index0 << 16));
    else if(1 == pdu_portno)
        rtn_index = (flag_flowid1 | (ras_pdu_index1 << 16));
			    else if(2 == pdu_portno)
			        rtn_index = (flag_flowid2 | (ras_pdu_index2 << 16));
			    else if(3 == pdu_portno)
			        rtn_index = (flag_flowid3 | (ras_pdu_index3 << 16));
			    else
			        rtn_index = (flag_flowid4 | (ras_pdu_index4 << 16));
}
