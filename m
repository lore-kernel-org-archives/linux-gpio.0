From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: attach iomuxc device to gpr syscon
Date: Tue, 8 Mar 2016 15:54:59 +0700
Message-ID: <CACRpkdZPLO9FCoCdU6a-a55-HQCopaGu1yhGvrFrkd2hAdvewQ@mail.gmail.com>
References: <1456420987-9883-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:33632 "EHLO
	mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753525AbcCHIzB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 03:55:01 -0500
Received: by mail-oi0-f43.google.com with SMTP id d205so6045103oia.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 00:55:00 -0800 (PST)
In-Reply-To: <1456420987-9883-1-git-send-email-p.zabel@pengutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Adrian Alonso <aalonso@freescale.com>, Robin Gong <b38343@freescale.com>, Stefan Agner <stefan@agner.ch>, Anson Huang <b20788@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>, Frank Li <Frank.Li@freescale.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sascha Hauer <kernel@pengutronix.de>

On Fri, Feb 26, 2016 at 12:23 AM, Philipp Zabel <p.zabel@pengutronix.de> wrote:

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

Patch applied with Shawn's ACK.

Yours,
Linus Walleij
