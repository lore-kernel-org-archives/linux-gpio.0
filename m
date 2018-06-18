From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [Letux-kernel] BUG: drivers/pinctrl/core: races in pinctrl_groups and deferred probing
Date: Mon, 18 Jun 2018 18:43:49 +0200
Message-ID: <CDD8B994-59E9-42DC-A77D-AF4F35EBF101@goldelico.com>
References: <FC373DE9-6D6B-40C5-ACED-C07B1B524469@goldelico.com> <20180615065810.GI112168@atomide.com> <20180615111318.GJ112168@atomide.com> <029F115C-480E-485A-B547-9D5873925CEF@goldelico.com> <4DE2E482-B0D3-4799-9E2D-74E2180B305B@goldelico.com> <CAHp75Vf7-xcsoSJ--9nJYbxpwSfDv201UwnxJHoFbwtD187SPw@mail.gmail.com> <20180618091433.GP112168@atomide.com> <BB5DB278-9827-4351-99DF-54C875B1879F@goldelico.com> <20180618095428.GQ112168@atomide.com> <CA+Ot1OxNj30KgHWJHXgWbnXYkNXTNvd_t-b6+uG3u=z8+pZf2Q@mail.gmail.com> <20180618115122.GT26255@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180618115122.GT26255@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Christ van Willegen <cvwillegen@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, kernel@pyra-handheld.com, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: linux-gpio@vger.kernel.org

Hi Tony,

> Am 18.06.2018 um 13:51 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Christ van Willegen <cvwillegen@gmail.com> [180618 10:01]:
>>> --- a/drivers/pinctrl/core.c
>>> +++ b/drivers/pinctrl/core.c
>>> +               if (!strcmp(function, gname))
>>=20
>>=20
>> This could never fail? gname guaranteed to never =3D=3D NULL?

If there are no duplicates and stale entries any more, gname must
be valid.

>=20
> Thanks I'll add checks to make sure we always have a valid
> name for new functions and groups added.

Well, not having checks is the cheapest debugging tool that does not
even need to be enabled because strcmp(NULL) checks come for free :)

Jokes aside, I now have tested the latest patch and it seems to solve =
the issues :) :) :)

I can also demonstrate that the duplication has gone:

root@letux:~# dmesg|fgrep generic_add
[    0.747436] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_hsusb2_pins selector=3D0
[    0.750671] pinctrl_generic_add_group: pctldev=3Dee486f80 =
name=3Dpinmux_hsusb2_2_pins selector=3D0
[    0.751403] pinctrl_generic_add_group: pctldev=3Dee486e00 =
name=3Dpinmux_mcbsp1_devconf0_pins selector=3D0
[    0.752227] pinctrl_generic_add_group: pctldev=3Dee486d00 =
name=3Dpinmux_tv_acbias_devconf1_pins selector=3D0
[    0.769104] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_uart1_pins selector=3D1
[    0.770874] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_uart2_pins selector=3D2
[    0.772003] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_uart3_pins selector=3D3
[    1.799316] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_twl4030_pins selector=3D4
[    1.808624] pinctrl_generic_add_group: pctldev=3Dee446000 =
name=3Dpinmux_twl4030_vpins selector=3D0
[    1.978912] pinctrl_generic_add_group: pctldev=3Dee486f80 =
name=3Dspi_gpio_pinmux selector=3D1
[    2.173522] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_mmc1_pins selector=3D5
[    2.207916] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_wlan_irq_pin selector=3D6
[    2.383666] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_gpmc_pins selector=3D7
[    2.778808] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_wlan_pins selector=3D8
[    2.794708] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_bt_pins selector=3D9
[    5.405273] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_dss_dpi_pins selector=3D10
[    6.051666] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_mcbsp1_pins selector=3D11
[    6.136688] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_mcbsp2_pins selector=3D12
[    6.222015] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_mcbsp3_pins selector=3D13
[    6.261199] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_penirq_pins selector=3D14
[    6.288787] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_mcbsp4_pins selector=3D15
[    6.336700] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dhdq_pins selector=3D16
[    6.607788] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_camera_pins selector=3D17
[    6.900848] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dbacklight_pins_pinmux selector=3D18
[    7.298217] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dmodem_pins selector=3D19
[    8.134826] pinctrl_generic_add_group: pctldev=3Dee446180 =
name=3Dpinmux_pps_pins selector=3D20
root@letux:~#

And I was no longer able to reproduce the strcmp(NULL) issue. So it is =
either better hidden
or gone.

So code just needs group cleanup on failed probing and fixing the mutex =
around pinctrl_generic_add_group().

I think we need the mutex because a race still can happen when =
create_pinctrl() is calling pcs_dt_node_to_map()
and pinctrl_generic_add_group() w/o being locked on pinctrl_maps_mutex.

The race I suspect is that two drivers are trying to insert the same =
name and may come
both to the conclusion that it does not yet exist. And both insert into =
the radix tree.

The window of risk is small though... It is in =
pinctrl_generic_add_group() between calling
pinctrl_generic_group_name_to_selector() and radix_tree_insert() so we =
probably won't
see it in real hardware tests.

Anyhow, I'll apply the patches as "hacks" to the LetuxOS kernel (4.17.x =
and 4.18-rc1) so that
more users can test. And we can replace them if they are finally =
accepted upstream.

BR and thanks for fixing the bug,
Nikolaus
