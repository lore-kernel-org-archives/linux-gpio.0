From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH v5 1/3] irqdomain: export of_phandle_args_to_fwspec
Date: Wed, 27 Sep 2017 11:42:54 +0900
Message-ID: <CAK7LNATTfmheWvOUrwbEbuOsx=TKFJB1+XxZcKKQtYyPjgkO_g@mail.gmail.com>
References: <1505292990-22957-1-git-send-email-yamada.masahiro@socionext.com>
 <1505292990-22957-2-git-send-email-yamada.masahiro@socionext.com>
 <CACRpkdb_4xMvN=5TH=UNiHhKC7X-C4g+t2JoiR992Y12Q-818w@mail.gmail.com> <alpine.DEB.2.20.1709251211050.15252@nanos>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:22671 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934771AbdI0Cny (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Sep 2017 22:43:54 -0400
In-Reply-To: <alpine.DEB.2.20.1709251211050.15252@nanos>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh@kernel.org>, David Daney <david.daney@cavium.com>, Masami Hiramatsu <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-09-25 19:11 GMT+09:00 Thomas Gleixner <tglx@linutronix.de>:
> On Thu, 21 Sep 2017, Linus Walleij wrote:
>
>> On Wed, Sep 13, 2017 at 10:56 AM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>
>> > This helper will be useful for irqchip drivers that need to convert
>> > DT binding into IRQ fwspec.
>> >
>> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>
>> I'm waiting for the irqchip maintainers to have a look at this.
>>
>> I can carry it in the GPIO tree, but Thomas often prefers to handle
>> me an immutable git branch for infrastructure.
>
> I don't think we have colliding stuff coming up, so please carry it in your
> tree with Acked-by-me.
>
> Thanks,
>
>         tglx
> --


Please hold it back now.

I have sent v6,
which is self-contained in the GPIO subsystem.

I will wait for Linus to check v6.


-- 
Best Regards
Masahiro Yamada
