From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: update document for pinconf_generic_parse_dt_config
Date: Tue, 1 Dec 2015 11:12:16 +0100
Message-ID: <CACRpkdZ_9EOA2PVcPQgoM2UHor5jdtsGBSzomYEn0hOJEF=g1w@mail.gmail.com>
References: <1448453603-38980-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:33396 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754713AbbLAKMR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Dec 2015 05:12:17 -0500
Received: by obbww6 with SMTP id ww6so964602obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Dec 2015 02:12:17 -0800 (PST)
In-Reply-To: <1448453603-38980-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ludovic Desroches <ludovic.desroches@atmel.com>

On Wed, Nov 25, 2015 at 1:13 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:

> The returned configs from pinconf_generic_parse_dt_config() is
> duplicated from original. Make it clear it must be freed when no
> longer necessary.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

Patch applied.

> It seems memleak in pinctrl-mtk-common.c[1] is not alone. After a quick
> glance I notice similar issues in drivers/pinctrl/pinctrl-at91-pio4.c and
> drivers/pinctrl/nomadik/pinctrl-abx500.c.

Patches fixing them are coming? ;)

Yours,
Linus Walleij
