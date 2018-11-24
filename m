From: Nicholas Mc Guire <hofrat@osadl.org>
Subject: [PATCH] pinctrl: rza1: report if devm_kasptrinf() fails
Date: Sat, 24 Nov 2018 17:30:33 +0100
Message-ID: <1543077033-7016-1-git-send-email-hofrat@osadl.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
List-Id: linux-gpio@vger.kernel.org

devm_kasprintf() may return NULL on failure of internal allocation 
thus the assignments are not safe if not checked. On error
rza1_pinctrl_register() respectively rza1_parse_gpiochip() return
negative values so -ENOMEM in the (unlikely) failure case of 
devm_kasprintf() should be fine here. 

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 5a49b644b307 ("pinctrl: Renesas RZ/A1 pin and gpio controller")
---

Problem was located with an experimental coccinelle script

The dev_err() for this unlikely case is added so that a failures of
rza1_pinctrl_register() respectively rza1_parse_gpiochip() can be
understood as currently the negative return value is simply passed up
the call stack but it would be hard to identify the cause.

Patch was compile tested with: shmobile_defconfig (implies PINCTRL_RZA1=y)

Patch is against 4.20-rc3 (localversion-next is next-20181123)

 drivers/pinctrl/pinctrl-rza1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 14eb576..2533df4 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1225,6 +1225,11 @@ static int rza1_parse_gpiochip(struct rza1_pinctrl *rza1_pctl,
 	chip->base	= -1;
 	chip->label	= devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
 					 np);
+	if (!chip->label) {
+		dev_err(rza1_pctl->dev, "Failed to allocate label\n");
+		return -ENOMEM;
+	}
+
 	chip->ngpio	= of_args.args[2];
 	chip->of_node	= np;
 	chip->parent	= rza1_pctl->dev;
@@ -1326,6 +1331,11 @@ static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
 		pins[i].number = i;
 		pins[i].name = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL,
 					      "P%u-%u", port, pin);
+		if (!pins[i].name) {
+			dev_err(rza1_pctl->dev,
+				"RZ/A1 pin controller allocation failed\n");
+			return -ENOMEM;
+		}
 
 		if (i % RZA1_PINS_PER_PORT == 0) {
 			/*
-- 
2.1.4
