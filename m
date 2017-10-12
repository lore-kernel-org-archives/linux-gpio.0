From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Add hierarchical irq_domain for i2c based gpio expander pca9505
Date: Thu, 12 Oct 2017 10:59:27 +0200
Message-ID: <CACRpkdbcG03w0RHKhj0ws6+vbf0kiEPPLOF8OP+KJ-Jr6XZnNw@mail.gmail.com>
References: <CAKUFe6aHg6CUwhorpXYvRjEO0BeMWw0nV-xjwG6F+ZvbHSMSRQ@mail.gmail.com>
 <CAKUFe6Yeq+4s-28FTP2cJ8SQJj-Yoq5-Ewie8noy0Yoti0TbbQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKUFe6Yeq+4s-28FTP2cJ8SQJj-Yoq5-Ewie8noy0Yoti0TbbQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Shah <abhishek.shah@broadcom.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Takahiro Akashi <takahiro.akashi@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Oct 12, 2017 at 7:10 AM, Abhishek Shah
<abhishek.shah@broadcom.com> wrote:

>> I am facing one issue, where; while disabling/ masking interrupts just
>> before kexec reboot, access to gpio expander pca9505 residing over
>> i2c bus hangs, because i2c interrupts are disabled prior to writing
>> pca9505 register.

This dependency between IRQ controllers on slow buses
(I2C, SPI, 1W etc) and the IRQ controller above it is annoying.
We face the same issue with runtime power management.

I think Marc Z and Ulf Hansson may have input on this.
We surely need a strict procedure for how to take IRQ
chips up/down. We know how to take them up, but the procedure
for taking them down (and potentially up again) is a bit so-so.

>> In our chip, we have 3 irq_domain, namely gicv3, bcm-iproc-gpio [GPIO
>> controller with ~150 pins] and pca953x [40-pin IO expander pca9505].
>>
>> bcm-iproc-gpio and i2c interrupts among the other interrupts  are
>> registered to gicv3 and
>> pca953x interrupts are registered to bcm-iproc-gpio.
>>
>> So, interrupt from pca953x gets routed like...
>> pca953x-> bcm-iproc-gpio-> gicv3

I see, this is a pretty straight-forward cascaded interrupt controller.

>> Now, I see that, got GPIO controllers, an independent IRQ domain is
>> added using gpiochip_irqchip_add_nested
>> or gpiochip_irqchip_add, which makes use of irq_domain_add_simple like this:
>> gpiochip->irqdomain = irq_domain_add_simple(of_node,
>>                                         gpiochip->ngpio, first_irq,
>>                                         &gpiochip_domain_ops, gpiochip);

This looks fine.

>> Is it possible to add hierarchical irq_domain for pca953x to be child
>> of bcm-iproc-gpio and bcm-iproc-gpio irq_domain  to be child of gicv3
>> using irq_domain_add_hierarchy instead of current  irq_domain_add_simple API??

This is not what hierarchical IRQ domains are for.

Documentation and naming is a problem here. We really
should work on this. Marc's talk from last years ELCE is
very helpful:
https://elinux.org/images/8/8c/Zyngier.pdf
Also on YouTube:
https://www.youtube.com/watch?v=YE8cRHVIM4E

In short: hierarchic IRQ domains are for interrupt delivery
paths, not for sequencing taking irqchips up/down.

>> Would that make sure that first all interrupts of child irq_domain
>> gets disabled?

No.

>> Do you think adding "irq_domain_add_hierarchy" for GPIO controllers
>> can solve this problem?

No.

>> or do you suggest change in the way "machine_kexec_mask_interrupts" is
>> implemented?

What you need to do is analyze the call graph and figure out
the right way to order things.

There are irqchips that power up/down using syscore ops,
such as drivers/irqchip/irq-mtk-cirq.c
see
commit 9dbbbd33aafaf1f95b1cce940bdf4331cd8b822e
"irqchip: Add Mediatek mtk-cirq driver"

Yours,
Linus Walleij
