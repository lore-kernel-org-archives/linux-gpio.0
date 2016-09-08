From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 0/3] gpio/pinctrl: imx: let IOMUX controller know
 about on-SoC GPIOs
Date: Thu, 8 Sep 2016 10:28:01 +0800
Message-ID: <20160908022800.GB2533@x250>
References: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752547AbcIHC2W (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Sep 2016 22:28:22 -0400
Content-Disposition: inline
In-Reply-To: <1473299296-22458-1-git-send-email-vladimir_zapolskiy@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, Deepak Das <deepak_das@mentor.com>, linux-arm-kernel@lists.infradead.org

On Thu, Sep 08, 2016 at 04:48:13AM +0300, Vladimir Zapolskiy wrote:
> The change establishes a connection between on-SoC IOMUX controller(s)
> and GPIO controllers found on some SoC from Freescale/NXP iMX series,
> if a GPIO controller device node contains common gpio-ranges information.
> 
> The change is backward compatible with respect to potentially not updated
> outdated DTB data without gpio-ranges propery, for such boards the only
> functional change is lowered initcall priority of GPIO controller driver,
> which in general anyway is exected to be used only after pinctrl/pinmux
> controller.
> 
> If this change is applied the next interesting applications may be done
> as a follow-up work, for example switching pad function to GPIO on gpiod
> request, converting iomux controller driver to strict type and so on.
> 
> For actual values of gpio-ranges properties please reference series
> "ARM: dts: imx: add gpio-ranges properties to some iMX GPIO controllers"
> http://www.spinics.net/lists/arm-kernel/msg525258.html
> 
> Changes from v1 to v2:
> * replaced 2/3 by an own change providing a better commit description
>   and which moves gpio_mxc_init() call to subsys_initcall() instead of
>   apparently too late device_initcall(), this mitigates Shawn's
>   expressed concern about the change.

Yes, this is more conservative and stands less chance to cause regression.

> 
> Vladimir Zapolskiy (3):
>   pinctrl: imx: accept gpio request/free from pinctrl
>   gpio: mxc: shift gpio_mxc_init() to subsys_initcall level
>   gpio: mxc: add generic gpio request/free callbacks to pinctrl

For the series,

Acked-by: Shawn Guo <shawnguo@kernel.org>
