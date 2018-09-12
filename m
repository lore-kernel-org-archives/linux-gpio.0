From: Niklas Cassel <niklas.cassel@linaro.org>
Subject: Re: [PATCH v3 0/3] pinctrl: msm interrupt and muxing fixes
Date: Wed, 12 Sep 2018 12:34:31 +0200
Message-ID: <20180912103431.GA27204@centauri.ideon.se>
References: <20180816200648.90458-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180816200648.90458-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

Hello Stephen,

I'm getting this warning on dragonboard 820c (msm8996) when booting linux-next:

[    3.211575] WARNING: CPU: 1 PID: 1 at drivers/pinctrl/qcom/pinctrl-msm.c:164 msm_pinmux_set_mux+0xc8/0x150
[    3.212127] l28: ramp_delay not set
[    3.215146] Modules linked in:
[    3.215168] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G        W         4.19.0-rc2-next-2018904-00004-gd8c6804d9e9b #54
[    3.215175] Hardware name: Qualcomm Technologies, Inc. DB820c (DT)
[    3.215184] pstate: 60400005 (nZCv daif +PAN -UAO)
[    3.215197] pc : msm_pinmux_set_mux+0xc8/0x150
[    3.215206] lr : msm_pinmux_set_mux+0x30/0x150
[    3.215213] sp : ffff00000803b880
[    3.224815] l28: 925 mV
[    3.228149] x29: ffff00000803b880 x28: ffff00000978a22c
[    3.228172] x27: ffff000009f22000 x26: ffff000009640764
[    3.228193] x25: 0000000000000000
[    3.241956] x24: ffff8000d93f5f18
[    3.241971] x23: ffff8000d93fec18 x22: 0000000000000000
[    3.241992] x21: ffff000009100d10 x20: 000000000000003c
[    3.252891] x19: 000000000000000a x18: ffffffffffffffff
[    3.252913] x17: 00000000000017c7 x16: ffff000009fdaac0
[    3.252935] x15: ffff000009cbe1c8
[    3.257467] l29: supplied by regulator-dummy
[    3.261743] x14: ffff8000d85fea14
[    3.261757] x13: ffff8000d85fea13 x12: ffff8000d9f488b0
[    3.261778] x11: 0000000005f5e0ff x10: 0000000000000040
[    3.267734] x9 : ffff8000d91bae18 x8 : ffff8000d981efe8
[    3.267755] x7 : ffff8000d981f128 x6 : 000000000000000a
[    3.267776] x5 : 0000000000000040
[    3.273347] l29: Bringing 0uV into 2800000-2800000uV
[    3.278323] x4 : ffffffffffffffff
[    3.278338] x3 : 000000000000000a x2 : 00000000ffffffc6
[    3.278359] x1 : ffff000009d3eec8 x0 : 00000000000000f3
[    3.282026] l29: ramp_delay not set
[    3.292566] Call trace:
[    3.292581]  msm_pinmux_set_mux+0xc8/0x150
[    3.292590]  msm_pinmux_request_gpio+0x5c/0x68
[    3.292599]  pin_request+0x154/0x2c0
[    3.292608]  pinmux_request_gpio+0x60/0xa0
[    3.296080] l29: 2800 mV
[    3.301503]  pinctrl_gpio_request+0x148/0x1d8
[    3.301514]  gpiochip_generic_request+0x2c/0x38
[    3.301523]  gpiod_request_commit+0xc4/0x1a0
[    3.301532]  gpiod_request+0x6c/0x110
[    3.301544]  gpiod_get_index+0x134/0x360
[    3.322166]  devm_gpiod_get_index+0x64/0xc0
[    3.322174]  devm_gpiod_get_optional+0x38/0x58
[    3.322185]  qcom_pcie_probe+0xa4/0x230
[    3.322197]  platform_drv_probe+0x58/0xa8
[    3.322207]  really_probe+0x280/0x3d8
[    3.322215]  driver_probe_device+0x60/0x148
[    3.322224]  __driver_attach+0x144/0x148
[    3.322233]  bus_for_each_dev+0x84/0xd8
[    3.322241]  driver_attach+0x30/0x40
[    3.322250]  bus_add_driver+0x234/0x2a8
[    3.322258]  driver_register+0x64/0x110
[    3.322267]  __platform_driver_register+0x54/0x60
[    3.322279]  qcom_pcie_driver_init+0x20/0x28
[    3.322290]  do_one_initcall+0x94/0x3f8
[    3.322301]  kernel_init_freeable+0x47c/0x528
[    3.322315]  kernel_init+0x18/0x110
[    3.322323]  ret_from_fork+0x10/0x1c


If I revert patch 2/3 and 3/3 in this series, the warning goes away.


Kind regards,
Niklas
