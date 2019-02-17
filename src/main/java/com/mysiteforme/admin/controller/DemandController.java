package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.Demand;
import com.mysiteforme.admin.service.DemandService;
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
 * 需求表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-02-17
 */
@Controller
@RequestMapping("/admin/demand")
public class DemandController {
    private static final Logger LOGGER = LoggerFactory.getLogger(DemandController.class);

    @Autowired
    private DemandService demandService;

    @GetMapping("list")
    @SysLog("跳转需求表列表")
    public String list(){
        return "/admin/demand/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求需求表列表数据")
    public LayerData<Demand> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<Demand> layerData = new LayerData<>();
        EntityWrapper<Demand> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

            String type = (String) map.get("type");
            if(StringUtils.isNotBlank(type)) {
                wrapper.eq("type",type);
            }else{
                map.remove("type");
            }

        }
        Page<Demand> pageData = demandService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增需求表页面")
    public String add(){
        return "/admin/demand/add";
    }

    @PostMapping("add")
    @SysLog("保存新增需求表数据")
    @ResponseBody
    public RestResponse add(Demand demand){
        demandService.insert(demand);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑需求表页面")
    public String edit(Long id,Model model){
        Demand demand = demandService.selectById(id);
        model.addAttribute("demand",demand);
        return "/admin/demand/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑需求表数据")
    public RestResponse edit(Demand demand){
        if(null == demand.getId() || 0 == demand.getId()){
            return RestResponse.failure("ID不能为空");
        }
        demandService.updateById(demand);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除需求表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        Demand demand = demandService.selectById(id);
        demand.setDelFlag(true);
        demandService.updateById(demand);
        return RestResponse.success();
    }

}