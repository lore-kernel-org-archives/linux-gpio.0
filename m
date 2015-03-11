From: Paul Walmsley <paul@pwsan.com>
Subject: Re: [PATCH -next] pinctrl: mediatek: Fix include directive
Date: Wed, 11 Mar 2015 19:16:33 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1503111915570.22939@utopia.booyaka.com>
References: <1426089920-24818-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from utopia.booyaka.com ([74.50.51.50]:54837 "EHLO
	utopia.booyaka.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724AbbCKTQf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Mar 2015 15:16:35 -0400
In-Reply-To: <1426089920-24818-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

On Wed, 11 Mar 2015, Guenter Roeck wrote:

> Fix the following build failure:
> 
> In file included from drivers/pinctrl/mediatek/pinctrl-mt8135.c:24:0:
> drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h:19:32: fatal error:
> 	pinctrl-mtk-common.h: No such file or directory
> 
> seen when building arm:multi_v7_defconfig.
> 
> Fixes: 94097d89c145 ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

This fixes the next-20150311 build here.

Reviewed-by: Paul Walmsley <paul@pwsan.com>


- Paul
