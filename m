From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [RFC PATCH 0/3] New Atmel PIO4 pinctrl/gpio driver
Date: Wed, 5 Aug 2015 09:31:17 +0200
Message-ID: <20150805073117.GP5161@pengutronix.de>
References: <1438355290-28255-1-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:42034 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752051AbbHEHbU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 5 Aug 2015 03:31:20 -0400
Content-Disposition: inline
In-Reply-To: <1438355290-28255-1-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com

On Fri, Jul 31, 2015 at 05:08:07PM +0200, Ludovic Desroches wrote:
> Hi,
> 
> Following our discussion, I send an RFC version of my driver. RFC because it is
> not totally achieved, some cleanup and feature addition is needed.
> 
> At least, we could discuss about the 'core' part. I have used the pinmux
> property as Mediatek driver. Patch 3 is the internal dt files we are using.

As you can imagine I am fine with the binding, so I can add my acked-by
once you send a non-RFC version.

The only thing I never understood is what's so special about GPIOs that
they have to bypass the pinctrl framework and instead a gpio_request
magically translates a gpio into a pin. Wouldn't it make sense to at
least add the pins in their GPIO mode to
arch/arm/boot/dts/sama5d2-pinfunc.h?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
