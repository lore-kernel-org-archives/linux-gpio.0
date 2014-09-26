From: Shawn Guo <shawn.guo@freescale.com>
Subject: Re: [PATCH v3 0/5] vf610: Add GPIO support
Date: Fri, 26 Sep 2014 09:16:36 +0800
Message-ID: <20140926011635.GB21077@dragon>
References: <cover.1411662961.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1on0116.outbound.protection.outlook.com ([157.56.110.116]:41952
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752384AbaIZBRI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 25 Sep 2014 21:17:08 -0400
Content-Disposition: inline
In-Reply-To: <cover.1411662961.git.stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, kernel@pengutronix.de, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bpringlemeir@nbsps.com, l.stach@pengutronix.de

On Thu, Sep 25, 2014 at 06:37:04PM +0200, Stefan Agner wrote:
> Stefan Agner (5):
>   pinctrl: imx: detect uninitialized pins
>   pinctrl: imx: add gpio pinmux support for vf610
>   gpio: vf610: add gpiolib/IRQ chip driver for Vybrid
>   ARM: dts: vf610: use new GPIO support
>   Documentation: dts: add bindings for Vybrid GPIO/PORT module

For patch #1, #2, #3 and #5:

Acked-by: Shawn Guo <shawn.guo@freescale.com>
