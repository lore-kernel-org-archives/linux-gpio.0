From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH v3] pinctrl: mediatek: Fix multiple registration issue.
Date: Fri, 21 Aug 2015 13:08:24 +0800
Message-ID: <CAFRkauDR_XuMrihptQu1=Oq4nzOqcmne89LwsOHPzQrWCQQgMA@mail.gmail.com>
References: <1440132404-27749-1-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f53.google.com ([209.85.215.53]:36485 "EHLO
	mail-la0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751737AbbHUFIZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Aug 2015 01:08:25 -0400
Received: by lagz9 with SMTP id z9so34716142lag.3
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 22:08:24 -0700 (PDT)
In-Reply-To: <1440132404-27749-1-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, Maoguang Meng <maoguang.meng@mediatek.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Chaotian Jing <chaotian.jing@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, biao.huang@mediatek.com

2015-08-21 12:46 GMT+08:00 Hongzhou Yang <hongzhou.yang@mediatek.com>:
> Since our common driver need support main chip and PMU
> at the same time, that means it will register two
> pinctrl device, and the pinctrl_desc structure should
> be used two times.
>
> But pinctrl_desc use global static definition, then
> the latest registered pinctrl device will overwrite
> the old one's, all members in pinctrl_desc will set to
> the new one's, such as name, pins and pins numbers, etc.
> This is a bug. Changing to use devm_kzalloc to fix it.
>
> Cc: stable@vger.kernel.org # v4.1+
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
> ---
>  Use dynamic allocation to fix multiple registration issue.

The code looks good to me but the commit log needs fix.
You don't use devm_kzalloc now.
Just embedded struct pinctrl_desc pctl_desc to struct mtk_pinctrl.

Reviewed-by: Axel Lin <axel.lin@ingics.com>
