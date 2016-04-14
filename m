From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: imx: Kconfig: PINCTRL_IMX select REGMAP
Date: Thu, 14 Apr 2016 14:19:31 +0200
Message-ID: <CACRpkdYCmVZMePTQ1LwJWGs-bVZRT9U1LD2uGc9A=j+jkbXn8w@mail.gmail.com>
References: <1460313698-23917-1-git-send-email-akurz@blala.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36705 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932119AbcDNMTc (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2016 08:19:32 -0400
Received: by mail-oi0-f54.google.com with SMTP id y204so91302707oie.3
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2016 05:19:32 -0700 (PDT)
In-Reply-To: <1460313698-23917-1-git-send-email-akurz@blala.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Kurz <akurz@blala.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawnguo@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>

On Sun, Apr 10, 2016 at 8:41 PM, Alexander Kurz <akurz@blala.de> wrote:

> Regmap functionality has been integrated into pinctrl-imx.c with commit
> 8626ada8 which might trigger build failures when regmap is not selected
> otherwise. Hence, make Kconfig aware about this new dependency.
>
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Patch applied for fixes with the ACKs.

Yours,
Linus Walleij
