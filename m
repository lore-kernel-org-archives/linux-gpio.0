From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: mediatek: correct debounce time unit in mtk_gpio_set_debounce
Date: Fri, 15 Apr 2016 10:29:04 +0200
Message-ID: <CACRpkdZT0xMDwwnQRvC1Q76yvBGoJnU1w_rSP8XcmKRnCQpnKg@mail.gmail.com>
References: <1459580269-64531-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:36822 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753000AbcDOI3F (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Apr 2016 04:29:05 -0400
Received: by mail-oi0-f46.google.com with SMTP id y204so117682909oie.3
        for <linux-gpio@vger.kernel.org>; Fri, 15 Apr 2016 01:29:05 -0700 (PDT)
In-Reply-To: <1459580269-64531-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, Daniel Kurtz <djkurtz@chromium.org>

On Sat, Apr 2, 2016 at 8:57 AM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:

> The debounce time unit for gpio_chip.set_debounce is us but
> mtk_gpio_set_debounce regard it as ms.
> Fix this by correct debounce time array dbnc_arr so it can find correct
> debounce setting. Debounce time for first debounce setting is 500us,
> correct this as well.
>
> While I'm at it, also change the debounce time array name to
> "debounce_time" for readability.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
> This was based on v4.6-rc1
> Change since v1:
> - Improve commit message.
> - Change dbnc_arr name to debounce_time

Patch applied to fixes and tagged for stable.

Yours,
Linus Walleij
