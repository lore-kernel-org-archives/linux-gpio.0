From: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v3 3/4] i2c: rk3x: new method to caculate i2c clocks
Date: Thu, 14 Jan 2016 15:50:43 +0100 (CET)
Message-ID: <alpine.DEB.2.10.1601141548100.2509@hadrien>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: heiko@sntech.de, wsa@the-dreams.de, andy.shevchenko@gmail.com, dianders@chromium.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hl@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>
List-Id: linux-gpio@vger.kernel.org

It looks like it would be an infinite loop?

julia

---------- Forwarded message ----------
Date: Thu, 14 Jan 2016 22:42:19 +0800
From: kbuild test robot <fengguang.wu@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: Re: [PATCH v3 3/4] i2c: rk3x: new method to caculate i2c clocks

CC: kbuild-all@01.org
In-Reply-To: <1452774699-57455-4-git-send-email-david.wu@rock-chips.com>
TO: David Wu <david.wu@rock-chips.com>
CC: heiko@sntech.de
CC: wsa@the-dreams.de, andy.shevchenko@gmail.com, dianders@chromium.org, huangtao@rock-chips.com, zyw@rock-chips.com, cf@rock-chips.com, xjq@rock-chips.com, hl@rock-chips.com, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, David Wu <david.wu@rock-chips.com>

Hi David,

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v4.4 next-20160114]
[cannot apply to rockchip/for-next]
[if your patch is applied to the wrong git tree, please drop us a note to help improving the system]

url:    https://github.com/0day-ci/linux/commits/David-Wu/i2c-rk3x-switch-to-i2c-generic-dt-parsing/20160114-203309
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux i2c/for-next
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

>> drivers/i2c/busses/i2c-rk3x.c:793:23-34: WARNING: Unsigned expression compared with zero: data_hd_cnt >= 0

git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5fed4c320427dd34a909f9b408fadf297121924c
vim +793 drivers/i2c/busses/i2c-rk3x.c

5fed4c32 David Wu 2016-01-14  777  		 * for low (spend more time low).
5fed4c32 David Wu 2016-01-14  778  		 */
5fed4c32 David Wu 2016-01-14  779  		extra_div = min_total_div - min_div_for_hold;
5fed4c32 David Wu 2016-01-14  780  		extra_low_div = DIV_ROUND_UP(min_low_div * extra_div,
5fed4c32 David Wu 2016-01-14  781  					     min_div_for_hold);
5fed4c32 David Wu 2016-01-14  782
5fed4c32 David Wu 2016-01-14  783  		t_output->div_low = min_low_div + extra_low_div;
5fed4c32 David Wu 2016-01-14  784  		t_output->div_high = min_high_div + (extra_div - extra_low_div);
5fed4c32 David Wu 2016-01-14  785  	}
5fed4c32 David Wu 2016-01-14  786
5fed4c32 David Wu 2016-01-14  787  	/*
5fed4c32 David Wu 2016-01-14  788  	 * calculate sda data hold count by the rules, thd_sda_count:3
5fed4c32 David Wu 2016-01-14  789  	 * is a appropriate value to reduce calculated times.
5fed4c32 David Wu 2016-01-14  790  	 * tHD;sda  = (l * s + 1) * T
5fed4c32 David Wu 2016-01-14  791  	 * tSU;sda = ((8 - s) * l + 1) * T
5fed4c32 David Wu 2016-01-14  792  	 */
5fed4c32 David Wu 2016-01-14 @793  	for (data_hd_cnt = 3; data_hd_cnt >= 0; data_hd_cnt--) {
5fed4c32 David Wu 2016-01-14  794  		max_hold_data_ns =  DIV_ROUND_UP((data_hd_cnt
5fed4c32 David Wu 2016-01-14  795  						 * (t_output->div_low) + 1)
5fed4c32 David Wu 2016-01-14  796  						 * 1000000, clk_rate_khz);
5fed4c32 David Wu 2016-01-14  797  		min_setup_data_ns =  DIV_ROUND_UP(((8 - data_hd_cnt)
5fed4c32 David Wu 2016-01-14  798  						 * (t_output->div_low) + 1)
5fed4c32 David Wu 2016-01-14  799  						 * 1000000, clk_rate_khz);
5fed4c32 David Wu 2016-01-14  800  		if ((max_hold_data_ns < spec_max_data_hold_ns) &&
5fed4c32 David Wu 2016-01-14  801  		    (min_setup_data_ns > spec_min_data_setup_ns)) {

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
