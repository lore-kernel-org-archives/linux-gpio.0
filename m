From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: sirf: fix typo in kernel warning on a bad interruot
Date: Sat, 28 Feb 2015 20:22:27 +0000
Message-ID: <1425154947-7855-1-git-send-email-colin.king@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:37152 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbbB1UYL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 28 Feb 2015 15:24:11 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>, Stephen Warren <swarren@nvidia.com>, Fan Wu <fwu@marvell.com>, Bin Shi <Bin.Shi@csr.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix typo, "flaged" -> "flagged"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 2a1f072..abc5c47 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -568,7 +568,7 @@ static void sirfsoc_gpio_handle_irq(unsigned int irq, struct irq_desc *desc)
 	status = readl(sgpio->chip.regs + SIRFSOC_GPIO_INT_STATUS(bank->id));
 	if (!status) {
 		printk(KERN_WARNING
-			"%s: gpio id %d status %#x no interrupt is flaged\n",
+			"%s: gpio id %d status %#x no interrupt is flagged\n",
 			__func__, bank->id, status);
 		handle_bad_irq(irq, desc);
 		return;
-- 
2.1.4

