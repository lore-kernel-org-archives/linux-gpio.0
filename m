From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] pinctrl: imx: Kconfig: PINCTRL_IMX select REGMAP
Date: Mon, 11 Apr 2016 09:34:10 +0200
Message-ID: <1460360050.4020.16.camel@pengutronix.de>
References: <1460313698-23917-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:58457 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751026AbcDKHeN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Apr 2016 03:34:13 -0400
In-Reply-To: <1460313698-23917-1-git-send-email-akurz@blala.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>

Hi Alexander,

Am Sonntag, den 10.04.2016, 20:41 +0200 schrieb Alexander Kurz:
> Regmap functionality has been integrated into pinctrl-imx.c with commit
> 8626ada8 which might trigger build failures when regmap is not selected
> otherwise. Hence, make Kconfig aware about this new dependency.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

thanks
Philipp

