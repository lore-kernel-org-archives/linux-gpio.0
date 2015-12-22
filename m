From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Tue, 22 Dec 2015 16:11:47 +0100
Message-ID: <CACRpkdbRDzXunYK5d6Ld4Z2a=0mkp4KBvgL2P-St4P65Jajamw@mail.gmail.com>
References: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:35570 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752061AbbLVPLs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 10:11:48 -0500
Received: by mail-oi0-f54.google.com with SMTP id l9so80899636oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 07:11:48 -0800 (PST)
In-Reply-To: <1450792017-7120-1-git-send-email-djkurtz@chromium.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Fabio Estevam <fabio.estevam@freescale.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

On Tue, Dec 22, 2015 at 2:46 PM, Daniel Kurtz <djkurtz@chromium.org> wrote:

> Move pinctrl initialization earlier in boot so that real devices can find
> their pctldev without probe deferring.
(...)
> -module_init(mtk_pinctrl_init);
> +arch_initcall(mtk_pinctrl_init);

So I see why you're doing this (because of wanting to avoid nasty boot
probe deferrals, right?) and I'm going to apply it, because the work
with probe ordering is still in the works, but I'd like some general
ARM people to come in with opinions.

Yours,
Linus Walleij
