From: Jonas Gorski <jogo@openwrt.org>
Subject: Re: [RFC 09/18] gpio: add driver for Atheros AR5312 SoC GPIO controller
Date: Mon, 29 Sep 2014 11:24:18 +0200
Message-ID: <CAOiHx==oJX_4qEigoQ4PwMYqUEek86fAY+ZYue7KWSk-Dc9HFw@mail.gmail.com>
References: <1410723213-22440-1-git-send-email-ryazanov.s.a@gmail.com>
 <1410723213-22440-10-git-send-email-ryazanov.s.a@gmail.com> <CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:36284 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750970AbaI2JYu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 29 Sep 2014 05:24:50 -0400
Received: from localhost (localhost [127.0.0.1])
	by arrakis.dune.hu (Postfix) with ESMTP id C947C28BF2D
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 11:24:03 +0200 (CEST)
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com [209.85.216.45])
	by arrakis.dune.hu (Postfix) with ESMTPSA id 8CA7D28AD3E
	for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 11:23:57 +0200 (CEST)
Received: by mail-qa0-f45.google.com with SMTP id w8so918170qac.32
        for <linux-gpio@vger.kernel.org>; Mon, 29 Sep 2014 02:24:39 -0700 (PDT)
In-Reply-To: <CACRpkda3Cq+d47DMm018nAC7ThcHAOv-tOqEbNsUY1mOSnKyoA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Linux MIPS <linux-mips@linux-mips.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Sep 29, 2014 at 11:18 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Sun, Sep 14, 2014 at 9:33 PM, Sergey Ryazanov <ryazanov.s.a@gmail.com> wrote:
>
>> Atheros AR5312 SoC have a builtin GPIO controller, which could be
>> accessed via memory mapped registers. This patch adds new driver
>> for them.
>>
>> Signed-off-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Alexandre Courbot <gnurou@gmail.com>
>> Cc: linux-gpio@vger.kernel.org
> (...)
>> -       /* Attempt to jump to the mips reset location - the boot loader
>> -        * itself might be able to recover the system */
>> +       /* Cold reset does not work on the AR2315/6, use the GPIO reset bits
>> +        * a workaround. Give it some time to attempt a gpio based hardware
>> +        * reset (atheros reference design workaround) */
>> +       gpio_request_one(AR2315_RESET_GPIO, GPIOF_OUT_INIT_LOW, "Reset");
>> +       mdelay(100);
>
> Please try to use the new GPIO descriptor API.
> See Documentation/gpio/consumer.txt
>
> (...)
>> +++ b/drivers/gpio/gpio-ar2315.c
>
>> +static u32 ar2315_gpio_intmask;
>> +static u32 ar2315_gpio_intval;
>> +static unsigned ar2315_gpio_irq_base;
>> +static void __iomem *ar2315_mem;
>
> Get rid of these local variables and put them into an allocated
> state container, see
> Documentation/driver-model/design-patterns.txt
>
> Get rid of _gpio_irq_base altogether. (See comments below.)
>
> (...)
>> +static inline u32 ar2315_gpio_reg_read(unsigned reg)
>> +{
>> +       return __raw_readl(ar2315_mem + reg);
>> +}
>
> Use readl_relaxed()

ar2315/ar5312 is big endian, so readl_relaxed would mess up the byte
order. There does not seem to be a big endian equivalent for _relaxed.


Regards
Jonas
