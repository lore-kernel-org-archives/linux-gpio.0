From: Gerlando Falauto <gerlando.falauto@gmail.com>
Subject: debugging irq threaded handler not getting called
Date: Thu, 7 Feb 2019 21:24:00 +0100
Message-ID: <CABMprFit_4dv7FjjOUfFPSZgoL8AMM594qwi1SyB+x6iTcJpEg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi,

I'm having a hard time debugging a custom SPI device with multiple
interrupt GPIO pins, connected to a Samsung Artik 710 SoC module.

The device is a microcontroller acting as an SPI-CAN bridge (emulating
the hi3110, so SPI slave device) for two separate can busses.
[The idea was to make it emulate two separate hi3110 devices, each
with its own interrupt pin, and tweak the hi311x.c driver].
So I have 2 instances of the same device in the device tree, each with
its own GPIO as interrupt source:

    can0: can@0 {
      /*.... */
        interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
    }

    can1: can@1 {
      /*.... */
        interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
    }

Interrupts are requested as threaded and one-shot, on HIGH level:

    unsigned long flags = IRQF_ONESHOT | IRQF_TRIGGER_HIGH;
    ret = request_threaded_irq(spi->irq, NULL, hi3110_can_ist,
                   flags, DEVICE_NAME, priv);


The threaded IRQ handler essentially does its job and always returns
IRQ_HANDLED:

    static irqreturn_t hi3110_can_ist(int irq, void *dev_id) {

      /* Does its business */
      return IRQ_HANDLED;
    }

I understand having a level trigger with ONESHOT should just re-enable
the interrupt at the end of the threaded handler.
Two interrupts could occur at mostly the same time, and this approach
seems to handle concurrency correctly with their locks.
The SPI bus is shared, but transactions look just fine.

What happens is that under moderately heavy load (100+100 irq/s),
after some minutes one of the two interrupts is not served anymore.
On a logic analyzer, the interrupt pin stays high forever with no
interaction with the SPI bus.
What's weird is that it's always the second instance to expose this
behavior. The first instance keeps working just fine, serving its
interrupts nicely.

I traced execution of the threaded handler on the analyzer, driving a
GPIO high/low at the very start/end of the handler.
You can see it go high right after the interrupt goes high, and go low
afterwards.
So the handler code always returns, and IRQ_HANDLED is the only
possible return value.

When this issue happens, the interrupt pin goes high but the driven
GPIO stays low -- this means the threaded handler never gets called.
I assume there's nothing more I should do other than just returning
IRQ_HANDLED to get the interrupt to get re-enabled, but I suspect
this doesn't really happen for some reason.

I also tried swapping the two interrupt lines, but again it's always
the second instance to get disabled, even though it's now on a
different pin.

Any suggestion on how I can dynamically inspect whether (and WHY?) the
interrupt was left disabled?
I saw some interesting entries in sysfs to inspect irq status
(https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-kernel-irq)
but I'm running a custom 4.4 kernel so that's unfortunately not available.
Any idea would be highly appreciated!

Thank you,
Gerlando
