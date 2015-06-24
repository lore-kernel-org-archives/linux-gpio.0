From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 7/9] arm: twr-k70f120m: IOMUX driver for Kinetis SoC
Date: Wed, 24 Jun 2015 12:21:22 +0200
Message-ID: <1435141282.4528.71.camel@tiscali.nl>
References: <1435094387-20146-1-git-send-email-pawelo@king.net.pl>
	 <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lb3-smtp-cloud3.xs4all.net ([194.109.24.30]:42186 "EHLO
	lb3-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750847AbbFXKVg (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Wed, 24 Jun 2015 06:21:36 -0400
In-Reply-To: <1435094387-20146-8-git-send-email-pawelo@king.net.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Osmialowski <pawelo@king.net.pl>, Andrew Morton <akpm@linux-foundation.org>, Anson Huang <b20788@freescale.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Bhupesh Sharma <bhupesh.sharma@freescale.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Frank Li <Frank.Li@freescale.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Haojian Zhuang <haojian.zhuang@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jingchang Lu <jingchang.lu@freescale.com>, Jiri Slaby <jslaby@suse.cz>, Kees Cook <keescook@chromium.org>, Kumar Gala <galak@codeaurora.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm+renesas@opensource.se>, Michael Turquette <mturquette@baylibre.com>, Nathan
Cc: Yuri Tikhonov <yur@emcraft.com>, Sergei Poselenov <sposelenov@emcraft.com>, Dmitry Cherkassov <d_cherkasov@emcraft.com>, Alexander Potashev <aspotashev@emcraft.com>

On Tue, 2015-06-23 at 23:19 +0200, Paul Osmialowski wrote:
> --- a/drivers/pinctrl/freescale/Kconfig
> +++ b/drivers/pinctrl/freescale/Kconfig
 
> +config PINCTRL_KINETIS
> +	bool "Kinetis pinctrl driver"
> +	depends on OF
> +	depends on SOC_K70
> +	select PINMUX
> +	help
> +	  Say Y here to enable the Kinetis pinctrl driver

> --- a/drivers/pinctrl/freescale/Makefile
> +++ b/drivers/pinctrl/freescale/Makefile

> +obj-$(CONFIG_PINCTRL_KINETIS)	+= pinctrl-kinetis.o

> --- /dev/null
> +++ b/drivers/pinctrl/freescale/pinctrl-kinetis.c

> +#include <linux/module.h>

> +static struct pinctrl_desc kinetis_pinctrl_desc = {
> +	[...]
> +	.owner = THIS_MODULE,
> +};

> +static void __exit kinetis_pinctrl_exit(void)
> +{
> +	platform_driver_unregister(&kinetis_pinctrl_driver);
> +}
> +module_exit(kinetis_pinctrl_exit);
> +
> +MODULE_DESCRIPTION("Freescale Kinetis pinctrl driver");
> +MODULE_LICENSE("GPL v2");

pinctrl-kinetis.o can only be built-in, right? But the code uses a few
module specific constructs. Did you mean to make PINCTRL_KINETIS
tristate instead?

Thanks,


Paul Bolle
