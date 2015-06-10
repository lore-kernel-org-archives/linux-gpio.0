From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH] gpio: pcf857x: handle only enabled irqs
Date: Thu, 11 Jun 2015 00:03:03 +0300
Message-ID: <5578A607.9030602@ti.com>
References: <1433359988-3456-1-git-send-email-grygorii.strashko@ti.com> <CACRpkdaRb6FruKiYQg0g4ZO8cRnT5FSj==gkDb9GTvnnc=FTvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaRb6FruKiYQg0g4ZO8cRnT5FSj==gkDb9GTvnnc=FTvg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Sekhar Nori <nsekhar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

On 06/10/2015 10:39 AM, Linus Walleij wrote:
> On Wed, Jun 3, 2015 at 9:33 PM, Grygorii Strashko
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
>>   21fd3cd1874a ('gpio: pcf857x: call the gpio user handler iff...')
>>
>> and then it was removed by commit
>>   a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip...')
>>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Fixes: a39294bdf4b0 ('gpio: pcf857x: Switch to use gpiolib irqchip helpers')
>> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
>
> This patch does not apply on the "devel" branch in my GPIO
> tree, please rebase it. I do not run a "fixes" branch this
> late in the kernel cycle.

Sure. Done.

-- 
regards,
-grygorii
