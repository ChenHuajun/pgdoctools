package statqry.wdssweb.function;
import java.util.*;
/**
 * <p>收入查询结果项目类: </p>
 * @author zouming
 * @version 1.0
 */
public class Earning {
  /**
   <p>收入的物主</p>
   */
  private String owerId;
  /**
   <p>收入描述。收入标识流量</p>
   */
  private String strDescribe;
  /**
   <p>收入值</p>
   */
  //private float fValue;
  private String strValue = "";

  public  void setowerId(String theowerId ){
  	owerId = theowerId;;
  }

  public  String getowerId( ){
  return owerId;
  }

  public  void setstrDescribe(String theDescribe){
    strDescribe = theDescribe;
  }

  public  String getstrDescribe( ){
    return strDescribe;
  }

  public void setfValue(String theValue){
    strValue = theValue;
  }

  public String getfValue(){
    return strValue ;
  }
}