From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] pinctrl: sunxi: add support of R40 to A10 pinctrl
 driver
Date: Wed, 19 Jul 2017 21:25:20 +0800
Message-ID: <201707192110.5Cu1WZB9%fengguang.wu@intel.com>
References: <20170718074254.20732-3-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718074254.20732-3-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: linux-gpio@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Icenowy,

[auto build test ERROR on pinctrl/devel]
[also build test ERROR on v4.13-rc1]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Icenowy-Zheng/pinctrl-sunxi-add-a-missing-function-of-A10-A20-pinctrl-driver/20170719-062420
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
config: arm-sunxi_defconfig (attached as .config)
compiler: arm-linux-gnueabi-gcc (Debian 6.1.1-9) 6.1.1 20160705
reproduce:
        wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=arm 

All errors (new ones prefixed by >>):

>> drivers/pinctrl//sunxi/pinctrl-sun4i-a10.c:357:1: error: macro "SUNXI_FUNCTION_VARIANT" requires 3 arguments, but only 2 given
          PINCTRL_SUN8I_R40)),
    ^     ~
   In file included from drivers/pinctrl//sunxi/pinctrl-sun4i-a10.c:19:0:
>> drivers/pinctrl//sunxi/pinctrl-sun4i-a10.c:356:5: error: 'SUNXI_FUNCTION_VARIANT' undeclared here (not in a function)
        SUNXI_FUNCTION_VARIANT(0x4, "pwm" /* PWM5 */
        ^
   drivers/pinctrl//sunxi/pinctrl-sunxi.h:149:4: note: in definition of macro 'SUNXI_PIN'
       __VA_ARGS__, { } },   \
       ^~~~~~~~~~~

vim +/SUNXI_FUNCTION_VARIANT +357 drivers/pinctrl//sunxi/pinctrl-sun4i-a10.c

    20	
    21	static const struct sunxi_desc_pin sun4i_a10_pins[] = {
    22		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 0),
    23			  SUNXI_FUNCTION(0x0, "gpio_in"),
    24			  SUNXI_FUNCTION(0x1, "gpio_out"),
    25			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXD3 */
    26			  SUNXI_FUNCTION(0x3, "spi1"),		/* CS0 */
    27			  SUNXI_FUNCTION(0x4, "uart2"),		/* RTS */
    28			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXD3 */
    29						 PINCTRL_SUN7I_A20 |
    30						 PINCTRL_SUN8I_R40)),
    31		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 1),
    32			  SUNXI_FUNCTION(0x0, "gpio_in"),
    33			  SUNXI_FUNCTION(0x1, "gpio_out"),
    34			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXD2 */
    35			  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
    36			  SUNXI_FUNCTION(0x4, "uart2"),		/* CTS */
    37			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXD2 */
    38						 PINCTRL_SUN7I_A20 |
    39						 PINCTRL_SUN8I_R40)),
    40		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 2),
    41			  SUNXI_FUNCTION(0x0, "gpio_in"),
    42			  SUNXI_FUNCTION(0x1, "gpio_out"),
    43			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXD1 */
    44			  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
    45			  SUNXI_FUNCTION(0x4, "uart2"),		/* TX */
    46			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXD1 */
    47						 PINCTRL_SUN7I_A20 |
    48						 PINCTRL_SUN8I_R40)),
    49		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 3),
    50			  SUNXI_FUNCTION(0x0, "gpio_in"),
    51			  SUNXI_FUNCTION(0x1, "gpio_out"),
    52			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXD0 */
    53			  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
    54			  SUNXI_FUNCTION(0x4, "uart2"),		/* RX */
    55			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXD0 */
    56						 PINCTRL_SUN7I_A20 |
    57						 PINCTRL_SUN8I_R40)),
    58		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 4),
    59			  SUNXI_FUNCTION(0x0, "gpio_in"),
    60			  SUNXI_FUNCTION(0x1, "gpio_out"),
    61			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXD3 */
    62			  SUNXI_FUNCTION(0x3, "spi1"),		/* CS1 */
    63			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXD3 */
    64						 PINCTRL_SUN7I_A20 |
    65						 PINCTRL_SUN8I_R40)),
    66		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 5),
    67			  SUNXI_FUNCTION(0x0, "gpio_in"),
    68			  SUNXI_FUNCTION(0x1, "gpio_out"),
    69			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXD2 */
    70			  SUNXI_FUNCTION(0x3, "spi3"),		/* CS0 */
    71			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXD2 */
    72						 PINCTRL_SUN7I_A20 |
    73						 PINCTRL_SUN8I_R40)),
    74		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 6),
    75			  SUNXI_FUNCTION(0x0, "gpio_in"),
    76			  SUNXI_FUNCTION(0x1, "gpio_out"),
    77			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXD1 */
    78			  SUNXI_FUNCTION(0x3, "spi3"),		/* CLK */
    79			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXD1 */
    80						 PINCTRL_SUN7I_A20 |
    81						 PINCTRL_SUN8I_R40)),
    82		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 7),
    83			  SUNXI_FUNCTION(0x0, "gpio_in"),
    84			  SUNXI_FUNCTION(0x1, "gpio_out"),
    85			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXD0 */
    86			  SUNXI_FUNCTION(0x3, "spi3"),		/* MOSI */
    87			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXD0 */
    88						 PINCTRL_SUN7I_A20 |
    89						 PINCTRL_SUN8I_R40)),
    90		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 8),
    91			  SUNXI_FUNCTION(0x0, "gpio_in"),
    92			  SUNXI_FUNCTION(0x1, "gpio_out"),
    93			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXCK */
    94			  SUNXI_FUNCTION(0x3, "spi3"),		/* MISO */
    95			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXCK */
    96						 PINCTRL_SUN7I_A20 |
    97						 PINCTRL_SUN8I_R40)),
    98		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 9),
    99			  SUNXI_FUNCTION(0x0, "gpio_in"),
   100			  SUNXI_FUNCTION(0x1, "gpio_out"),
   101			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXERR */
   102			  SUNXI_FUNCTION(0x3, "spi3"),		/* CS1 */
   103			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GNULL / ERXERR */
   104						 PINCTRL_SUN7I_A20 |
   105						 PINCTRL_SUN8I_R40),
   106			  SUNXI_FUNCTION_VARIANT(0x6, "i2s1",	/* MCLK */
   107						 PINCTRL_SUN7I_A20 |
   108						 PINCTRL_SUN8I_R40)),
   109		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 10),
   110			  SUNXI_FUNCTION(0x0, "gpio_in"),
   111			  SUNXI_FUNCTION(0x1, "gpio_out"),
   112			  SUNXI_FUNCTION(0x2, "emac"),		/* ERXDV */
   113			  SUNXI_FUNCTION(0x4, "uart1"),		/* TX */
   114			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GRXDV */
   115						 PINCTRL_SUN7I_A20 |
   116						 PINCTRL_SUN8I_R40)),
   117		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 11),
   118			  SUNXI_FUNCTION(0x0, "gpio_in"),
   119			  SUNXI_FUNCTION(0x1, "gpio_out"),
   120			  SUNXI_FUNCTION(0x2, "emac"),		/* EMDC */
   121			  SUNXI_FUNCTION(0x4, "uart1"),		/* RX */
   122			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* EMDC */
   123						 PINCTRL_SUN7I_A20 |
   124						 PINCTRL_SUN8I_R40)),
   125		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 12),
   126			  SUNXI_FUNCTION(0x0, "gpio_in"),
   127			  SUNXI_FUNCTION(0x1, "gpio_out"),
   128			  SUNXI_FUNCTION(0x2, "emac"),		/* EMDIO */
   129			  SUNXI_FUNCTION(0x3, "uart6"),		/* TX */
   130			  SUNXI_FUNCTION(0x4, "uart1"),		/* RTS */
   131			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* EMDIO */
   132						 PINCTRL_SUN7I_A20 |
   133						 PINCTRL_SUN8I_R40)),
   134		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 13),
   135			  SUNXI_FUNCTION(0x0, "gpio_in"),
   136			  SUNXI_FUNCTION(0x1, "gpio_out"),
   137			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXEN */
   138			  SUNXI_FUNCTION(0x3, "uart6"),		/* RX */
   139			  SUNXI_FUNCTION(0x4, "uart1"),		/* CTS */
   140			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXCTL / ETXEN */
   141						 PINCTRL_SUN7I_A20 |
   142						 PINCTRL_SUN8I_R40)),
   143		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 14),
   144			  SUNXI_FUNCTION(0x0, "gpio_in"),
   145			  SUNXI_FUNCTION(0x1, "gpio_out"),
   146			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXCK */
   147			  SUNXI_FUNCTION(0x3, "uart7"),		/* TX */
   148			  SUNXI_FUNCTION(0x4, "uart1"),		/* DTR */
   149			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GNULL / ETXCK */
   150						 PINCTRL_SUN7I_A20 |
   151						 PINCTRL_SUN8I_R40),
   152			  SUNXI_FUNCTION_VARIANT(0x6, "i2s1",	/* BCLK */
   153						 PINCTRL_SUN7I_A20 |
   154						 PINCTRL_SUN8I_R40)),
   155		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 15),
   156			  SUNXI_FUNCTION(0x0, "gpio_in"),
   157			  SUNXI_FUNCTION(0x1, "gpio_out"),
   158			  SUNXI_FUNCTION(0x2, "emac"),		/* ECRS */
   159			  SUNXI_FUNCTION(0x3, "uart7"),		/* RX */
   160			  SUNXI_FUNCTION(0x4, "uart1"),		/* DSR */
   161			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GTXCK / ECRS */
   162						 PINCTRL_SUN7I_A20 |
   163						 PINCTRL_SUN8I_R40),
   164			  SUNXI_FUNCTION_VARIANT(0x6, "i2s1",	/* LRCK */
   165						 PINCTRL_SUN7I_A20 |
   166						 PINCTRL_SUN8I_R40)),
   167		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 16),
   168			  SUNXI_FUNCTION(0x0, "gpio_in"),
   169			  SUNXI_FUNCTION(0x1, "gpio_out"),
   170			  SUNXI_FUNCTION(0x2, "emac"),		/* ECOL */
   171			  SUNXI_FUNCTION(0x3, "can"),		/* TX */
   172			  SUNXI_FUNCTION(0x4, "uart1"),		/* DCD */
   173			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GCLKIN / ECOL */
   174						 PINCTRL_SUN7I_A20 |
   175						 PINCTRL_SUN8I_R40),
   176			  SUNXI_FUNCTION_VARIANT(0x6, "i2s1",	/* DO */
   177						 PINCTRL_SUN7I_A20 |
   178						 PINCTRL_SUN8I_R40)),
   179		SUNXI_PIN(SUNXI_PINCTRL_PIN(A, 17),
   180			  SUNXI_FUNCTION(0x0, "gpio_in"),
   181			  SUNXI_FUNCTION(0x1, "gpio_out"),
   182			  SUNXI_FUNCTION(0x2, "emac"),		/* ETXERR */
   183			  SUNXI_FUNCTION(0x3, "can"),		/* RX */
   184			  SUNXI_FUNCTION(0x4, "uart1"),		/* RING */
   185			  SUNXI_FUNCTION_VARIANT(0x5, "gmac",	/* GNULL / ETXERR */
   186						 PINCTRL_SUN7I_A20 |
   187						 PINCTRL_SUN8I_R40),
   188			  SUNXI_FUNCTION_VARIANT(0x6, "i2s1",	/* DI */
   189						 PINCTRL_SUN7I_A20 |
   190						 PINCTRL_SUN8I_R40)),
   191		/* Hole */
   192		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 0),
   193			  SUNXI_FUNCTION(0x0, "gpio_in"),
   194			  SUNXI_FUNCTION(0x1, "gpio_out"),
   195			  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
   196			  SUNXI_FUNCTION_VARIANT(0x3, "pll_lock_dbg",
   197						 PINCTRL_SUN8I_R40)),
   198		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 1),
   199			  SUNXI_FUNCTION(0x0, "gpio_in"),
   200			  SUNXI_FUNCTION(0x1, "gpio_out"),
   201			  SUNXI_FUNCTION(0x2, "i2c0")),		/* SDA */
   202		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 2),
   203			  SUNXI_FUNCTION(0x0, "gpio_in"),
   204			  SUNXI_FUNCTION(0x1, "gpio_out"),
   205			  SUNXI_FUNCTION_VARIANT(0x2, "pwm",	/* PWM0 */
   206						 PINCTRL_SUN4I_A10 |
   207						 PINCTRL_SUN7I_A20),
   208			  SUNXI_FUNCTION_VARIANT(0x3, "pwm",	/* PWM0 */
   209						 PINCTRL_SUN8I_R40)),
   210		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 3),
   211			  SUNXI_FUNCTION(0x0, "gpio_in"),
   212			  SUNXI_FUNCTION(0x1, "gpio_out"),
   213			  SUNXI_FUNCTION_VARIANT(0x2, "ir0",	/* TX */
   214						 PINCTRL_SUN4I_A10 |
   215						 PINCTRL_SUN7I_A20),
   216			  SUNXI_FUNCTION_VARIANT(0x3, "pwm",	/* PWM1 */
   217						 PINCTRL_SUN8I_R40),
   218			/*
   219			 * The SPDIF block is not referenced at all in the A10 user
   220			 * manual. However it is described in the code leaked and the
   221			 * pin descriptions are declared in the A20 user manual which
   222			 * is pin compatible with this device.
   223			 */
   224			  SUNXI_FUNCTION(0x4, "spdif")),        /* SPDIF MCLK */
   225		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 4),
   226			  SUNXI_FUNCTION(0x0, "gpio_in"),
   227			  SUNXI_FUNCTION(0x1, "gpio_out"),
   228			  SUNXI_FUNCTION(0x2, "ir0")),		/* RX */
   229		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 5),
   230			  SUNXI_FUNCTION(0x0, "gpio_in"),
   231			  SUNXI_FUNCTION(0x1, "gpio_out"),
   232			  /*
   233			   * On A10 there's only one I2S controller and the pin group
   234			   * is simply named "i2s". On A20 there's two and thus it's
   235			   * renamed to "i2s0". Deal with these name here, in order
   236			   * to satisfy existing device trees.
   237			   */
   238			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* MCLK */
   239						 PINCTRL_SUN4I_A10),
   240			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* MCLK */
   241						 PINCTRL_SUN7I_A20 |
   242						 PINCTRL_SUN8I_R40),
   243			  SUNXI_FUNCTION(0x3, "ac97")),		/* MCLK */
   244		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 6),
   245			  SUNXI_FUNCTION(0x0, "gpio_in"),
   246			  SUNXI_FUNCTION(0x1, "gpio_out"),
   247			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* BCLK */
   248						 PINCTRL_SUN4I_A10),
   249			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* BCLK */
   250						 PINCTRL_SUN7I_A20 |
   251						 PINCTRL_SUN8I_R40),
   252			  SUNXI_FUNCTION(0x3, "ac97")),		/* BCLK */
   253		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 7),
   254			  SUNXI_FUNCTION(0x0, "gpio_in"),
   255			  SUNXI_FUNCTION(0x1, "gpio_out"),
   256			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* LRCK */
   257						 PINCTRL_SUN4I_A10),
   258			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* LRCK */
   259						 PINCTRL_SUN7I_A20 |
   260						 PINCTRL_SUN8I_R40),
   261			  SUNXI_FUNCTION(0x3, "ac97")),		/* SYNC */
   262		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 8),
   263			  SUNXI_FUNCTION(0x0, "gpio_in"),
   264			  SUNXI_FUNCTION(0x1, "gpio_out"),
   265			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* DO0 */
   266						 PINCTRL_SUN4I_A10),
   267			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* DO0 */
   268						 PINCTRL_SUN7I_A20 |
   269						 PINCTRL_SUN8I_R40),
   270			  SUNXI_FUNCTION(0x3, "ac97")),		/* DO */
   271		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 9),
   272			  SUNXI_FUNCTION(0x0, "gpio_in"),
   273			  SUNXI_FUNCTION(0x1, "gpio_out"),
   274			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* DO1 */
   275						 PINCTRL_SUN4I_A10),
   276			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* DO1 */
   277						 PINCTRL_SUN7I_A20 |
   278						 PINCTRL_SUN8I_R40),
   279			  SUNXI_FUNCTION_VARIANT(0x4, "pwm",	/* PWM6 */
   280						 PINCTRL_SUN8I_R40)),
   281		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 10),
   282			  SUNXI_FUNCTION(0x0, "gpio_in"),
   283			  SUNXI_FUNCTION(0x1, "gpio_out"),
   284			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* DO2 */
   285						 PINCTRL_SUN4I_A10),
   286			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* DO2 */
   287						 PINCTRL_SUN7I_A20 |
   288						 PINCTRL_SUN8I_R40),
   289			  SUNXI_FUNCTION_VARIANT(0x4, "pwm",	/* PWM7 */
   290						 PINCTRL_SUN8I_R40)),
   291		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 11),
   292			  SUNXI_FUNCTION(0x0, "gpio_in"),
   293			  SUNXI_FUNCTION(0x1, "gpio_out"),
   294			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* DO3 */
   295						 PINCTRL_SUN4I_A10),
   296			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* DO3 */
   297						 PINCTRL_SUN7I_A20 |
   298						 PINCTRL_SUN8I_R40)),
   299		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 12),
   300			  SUNXI_FUNCTION(0x0, "gpio_in"),
   301			  SUNXI_FUNCTION(0x1, "gpio_out"),
   302			  SUNXI_FUNCTION_VARIANT(0x2, "i2s",	/* DI */
   303						 PINCTRL_SUN4I_A10),
   304			  SUNXI_FUNCTION_VARIANT(0x2, "i2s0",	/* DI */
   305						 PINCTRL_SUN7I_A20 |
   306						 PINCTRL_SUN8I_R40),
   307			  SUNXI_FUNCTION(0x3, "ac97"),		/* DI */
   308			/* Undocumented mux function on A10 - See SPDIF MCLK above */
   309			  SUNXI_FUNCTION_VARIANT(0x4, "spdif",	/* SPDIF IN */
   310						 PINCTRL_SUN4I_A10 |
   311						 PINCTRL_SUN7I_A20)),
   312		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 13),
   313			  SUNXI_FUNCTION(0x0, "gpio_in"),
   314			  SUNXI_FUNCTION(0x1, "gpio_out"),
   315			  SUNXI_FUNCTION(0x2, "spi2"),		/* CS1 */
   316			/* Undocumented mux function on A10 - See SPDIF MCLK above */
   317			  SUNXI_FUNCTION(0x4, "spdif")),        /* SPDIF OUT */
   318		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 14),
   319			  SUNXI_FUNCTION(0x0, "gpio_in"),
   320			  SUNXI_FUNCTION(0x1, "gpio_out"),
   321			  SUNXI_FUNCTION(0x2, "spi2"),		/* CS0 */
   322			  SUNXI_FUNCTION(0x3, "jtag")),		/* MS0 */
   323		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 15),
   324			  SUNXI_FUNCTION(0x0, "gpio_in"),
   325			  SUNXI_FUNCTION(0x1, "gpio_out"),
   326			  SUNXI_FUNCTION(0x2, "spi2"),		/* CLK */
   327			  SUNXI_FUNCTION(0x3, "jtag")),		/* CK0 */
   328		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 16),
   329			  SUNXI_FUNCTION(0x0, "gpio_in"),
   330			  SUNXI_FUNCTION(0x1, "gpio_out"),
   331			  SUNXI_FUNCTION(0x2, "spi2"),		/* MOSI */
   332			  SUNXI_FUNCTION(0x3, "jtag")),		/* DO0 */
   333		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 17),
   334			  SUNXI_FUNCTION(0x0, "gpio_in"),
   335			  SUNXI_FUNCTION(0x1, "gpio_out"),
   336			  SUNXI_FUNCTION(0x2, "spi2"),		/* MISO */
   337			  SUNXI_FUNCTION(0x3, "jtag")),		/* DI0 */
   338		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 18),
   339			  SUNXI_FUNCTION(0x0, "gpio_in"),
   340			  SUNXI_FUNCTION(0x1, "gpio_out"),
   341			  SUNXI_FUNCTION(0x2, "i2c1")),		/* SCK */
   342		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 19),
   343			  SUNXI_FUNCTION(0x0, "gpio_in"),
   344			  SUNXI_FUNCTION(0x1, "gpio_out"),
   345			  SUNXI_FUNCTION(0x2, "i2c1")),		/* SDA */
   346		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 20),
   347			  SUNXI_FUNCTION(0x0, "gpio_in"),
   348			  SUNXI_FUNCTION(0x1, "gpio_out"),
   349			  SUNXI_FUNCTION(0x2, "i2c2"),		/* SCK */
   350			  SUNXI_FUNCTION_VARIANT(0x4, "pwm",	/* PWM4 */
   351						 PINCTRL_SUN8I_R40)),
   352		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 21),
   353			  SUNXI_FUNCTION(0x0, "gpio_in"),
   354			  SUNXI_FUNCTION(0x1, "gpio_out"),
   355			  SUNXI_FUNCTION(0x2, "i2c2"),		/* SDA */
 > 356			  SUNXI_FUNCTION_VARIANT(0x4, "pwm"	/* PWM5 */
 > 357						 PINCTRL_SUN8I_R40)),
   358		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 22),
   359			  SUNXI_FUNCTION(0x0, "gpio_in"),
   360			  SUNXI_FUNCTION(0x1, "gpio_out"),
   361			  SUNXI_FUNCTION(0x2, "uart0"),		/* TX */
   362			  SUNXI_FUNCTION_VARIANT(0x3, "ir1",	/* TX */
   363						 PINCTRL_SUN4I_A10 |
   364						 PINCTRL_SUN7I_A20)),
   365		SUNXI_PIN(SUNXI_PINCTRL_PIN(B, 23),
   366			  SUNXI_FUNCTION(0x0, "gpio_in"),
   367			  SUNXI_FUNCTION(0x1, "gpio_out"),
   368			  SUNXI_FUNCTION(0x2, "uart0"),		/* RX */
   369			  SUNXI_FUNCTION(0x3, "ir1")),		/* RX */
   370		/* Hole */
   371		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 0),
   372			  SUNXI_FUNCTION(0x0, "gpio_in"),
   373			  SUNXI_FUNCTION(0x1, "gpio_out"),
   374			  SUNXI_FUNCTION(0x2, "nand0"),		/* NWE */
   375			  SUNXI_FUNCTION(0x3, "spi0")),		/* MOSI */
   376		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 1),
   377			  SUNXI_FUNCTION(0x0, "gpio_in"),
   378			  SUNXI_FUNCTION(0x1, "gpio_out"),
   379			  SUNXI_FUNCTION(0x2, "nand0"),		/* NALE */
   380			  SUNXI_FUNCTION(0x3, "spi0")),		/* MISO */
   381		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 2),
   382			  SUNXI_FUNCTION(0x0, "gpio_in"),
   383			  SUNXI_FUNCTION(0x1, "gpio_out"),
   384			  SUNXI_FUNCTION(0x2, "nand0"),		/* NCLE */
   385			  SUNXI_FUNCTION(0x3, "spi0")),		/* SCK */
   386		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 3),
   387			  SUNXI_FUNCTION(0x0, "gpio_in"),
   388			  SUNXI_FUNCTION(0x1, "gpio_out"),
   389			  SUNXI_FUNCTION(0x2, "nand0")),	/* NCE1 */
   390		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 4),
   391			  SUNXI_FUNCTION(0x0, "gpio_in"),
   392			  SUNXI_FUNCTION(0x1, "gpio_out"),
   393			  SUNXI_FUNCTION(0x2, "nand0")),	/* NCE0 */
   394		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 5),
   395			  SUNXI_FUNCTION(0x0, "gpio_in"),
   396			  SUNXI_FUNCTION(0x1, "gpio_out"),
   397			  SUNXI_FUNCTION(0x2, "nand0"),		/* NRE# */
   398			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* DS */
   399						 PINCTRL_SUN8I_R40)),
   400		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 6),
   401			  SUNXI_FUNCTION(0x0, "gpio_in"),
   402			  SUNXI_FUNCTION(0x1, "gpio_out"),
   403			  SUNXI_FUNCTION(0x2, "nand0"),		/* NRB0 */
   404			  SUNXI_FUNCTION(0x3, "mmc2")),		/* CMD */
   405		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 7),
   406			  SUNXI_FUNCTION(0x0, "gpio_in"),
   407			  SUNXI_FUNCTION(0x1, "gpio_out"),
   408			  SUNXI_FUNCTION(0x2, "nand0"),		/* NRB1 */
   409			  SUNXI_FUNCTION(0x3, "mmc2")),		/* CLK */
   410		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 8),
   411			  SUNXI_FUNCTION(0x0, "gpio_in"),
   412			  SUNXI_FUNCTION(0x1, "gpio_out"),
   413			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ0 */
   414			  SUNXI_FUNCTION(0x3, "mmc2")),		/* D0 */
   415		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 9),
   416			  SUNXI_FUNCTION(0x0, "gpio_in"),
   417			  SUNXI_FUNCTION(0x1, "gpio_out"),
   418			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ1 */
   419			  SUNXI_FUNCTION(0x3, "mmc2")),		/* D1 */
   420		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 10),
   421			  SUNXI_FUNCTION(0x0, "gpio_in"),
   422			  SUNXI_FUNCTION(0x1, "gpio_out"),
   423			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ2 */
   424			  SUNXI_FUNCTION(0x3, "mmc2")),		/* D2 */
   425		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 11),
   426			  SUNXI_FUNCTION(0x0, "gpio_in"),
   427			  SUNXI_FUNCTION(0x1, "gpio_out"),
   428			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ3 */
   429			  SUNXI_FUNCTION(0x3, "mmc2")),		/* D3 */
   430		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 12),
   431			  SUNXI_FUNCTION(0x0, "gpio_in"),
   432			  SUNXI_FUNCTION(0x1, "gpio_out"),
   433			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ4 */
   434			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* D4 */
   435						 PINCTRL_SUN8I_R40)),
   436		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 13),
   437			  SUNXI_FUNCTION(0x0, "gpio_in"),
   438			  SUNXI_FUNCTION(0x1, "gpio_out"),
   439			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ5 */
   440			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* D5 */
   441						 PINCTRL_SUN8I_R40)),
   442		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 14),
   443			  SUNXI_FUNCTION(0x0, "gpio_in"),
   444			  SUNXI_FUNCTION(0x1, "gpio_out"),
   445			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ6 */
   446			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* D6 */
   447						 PINCTRL_SUN8I_R40)),
   448		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 15),
   449			  SUNXI_FUNCTION(0x0, "gpio_in"),
   450			  SUNXI_FUNCTION(0x1, "gpio_out"),
   451			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQ7 */
   452			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* D7 */
   453						 PINCTRL_SUN8I_R40)),
   454		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 16),
   455			  SUNXI_FUNCTION(0x0, "gpio_in"),
   456			  SUNXI_FUNCTION(0x1, "gpio_out"),
   457			  SUNXI_FUNCTION(0x2, "nand0")),	/* NWP */
   458		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 17),
   459			  SUNXI_FUNCTION(0x0, "gpio_in"),
   460			  SUNXI_FUNCTION(0x1, "gpio_out"),
   461			  SUNXI_FUNCTION(0x2, "nand0")),	/* NCE2 */
   462		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 18),
   463			  SUNXI_FUNCTION(0x0, "gpio_in"),
   464			  SUNXI_FUNCTION(0x1, "gpio_out"),
   465			  SUNXI_FUNCTION(0x2, "nand0")),	/* NCE3 */
   466		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 19),
   467			  SUNXI_FUNCTION(0x0, "gpio_in"),
   468			  SUNXI_FUNCTION(0x1, "gpio_out"),
   469			  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE4 */
   470			  SUNXI_FUNCTION(0x3, "spi2")),		/* CS0 */
   471		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 20),
   472			  SUNXI_FUNCTION(0x0, "gpio_in"),
   473			  SUNXI_FUNCTION(0x1, "gpio_out"),
   474			  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE5 */
   475			  SUNXI_FUNCTION(0x3, "spi2")),		/* CLK */
   476		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 21),
   477			  SUNXI_FUNCTION(0x0, "gpio_in"),
   478			  SUNXI_FUNCTION(0x1, "gpio_out"),
   479			  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE6 */
   480			  SUNXI_FUNCTION(0x3, "spi2")),		/* MOSI */
   481		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 22),
   482			  SUNXI_FUNCTION(0x0, "gpio_in"),
   483			  SUNXI_FUNCTION(0x1, "gpio_out"),
   484			  SUNXI_FUNCTION(0x2, "nand0"),		/* NCE7 */
   485			  SUNXI_FUNCTION(0x3, "spi2")),		/* MISO */
   486		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 23),
   487			  SUNXI_FUNCTION(0x0, "gpio_in"),
   488			  SUNXI_FUNCTION(0x1, "gpio_out"),
   489			  SUNXI_FUNCTION(0x3, "spi0")),		/* CS0 */
   490		SUNXI_PIN(SUNXI_PINCTRL_PIN(C, 24),
   491			  SUNXI_FUNCTION(0x0, "gpio_in"),
   492			  SUNXI_FUNCTION(0x1, "gpio_out"),
   493			  SUNXI_FUNCTION(0x2, "nand0"),		/* NDQS */
   494			  SUNXI_FUNCTION_VARIANT(0x3, "mmc2",	/* RST */
   495						 PINCTRL_SUN8I_R40)),
   496		/* Hole */
   497		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 0),
   498			  SUNXI_FUNCTION(0x0, "gpio_in"),
   499			  SUNXI_FUNCTION(0x1, "gpio_out"),
   500			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D0 */
   501			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VP0 */
   502		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 1),
   503			  SUNXI_FUNCTION(0x0, "gpio_in"),
   504			  SUNXI_FUNCTION(0x1, "gpio_out"),
   505			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D1 */
   506			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VN0 */
   507		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 2),
   508			  SUNXI_FUNCTION(0x0, "gpio_in"),
   509			  SUNXI_FUNCTION(0x1, "gpio_out"),
   510			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D2 */
   511			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VP1 */
   512		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 3),
   513			  SUNXI_FUNCTION(0x0, "gpio_in"),
   514			  SUNXI_FUNCTION(0x1, "gpio_out"),
   515			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D3 */
   516			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VN1 */
   517		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 4),
   518			  SUNXI_FUNCTION(0x0, "gpio_in"),
   519			  SUNXI_FUNCTION(0x1, "gpio_out"),
   520			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D4 */
   521			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VP2 */
   522		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 5),
   523			  SUNXI_FUNCTION(0x0, "gpio_in"),
   524			  SUNXI_FUNCTION(0x1, "gpio_out"),
   525			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D5 */
   526			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VN2 */
   527		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 6),
   528			  SUNXI_FUNCTION(0x0, "gpio_in"),
   529			  SUNXI_FUNCTION(0x1, "gpio_out"),
   530			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D6 */
   531			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VPC */
   532		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 7),
   533			  SUNXI_FUNCTION(0x0, "gpio_in"),
   534			  SUNXI_FUNCTION(0x1, "gpio_out"),
   535			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D7 */
   536			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VNC */
   537		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 8),
   538			  SUNXI_FUNCTION(0x0, "gpio_in"),
   539			  SUNXI_FUNCTION(0x1, "gpio_out"),
   540			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D8 */
   541			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VP3 */
   542		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
   543			  SUNXI_FUNCTION(0x0, "gpio_in"),
   544			  SUNXI_FUNCTION(0x1, "gpio_out"),
   545			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D9 */
   546			  SUNXI_FUNCTION(0x3, "lvds0")),	/* VM3 */
   547		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
   548			  SUNXI_FUNCTION(0x0, "gpio_in"),
   549			  SUNXI_FUNCTION(0x1, "gpio_out"),
   550			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D10 */
   551			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VP0 */
   552		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
   553			  SUNXI_FUNCTION(0x0, "gpio_in"),
   554			  SUNXI_FUNCTION(0x1, "gpio_out"),
   555			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D11 */
   556			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VN0 */
   557		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
   558			  SUNXI_FUNCTION(0x0, "gpio_in"),
   559			  SUNXI_FUNCTION(0x1, "gpio_out"),
   560			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
   561			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VP1 */
   562		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
   563			  SUNXI_FUNCTION(0x0, "gpio_in"),
   564			  SUNXI_FUNCTION(0x1, "gpio_out"),
   565			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
   566			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VN1 */
   567		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
   568			  SUNXI_FUNCTION(0x0, "gpio_in"),
   569			  SUNXI_FUNCTION(0x1, "gpio_out"),
   570			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
   571			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VP2 */
   572		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
   573			  SUNXI_FUNCTION(0x0, "gpio_in"),
   574			  SUNXI_FUNCTION(0x1, "gpio_out"),
   575			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
   576			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VN2 */
   577		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
   578			  SUNXI_FUNCTION(0x0, "gpio_in"),
   579			  SUNXI_FUNCTION(0x1, "gpio_out"),
   580			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D16 */
   581			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VPC */
   582		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
   583			  SUNXI_FUNCTION(0x0, "gpio_in"),
   584			  SUNXI_FUNCTION(0x1, "gpio_out"),
   585			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D17 */
   586			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VNC */
   587		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
   588			  SUNXI_FUNCTION(0x0, "gpio_in"),
   589			  SUNXI_FUNCTION(0x1, "gpio_out"),
   590			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
   591			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VP3 */
   592		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
   593			  SUNXI_FUNCTION(0x0, "gpio_in"),
   594			  SUNXI_FUNCTION(0x1, "gpio_out"),
   595			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
   596			  SUNXI_FUNCTION(0x3, "lvds1")),	/* VN3 */
   597		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
   598			  SUNXI_FUNCTION(0x0, "gpio_in"),
   599			  SUNXI_FUNCTION(0x1, "gpio_out"),
   600			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
   601			  SUNXI_FUNCTION(0x3, "csi1")),		/* MCLK */
   602		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 21),
   603			  SUNXI_FUNCTION(0x0, "gpio_in"),
   604			  SUNXI_FUNCTION(0x1, "gpio_out"),
   605			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
   606			  SUNXI_FUNCTION(0x3, "sim")),		/* VPPEN */
   607		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 22),
   608			  SUNXI_FUNCTION(0x0, "gpio_in"),
   609			  SUNXI_FUNCTION(0x1, "gpio_out"),
   610			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
   611			  SUNXI_FUNCTION(0x3, "sim")),		/* VPPPP */
   612		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 23),
   613			  SUNXI_FUNCTION(0x0, "gpio_in"),
   614			  SUNXI_FUNCTION(0x1, "gpio_out"),
   615			  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
   616			  SUNXI_FUNCTION(0x3, "sim")),		/* DET */
   617		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 24),
   618			  SUNXI_FUNCTION(0x0, "gpio_in"),
   619			  SUNXI_FUNCTION(0x1, "gpio_out"),
   620			  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
   621			  SUNXI_FUNCTION(0x3, "sim")),		/* VCCEN */
   622		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 25),
   623			  SUNXI_FUNCTION(0x0, "gpio_in"),
   624			  SUNXI_FUNCTION(0x1, "gpio_out"),
   625			  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
   626			  SUNXI_FUNCTION(0x3, "sim")),		/* RST */
   627		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 26),
   628			  SUNXI_FUNCTION(0x0, "gpio_in"),
   629			  SUNXI_FUNCTION(0x1, "gpio_out"),
   630			  SUNXI_FUNCTION(0x2, "lcd0"),		/* HSYNC */
   631			  SUNXI_FUNCTION(0x3, "sim")),		/* SCK */
   632		SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 27),
   633			  SUNXI_FUNCTION(0x0, "gpio_in"),
   634			  SUNXI_FUNCTION(0x1, "gpio_out"),
   635			  SUNXI_FUNCTION(0x2, "lcd0"),		/* VSYNC */
   636			  SUNXI_FUNCTION(0x3, "sim")),		/* SDA */
   637		/* Hole */
   638		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 0),
   639			  SUNXI_FUNCTION(0x0, "gpio_in"),
   640			  SUNXI_FUNCTION(0x1, "gpio_out"),
   641			  SUNXI_FUNCTION(0x2, "ts0"),		/* CLK */
   642			  SUNXI_FUNCTION(0x3, "csi0")),		/* PCK */
   643		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 1),
   644			  SUNXI_FUNCTION(0x0, "gpio_in"),
   645			  SUNXI_FUNCTION(0x1, "gpio_out"),
   646			  SUNXI_FUNCTION(0x2, "ts0"),		/* ERR */
   647			  SUNXI_FUNCTION(0x3, "csi0")),		/* CK */
   648		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 2),
   649			  SUNXI_FUNCTION(0x0, "gpio_in"),
   650			  SUNXI_FUNCTION(0x1, "gpio_out"),
   651			  SUNXI_FUNCTION(0x2, "ts0"),		/* SYNC */
   652			  SUNXI_FUNCTION(0x3, "csi0")),		/* HSYNC */
   653		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 3),
   654			  SUNXI_FUNCTION(0x0, "gpio_in"),
   655			  SUNXI_FUNCTION(0x1, "gpio_out"),
   656			  SUNXI_FUNCTION(0x2, "ts0"),		/* DVLD */
   657			  SUNXI_FUNCTION(0x3, "csi0")),		/* VSYNC */
   658		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 4),
   659			  SUNXI_FUNCTION(0x0, "gpio_in"),
   660			  SUNXI_FUNCTION(0x1, "gpio_out"),
   661			  SUNXI_FUNCTION(0x2, "ts0"),		/* D0 */
   662			  SUNXI_FUNCTION(0x3, "csi0")),		/* D0 */
   663		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 5),
   664			  SUNXI_FUNCTION(0x0, "gpio_in"),
   665			  SUNXI_FUNCTION(0x1, "gpio_out"),
   666			  SUNXI_FUNCTION(0x2, "ts0"),		/* D1 */
   667			  SUNXI_FUNCTION(0x3, "csi0"),		/* D1 */
   668			  SUNXI_FUNCTION(0x4, "sim")),		/* VPPEN */
   669		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 6),
   670			  SUNXI_FUNCTION(0x0, "gpio_in"),
   671			  SUNXI_FUNCTION(0x1, "gpio_out"),
   672			  SUNXI_FUNCTION(0x2, "ts0"),		/* D2 */
   673			  SUNXI_FUNCTION(0x3, "csi0")),		/* D2 */
   674		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 7),
   675			  SUNXI_FUNCTION(0x0, "gpio_in"),
   676			  SUNXI_FUNCTION(0x1, "gpio_out"),
   677			  SUNXI_FUNCTION(0x2, "ts0"),		/* D3 */
   678			  SUNXI_FUNCTION(0x3, "csi0")),		/* D3 */
   679		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 8),
   680			  SUNXI_FUNCTION(0x0, "gpio_in"),
   681			  SUNXI_FUNCTION(0x1, "gpio_out"),
   682			  SUNXI_FUNCTION(0x2, "ts0"),		/* D4 */
   683			  SUNXI_FUNCTION(0x3, "csi0")),		/* D4 */
   684		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 9),
   685			  SUNXI_FUNCTION(0x0, "gpio_in"),
   686			  SUNXI_FUNCTION(0x1, "gpio_out"),
   687			  SUNXI_FUNCTION(0x2, "ts0"),		/* D5 */
   688			  SUNXI_FUNCTION(0x3, "csi0")),		/* D5 */
   689		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 10),
   690			  SUNXI_FUNCTION(0x0, "gpio_in"),
   691			  SUNXI_FUNCTION(0x1, "gpio_out"),
   692			  SUNXI_FUNCTION(0x2, "ts0"),		/* D6 */
   693			  SUNXI_FUNCTION(0x3, "csi0")),		/* D6 */
   694		SUNXI_PIN(SUNXI_PINCTRL_PIN(E, 11),
   695			  SUNXI_FUNCTION(0x0, "gpio_in"),
   696			  SUNXI_FUNCTION(0x1, "gpio_out"),
   697			  SUNXI_FUNCTION(0x2, "ts0"),		/* D7 */
   698			  SUNXI_FUNCTION(0x3, "csi0")),		/* D7 */
   699		/* Hole */
   700		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 0),
   701			  SUNXI_FUNCTION(0x0, "gpio_in"),
   702			  SUNXI_FUNCTION(0x1, "gpio_out"),
   703			  SUNXI_FUNCTION(0x2, "mmc0"),		/* D1 */
   704			  SUNXI_FUNCTION(0x4, "jtag")),		/* MSI */
   705		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 1),
   706			  SUNXI_FUNCTION(0x0, "gpio_in"),
   707			  SUNXI_FUNCTION(0x1, "gpio_out"),
   708			  SUNXI_FUNCTION(0x2, "mmc0"),		/* D0 */
   709			  SUNXI_FUNCTION(0x4, "jtag")),		/* DI1 */
   710		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 2),
   711			  SUNXI_FUNCTION(0x0, "gpio_in"),
   712			  SUNXI_FUNCTION(0x1, "gpio_out"),
   713			  SUNXI_FUNCTION(0x2, "mmc0"),		/* CLK */
   714			  SUNXI_FUNCTION(0x4, "uart0")),	/* TX */
   715		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 3),
   716			  SUNXI_FUNCTION(0x0, "gpio_in"),
   717			  SUNXI_FUNCTION(0x1, "gpio_out"),
   718			  SUNXI_FUNCTION(0x2, "mmc0"),		/* CMD */
   719			  SUNXI_FUNCTION(0x4, "jtag")),		/* DO1 */
   720		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 4),
   721			  SUNXI_FUNCTION(0x0, "gpio_in"),
   722			  SUNXI_FUNCTION(0x1, "gpio_out"),
   723			  SUNXI_FUNCTION(0x2, "mmc0"),		/* D3 */
   724			  SUNXI_FUNCTION(0x4, "uart0")),	/* RX */
   725		SUNXI_PIN(SUNXI_PINCTRL_PIN(F, 5),
   726			  SUNXI_FUNCTION(0x0, "gpio_in"),
   727			  SUNXI_FUNCTION(0x1, "gpio_out"),
   728			  SUNXI_FUNCTION(0x2, "mmc0"),		/* D2 */
   729			  SUNXI_FUNCTION(0x4, "jtag")),		/* CK1 */
   730		/* Hole */
   731		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 0),
   732			  SUNXI_FUNCTION(0x0, "gpio_in"),
   733			  SUNXI_FUNCTION(0x1, "gpio_out"),
   734			  SUNXI_FUNCTION(0x2, "ts1"),		/* CLK */
   735			  SUNXI_FUNCTION(0x3, "csi1"),		/* PCK */
   736			  SUNXI_FUNCTION(0x4, "mmc1")),		/* CMD */
   737		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 1),
   738			  SUNXI_FUNCTION(0x0, "gpio_in"),
   739			  SUNXI_FUNCTION(0x1, "gpio_out"),
   740			  SUNXI_FUNCTION(0x2, "ts1"),		/* ERR */
   741			  SUNXI_FUNCTION(0x3, "csi1"),		/* CK */
   742			  SUNXI_FUNCTION(0x4, "mmc1")),		/* CLK */
   743		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 2),
   744			  SUNXI_FUNCTION(0x0, "gpio_in"),
   745			  SUNXI_FUNCTION(0x1, "gpio_out"),
   746			  SUNXI_FUNCTION(0x2, "ts1"),		/* SYNC */
   747			  SUNXI_FUNCTION(0x3, "csi1"),		/* HSYNC */
   748			  SUNXI_FUNCTION(0x4, "mmc1")),		/* D0 */
   749		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 3),
   750			  SUNXI_FUNCTION(0x0, "gpio_in"),
   751			  SUNXI_FUNCTION(0x1, "gpio_out"),
   752			  SUNXI_FUNCTION(0x2, "ts1"),		/* DVLD */
   753			  SUNXI_FUNCTION(0x3, "csi1"),		/* VSYNC */
   754			  SUNXI_FUNCTION(0x4, "mmc1")),		/* D1 */
   755		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 4),
   756			  SUNXI_FUNCTION(0x0, "gpio_in"),
   757			  SUNXI_FUNCTION(0x1, "gpio_out"),
   758			  SUNXI_FUNCTION(0x2, "ts1"),		/* D0 */
   759			  SUNXI_FUNCTION(0x3, "csi1"),		/* D0 */
   760			  SUNXI_FUNCTION(0x4, "mmc1"),		/* D2 */
   761			  SUNXI_FUNCTION(0x5, "csi0")),		/* D8 */
   762		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 5),
   763			  SUNXI_FUNCTION(0x0, "gpio_in"),
   764			  SUNXI_FUNCTION(0x1, "gpio_out"),
   765			  SUNXI_FUNCTION(0x2, "ts1"),		/* D1 */
   766			  SUNXI_FUNCTION(0x3, "csi1"),		/* D1 */
   767			  SUNXI_FUNCTION(0x4, "mmc1"),		/* D3 */
   768			  SUNXI_FUNCTION(0x5, "csi0")),		/* D9 */
   769		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 6),
   770			  SUNXI_FUNCTION(0x0, "gpio_in"),
   771			  SUNXI_FUNCTION(0x1, "gpio_out"),
   772			  SUNXI_FUNCTION(0x2, "ts1"),		/* D2 */
   773			  SUNXI_FUNCTION(0x3, "csi1"),		/* D2 */
   774			  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
   775			  SUNXI_FUNCTION(0x5, "csi0")),		/* D10 */
   776		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 7),
   777			  SUNXI_FUNCTION(0x0, "gpio_in"),
   778			  SUNXI_FUNCTION(0x1, "gpio_out"),
   779			  SUNXI_FUNCTION(0x2, "ts1"),		/* D3 */
   780			  SUNXI_FUNCTION(0x3, "csi1"),		/* D3 */
   781			  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
   782			  SUNXI_FUNCTION(0x5, "csi0")),		/* D11 */
   783		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 8),
   784			  SUNXI_FUNCTION(0x0, "gpio_in"),
   785			  SUNXI_FUNCTION(0x1, "gpio_out"),
   786			  SUNXI_FUNCTION(0x2, "ts1"),		/* D4 */
   787			  SUNXI_FUNCTION(0x3, "csi1"),		/* D4 */
   788			  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
   789			  SUNXI_FUNCTION(0x5, "csi0")),		/* D12 */
   790		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 9),
   791			  SUNXI_FUNCTION(0x0, "gpio_in"),
   792			  SUNXI_FUNCTION(0x1, "gpio_out"),
   793			  SUNXI_FUNCTION(0x2, "ts1"),		/* D5 */
   794			  SUNXI_FUNCTION(0x3, "csi1"),		/* D5 */
   795			  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
   796			  SUNXI_FUNCTION(0x5, "csi0"),		/* D13 */
   797			  SUNXI_FUNCTION_VARIANT(0x6, "bist",	/* RESULT0 */
   798						 PINCTRL_SUN8I_R40)),
   799		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 10),
   800			  SUNXI_FUNCTION(0x0, "gpio_in"),
   801			  SUNXI_FUNCTION(0x1, "gpio_out"),
   802			  SUNXI_FUNCTION(0x2, "ts1"),		/* D6 */
   803			  SUNXI_FUNCTION(0x3, "csi1"),		/* D6 */
   804			  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
   805			  SUNXI_FUNCTION(0x5, "csi0"),		/* D14 */
   806			  SUNXI_FUNCTION_VARIANT(0x6, "bist",	/* RESULT1 */
   807						 PINCTRL_SUN8I_R40)),
   808		SUNXI_PIN(SUNXI_PINCTRL_PIN(G, 11),
   809			  SUNXI_FUNCTION(0x0, "gpio_in"),
   810			  SUNXI_FUNCTION(0x1, "gpio_out"),
   811			  SUNXI_FUNCTION(0x2, "ts1"),		/* D7 */
   812			  SUNXI_FUNCTION(0x3, "csi1"),		/* D7 */
   813			  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
   814			  SUNXI_FUNCTION(0x5, "csi0")),		/* D15 */
   815		/* Hole */
   816		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 0),
   817			  SUNXI_FUNCTION(0x0, "gpio_in"),
   818			  SUNXI_FUNCTION(0x1, "gpio_out"),
   819			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D0 */
   820			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAA0 */
   821						 PINCTRL_SUN4I_A10),
   822			  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
   823			  SUNXI_FUNCTION_IRQ(0x6, 0),		/* EINT0 */
   824			  SUNXI_FUNCTION(0x7, "csi1")),		/* D0 */
   825		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
   826			  SUNXI_FUNCTION(0x0, "gpio_in"),
   827			  SUNXI_FUNCTION(0x1, "gpio_out"),
   828			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D1 */
   829			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAA1 */
   830						 PINCTRL_SUN4I_A10),
   831			  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
   832			  SUNXI_FUNCTION_IRQ(0x6, 1),		/* EINT1 */
   833			  SUNXI_FUNCTION(0x7, "csi1")),		/* D1 */
   834		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
   835			  SUNXI_FUNCTION(0x0, "gpio_in"),
   836			  SUNXI_FUNCTION(0x1, "gpio_out"),
   837			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D2 */
   838			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAA2 */
   839						 PINCTRL_SUN4I_A10),
   840			  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
   841			  SUNXI_FUNCTION_IRQ(0x6, 2),		/* EINT2 */
   842			  SUNXI_FUNCTION(0x7, "csi1")),		/* D2 */
   843		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
   844			  SUNXI_FUNCTION(0x0, "gpio_in"),
   845			  SUNXI_FUNCTION(0x1, "gpio_out"),
   846			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D3 */
   847			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAIRQ */
   848						 PINCTRL_SUN4I_A10),
   849			  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
   850			  SUNXI_FUNCTION_IRQ(0x6, 3),		/* EINT3 */
   851			  SUNXI_FUNCTION(0x7, "csi1")),		/* D3 */
   852		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
   853			  SUNXI_FUNCTION(0x0, "gpio_in"),
   854			  SUNXI_FUNCTION(0x1, "gpio_out"),
   855			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D4 */
   856			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD0 */
   857						 PINCTRL_SUN4I_A10),
   858			  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
   859			  SUNXI_FUNCTION_IRQ(0x6, 4),		/* EINT4 */
   860			  SUNXI_FUNCTION(0x7, "csi1")),		/* D4 */
   861		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
   862			  SUNXI_FUNCTION(0x0, "gpio_in"),
   863			  SUNXI_FUNCTION(0x1, "gpio_out"),
   864			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D5 */
   865			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD1 */
   866						 PINCTRL_SUN4I_A10),
   867			  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
   868			  SUNXI_FUNCTION_IRQ(0x6, 5),		/* EINT5 */
   869			  SUNXI_FUNCTION(0x7, "csi1")),		/* D5 */
   870		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
   871			  SUNXI_FUNCTION(0x0, "gpio_in"),
   872			  SUNXI_FUNCTION(0x1, "gpio_out"),
   873			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D6 */
   874			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD2 */
   875						 PINCTRL_SUN4I_A10),
   876			  SUNXI_FUNCTION(0x4, "uart5"),		/* TX */
   877			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* BS */
   878						 PINCTRL_SUN4I_A10 |
   879						 PINCTRL_SUN7I_A20),
   880			  SUNXI_FUNCTION_IRQ(0x6, 6),		/* EINT6 */
   881			  SUNXI_FUNCTION(0x7, "csi1")),		/* D6 */
   882		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
   883			  SUNXI_FUNCTION(0x0, "gpio_in"),
   884			  SUNXI_FUNCTION(0x1, "gpio_out"),
   885			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D7 */
   886			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD3 */
   887						 PINCTRL_SUN4I_A10),
   888			  SUNXI_FUNCTION(0x4, "uart5"),		/* RX */
   889			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* CLK */
   890						 PINCTRL_SUN4I_A10 |
   891						 PINCTRL_SUN7I_A20),
   892			  SUNXI_FUNCTION_IRQ(0x6, 7),		/* EINT7 */
   893			  SUNXI_FUNCTION(0x7, "csi1")),		/* D7 */
   894		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
   895			  SUNXI_FUNCTION(0x0, "gpio_in"),
   896			  SUNXI_FUNCTION(0x1, "gpio_out"),
   897			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D8 */
   898			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD4 */
   899						 PINCTRL_SUN4I_A10),
   900			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXD3 */
   901						 PINCTRL_SUN7I_A20 |
   902						 PINCTRL_SUN8I_R40),
   903			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN0 */
   904			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* D0 */
   905						 PINCTRL_SUN4I_A10 |
   906						 PINCTRL_SUN7I_A20),
   907			  SUNXI_FUNCTION_IRQ(0x6, 8),		/* EINT8 */
   908			  SUNXI_FUNCTION(0x7, "csi1")),		/* D8 */
   909		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 9),
   910			  SUNXI_FUNCTION(0x0, "gpio_in"),
   911			  SUNXI_FUNCTION(0x1, "gpio_out"),
   912			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D9 */
   913			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD5 */
   914						 PINCTRL_SUN4I_A10),
   915			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXD2 */
   916						 PINCTRL_SUN7I_A20 |
   917						 PINCTRL_SUN8I_R40),
   918			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN1 */
   919			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* D1 */
   920						 PINCTRL_SUN4I_A10 |
   921						 PINCTRL_SUN7I_A20),
   922			  SUNXI_FUNCTION_IRQ(0x6, 9),		/* EINT9 */
   923			  SUNXI_FUNCTION(0x7, "csi1")),		/* D9 */
   924		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
   925			  SUNXI_FUNCTION(0x0, "gpio_in"),
   926			  SUNXI_FUNCTION(0x1, "gpio_out"),
   927			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D10 */
   928			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD6 */
   929						 PINCTRL_SUN4I_A10),
   930			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXD1 */
   931						 PINCTRL_SUN7I_A20 |
   932						 PINCTRL_SUN8I_R40),
   933			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN2 */
   934			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* D2 */
   935						 PINCTRL_SUN4I_A10 |
   936						 PINCTRL_SUN7I_A20),
   937			  SUNXI_FUNCTION_IRQ(0x6, 10),		/* EINT10 */
   938			  SUNXI_FUNCTION(0x7, "csi1")),		/* D10 */
   939		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
   940			  SUNXI_FUNCTION(0x0, "gpio_in"),
   941			  SUNXI_FUNCTION(0x1, "gpio_out"),
   942			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D11 */
   943			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD7 */
   944						 PINCTRL_SUN4I_A10),
   945			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXD0 */
   946						 PINCTRL_SUN7I_A20 |
   947						 PINCTRL_SUN8I_R40),
   948			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN3 */
   949			  SUNXI_FUNCTION_VARIANT(0x5, "ms",	/* D3 */
   950						 PINCTRL_SUN4I_A10 |
   951						 PINCTRL_SUN7I_A20),
   952			  SUNXI_FUNCTION_IRQ(0x6, 11),		/* EINT11 */
   953			  SUNXI_FUNCTION(0x7, "csi1")),		/* D11 */
   954		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 12),
   955			  SUNXI_FUNCTION(0x0, "gpio_in"),
   956			  SUNXI_FUNCTION(0x1, "gpio_out"),
   957			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D12 */
   958			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD8 */
   959						 PINCTRL_SUN4I_A10),
   960			  SUNXI_FUNCTION(0x4, "ps2"),		/* SCK1 */
   961			  SUNXI_FUNCTION_IRQ(0x6, 12),		/* EINT12 */
   962			  SUNXI_FUNCTION(0x7, "csi1")),		/* D12 */
   963		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 13),
   964			  SUNXI_FUNCTION(0x0, "gpio_in"),
   965			  SUNXI_FUNCTION(0x1, "gpio_out"),
   966			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D13 */
   967			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD9 */
   968						 PINCTRL_SUN4I_A10),
   969			  SUNXI_FUNCTION(0x4, "ps2"),		/* SDA1 */
   970			  SUNXI_FUNCTION(0x5, "sim"),		/* RST */
   971			  SUNXI_FUNCTION_IRQ(0x6, 13),		/* EINT13 */
   972			  SUNXI_FUNCTION(0x7, "csi1")),		/* D13 */
   973		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
   974			  SUNXI_FUNCTION(0x0, "gpio_in"),
   975			  SUNXI_FUNCTION(0x1, "gpio_out"),
   976			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D14 */
   977			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD10 */
   978						 PINCTRL_SUN4I_A10),
   979			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXD3 */
   980						 PINCTRL_SUN7I_A20 |
   981						 PINCTRL_SUN8I_R40),
   982			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN4 */
   983			  SUNXI_FUNCTION(0x5, "sim"),		/* VPPEN */
   984			  SUNXI_FUNCTION_IRQ(0x6, 14),		/* EINT14 */
   985			  SUNXI_FUNCTION(0x7, "csi1")),		/* D14 */
   986		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
   987			  SUNXI_FUNCTION(0x0, "gpio_in"),
   988			  SUNXI_FUNCTION(0x1, "gpio_out"),
   989			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D15 */
   990			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD11 */
   991						 PINCTRL_SUN4I_A10),
   992			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXD2 */
   993						 PINCTRL_SUN7I_A20 |
   994						 PINCTRL_SUN8I_R40),
   995			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN5 */
   996			  SUNXI_FUNCTION(0x5, "sim"),		/* VPPPP */
   997			  SUNXI_FUNCTION_IRQ(0x6, 15),		/* EINT15 */
   998			  SUNXI_FUNCTION(0x7, "csi1")),		/* D15 */
   999		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
  1000			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1001			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1002			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D16 */
  1003			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD12 */
  1004						 PINCTRL_SUN4I_A10),
  1005			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXD1 */
  1006						 PINCTRL_SUN7I_A20 |
  1007						 PINCTRL_SUN8I_R40),
  1008			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN6 */
  1009			  SUNXI_FUNCTION(0x5, "sim"),		/* DET */
  1010			  SUNXI_FUNCTION_IRQ(0x6, 16),		/* EINT16 */
  1011			  SUNXI_FUNCTION(0x7, "csi1")),		/* D16 */
  1012		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
  1013			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1014			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1015			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D17 */
  1016			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD13 */
  1017						 PINCTRL_SUN4I_A10),
  1018			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXD0 */
  1019						 PINCTRL_SUN7I_A20 |
  1020						 PINCTRL_SUN8I_R40),
  1021			  SUNXI_FUNCTION(0x4, "keypad"),	/* IN7 */
  1022			  SUNXI_FUNCTION(0x5, "sim"),		/* VCCEN */
  1023			  SUNXI_FUNCTION_IRQ(0x6, 17),		/* EINT17 */
  1024			  SUNXI_FUNCTION(0x7, "csi1")),		/* D17 */
  1025		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
  1026			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1027			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1028			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D18 */
  1029			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD14 */
  1030						 PINCTRL_SUN4I_A10),
  1031			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXCK */
  1032						 PINCTRL_SUN7I_A20 |
  1033						 PINCTRL_SUN8I_R40),
  1034			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT0 */
  1035			  SUNXI_FUNCTION(0x5, "sim"),		/* SCK */
  1036			  SUNXI_FUNCTION_IRQ(0x6, 18),		/* EINT18 */
  1037			  SUNXI_FUNCTION(0x7, "csi1")),		/* D18 */
  1038		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
  1039			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1040			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1041			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D19 */
  1042			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAD15 */
  1043						 PINCTRL_SUN4I_A10),
  1044			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXERR */
  1045						 PINCTRL_SUN7I_A20 |
  1046						 PINCTRL_SUN8I_R40),
  1047			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT1 */
  1048			  SUNXI_FUNCTION(0x5, "sim"),		/* SDA */
  1049			  SUNXI_FUNCTION_IRQ(0x6, 19),		/* EINT19 */
  1050			  SUNXI_FUNCTION(0x7, "csi1")),		/* D19 */
  1051		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 20),
  1052			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1053			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1054			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D20 */
  1055			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAOE */
  1056						 PINCTRL_SUN4I_A10),
  1057			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ERXDV */
  1058						 PINCTRL_SUN7I_A20 |
  1059						 PINCTRL_SUN8I_R40),
  1060			  SUNXI_FUNCTION(0x4, "can"),		/* TX */
  1061			  SUNXI_FUNCTION_IRQ(0x6, 20),		/* EINT20 */
  1062			  SUNXI_FUNCTION(0x7, "csi1")),		/* D20 */
  1063		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 21),
  1064			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1065			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1066			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D21 */
  1067			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATADREQ */
  1068						 PINCTRL_SUN4I_A10),
  1069			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* EMDC */
  1070						 PINCTRL_SUN7I_A20 |
  1071						 PINCTRL_SUN8I_R40),
  1072			  SUNXI_FUNCTION(0x4, "can"),		/* RX */
  1073			  SUNXI_FUNCTION_IRQ(0x6, 21),		/* EINT21 */
  1074			  SUNXI_FUNCTION(0x7, "csi1")),		/* D21 */
  1075		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 22),
  1076			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1077			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1078			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D22 */
  1079			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATADACK */
  1080						 PINCTRL_SUN4I_A10),
  1081			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* EMDIO */
  1082						 PINCTRL_SUN7I_A20 |
  1083						 PINCTRL_SUN8I_R40),
  1084			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT2 */
  1085			  SUNXI_FUNCTION(0x5, "mmc1"),		/* CMD */
  1086			  SUNXI_FUNCTION(0x7, "csi1")),		/* D22 */
  1087		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 23),
  1088			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1089			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1090			  SUNXI_FUNCTION(0x2, "lcd1"),		/* D23 */
  1091			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATACS0 */
  1092						 PINCTRL_SUN4I_A10),
  1093			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXEN */
  1094						 PINCTRL_SUN7I_A20 |
  1095						 PINCTRL_SUN8I_R40),
  1096			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT3 */
  1097			  SUNXI_FUNCTION(0x5, "mmc1"),		/* CLK */
  1098			  SUNXI_FUNCTION(0x7, "csi1")),		/* D23 */
  1099		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 24),
  1100			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1101			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1102			  SUNXI_FUNCTION(0x2, "lcd1"),		/* CLK */
  1103			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATACS1 */
  1104						 PINCTRL_SUN4I_A10),
  1105			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXCK */
  1106						 PINCTRL_SUN7I_A20 |
  1107						 PINCTRL_SUN8I_R40),
  1108			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT4 */
  1109			  SUNXI_FUNCTION(0x5, "mmc1"),		/* D0 */
  1110			  SUNXI_FUNCTION(0x7, "csi1")),		/* PCLK */
  1111		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 25),
  1112			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1113			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1114			  SUNXI_FUNCTION(0x2, "lcd1"),		/* DE */
  1115			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAIORDY */
  1116						 PINCTRL_SUN4I_A10),
  1117			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ECRS */
  1118						 PINCTRL_SUN7I_A20 |
  1119						 PINCTRL_SUN8I_R40),
  1120			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT5 */
  1121			  SUNXI_FUNCTION(0x5, "mmc1"),		/* D1 */
  1122			  SUNXI_FUNCTION(0x7, "csi1")),		/* FIELD */
  1123		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 26),
  1124			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1125			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1126			  SUNXI_FUNCTION(0x2, "lcd1"),		/* HSYNC */
  1127			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAIOR */
  1128						 PINCTRL_SUN4I_A10),
  1129			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ECOL */
  1130						 PINCTRL_SUN7I_A20 |
  1131						 PINCTRL_SUN8I_R40),
  1132			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT6 */
  1133			  SUNXI_FUNCTION(0x5, "mmc1"),		/* D2 */
  1134			  SUNXI_FUNCTION(0x7, "csi1")),		/* HSYNC */
  1135		SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 27),
  1136			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1137			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1138			  SUNXI_FUNCTION(0x2, "lcd1"),		/* VSYNC */
  1139			  SUNXI_FUNCTION_VARIANT(0x3, "pata",	/* ATAIOW */
  1140						 PINCTRL_SUN4I_A10),
  1141			  SUNXI_FUNCTION_VARIANT(0x3, "emac",	/* ETXERR */
  1142						 PINCTRL_SUN7I_A20 |
  1143						 PINCTRL_SUN8I_R40),
  1144			  SUNXI_FUNCTION(0x4, "keypad"),	/* OUT7 */
  1145			  SUNXI_FUNCTION(0x5, "mmc1"),		/* D3 */
  1146			  SUNXI_FUNCTION(0x7, "csi1")),		/* VSYNC */
  1147		/* Hole */
  1148		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 0),
  1149			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1150			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1151			  SUNXI_FUNCTION_VARIANT(0x3, "i2c3",	/* SCK */
  1152						 PINCTRL_SUN7I_A20 |
  1153						 PINCTRL_SUN8I_R40)),
  1154		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 1),
  1155			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1156			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1157			  SUNXI_FUNCTION_VARIANT(0x3, "i2c3",	/* SDA */
  1158						 PINCTRL_SUN7I_A20 |
  1159						 PINCTRL_SUN8I_R40)),
  1160		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 2),
  1161			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1162			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1163			  SUNXI_FUNCTION_VARIANT(0x3, "i2c4",	/* SCK */
  1164						 PINCTRL_SUN7I_A20 |
  1165						 PINCTRL_SUN8I_R40)),
  1166		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 3),
  1167			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1168			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1169			  SUNXI_FUNCTION(0x2, "pwm"),		/* PWM1 */
  1170			  SUNXI_FUNCTION_VARIANT(0x3, "i2c3",	/* SDA */
  1171						 PINCTRL_SUN7I_A20 |
  1172						 PINCTRL_SUN8I_R40)),
  1173		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 4),
  1174			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1175			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1176			  SUNXI_FUNCTION(0x2, "mmc3")),		/* CMD */
  1177		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 5),
  1178			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1179			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1180			  SUNXI_FUNCTION(0x2, "mmc3")),		/* CLK */
  1181		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 6),
  1182			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1183			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1184			  SUNXI_FUNCTION(0x2, "mmc3")),		/* D0 */
  1185		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 7),
  1186			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1187			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1188			  SUNXI_FUNCTION(0x2, "mmc3")),		/* D1 */
  1189		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 8),
  1190			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1191			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1192			  SUNXI_FUNCTION(0x2, "mmc3")),		/* D2 */
  1193		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 9),
  1194			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1195			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1196			  SUNXI_FUNCTION(0x2, "mmc3")),		/* D3 */
  1197		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 10),
  1198			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1199			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1200			  SUNXI_FUNCTION(0x2, "spi0"),		/* CS0 */
  1201			  SUNXI_FUNCTION(0x3, "uart5"),		/* TX */
  1202			  SUNXI_FUNCTION_IRQ(0x6, 22)),		/* EINT22 */
  1203		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 11),
  1204			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1205			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1206			  SUNXI_FUNCTION(0x2, "spi0"),		/* CLK */
  1207			  SUNXI_FUNCTION(0x3, "uart5"),		/* RX */
  1208			  SUNXI_FUNCTION_IRQ(0x6, 23)),		/* EINT23 */
  1209		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 12),
  1210			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1211			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1212			  SUNXI_FUNCTION(0x2, "spi0"),		/* MOSI */
  1213			  SUNXI_FUNCTION(0x3, "uart6"),		/* TX */
  1214			  SUNXI_FUNCTION_VARIANT(0x4, "clk_out_a",
  1215						 PINCTRL_SUN7I_A20 |
  1216						 PINCTRL_SUN8I_R40),
  1217			  SUNXI_FUNCTION_IRQ(0x6, 24)),		/* EINT24 */
  1218		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 13),
  1219			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1220			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1221			  SUNXI_FUNCTION(0x2, "spi0"),		/* MISO */
  1222			  SUNXI_FUNCTION(0x3, "uart6"),		/* RX */
  1223			  SUNXI_FUNCTION_VARIANT(0x4, "clk_out_b",
  1224						 PINCTRL_SUN7I_A20 |
  1225						 PINCTRL_SUN8I_R40),
  1226			  SUNXI_FUNCTION_IRQ(0x6, 25)),		/* EINT25 */
  1227		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 14),
  1228			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1229			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1230			  SUNXI_FUNCTION(0x2, "spi0"),		/* CS1 */
  1231			  SUNXI_FUNCTION(0x3, "ps2"),		/* SCK1 */
  1232			  SUNXI_FUNCTION(0x4, "timer4"),	/* TCLKIN0 */
  1233			  SUNXI_FUNCTION_IRQ(0x6, 26)),		/* EINT26 */
  1234		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 15),
  1235			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1236			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1237			  SUNXI_FUNCTION(0x2, "spi1"),		/* CS1 */
  1238			  SUNXI_FUNCTION(0x3, "ps2"),		/* SDA1 */
  1239			  SUNXI_FUNCTION(0x4, "timer5"),	/* TCLKIN1 */
  1240			  SUNXI_FUNCTION_IRQ(0x6, 27)),		/* EINT27 */
  1241		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 16),
  1242			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1243			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1244			  SUNXI_FUNCTION(0x2, "spi1"),		/* CS0 */
  1245			  SUNXI_FUNCTION(0x3, "uart2"),		/* RTS */
  1246			  SUNXI_FUNCTION_IRQ(0x6, 28)),		/* EINT28 */
  1247		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 17),
  1248			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1249			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1250			  SUNXI_FUNCTION(0x2, "spi1"),		/* CLK */
  1251			  SUNXI_FUNCTION(0x3, "uart2"),		/* CTS */
  1252			  SUNXI_FUNCTION_IRQ(0x6, 29)),		/* EINT29 */
  1253		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 18),
  1254			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1255			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1256			  SUNXI_FUNCTION(0x2, "spi1"),		/* MOSI */
  1257			  SUNXI_FUNCTION(0x3, "uart2"),		/* TX */
  1258			  SUNXI_FUNCTION_IRQ(0x6, 30)),		/* EINT30 */
  1259		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 19),
  1260			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1261			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1262			  SUNXI_FUNCTION(0x2, "spi1"),		/* MISO */
  1263			  SUNXI_FUNCTION(0x3, "uart2"),		/* RX */
  1264			  SUNXI_FUNCTION_IRQ(0x6, 31)),		/* EINT31 */
  1265		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 20),
  1266			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1267			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1268			  SUNXI_FUNCTION(0x2, "ps2"),		/* SCK0 */
  1269			  SUNXI_FUNCTION(0x3, "uart7"),		/* TX */
  1270			  SUNXI_FUNCTION_VARIANT(0x4, "hdmi",	/* HSCL */
  1271						 PINCTRL_SUN4I_A10 |
  1272						 PINCTRL_SUN7I_A20),
  1273			  SUNXI_FUNCTION_VARIANT(0x6, "pwm",	/* PWM2 */
  1274						 PINCTRL_SUN8I_R40)),
  1275		SUNXI_PIN(SUNXI_PINCTRL_PIN(I, 21),
  1276			  SUNXI_FUNCTION(0x0, "gpio_in"),
  1277			  SUNXI_FUNCTION(0x1, "gpio_out"),
  1278			  SUNXI_FUNCTION(0x2, "ps2"),		/* SDA0 */
  1279			  SUNXI_FUNCTION(0x3, "uart7"),		/* RX */
  1280			  SUNXI_FUNCTION_VARIANT(0x4, "hdmi",	/* HSDA */
  1281						 PINCTRL_SUN4I_A10 |
  1282						 PINCTRL_SUN7I_A20),
  1283			  SUNXI_FUNCTION_VARIANT(0x6, "pwm",	/* PWM3 */
  1284						 PINCTRL_SUN8I_R40)),
  1285	};
  1286	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--OgqxwSJOaUobr8KG
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
A8UoAjqug9aS0n1zbYyN7nt3l/0fV2Dwn3VfAQA=

--OgqxwSJOaUobr8KG--
