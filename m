From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 09/50] pinctrl: imx: Use devm_pinctrl_register() for
 pinctrl registration
Date: Thu, 25 Feb 2016 15:47:18 +0100
Message-ID: <1456411638.3268.14.camel@pengutronix.de>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	 <1456319775-3216-10-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-10-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org, Adrian Alonso <aalonso@freescale.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-gpio@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, linux-mediatek@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Am Mittwoch, den 24.02.2016, 18:45 +0530 schrieb Laxman Dewangan:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Adrian Alonso <aalonso@freescale.com>
> Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
[...]

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

