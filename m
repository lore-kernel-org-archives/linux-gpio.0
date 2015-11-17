From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: mediatek: Add get_direction support.
Date: Tue, 17 Nov 2015 14:58:10 +0100
Message-ID: <CACRpkdZw_cM2G5OtqpA_GOYL61Pzz0Qkx1H-Pzmi2u1TmHiBsQ@mail.gmail.com>
References: <1447462164-34639-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35211 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752624AbbKQN6L (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2015 08:58:11 -0500
Received: by oige206 with SMTP id e206so5015256oig.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2015 05:58:11 -0800 (PST)
In-Reply-To: <1447462164-34639-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Colin Ian King <colin.king@canonical.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com

On Sat, Nov 14, 2015 at 1:49 AM, Hongzhou Yang
<hongzhou.yang@mediatek.com> wrote:

> Since Linux gpio framework return 0 for output, 1 for input.
> But HW use 0 stands for input, and 1 stands for output.
> So use negative to correct it.
>
> And gpio_chip.get is used to get input value, no need to get
> output value, so removing it.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  Add get direction support.
>  Remove gpio_chip.get value for output direction.

This patch does not apply. Please rebase on v4.4-rc1
and resend.

Yours,
Linus Walleij
