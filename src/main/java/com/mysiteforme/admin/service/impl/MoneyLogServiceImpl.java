package com.mysiteforme.admin.service.impl;

import com.mysiteforme.admin.entity.MoneyLog;
import com.mysiteforme.admin.dao.MoneyLogDao;
import com.mysiteforme.admin.service.MoneyLogService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 付款记录 服务实现类
 * </p>
 *
 * @author wangl
 * @since 2019-01-20
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class MoneyLogServiceImpl extends ServiceImpl<MoneyLogDao, MoneyLog> implements MoneyLogService {

}
