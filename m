From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH -next] pinctrl: mediatek: Fix include directive
Date: Wed, 18 Mar 2015 10:59:10 +0100
Message-ID: <CACRpkdbfqCUPY_vqpif7jtdxy5E9Ei_XWojunJQ3ONpRKe1Lng@mail.gmail.com>
References: <1426089920-24818-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:35236 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755421AbbCRJ7L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 18 Mar 2015 05:59:11 -0400
Received: by obcjt1 with SMTP id jt1so7747157obc.2
        for <linux-gpio@vger.kernel.org>; Wed, 18 Mar 2015 02:59:11 -0700 (PDT)
In-Reply-To: <1426089920-24818-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>

On Wed, Mar 11, 2015 at 5:05 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> Fix the following build failure:
>
> In file included from drivers/pinctrl/mediatek/pinctrl-mt8135.c:24:0:
> drivers/pinctrl/mediatek/pinctrl-mtk-mt8135.h:19:32: fatal error:
>         pinctrl-mtk-common.h: No such file or directory
>
> seen when building arm:multi_v7_defconfig.
>
> Fixes: 94097d89c145 ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Patch applied with Paul's Review tag, sorry for lagging
behind on mail :(

Yours,
Linus Walleij
