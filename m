From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix direction control issue
Date: Fri, 5 Feb 2016 14:56:07 +0100
Message-ID: <CACRpkdY5e-1mTOzPVUvPEJyxLBVxZRQw6Gqui1pAno96_RWq8g@mail.gmail.com>
References: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
	<1454462686-770-2-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34518 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029AbcBEN4I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2016 08:56:08 -0500
Received: by mail-oi0-f47.google.com with SMTP id w5so41114890oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2016 05:56:07 -0800 (PST)
In-Reply-To: <1454462686-770-2-git-send-email-biao.huang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Wed, Feb 3, 2016 at 2:24 AM, Biao Huang <biao.huang@mediatek.com> wrote:

> Since input-enable/disable and input-schmitt-enable/disable are
> workable when gpio direction is input, so add direction setting
> when do input-enable/disable and input-schmitt-enable/disable
> properties.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

This patch applied for fixes. I see now that it was part of the
mt2701 patch set, so sorry for missing it...

Yours,
Linus Walleij
