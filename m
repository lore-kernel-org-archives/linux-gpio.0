From: Abhishek Shah <abhishek.shah@broadcom.com>
Subject: Add hierarchical irq_domain for i2c based gpio expander pca9505
Date: Wed, 11 Oct 2017 17:50:03 +0530
Message-ID: <CAKUFe6aHg6CUwhorpXYvRjEO0BeMWw0nV-xjwG6F+ZvbHSMSRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, takahiro.akashi@linaro.org
Cc: linux-gpio@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, Sandeep Tripathy <sandeep.tripathy@broadcom.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

I am facing one issue, where; while disabling/ masking interrupts just
before kexec reboot, access to gpio expander pca9505 residing over
i2c bus hangs, because i2c interrupts are disabled prior to writing
pca9505 register.

In our chip, we have 3 irq_domain, namely gicv3, bcm-iproc-gpio [GPIO
controller with ~150 pins] and pca953x [40-pin IO expander pca9505].

bcm-iproc-gpio and i2c interrupts among the other interrupts  are
registered to gicv3 and
pca953x interrupts are registered to bcm-iproc-gpio.

So, interrupt from pca953x gets routed like...
pca953x-> bcm-iproc-gpio-> gicv3

Now, I see that, got GPIO controllers, an independent IRQ domain is
added using gpiochip_irqchip_add_nested
or gpiochip_irqchip_add, which makes use of irq_domain_add_simple like this:
gpiochip->irqdomain = irq_domain_add_simple(of_node,
                                        gpiochip->ngpio, first_irq,
                                        &gpiochip_domain_ops, gpiochip);

Is it possible to add hierarchical irq_domain for pca953x to be child
of bcm-iproc-gpio and bcm-iproc-gpio irq_domain  to be child of gicv3
using irq_domain_add_hierarchy instead of current  irq_domain_add_simple API??

Would that make sure that first all interrupts of child irq_domain
gets disabled?


Now, this is where I am facing issue during kexec_reboot:

static void machine_kexec_mask_interrupts(void)                  /*
function is present in arch/arm64/kernel/machine_kexec.c file */
{
        unsigned int i;
        struct irq_desc *desc;

        for_each_irq_desc(i, desc) {
                struct irq_chip *chip;
                int ret;

                chip = irq_desc_get_chip(desc);
                if (!chip)
                        continue;

                /*
                 * First try to remove the active state. If this
                 * fails, try to EOI the interrupt.
                 */
                ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE,
false);   /* access to PCA9505 register hangs here and kexec reboot
fails! */

                if (ret && irqd_irq_inprogress(&desc->irq_data) &&
                    chip->irq_eoi)
                        chip->irq_eoi(&desc->irq_data);

                if (chip->irq_mask)
                        chip->irq_mask(&desc->irq_data);

                if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
                        chip->irq_disable(&desc->irq_data);
        }
}

In my case, when this loop runs, initially it masks all GICv3
interrupts,i.e. i2c interrupts are also disabled.
Now when irq_set_irqchip_state gets executed in process of masking
pca9505 interrupts, .irq_bus_sync_unlock
callback (pca953x_irq_bus_sync_unlock) hangs because i2c interrupts are masked.

Do you think adding "irq_domain_add_hierarchy" for GPIO controllers
can solve this problem?
or do you suggest change in the way "machine_kexec_mask_interrupts" is
implemented?


Regards,
Abhishek
