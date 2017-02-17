From: Phil Reid <preid@electromag.com.au>
Subject: Re: [PATCH 1/1] gpio: altera: Use handle_level_irq when configured as
 a level_high
Date: Fri, 17 Feb 2017 19:32:52 +0800
Message-ID: <bf217d37-69f6-6808-2cc4-8c3a9e1de9bb@electromag.com.au>
References: <1487322752-31896-1-git-send-email-preid@electromag.com.au>
 <CAHp75VdK2sL1WyjfcRzQZ4Q+i5mnbcsYA4jPJhx=-g-e03KOog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:48266 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932674AbdBQLc5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Feb 2017 06:32:57 -0500
In-Reply-To: <CAHp75VdK2sL1WyjfcRzQZ4Q+i5mnbcsYA4jPJhx=-g-e03KOog@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: thloh@altera.com, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 17/02/2017 17:23, Andy Shevchenko wrote:
> On Fri, Feb 17, 2017 at 11:12 AM, Phil Reid <preid@electromag.com.au> wrote:
>> When a threaded irq handler is chained attached to one of the gpio
>> pins when configure for level irq the altera_gpio_irq_leveL_high_handler
>> does not mask the interrupt while being handled by the chained irq.
>> This resulting in the threaded irq not getting enough cycles to complete
>> quickly enough before the irq was disabled as faulty.
>> It looks like handle_level_irq should be used in this situation
>> instead of handle_simple_irq.
>
>> @@ -310,7 +310,8 @@ static int altera_gpio_probe(struct platform_device *pdev)
>>         altera_gc->interrupt_trigger = reg;
>>
>>         ret = gpiochip_irqchip_add(&altera_gc->mmchip.gc, &altera_irq_chip, 0,
>> -               handle_simple_irq, IRQ_TYPE_NONE);
>> +               altera_gc->interrupt_trigger == IRQ_TYPE_LEVEL_HIGH ?
>> +               handle_level_irq : handle_simple_irq, IRQ_TYPE_NONE);
>
> AFAIK, handle_bad_irq() should be used here.
>
G'day Andy

Grepping drivers/gpio find a combination of
handle_simple_irq
handle_level_irq
handle_edge_irq
handle_bad_irq
used in gpiochip_irqchip_add

The ones which use handle_bad_irq call irq_set_handler_locked in their
irq_type callback to either handle_level_irq / handle_edge_irq

So I think in this case it's correct. But I'm no expert.

-- 
Regards
Phil Reid


