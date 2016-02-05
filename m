From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add gpio_request_enable support
Date: Fri, 5 Feb 2016 14:58:28 +0100
Message-ID: <CACRpkdZPTOPfsqx34yr9-bSyg4-N_dR+beqAXjJc1NjK2xh4Jw@mail.gmail.com>
References: <1454462686-770-1-git-send-email-biao.huang@mediatek.com>
	<1454462686-770-3-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:34729 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753029AbcBEN62 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2016 08:58:28 -0500
Received: by mail-ob0-f172.google.com with SMTP id wb13so90235761obb.1
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2016 05:58:28 -0800 (PST)
In-Reply-To: <1454462686-770-3-git-send-email-biao.huang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>, John Crispin <blogic@openwrt.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Wed, Feb 3, 2016 at 2:24 AM, Biao Huang <biao.huang@mediatek.com> wrote:

> Implement the .gpio_request_enable() callbacks in struct pinmux_ops
> in mediatek pinctrl driver. Make sure that when gpio_request is called,
> GPIO on the pin is enabled.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Patch applied to my devel-mt2701 branch.

Yours,
Linus Walleij
