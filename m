From: "Keiji Hayashibara" <hayashibara.keiji@socionext.com>
Subject: RE: [PATCH] pinctrl: uniphier: add spi pin-mux settings
Date: Thu, 19 Jul 2018 18:02:28 +0900
Message-ID: <000001d41f3f$38818500$a9848f00$@socionext.com>
References: <1531981249-26329-1-git-send-email-hayashibara.keiji@socionext.com> <201807191518.CFD3QbbB%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain;
        charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201807191518.CFD3QbbB%fengguang.wu@intel.com>
Content-Language: ja
Sender: linux-kernel-owner@vger.kernel.org
To: 'kbuild test robot' <lkp@intel.com>
Cc: kbuild-all@01.org, linus.walleij@linaro.org, =?iso-2022-jp?B?WWFtYWRhLCBNYXNhaGlyby8bJEI7M0VEGyhCIBskQj8/OTAbKEI=?= <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, masami.hiramatsu@linaro.org, jaswinder.singh@linaro.org, linux-kernel@vger.kernel.org, =?iso-2022-jp?B?SGF5YXNoaSwgS3VuaWhpa28vGyRCTlMbKEIgGyRCSy5JJxsoQg==?= <hayashi.kunihiko@socionext.com>, =?iso-2022-jp?B?SGF5YXNoaWJhcmEsIEtlaWppLxskQk5TODYbKEIgGyRCNzxGcxsoQg==?= <hayashibara.keiji@socionext.com>
List-Id: linux-gpio@vger.kernel.org

Hi,

Sorry.
I will fix this and send v2 patch.

Thank you.

Best Regards,
Keiji Hayashibara

> -----Original Message-----
> From: kbuild test robot [mailto:lkp@intel.com]
> Sent: Thursday, July 19, 2018 5:02 PM
> To: Hayashibara, Keiji/林原 啓二 <hayashibara.keiji@socionext.com>
> Cc: kbuild-all@01.org; linus.walleij@linaro.org; Yamada, Masahiro/山田 真弘 <yamada.masahiro@socionext.com>;
> linux-gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; masami.hiramatsu@linaro.org;
> jaswinder.singh@linaro.org; linux-kernel@vger.kernel.org; Hayashibara, Keiji/林原 啓二
> <hayashibara.keiji@socionext.com>; Hayashi, Kunihiko/林 邦彦 <hayashi.kunihiko@socionext.com>
> Subject: Re: [PATCH] pinctrl: uniphier: add spi pin-mux settings
>
> Hi Kunihiko,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on pinctrl/devel] [also build test WARNING on v4.18-rc5 next-20180718] [if your patch
> is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:
> https://github.com/0day-ci/linux/commits/Keiji-Hayashibara/pinctrl-uniphier-add-spi-pin-mux-settings/2018071
> 9-144943
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
> config: mips-allyesconfig (attached as .config)
> compiler: mips-linux-gnu-gcc (Debian 7.2.0-11) 7.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.2.0 make.cross ARCH=mips
>
> All warnings (new ones prefixed by >>):
>
>    In file included from drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c:21:0:
>    drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c:629:27: error: 'spi0_groups' undeclared here (not in a
> function); did you mean 'spi_groups'?
>      UNIPHIER_PINMUX_FUNCTION(spi0),
>                               ^
>    drivers/pinctrl/uniphier/pinctrl-uniphier.h:188:13: note: in definition of macro 'UNIPHIER_PINMUX_FUNCTION'
>       .groups = func##_groups,    \
>                 ^~~~
>    In file included from include/linux/kernel.h:15:0,
>                     from drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c:16:
>    include/linux/build_bug.h:29:45: error: bit-field '<anonymous>' width not an integer constant
>     #define BUILD_BUG_ON_ZERO(e) (sizeof(struct { int:(-!!(e)); }))
>                                                 ^
>    include/linux/compiler-gcc.h:65:28: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
>     #define __must_be_array(a) BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
>                                ^~~~~~~~~~~~~~~~~
>    include/linux/kernel.h:72:59: note: in expansion of macro '__must_be_array'
>     #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
>                                                               ^~~~~~~~~~~~~~~
> >> drivers/pinctrl/uniphier/pinctrl-uniphier.h:189:17: note: in expansion of macro 'ARRAY_SIZE'
>       .num_groups = ARRAY_SIZE(func##_groups),  \
>                     ^~~~~~~~~~
> >> drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c:629:2: note: in expansion of macro
> 'UNIPHIER_PINMUX_FUNCTION'
>      UNIPHIER_PINMUX_FUNCTION(spi0),
>      ^~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +/UNIPHIER_PINMUX_FUNCTION +629 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
>
>    618
>    619	static const struct uniphier_pinmux_function uniphier_sld8_functions[] = {
>    620		UNIPHIER_PINMUX_FUNCTION(emmc),
>    621		UNIPHIER_PINMUX_FUNCTION(ether_mii),
>    622		UNIPHIER_PINMUX_FUNCTION(ether_rmii),
>    623		UNIPHIER_PINMUX_FUNCTION(i2c0),
>    624		UNIPHIER_PINMUX_FUNCTION(i2c1),
>    625		UNIPHIER_PINMUX_FUNCTION(i2c2),
>    626		UNIPHIER_PINMUX_FUNCTION(i2c3),
>    627		UNIPHIER_PINMUX_FUNCTION(nand),
>    628		UNIPHIER_PINMUX_FUNCTION(sd),
>  > 629		UNIPHIER_PINMUX_FUNCTION(spi0),
>    630		UNIPHIER_PINMUX_FUNCTION(system_bus),
>    631		UNIPHIER_PINMUX_FUNCTION(uart0),
>    632		UNIPHIER_PINMUX_FUNCTION(uart1),
>    633		UNIPHIER_PINMUX_FUNCTION(uart2),
>    634		UNIPHIER_PINMUX_FUNCTION(uart3),
>    635		UNIPHIER_PINMUX_FUNCTION(usb0),
>    636		UNIPHIER_PINMUX_FUNCTION(usb1),
>    637		UNIPHIER_PINMUX_FUNCTION(usb2),
>    638	};
>    639
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
