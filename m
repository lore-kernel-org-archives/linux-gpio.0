From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: add input-enable and direction
 setting for eint resources
Date: Fri, 19 Feb 2016 00:31:03 +0100
Message-ID: <CACRpkdYeyAejh5Dtw7SKb7o790PcQgnz4tWpT+79hQ2_H6Lj5Q@mail.gmail.com>
References: <1455650194-9813-1-git-send-email-biao.huang@mediatek.com>
	<1455650194-9813-3-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:34546 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946440AbcBRXbE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 18 Feb 2016 18:31:04 -0500
Received: by mail-ob0-f177.google.com with SMTP id kf7so8816035obb.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Feb 2016 15:31:03 -0800 (PST)
In-Reply-To: <1455650194-9813-3-git-send-email-biao.huang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Biao Huang <biao.huang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>

On Tue, Feb 16, 2016 at 8:16 PM, Biao Huang <biao.huang@mediatek.com> wrote:

> To use pin as eint, user should make sure that:
> 1. pin is set to right mode, this is done in .irq_request_resources
> implementation already.
> 2. direction of the pin is input, which should call GPIO API to set
> pin to input gpio.
> We add what step 2 do to .irq_request_resources so that user doesn't
> need call GPIO API any more when pin for eint usage.
>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Patch applied.

Yours,
Linus Walleij
