package statqry.wdssweb.function;
import java.util.*;
import java.sql.SQLException;
/**
 * <p>各种类型流量查询的公共接口</p>
 * @author zouming
 * @version 1.0
 */
public interface FluxSearch {
  /**根据查询条件，查询流量
   *@param strWhere 页面传入的查询条件
   */
  public List DoSearchFlux (String strWhere) throws SQLException,Exception;
}