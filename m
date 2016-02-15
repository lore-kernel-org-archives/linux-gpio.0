From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: fix handling return value of mtk_pmx_find_gpio_mode
Date: Tue, 16 Feb 2016 00:31:05 +0100
Message-ID: <CACRpkda5oCmPLpgwM5r4nr4QFMSgXwb0JzFmpiaQotgO4KhLmg@mail.gmail.com>
References: <1455201248-4988-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36691 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572AbcBOXbF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 18:31:05 -0500
Received: by mail-ob0-f180.google.com with SMTP id gc3so132637060obb.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2016 15:31:05 -0800 (PST)
In-Reply-To: <1455201248-4988-1-git-send-email-a.hajda@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Biao Huang <biao.huang@mediatek.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

On Thu, Feb 11, 2016 at 3:34 PM, Andrzej Hajda <a.hajda@samsung.com> wrote:

> The function can return negative values, so its result should
> be assigned to signed variable.
>
> The problem has been detected using coccinelle semantic patch
> scripts/coccinelle/tests/assign_signed_to_unsigned.cocci.
>
> Fixes: 59ee9c9 ('pinctrl: mediatek: Add gpio_request_enable support')
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Patch applied with Hongzhou's ACK.

Yours,
Linus Walleij
