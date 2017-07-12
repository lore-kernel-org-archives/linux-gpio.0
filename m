From: Philipp Rosenberger <p.rosenberger@linutronix.de>
Subject: [PATCH 1/2] gpio: gpio-mxc: Fix: higher 16 GPIOs usable as wake source
Date: Wed, 12 Jul 2017 10:36:39 +0200
Message-ID: <1499848600-7233-2-git-send-email-p.rosenberger@linutronix.de>
References: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499848600-7233-1-git-send-email-p.rosenberger@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, Philipp Rosenberger <p.rosenberger@linutronix.de>
List-Id: linux-gpio@vger.kernel.org

In the function gpio_set_wake_irq(), port->irq_high is only checked for
zero. As platform_get_irq() returns a value less then zero if no interrupt
was found, any gpio >= 16 was handled like an irq_high interrupt was
available. On iMX27 for example no high interrupt is available. This lead
to the problem that only some gpios (the lower 16) were useable as wake
sources.

Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
---
 drivers/gpio/gpio-mxc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 3abea3f..9269225 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -424,6 +424,9 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(port->base);
 
 	port->irq_high = platform_get_irq(pdev, 1);
+	if (port->irq_high < 0)
+		port->irq_high = 0;
+
 	port->irq = platform_get_irq(pdev, 0);
 	if (port->irq < 0)
 		return port->irq;
-- 
2.1.4
