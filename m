From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 5/5] arm: dts: Add pinctrl/GPIO/EINT node for mt2701
Date: Thu, 7 Jan 2016 11:14:05 +0100
Message-ID: <CACRpkdbc-tNaeMzzX2riwUFPp0-XjVfvjuM6knWzVVwP89ECdA@mail.gmail.com>
References: <1451286546-5920-1-git-send-email-biao.huang@mediatek.com>
	<1451286546-5920-6-git-send-email-biao.huang@mediatek.com>
	<5685104D.7070008@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:35884 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403AbcAGKOH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jan 2016 05:14:07 -0500
Received: by mail-oi0-f46.google.com with SMTP id o62so305103160oif.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jan 2016 02:14:06 -0800 (PST)
In-Reply-To: <5685104D.7070008@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Biao Huang <biao.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Erin Lo <erin.lo@mediatek.com>

On Thu, Dec 31, 2015 at 12:23 PM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> On 28/12/15 08:09, Biao Huang wrote:
>>
>> Add pinctrl and GPIO node to mt2701.dtsi
>>
>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
>> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>>   arch/arm/boot/dts/mt2701.dtsi |   19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>
> Linus, will you take this patch through your branch?

No I prefer anything in arch/arm/boot/dts/* to go in through
the ARM SoC tree.

It can usually be merged orthogonally anyways.

I take Documenation/devicetree/bindings/* and patches
to the driver itself in drivers/pinctrl/*

Yours,
Linus Walleij
