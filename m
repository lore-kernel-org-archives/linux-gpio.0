From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/3] irq/irq_sim: add a simple interrupt simulator framework
Date: Mon, 24 Jul 2017 08:54:30 +0200
Message-ID: <CAMRc=Mco8+i+62MotuG66OGmL1hCf0HnPUSZSWgwu4S=0V=qoA@mail.gmail.com>
References: <1500466814-32679-1-git-send-email-brgl@bgdev.pl>
 <1500466814-32679-2-git-send-email-brgl@bgdev.pl> <20170722215900.3d0db97a@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20170722215900.3d0db97a@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

2017-07-22 22:59 GMT+02:00 Jonathan Cameron <jic23@kernel.org>:
>> +
>> +/**
>> + * irq_sim_fire - Enqueue an interrupt.
>> + *
>> + * @sim:        The interrupt simulator object.
>> + * @offset:     Offset of the simulated interrupt which should be fired.
>> + */
>> +void irq_sim_fire(struct irq_sim *sim, unsigned int offset)
>> +{
>> +     if (sim->irqs[offset].enabled) {
>> +             sim->work_ctx.irq = irq_sim_irqnum(sim, offset);
> Is this safe against more than one firing at a time?  Or is it
> the responsibility of the caller to prevent that?
>

Yes, I assumed this should be the responsibility of the caller. Let me
know if there's an important reason to implement separate locking
within this framework. My goal was to keep it simple, hence no
generalized UAPI too - callers should use their own interfaces to
expose this to the user space if needed.

Thanks,
Bartosz
