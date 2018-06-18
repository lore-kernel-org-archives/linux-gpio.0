From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in pinctrl_groups
 and deferred probing
Date: Mon, 18 Jun 2018 11:22:50 +0300
Message-ID: <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com>
References: <F20BD6B3-D4D7-4D5D-B464-64402650BDE5@goldelico.com>
 <20180614120157.GE112168@atomide.com> <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com>
 <20180615065810.GI112168@atomide.com> <20180615111318.GJ112168@atomide.com>
 <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com> <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Tony Lindgren <tony@atomide.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

On Sat, Jun 16, 2018 at 2:08 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:

> [    0.739501] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_hsusb2_pins selector=0
> [    0.741638] pinctrl_generic_add_group: pctldev=ee481f80 name=pinmux_hsusb2_2_pins selector=0
> [    0.742401] pinctrl_generic_add_group: pctldev=ee481e00 name=pinmux_mcbsp1_devconf0_pins selector=0
> [    0.743072] pinctrl_generic_add_group: pctldev=ee481d00 name=pinmux_tv_acbias_devconf1_pins selector=0
> [    0.760437] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_uart1_pins selector=1
> [    0.762268] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_uart2_pins selector=2
> [    0.763610] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_uart3_pins selector=3
> [    1.790527] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_twl4030_pins selector=4
> [    1.799835] pinctrl_generic_add_group: pctldev=ee3cd000 name=pinmux_twl4030_vpins selector=0
> [    1.969635] pinctrl_generic_add_group: pctldev=ee481f80 name=spi_gpio_pinmux selector=1
> [    2.164093] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_mmc1_pins selector=5
> [    2.198242] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_wlan_irq_pin selector=6
> [    2.374328] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_gpmc_pins selector=7
> [    2.769989] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_wlan_pins selector=8
> [    2.785888] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_bt_pins selector=9
> [    2.802154] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_wlan_irq_pin selector=10
> [    5.415222] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_dss_dpi_pins selector=11
> [    6.080566] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_mcbsp1_pins selector=12
> [    6.182617] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_mcbsp2_pins selector=13
> [    6.271240] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_mcbsp3_pins selector=14
> [    6.330718] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_penirq_pins selector=15
> [    6.368927] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_mcbsp4_pins selector=16
> [    6.616546] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=17
> [    6.835418] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=18
> [    6.874694] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=19
> [    6.900299] pinctrl_generic_add_group: pctldev=ee3cd180 name=hdq_pins selector=20
> [    6.937042] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=21
> [    7.062744] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=22
> [    7.108032] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=23
> [    7.145080] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=24
> [    7.197723] pinctrl_generic_add_group: pctldev=ee3cd180 name=backlight_pins_pinmux selector=25
> [    7.427398] pinctrl_generic_add_group: pctldev=ee3cd180 name=modem_pins selector=26
> [    7.476562] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=27
> [    7.505981] pinctrl_generic_add_group: pctldev=ee3cd180 name=backlight_pins_pinmux selector=28
> [    7.564910] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=29
> [    7.894439] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=30
> [    8.207489] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=31
> [    8.311096] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_pps_pins selector=32
> [    8.340667] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=33
> [    8.414428] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=34
> [    9.231445] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=35
> [    9.446716] pinctrl_generic_add_group: pctldev=ee3cd180 name=pinmux_camera_pins selector=36
> root@letux:~#
>
> But it looks as if we still have duplicate assignments by deferred probing, i.e. some cleanup is
> missing (or is this intended behaviour?).

> But I think the fundamental problem is that the same driver assigns multiple slots if
> probing is deferred.

Indeed.

I think there is a simple way to clean up pinctrl stuff on failed probe. See
https://elixir.bootlin.com/linux/v4.18-rc1/source/drivers/base/dd.c#L416

We only bind pins, and do not perform any actions when failure happens later on.

> 3.  I could not observe calls to pinctrl_generic_remove_group()
> 4.  this means a stale pointer to the group_desc is still stored in the radix tree
>     if driver probing fails

Exactly.

-- 
With Best Regards,
Andy Shevchenko
