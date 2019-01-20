package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.MoneyLog;
import com.mysiteforme.admin.service.MoneyLogService;
import com.baomidou.mybatisplus.plugins.Page;
import com.mysiteforme.admin.util.LayerData;
import com.mysiteforme.admin.util.RestResponse;
import com.mysiteforme.admin.annotation.SysLog;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.WebUtils;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 付款记录  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Controller
@RequestMapping("/admin/moneyLog")
public class MoneyLogController {
    private static final Logger LOGGER = LoggerFactory.getLogger(MoneyLogController.class);

    @Autowired
    private MoneyLogService moneyLogService;

    @GetMapping("list")
    @SysLog("跳转付款记录列表")
    public String list(){
        return "/admin/moneyLog/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求付款记录列表数据")
    public LayerData<MoneyLog> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<MoneyLog> layerData = new LayerData<>();
        EntityWrapper<MoneyLog> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String type = (String) map.get("type");
            if(StringUtils.isNotBlank(type)) {
                wrapper.eq("type",type);
            }else{
                map.remove("type");
            }

            String num = (String) map.get("num");
            if(StringUtils.isNotBlank(num)) {
                wrapper.like("num",num);
            }else{
                map.remove("num");
            }

            String method = (String) map.get("method");
            if(StringUtils.isNotBlank(method)) {
                wrapper.eq("method",method);
            }else{
                map.remove("method");
            }

            String description = (String) map.get("description");
            if(StringUtils.isNotBlank(description)) {
                wrapper.like("description",description);
            }else{
                map.remove("description");
            }

        }
        Page<MoneyLog> pageData = moneyLogService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增付款记录页面")
    public String add(){
        return "/admin/moneyLog/add";
    }

    @PostMapping("add")
    @SysLog("保存新增付款记录数据")
    @ResponseBody
    public RestResponse add(MoneyLog moneyLog){
        moneyLogService.insert(moneyLog);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑付款记录页面")
    public String edit(Long id,Model model){
        MoneyLog moneyLog = moneyLogService.selectById(id);
        model.addAttribute("moneyLog",moneyLog);
        return "/admin/moneyLog/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑付款记录数据")
    public RestResponse edit(MoneyLog moneyLog){
        if(null == moneyLog.getId() || 0 == moneyLog.getId()){
            return RestResponse.failure("ID不能为空");
        }
        moneyLogService.updateById(moneyLog);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除付款记录数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        MoneyLog moneyLog = moneyLogService.selectById(id);
        moneyLog.setDelFlag(true);
        moneyLogService.updateById(moneyLog);
        return RestResponse.success();
    }

}