From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v5 1/7] irq/irq_sim: add irq_set_type() callback
Date: Mon, 18 Feb 2019 17:41:32 +0100
Message-ID: <20190218164138.24921-2-brgl@bgdev.pl>
References: <20190218164138.24921-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218164138.24921-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Implement the irq_set_type() callback and call irqd_set_trigger_type()
internally so that users interested in the configured trigger type can
later retrieve it using irqd_get_trigger_type().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 kernel/irq/irq_sim.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/kernel/irq/irq_sim.c b/kernel/irq/irq_sim.c
index 98a20e1594ce..83ecc65d8be2 100644
--- a/kernel/irq/irq_sim.c
+++ b/kernel/irq/irq_sim.c
@@ -25,10 +25,18 @@ static void irq_sim_irqunmask(struct irq_data *data)
 	irq_ctx->enabled = true;
 }
 
+static int irq_sim_set_type(struct irq_data *data, unsigned int type)
+{
+	irqd_set_trigger_type(data, type);
+
+	return 0;
+}
+
 static struct irq_chip irq_sim_irqchip = {
 	.name		= "irq_sim",
 	.irq_mask	= irq_sim_irqmask,
 	.irq_unmask	= irq_sim_irqunmask,
+	.irq_set_type	= irq_sim_set_type,
 };
 
 static void irq_sim_handle_irq(struct irq_work *work)
-- 
2.20.1
