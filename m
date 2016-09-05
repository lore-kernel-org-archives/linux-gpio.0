From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 0/3] gpio/pinctrl: imx: let IOMUX controller know about
 on-SoC GPIOs
Date: Mon, 5 Sep 2016 10:12:01 +0800
Message-ID: <20160905021201.GC25778@tiger>
References: <1471644615-10320-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <cc5ab313-c3c6-bfd4-d2b8-92a7d153cf05@mentor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:51600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754597AbcIECM1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 4 Sep 2016 22:12:27 -0400
Content-Disposition: inline
In-Reply-To: <cc5ab313-c3c6-bfd4-d2b8-92a7d153cf05@mentor.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, Deepak Das <deepak_das@mentor.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Sep 02, 2016 at 04:11:46PM +0300, Vladimir Zapolskiy wrote:
> Hi Shawn, Fabio,
> 
> On 08/20/2016 01:10 AM, Vladimir Zapolskiy wrote:
> >The change establishes a connection between on-SoC IOMUX controller(s)
> >and GPIO controllers found on some SoC from Freescale/NXP iMX series,
> >if a GPIO controller device node contains common gpio-ranges information.
> >
> >The change is backward compatible with respect to potentially not updated
> >outdated DTB data without gpio-ranges propery, for such boards the only
> >functional change is lowered initcall priority of GPIO controller driver,
> >which in general anyway is exected to be used only after pinctrl/pinmux
> >controller.
> >
> >If this change is applied the next interesting applications may be done
> >as a follow-up work, for example switching pad function to GPIO on gpiod
> >request, converting iomux controller driver to strict type and so on.
> >
> >For actual values of gpio-ranges properties please reference series
> >"ARM: dts: imx: add gpio-ranges properties to some iMX GPIO controllers"
> >http://archive.arm.linux.org.uk/lurker/message/20160819.220621.86d845d1.en.html
> >
> >Deepak Das (1):
> >  gpio: mxc: lower level of gpio_mxc_init() initcall
> >
> >Vladimir Zapolskiy (2):
> >  pinctrl: imx: accept gpio request/free from pinctrl
> >  gpio: mxc: add generic gpio request/free callbacks to pinctrl
> >
> > drivers/gpio/gpio-mxc.c                 | 7 ++++++-
> > drivers/pinctrl/freescale/pinctrl-imx.c | 4 ++--
> > 2 files changed, 8 insertions(+), 3 deletions(-)
> >
> 
> no comments so far, please could you express your concerns about
> this change? IMHO it would be nice to have this feature enabled
> in v4.9.
> 
> I assume that the most worrisome commit is the change of GPIO controller
> driver init level, but I belive it is safe enough, no?

If I understand it correctly, with the change, most of GPIO client
device drivers use the same init level as GPIO driver.  So we are not
sure if GPIO driver is ready when client drivers try to request GPIO.
It shouldn't be a problem if every client driver handle the failure
with deferred probing, but I'm not sure that's the case now.

Shawn
