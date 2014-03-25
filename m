From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 7/7] gpio: dwapb: use d->mask instead od BIT(bit)
Date: Tue, 25 Mar 2014 08:54:58 +0100
Message-ID: <53313652.5010306@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de> <1395505004-22650-8-git-send-email-bigeasy@linutronix.de> <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFu+WQCpo=LEZqdAhpMcO1PLqUzfcVKTafnwe=BiLGLjFZQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: atull@altera.com, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dinguyen@altera.com, delicious.quinoa@gmail.com
List-Id: linux-gpio@vger.kernel.org

On 03/25/2014 03:17 AM, Alexandre Courbot wrote:
>> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
>> index 3c9cdda..ebfcf5c 100644
>> --- a/drivers/gpio/gpio-dwapb.c
>> +++ b/drivers/gpio/gpio-dwapb.c
>> @@ -126,7 +126,7 @@ static void dwapb_irq_disable(struct irq_data *d)
>>
>>         irq_gc_lock(igc);
>>         val = readl(gpio->regs + GPIO_INTEN);
>> -       val &= ~BIT(d->hwirq);
>> +       val &= d->mask;
> 
> Shouldn't that be ~d->mask here?

Yes, indeed. Thanks for catching this.

Sebastian
