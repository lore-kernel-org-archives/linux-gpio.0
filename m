From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RESEND PATCH] pinctrl: mt8173: set GPIO16 to usb iddig mode
Date: Fri, 2 Dec 2016 13:40:46 +0100
Message-ID: <CACRpkdbUebNHcHyQ+Pi_yfyLBB021HznPfoUv2SU0uh1_3RocA@mail.gmail.com>
References: <1480472491-4644-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:34866 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751786AbcLBMkr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Dec 2016 07:40:47 -0500
Received: by mail-qk0-f169.google.com with SMTP id n204so277190119qke.2
        for <linux-gpio@vger.kernel.org>; Fri, 02 Dec 2016 04:40:47 -0800 (PST)
In-Reply-To: <1480472491-4644-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Wed, Nov 30, 2016 at 3:21 AM, Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> the default mode of GPIO16 pin is gpio, when set EINT16 to
> IRQ_TYPE_LEVEL_HIGH, no interrupt is triggered, it can be
> fixed when set its default mode as usb iddig.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Patch applied with Hongzhou's ACK!

Yours,
Linus Walleij
