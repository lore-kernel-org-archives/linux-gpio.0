From: "Gustavo A. R. Silva" <garsilva@embeddedor.com>
Subject: [PATCH] gpio: mark expected switch fall-throughs
Date: Fri, 13 Oct 2017 15:43:53 -0500
Message-ID: <20171013204353.GA27362@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Joel Stanley <joel@jms.id.au>, Linus Walleij <linus.walleij@linaro.org>, Alban Bedel <albeu@free.fr>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Signed-off-by: Gustavo A. R. Silva <garsilva@embeddedor.com>
---
This code was tested by compilation only (GCC 7.2.0 was used).
Please, verify if the actual intention of the code is to fall through.

 drivers/gpio/gpio-aspeed.c | 3 +++
 drivers/gpio/gpio-ath79.c  | 1 +
 drivers/gpio/gpio-stmpe.c  | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index c269cc1..bdda32a 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -411,13 +411,16 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_BOTH:
 		type2 |= bit;
+		/* fall through */
 	case IRQ_TYPE_EDGE_RISING:
 		type0 |= bit;
+		/* fall through */
 	case IRQ_TYPE_EDGE_FALLING:
 		handler = handle_edge_irq;
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
 		type0 |= bit;
+		/* fall through */
 	case IRQ_TYPE_LEVEL_LOW:
 		type1 |= bit;
 		handler = handle_level_irq;
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index f33d4a5..02e56e0 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -132,6 +132,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 
 	case IRQ_TYPE_LEVEL_HIGH:
 		polarity |= mask;
+		/* fall through */
 	case IRQ_TYPE_LEVEL_LOW:
 		type |= mask;
 		break;
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 16cbc57..001a89d 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -299,7 +299,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 			if (ret < 0)
 				return;
 			edge_det = !!(ret & mask);
-
+			/* fall through */
 		case STMPE1801:
 			rise_reg = stmpe->regs[STMPE_IDX_GPRER_LSB + bank];
 			fall_reg = stmpe->regs[STMPE_IDX_GPFER_LSB + bank];
@@ -312,7 +312,7 @@ static void stmpe_dbg_show_one(struct seq_file *s,
 			if (ret < 0)
 				return;
 			fall = !!(ret & mask);
-
+			/* fall through */
 		case STMPE801:
 		case STMPE1600:
 			irqen_reg = stmpe->regs[STMPE_IDX_IEGPIOR_LSB + bank];
-- 
2.7.4
