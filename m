From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 1/1] pinctrl: intel: Add Intel Merrifield pin
 controller support
Date: Thu, 23 Jun 2016 13:16:34 +0300
Message-ID: <20160623101634.GM1718@lahna.fi.intel.com>
References: <1466673100-28977-1-git-send-email-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:45444 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751734AbcFWKQp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 23 Jun 2016 06:16:45 -0400
Content-Disposition: inline
In-Reply-To: <1466673100-28977-1-git-send-email-andriy.shevchenko@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Thu, Jun 23, 2016 at 12:11:40PM +0300, Andy Shevchenko wrote:
> This driver adds pinctrl support for Intel Merrifield. The IP block which is
> called Family-Level Interface Shim is a separate entity in SoC. The GPIO driver
> (gpio-intel-mid.c) will be updated accordingly to support pinctrl interface.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

There are few things which I missed from my previous review but
regardless of them,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

> ---

[...]

> +	PINCTRL_PIN(158, "GP137"),
> +	PINCTRL_PIN(159, "GP138"),
> +	PINCTRL_PIN(160, "GP139"),
> +	PINCTRL_PIN(161, "GP140"),
> +	PINCTRL_PIN(162, "GP141"),
> +	PINCTRL_PIN(163, "GP142"),
> +	PINCTRL_PIN(164, "GP16_HDMI_HPD"),
> +	PINCTRL_PIN(165, "GP68_DSI_A_TE"),
> +	PINCTRL_PIN(166, "GP69_DSI_C_TE"),
> +	PINCTRL_PIN(167, "OSC_CLK_CTRL0"),
> +	PINCTRL_PIN(168, "OSC_CLK_CTRL1"),
> +	PINCTRL_PIN(169, "OSC_CLK0"),
> +	PINCTRL_PIN(170, "OSC_CLK1"),
> +	PINCTRL_PIN(171, "OSC_CLK2"),
> +	PINCTRL_PIN(172, "OSC_CLK3"),
> +	PINCTRL_PIN(173, "OSC_CLK4"),
> +	PINCTRL_PIN(174, "RESETOUT#"),

This still has '#'.

> +	PINCTRL_PIN(175, "PMODE"),
> +	PINCTRL_PIN(176, "PRDY"),
> +	PINCTRL_PIN(177, "PREQ"),
> +	PINCTRL_PIN(178, "GP190"),
> +	PINCTRL_PIN(179, "GP191"),

[...]

> +static const char * const mrfld_sdio_groups[] = { "sdio_grp" };
> +static const char * const mrfld_spi5_groups[] = { "spi5_grp" };
> +static const char * const mrfld_uart0_groups[] = { "uart0_grp", };
> +static const char * const mrfld_uart1_groups[] = { "uart1_grp", };
> +static const char * const mrfld_uart2_groups[] = { "uart2_grp", };

These have "," at the end whereas others don't.

> +static const char * const mrfld_pwm0_groups[] = { "pwm0_grp" };
> +static const char * const mrfld_pwm1_groups[] = { "pwm1_grp" };
> +static const char * const mrfld_pwm2_groups[] = { "pwm2_grp" };
> +static const char * const mrfld_pwm3_groups[] = { "pwm3_grp" };

[...]

> +static struct platform_driver mrfld_pinctrl_driver = {
> +	.probe = mrfld_pinctrl_probe,
> +	.driver = {
> +		.name = "merrifield-pinctrl",

I would call it "pinctrl-merrifield" to be consistent with other Intel
pinctrl drivers.

> +	},
> +};
> +
> +static int __init mrfld_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mrfld_pinctrl_driver);
> +}
> +subsys_initcall(mrfld_pinctrl_init);
> +
> +static void __exit mrfld_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&mrfld_pinctrl_driver);
> +}
> +module_exit(mrfld_pinctrl_exit);
> +
> +MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel Merrifield SoC pinctrl driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:merrifield-pinctrl");

Ditto.
