From: Leonard Crestez <cdleonard@gmail.com>
Subject: Interrupt storm from pinctrl-amd on Acer AN515-42
Date: Fri, 28 Dec 2018 01:02:19 +0200
Message-ID: <4085fc648ff5086bd6e6237d74d2a11e945a617b.camel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Nehal Shah <Nehal-bakulchandra.Shah@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Daniel Drake <drake@endlessm.com>, Nitesh Kumar Agrawal <Nitesh-kumar.Agrawal@amd.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

My Acer Nitro 5 AN515-42 laptop with a Ryzen 2700U hangs on boot with 
recent kernel on an interrupt storm from pinctrl-amd.

Older kernels work but this seems to be because this module was disabled 
by default. I tried to copy over old driver from 4.9 but it still 
experiences same issue.

Digging a little deeper it seems the touchpad interrupt is active on 
boot and since it's configured as "level" and no touchpad driver is 
available yet there does not seem to be any way to clear it.

I don't know how this should be handled, booting with an active enabled but 
unclearable interrupt seems like a platform bug to me. There is even an 
option to set touchpad to "basic" which does some sort of ps2 emulation 
but the IRQ issue still happens!

One workaround is to explicitly disable the interrupt from the handler 
if no mapping is found; this will keep it disabled until 
amd_gpio_irq_set_type is called later.

--- drivers/pinctrl/pinctrl-amd.c
+++ drivers/pinctrl/pinctrl-amd.c
@@ -567,22 +567,27 @@ static irqreturn_t amd_gpio_irq_handler(int irq, void *dev_id)
                        regval = readl(regs + i);
                        if (!(regval & PIN_IRQ_PENDING) ||
                            !(regval & BIT(INTERRUPT_MASK_OFF)))
                                continue;
                        irq = irq_find_mapping(gc->irq.domain, irqnr + i);
-                       generic_handle_irq(irq);
+                       if (irq) {
+                               generic_handle_irq(irq);
+                               ret = IRQ_HANDLED;
+                       }
 
                        /* Clear interrupt.
                         * We must read the pin register again, in case the
                         * value was changed while executing
                         * generic_handle_irq() above.
                         */
                        raw_spin_lock_irqsave(&gpio_dev->lock, flags);
                        regval = readl(regs + i);
+                       /* Disable if pending but unmapped */
+                       if (!irq && (regval & PIN_IRQ_PENDING))
+                               regval &= ~BIT(INTERRUPT_ENABLE_OFF);
                        writel(regval, regs + i);
                        raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
-                       ret = IRQ_HANDLED;
                }
        }
 
        /* Signal EOI to the GPIO unit */


When in "i2c mode" the touchpad has an ACPI hid "ELAN0504", there are
many similar compatibe hids in elan_i2c driver and if I add this one it
probes successfully and handles irqs but fails to report input (i2c 
read data is invalid).

Same laptop experiences some severe p-state throttling issues so there
are many things wrong here. Let me know if you want more version info
or ACPI dumps.

--
Regards,
Leonard
