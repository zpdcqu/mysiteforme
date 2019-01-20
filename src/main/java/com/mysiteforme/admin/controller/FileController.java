package com.mysiteforme.admin.controller;

import com.xiaoleilu.hutool.date.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.mysiteforme.admin.entity.File;
import com.mysiteforme.admin.service.FileService;
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
 * 上传文件表  前端控制器
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Controller
@RequestMapping("/admin/file")
public class FileController {
    private static final Logger LOGGER = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private FileService fileService;

    @GetMapping("list")
    @SysLog("跳转上传文件表列表")
    public String list(){
        return "/admin/file/list";
    }

    @PostMapping("list")
    @ResponseBody
    @SysLog("请求上传文件表列表数据")
    public LayerData<File> list(@RequestParam(value = "page",defaultValue = "1")Integer page,
                                      @RequestParam(value = "limit",defaultValue = "10")Integer limit,
                                      ServletRequest request){
        Map map = WebUtils.getParametersStartingWith(request, "s_");
        LayerData<File> layerData = new LayerData<>();
        EntityWrapper<File> wrapper = new EntityWrapper<>();
        wrapper.eq("del_flag",false);
        if(!map.isEmpty()){
            String name = (String) map.get("name");
            if(StringUtils.isNotBlank(name)) {
                wrapper.like("name",name);
            }else{
                map.remove("name");
            }

            String uploadUser = (String) map.get("uploadUser");
            if(StringUtils.isNotBlank(uploadUser)) {
                wrapper.like("uploadUser",uploadUser);
            }else{
                map.remove("uploadUser");
            }

            String beginDate = (String) map.get("beginDate");
            String endDate = (String) map.get("endDate");
            if(StringUtils.isNotBlank(beginDate)) {
                Date begin = DateUtil.parse(beginDate);
                wrapper.ge("date",begin);
            }else{
                map.remove("beginDate");
            }
            if(StringUtils.isNotBlank(endDate)) {
                Date end = DateUtil.parse(endDate);
                wrapper.le("date",end);
            }else{
                map.remove("endDate");
            }

        }
        Page<File> pageData = fileService.selectPage(new Page<>(page,limit),wrapper);
        layerData.setData(pageData.getRecords());
        layerData.setCount(pageData.getTotal());
        return layerData;
    }

    @GetMapping("add")
    @SysLog("跳转新增上传文件表页面")
    public String add(){
        return "/admin/file/add";
    }

    @PostMapping("add")
    @SysLog("保存新增上传文件表数据")
    @ResponseBody
    public RestResponse add(File file){
        fileService.insert(file);
        return RestResponse.success();
    }

    @GetMapping("edit")
    @SysLog("跳转编辑上传文件表页面")
    public String edit(Long id,Model model){
        File file = fileService.selectById(id);
        model.addAttribute("file",file);
        return "/admin/file/edit";
    }

    @PostMapping("edit")
    @ResponseBody
    @SysLog("保存编辑上传文件表数据")
    public RestResponse edit(File file){
        if(null == file.getId() || 0 == file.getId()){
            return RestResponse.failure("ID不能为空");
        }
        fileService.updateById(file);
        return RestResponse.success();
    }

    @PostMapping("delete")
    @ResponseBody
    @SysLog("删除上传文件表数据")
    public RestResponse delete(@RequestParam(value = "id",required = false)Long id){
        if(null == id || 0 == id){
            return RestResponse.failure("ID不能为空");
        }
        File file = fileService.selectById(id);
        file.setDelFlag(true);
        fileService.updateById(file);
        return RestResponse.success();
    }

}