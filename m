From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.9 19/32] gpio: vf610: Mask all GPIO interrupts
Date: Sat, 23 Feb 2019 16:09:38 -0500
Message-ID: <20190223210951.202268-19-sashal@kernel.org>
References: <20190223210951.202268-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190223210951.202268-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Linus Walleij <linus.walleij@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Andrew Lunn <andrew@lunn.ch>

[ Upstream commit 7ae710f9f8b2cf95297e7bbfe1c09789a7dc43d4 ]

On SoC reset all GPIO interrupts are disable. However, if kexec is
used to boot into a new kernel, the SoC does not experience a
reset. Hence GPIO interrupts can be left enabled from the previous
kernel. It is then possible for the interrupt to fire before an
interrupt handler is registered, resulting in the kernel complaining
of an "unexpected IRQ trap", the interrupt is never cleared, and so
fires again, resulting in an interrupt storm.

Disable all GPIO interrupts before registering the GPIO IRQ chip.

Fixes: 7f2691a19627 ("gpio: vf610: add gpiolib/IRQ chip driver for Vybrid")
Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpio/gpio-vf610.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 3edb09cb9ee08..1f599bc082374 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -221,6 +221,7 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	struct vf610_gpio_port *port;
 	struct resource *iores;
 	struct gpio_chip *gc;
+	int i;
 	int ret;
 
 	port = devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
@@ -259,6 +260,10 @@ static int vf610_gpio_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	/* Mask all GPIO interrupts */
+	for (i = 0; i < gc->ngpio; i++)
+		vf610_gpio_writel(0, port->base + PORT_PCR(i));
+
 	/* Clear the interrupt status register for all GPIO's */
 	vf610_gpio_writel(~0, port->base + PORT_ISFR);
 
-- 
2.19.1
