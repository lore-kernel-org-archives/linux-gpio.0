From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v5 1/3] irqdomain: export of_phandle_args_to_fwspec
Date: Thu, 21 Sep 2017 21:04:22 +0900
Message-ID: <CAK7LNAR6A2mqe42_OROUF0ucwmo-vN2+a3rWK_DSCE518JB=fg@mail.gmail.com>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
 <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com> <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:25443 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751387AbdIUMFI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 21 Sep 2017 08:05:08 -0400
In-Reply-To: <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Linus,

2017-09-21 20:34 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Wed, Sep 13, 2017 at 10:56 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> This helper will be useful for irqchip drivers that need to convert
>> DT binding into IRQ fwspec.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> I'm waiting for the irqchip maintainers to have a look at this.
>
> I can carry it in the GPIO tree, but Thomas often prefers to handle
> me an immutable git branch for infrastructure.
>
> Yours,
> Linus Walleij


I found a problem in 3/3, so I will fix it in v6.

But, I'd like to know if this approach is basically OK or not.


Thanks.



-- 
Best Regards
Masahiro Yamada
