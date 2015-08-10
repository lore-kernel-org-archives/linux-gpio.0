From: Ludovic Desroches <ludovic.desroches@atmel.com>
Subject: Re: [RFC PATCH 0/3] New Atmel PIO4 pinctrl/gpio driver
Date: Mon, 10 Aug 2015 08:53:34 +0200
Message-ID: <20150810065334.GC2635@odux.rfo.atmel.com>
References: <1438355290-28255-1-git-send-email-ludovic.desroches@atmel.com>
 <20150805073117.GP5161@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:35614 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752613AbbHJGxy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Aug 2015 02:53:54 -0400
Content-Disposition: inline
In-Reply-To: <20150805073117.GP5161@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com

Hi Sascha,

On Wed, Aug 05, 2015 at 09:31:17AM +0200, Sascha Hauer wrote:
> On Fri, Jul 31, 2015 at 05:08:07PM +0200, Ludovic Desroches wrote:
> > Hi,
> > 
> > Following our discussion, I send an RFC version of my driver. RFC because it is
> > not totally achieved, some cleanup and feature addition is needed.
> > 
> > At least, we could discuss about the 'core' part. I have used the pinmux
> > property as Mediatek driver. Patch 3 is the internal dt files we are using.
> 
> As you can imagine I am fine with the binding, so I can add my acked-by
> once you send a non-RFC version.
>

Great, I'm glad to hear that.
 
> The only thing I never understood is what's so special about GPIOs that
> they have to bypass the pinctrl framework and instead a gpio_request
> magically translates a gpio into a pin.

Not sure to really understand your concern here... Do you mean I could
get rid of gpio_request_enable()?

> Wouldn't it make sense to at
> least add the pins in their GPIO mode to
> arch/arm/boot/dts/sama5d2-pinfunc.h?

It is done, PIN_PA0 could be used for this purpose.

Regards

Ludovic
