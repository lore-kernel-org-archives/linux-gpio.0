From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: imx: attach iomuxc device to gpr syscon
Date: Sun, 28 Feb 2016 10:25:55 +0800
Message-ID: <20160228022555.GA22051@tiger>
References: <1456420987-9883-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:33545 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S2992732AbcB1C0O (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 27 Feb 2016 21:26:14 -0500
Content-Disposition: inline
In-Reply-To: <1456420987-9883-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Stefan Agner <stefan@agner.ch>, Anson Huang <b20788@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>, Frank Li <Frank.Li@freescale.com>, linux-gpio@vger.kernel.org, kernel@pengutronix.de

On Thu, Feb 25, 2016 at 06:23:07PM +0100, Philipp Zabel wrote:
> Commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from platform
> devices") added the possibility to register syscon devices without
> associated platform device. This also removed regmap debugfs facilities,
> which don't work without a device. This patch associates the syscon regmap
> that handles the IOMUX controller's general purpose registers with the
> pinctrl device so that the GPR registers appear in the regmap debugfs
> directory again. For example, on i.MX6Q the GPR registers now can be
> read from /sys/kernel/debug/regmap/20e0000.iomuxc-gpr/registers.
> 
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Acked-by: Shawn Guo <shawnguo@kernel.org>
