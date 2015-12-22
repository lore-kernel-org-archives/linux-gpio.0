From: Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH] pinctrl: mediatek: convert to arch_initcall
Date: Tue, 22 Dec 2015 21:41:28 +0800
Message-ID: <CAGS+omCLEaD34eXLcQZ5q4Jt36d8Ksfg2SzfNNPxkgYrRQu0_g@mail.gmail.com>
References: <1450412497-25872-1-git-send-email-djkurtz@chromium.org>
 <CACRpkdbuL5Kjeqb-zJg9DmoxKzy7vphYgBTG-Ffh2i=UVH97ug@mail.gmail.com> <1450791416.20501.7.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f46.google.com ([209.85.213.46]:33226 "EHLO
	mail-vk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbbLVNlt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Dec 2015 08:41:49 -0500
Received: by mail-vk0-f46.google.com with SMTP id a188so119151503vkc.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Dec 2015 05:41:49 -0800 (PST)
In-Reply-To: <1450791416.20501.7.camel@mtksdaap41>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Fabio Estevam <fabio.estevam@freescale.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, Fabian Frederick <fabf@skynet.be>, Maoguang Meng <maoguang.meng@mediatek.com>, Axel Lin <axel.lin@ingics.com>, Patrice Chotard <patrice.chotard@st.com>, "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

On Tue, Dec 22, 2015 at 9:36 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> On Tue, 2015-12-22 at 11:23 +0100, Linus Walleij wrote:
>> On Fri, Dec 18, 2015 at 5:21 AM, Daniel Kurtz <djkurtz@chromium.org> wrote:
>>
>> > Move pinctrl initialization earlier in boot so that real devices can find
>> > their pctldev without probe deferring.
>> >
>> > Signed-off-by: Daniel Kurtz <djkurtz@chromium.org>
>>
>> I interpret the discussion as I should wait for a new version of this?
>>
>> Or should it be applied?
>
> We'll have another patch to change init orders for pwrap, mt6397 mfd
> core and mt6397 regulator. Before that, the mt6397 pinctrl changes in
> this patch won't work as expect. Apply this now won't cause any problem
> either, unless someone think we should stink to current orders.
>
> So I think we could apply this now:
>
> Acked-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
>
> Joe.C

Joe.C, Linus,

Thanks for the Ack.
I think it is cleaner if I just send a new patch without the mt6397 change.
So, I'll do that in a bit.
