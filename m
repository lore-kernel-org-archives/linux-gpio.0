From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: mxs: atomically switch mux and drive strength
 config
Date: Sun, 21 May 2017 16:46:12 +0800
Message-ID: <20170521084611.GI26102@dragon>
References: <20170518092355.6735-1-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751198AbdEUIqu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 21 May 2017 04:46:50 -0400
Content-Disposition: inline
In-Reply-To: <20170518092355.6735-1-u.kleine-koenig@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de, linux-gpio@vger.kernel.org

On Thu, May 18, 2017 at 11:23:55AM +0200, Uwe Kleine-König wrote:
> To set the mux mode of a pin two bits must be set. Up to now this is
> implemented using the following idiom:
> 
> 	writel(mask, reg + CLR);
> 	writel(value, reg + SET);
> 
> . This however results in the mux mode being 0 between the two writes.
> 
> On my machine there is an IC's reset pin connected to LCD_D20. The
> bootloader configures this pin as GPIO output-high (i.e. not holding the
> IC in reset). When Linux reconfigures the pin to GPIO the short time
> LCD_D20 is muxed as LCD_D20 instead of GPIO_1_20 is enough to confuse
> the connected IC.
> 
> The same problem is present for the pin's drive strength setting which is
> reset to low drive strength before using the right value.
> 
> So instead of relying on the hardware to modify the register setting
> using two writes implement the bit toggling using read-modify-write.
> 
> Fixes: 17723111e64f ("pinctrl: add pinctrl-mxs support")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Shawn Guo <shawnguo@kernel.org>
