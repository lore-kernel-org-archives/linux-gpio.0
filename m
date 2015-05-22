From: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Subject: [PATCH] gpio: Prevent an integer overflow in the pca953x driver
Date: Fri, 22 May 2015 12:35:12 +1200
Message-ID: <1432254912-17153-1-git-send-email-joshua.scott@alliedtelesis.co.nz>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:58124 "EHLO
	gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756140AbbEVAf0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 21 May 2015 20:35:26 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
Cc: Joshua Scott <joshua.scott@alliedtelesis.co.nz>, Chris Packham <chris.packham@alliedtelesis.co.nz>

Interrupts were missed if an 8-bit integer overflow occurred. This was
observed when bank0,pin7 and bank1,pin7 changed simultaniously.

As the 8-bit totals were only checked against zero, replace them with
booleans. Name the booleans so that their purpose is clear.

Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
---
 drivers/gpio/gpio-pca953x.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index e2da64a..5059db5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -443,12 +443,13 @@ static struct irq_chip pca953x_irq_chip = {
 	.irq_set_type		= pca953x_irq_set_type,
 };
 
-static u8 pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
+static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 {
 	u8 cur_stat[MAX_BANK];
 	u8 old_stat[MAX_BANK];
-	u8 pendings = 0;
-	u8 trigger[MAX_BANK], triggers = 0;
+	bool pending_seen = false;
+	bool trigger_seen = false;
+	u8 trigger[MAX_BANK];
 	int ret, i, offset = 0;
 
 	switch (chip->chip_type) {
@@ -461,7 +462,7 @@ static u8 pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 	}
 	ret = pca953x_read_regs(chip, offset, cur_stat);
 	if (ret)
-		return 0;
+		return false;
 
 	/* Remove output pins from the equation */
 	for (i = 0; i < NBANK(chip); i++)
@@ -471,11 +472,12 @@ static u8 pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 
 	for (i = 0; i < NBANK(chip); i++) {
 		trigger[i] = (cur_stat[i] ^ old_stat[i]) & chip->irq_mask[i];
-		triggers += trigger[i];
+		if (trigger[i])
+			trigger_seen = true;
 	}
 
-	if (!triggers)
-		return 0;
+	if (!trigger_seen)
+		return false;
 
 	memcpy(chip->irq_stat, cur_stat, NBANK(chip));
 
@@ -483,10 +485,11 @@ static u8 pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		pending[i] = (old_stat[i] & chip->irq_trig_fall[i]) |
 			(cur_stat[i] & chip->irq_trig_raise[i]);
 		pending[i] &= trigger[i];
-		pendings += pending[i];
+		if (pending[i])
+			pending_seen = true;
 	}
 
-	return pendings;
+	return pending_seen;
 }
 
 static irqreturn_t pca953x_irq_handler(int irq, void *devid)
-- 
1.9.1

