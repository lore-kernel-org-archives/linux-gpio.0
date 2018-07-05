From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] pinctrl: baytrail: Mark expected switch fall-throughs
Date: Thu, 5 Jul 2018 10:51:27 -0500
Message-ID: <20180705155127.GA1458@embeddedor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

In preparation to enabling -Wimplicit-fallthrough, mark switch cases
where we are expecting to fall through.

Addresses-Coverity-ID: 1292308 ("Missing break in switch")
Addresses-Coverity-ID: 1292309 ("Missing break in switch")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6b52ea1..3420e7e 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1542,11 +1542,13 @@ static void byt_irq_unmask(struct irq_data *d)
 	switch (irqd_get_trigger_type(d)) {
 	case IRQ_TYPE_LEVEL_HIGH:
 		value |= BYT_TRIG_LVL;
+		/* fall through */
 	case IRQ_TYPE_EDGE_RISING:
 		value |= BYT_TRIG_POS;
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 		value |= BYT_TRIG_LVL;
+		/* fall through */
 	case IRQ_TYPE_EDGE_FALLING:
 		value |= BYT_TRIG_NEG;
 		break;
-- 
2.7.4
