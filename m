From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] pinctrl/amd: white space cleanups in amd_gpio_dbg_show()
Date: Sat, 7 Jan 2017 09:32:15 +0300
Message-ID: <20170107063214.GE26959@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21478 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935346AbdAGGc0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Jan 2017 01:32:26 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Shah@elgon.mountain, Nehal-bakulchandra <Nehal-Bakulchandra.shah@amd.com>, Ken Xue <Ken.Xue@amd.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally deleted two tabs from the first line, but even with that
fixed the conditions were not really kernel style.  Put the && at the
end of the line so we can align the condition clauses.  Also add spaces
around the "+" operator.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7b95c1886f7b..249aa5e83419 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -216,14 +216,14 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			if (pin_reg & BIT(INTERRUPT_ENABLE_OFF)) {
 				interrupt_enable = "interrupt is enabled|";
 
-		if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
-				&& !(pin_reg & BIT(ACTIVE_LEVEL_OFF+1)))
+				if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
+				    !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
 					active_level = "Active low|";
-				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF)
-				&& !(pin_reg & BIT(ACTIVE_LEVEL_OFF+1)))
+				else if (pin_reg & BIT(ACTIVE_LEVEL_OFF) &&
+					 !(pin_reg & BIT(ACTIVE_LEVEL_OFF + 1)))
 					active_level = "Active high|";
-				else if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF))
-					&& pin_reg & BIT(ACTIVE_LEVEL_OFF+1))
+				else if (!(pin_reg & BIT(ACTIVE_LEVEL_OFF)) &&
+					 pin_reg & BIT(ACTIVE_LEVEL_OFF + 1))
 					active_level = "Active on both|";
 				else
 					active_level = "Unknow Active level|";
