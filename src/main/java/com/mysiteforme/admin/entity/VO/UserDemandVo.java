package com.mysiteforme.admin.entity.VO;

import com.mysiteforme.admin.entity.Demand;

public class UserDemandVo extends Demand {
    Boolean checked;
    Object userOption;

    public Boolean getChecked() {
        return checked;
    }

    public void setChecked(Boolean checked) {
        this.checked = checked;
    }

    public Object getUserOption() {
        return userOption;
    }

    public void setUserOption(Object userOption) {
        this.userOption = userOption;
    }
}
