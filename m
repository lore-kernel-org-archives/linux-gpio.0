From: Anson Huang <anson.huang@nxp.com>
Subject: [PATCH] gpio: mxc: skip GPIO_IMR restore in noirq resume
Date: Thu, 8 Nov 2018 10:53:38 +0000
Message-ID: <1541674114-843-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: linux-gpio@vger.kernel.org

During the time window of noirq suspend and noirq resume,
if a GPIO pin is enabled as system wakeup source, the
corresponding GPIO line's IRQ will be unmasked, and GPIO bank
will NOT lost power, when GPIO irq arrives, generic irq handler
will mask it until GPIO driver is ready to handle it, but in GPIO
noirq resume callback, current implementation will restore the IMR
register using the value saved in previous noirq suspend callback
which is unmasked, so this GPIO line with IRQ pending will be
unmasked again after GPIO IMR regitster is restored, ARM
will be triggered to handle this IRQ again, because of the
change of commit bf22ff45bed6 ("genirq: Avoid unnecessary low
level irq function calls"), the mask_irq function will check
the status of irq_data to decide whether to mask the irq,
in this scenario, since the GPIO IRQ is being masked before
GPIO noirq resume, IRQD_IRQ_MASKED flag is set, so the second
time GPIO IRQ triggered by restoring GPIO IMR register, the
irq_mask callback will be skipped and cause ARM busy handling
the GPIO IRQ come all the way and no response to user anymore.

To make the scenario easy to understand, I take GPIO1_0 for
example when it is used as wake up source:

1. GPIO1_0 is enabled as wakeup source, it will be unmasked;
2. In noirq suspend, GPIO driver saves GPIO1_0's mask state in
   IMR register as "unmasked";
3. System go into suspend;
4. GPIO1_0 IRQ arrives, system wakes up;
5. Before noirq resume phase, ARM handles the GPIO1_0 IRQ, set
   IRQD_IRQ_MASKED flag and call GPIO irq_mask callback to mask
   it, as GPIO driver is NOT ready to handle it, now GPIO1_0
   IRQ is masked;
6. In GPIO noirq resume, GPIO driver restores GPIO registers,
   GPIO1_0 IRQ will be restored to unmask state again and system
   IRQ triggered;
7. ARM handles GPIO1_0 IRQ again, this time the GPIO1_0 will NOT be
   masked since its irq_data already has IRQD_IRQ_MASKED flag set;
8. GPIO1_0 IRQ keeps coming, ARM will be busy handling it but always
   skip the irq_mask operation, system no response.

Although this issue is exposed by commit bf22ff45bed6 ("genirq: Avoid
unnecessary low level irq function calls"), but actually we should
skip the GPIO IMR register restore, as the IMR register is NOT
atomic during the time window of GPIO noirq suspend and noirq resume,
it could be changed by ARM if there is GPIO IRQ pending at this window.

For the scenario of GPIO bank lost power, that means no GPIO pin is
enabled as wakeup source, all GPIO IRQs will be masked and it is
same as the reset value when GPIO bank power ON, so no issue for
this case.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 5c69516..3d74ad7 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -531,7 +531,6 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *po=
rt)
=20
 	port->gpio_saved_reg.icr1 =3D readl(port->base + GPIO_ICR1);
 	port->gpio_saved_reg.icr2 =3D readl(port->base + GPIO_ICR2);
-	port->gpio_saved_reg.imr =3D readl(port->base + GPIO_IMR);
 	port->gpio_saved_reg.gdir =3D readl(port->base + GPIO_GDIR);
 	port->gpio_saved_reg.edge_sel =3D readl(port->base + GPIO_EDGE_SEL);
 	port->gpio_saved_reg.dr =3D readl(port->base + GPIO_DR);
@@ -544,7 +543,6 @@ static void mxc_gpio_restore_regs(struct mxc_gpio_port =
*port)
=20
 	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);
 	writel(port->gpio_saved_reg.icr2, port->base + GPIO_ICR2);
-	writel(port->gpio_saved_reg.imr, port->base + GPIO_IMR);
 	writel(port->gpio_saved_reg.gdir, port->base + GPIO_GDIR);
 	writel(port->gpio_saved_reg.edge_sel, port->base + GPIO_EDGE_SEL);
 	writel(port->gpio_saved_reg.dr, port->base + GPIO_DR);
--=20
2.7.4
