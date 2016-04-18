From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: imx: select regmap subsystem
Date: Mon, 18 Apr 2016 09:44:32 +0800
Message-ID: <20160418014432.GQ28903@tiger>
References: <1460838382-1245338-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:48292 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751363AbcDRBpL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 17 Apr 2016 21:45:11 -0400
Content-Disposition: inline
In-Reply-To: <1460838382-1245338-1-git-send-email-arnd@arndb.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@freescale.com>, Anson Huang <b20788@freescale.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 16, 2016 at 10:26:06PM +0200, Arnd Bergmann wrote:
> Building the imx pinctrl driver without regmap fails with multiple
> build errors like:
> 
> drivers/pinctrl/freescale/pinctrl-imx.c: In function 'imx_pinctrl_probe':
> drivers/pinctrl/freescale/pinctrl-imx.c:723:9: error: variable 'config' has initializer but incomplete type
>   struct regmap_config config = { .name = "gpr" };
> 
> This adds a 'select REGMAP' statement, to ensure we can define a 'struct
> regmap_config'. This matches what all other regmap users do. The driver
> actually uses syscon on top of regmap, but syscon is already enabled
> on i.MX for other reasons, and selecting REGMAP but not SYSCON is
> sufficient for build testing on other platforms.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 8626ada871f1 ("pinctrl: imx: attach iomuxc device to gpr syscon")

LinusW already applied a similar patch [1] from Alexander a few days
ago.

Shawn

[1] http://thread.gmane.org/gmane.linux.kernel.gpio/16054
