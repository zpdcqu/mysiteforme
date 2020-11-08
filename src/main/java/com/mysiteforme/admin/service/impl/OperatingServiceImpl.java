package com.mysiteforme.admin.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.mysiteforme.admin.dao.OperatorDao;
import com.mysiteforme.admin.entity.Notice;
import com.mysiteforme.admin.service.OperatingService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class OperatingServiceImpl extends ServiceImpl<OperatorDao, Notice> implements OperatingService {
}
