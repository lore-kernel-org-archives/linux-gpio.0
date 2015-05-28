From: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Fix pinctrl register irq fail bug.
Date: Thu, 28 May 2015 09:11:43 +0800
Message-ID: <CAFRkauDrWCme5WDxsEW-HSGrNmJRVftVBP6qPLq3Lux-09BHbA@mail.gmail.com>
References: <1432719835-18939-1-git-send-email-hongzhou.yang@mediatek.com>
	<1432719835-18939-3-git-send-email-hongzhou.yang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f169.google.com ([209.85.217.169]:33082 "EHLO
	mail-lb0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751395AbbE1BLp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 27 May 2015 21:11:45 -0400
Received: by lbcue7 with SMTP id ue7so18504560lbc.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2015 18:11:44 -0700 (PDT)
In-Reply-To: <1432719835-18939-3-git-send-email-hongzhou.yang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, Sascha Hauer <kernel@pengutronix.de>, eddie.huang@mediatek.com, dandan.he@mediatek.com

2015-05-27 17:43 GMT+08:00 Hongzhou Yang <hongzhou.yang@mediatek.com>:
> Since mt6397 is no need to support interrupt controller,
> I judged "interrupt-controller" property to skip it last patch.
> But the if judgement should on the contrary, this is a bug.
>
> And find of_property_read_bool is better for this case.
> So using of_property_read_bool instead of of_find_property.
>
> Also fix bug of misuse pointer.
>
> Signed-off-by: Hongzhou Yang <hongzhou.yang@mediatek.com>
Reviewed-by: Axel Lin <axel.lin@ingics.com>
