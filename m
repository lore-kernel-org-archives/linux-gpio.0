From: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 0/5] New Atmel PIO4 pinctrl/gpio driver
Date: Tue, 15 Sep 2015 10:57:03 +0200
Message-ID: <20150915085703.GA4018@pengutronix.de>
References: <1439281685-3020-1-git-send-email-ludovic.desroches@atmel.com>
 <20150907131210.GC32379@odux.rfo.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:40409 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751823AbbIOI5G (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2015 04:57:06 -0400
Content-Disposition: inline
In-Reply-To: <20150907131210.GC32379@odux.rfo.atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, nicolas.ferre@atmel.com, alexandre.belloni@free-electrons.com

Hi Ludovic,

On Mon, Sep 07, 2015 at 03:12:10PM +0200, Ludovic Desroches wrote:
> Hi Sascha,
> 
> Any comments about this version? Maybe you missed it since you answered
> me on the RFC version. Of course I'll do the changes you requested for
> the next version (remove gpio_request_*() stuff and add macros for gpio
> muxing case).

The binding looks good to me. I wonder where the pinmux defines have
gone, they were part of the last series but not of this one.

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
