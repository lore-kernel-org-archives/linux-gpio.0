From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: omap2: fix missing include
Date: Fri, 23 Sep 2016 16:20:50 +0200
Message-ID: <CACRpkdZwV59KxK9mbDqaX68G2O=c88rFKx3Rpn5n9kgvdhUobg@mail.gmail.com>
References: <1474634412-7050-1-git-send-email-linus.walleij@linaro.org> <20160923141313.y7xp2yyv74nk2v3a@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34882 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754016AbcIWOUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Sep 2016 10:20:52 -0400
Received: by mail-oi0-f47.google.com with SMTP id w11so135867208oia.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Sep 2016 07:20:51 -0700 (PDT)
In-Reply-To: <20160923141313.y7xp2yyv74nk2v3a@atomide.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, Sep 23, 2016 at 4:13 PM, Tony Lindgren <tony@atomide.com> wrote:
> * Linus Walleij <linus.walleij@linaro.org> [160923 05:40]:
>> commit d47529b2e9fe
>> "gpio: don't include module.h in shared driver header"
>> removed <linux/module.h> from the <linux/gpio/driver.h> header.
>>
>> It seems arch/arm/mach-omap2/board-rx51-peripherals.c
>> is using __initdata_or_module from <linux/module.h> through
>> <linux/gpio.h> to <linux/gpio/driver.h>, so break this dependency
>> so that we get a clean compile.
>>
>> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
>> Cc: Tony Lindgren <tony@atomide.com>
>> Fixes: d47529b2e9fe ("gpio: don't include module.h in shared driver header")
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Tony: please ACK this if it's OK so I can merge it in front of
>> the offending patch.
>
> This file is gone in Linux next but if you need it:
>
> Acked-by: Tony Lindgren <tony@atomide.com>
>
> Sorry the removal got postponed from v4.8 to v4.9. Note that
> it will produce a trivial merge conflict.

OK thanks.

Yours,
Linus Walleij
