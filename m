From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] pinctrl: imx: Kconfig: PINCTRL_IMX select REGMAP
Date: Mon, 11 Apr 2016 19:17:56 +0800
Message-ID: <20160411111756.GB13735@tiger>
References: <1460313698-23917-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58503 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752636AbcDKLSe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Apr 2016 07:18:34 -0400
Content-Disposition: inline
In-Reply-To: <1460313698-23917-1-git-send-email-akurz@blala.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>

On Sun, Apr 10, 2016 at 08:41:38PM +0200, Alexander Kurz wrote:
> Regmap functionality has been integrated into pinctrl-imx.c with commit
> 8626ada8 which might trigger build failures when regmap is not selected
> otherwise. Hence, make Kconfig aware about this new dependency.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Acked-by: Shawn Guo <shawnguo@kernel.org> 
