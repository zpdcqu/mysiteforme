package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.File;
import com.mysiteforme.admin.dao.FileDao;
import com.mysiteforme.admin.service.FileService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 上传文件表 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class FileServiceImpl extends ServiceImpl<FileDao, File> implements FileService {

}
