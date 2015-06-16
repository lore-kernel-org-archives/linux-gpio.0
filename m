From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] gpio: pcf857x: handle only enabled irqs
Date: Tue, 16 Jun 2015 11:06:30 +0200
Message-ID: <CAMuHMdVq9akqnAR+f=zTA2GwP008HFzKzSL6KSxmF=8hyf6Kfw@mail.gmail.com>
References: <1433970069-30235-1-git-send-email-grygorii.strashko@ti.com>
	<CACRpkdZdivhsJcYrxYpr+rizcj9ZVGcxr5f1PD5DjxvZSScu8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZdivhsJcYrxYpr+rizcj9ZVGcxr5f1PD5DjxvZSScu8Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jun 16, 2015 at 10:58 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> <grygorii.strashko@ti.com> wrote:
>
>> Now pcf857x_irq() IRQ's dispatcher will try to run nested
>> IRQ handlers for each GPIO pin which state has changed.
>> Such IRQs are, actually, spurious and nested IRQ handlers
>> have to be called only for IRQs wich were enabled by users.
>> This is not critical issue - just  /proc/interrupts
>> will display counters for unused IRQS:
>> 399:          4          0   pcf857x   0 Edge
>> 428:          1          0   pcf857x  13 Edge
>> 430:          1          0   pcf857x  15 Edge
>>
>> Hence, fix it by adding irq_enabled field in struct pcf857x to track
>> enabled GPIO IRQs and corresponding callbacks in pcf857x_irq_chip.
>>
>> Similar functionality was presented in pcf857x driver, commit
>> 21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...')
>>
>> and then it was removed by commit
>>  a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip...')
>>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Fixes: a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip helpers')
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>> ---
>>
>> No functional changes.
>> It's just rebased on top of "devel" branch
>> git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
>
> Patch applied since no comments arrived.

Sorry for the late reply, still recovering from travel backlog.

I gave it a quick try on sh73a0/kzm9g. No visible impact, gpio keys and
wake-up from s2ram still work.

Note that this board didn't seem to be affected by the issue that was fixed by
21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...').

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
