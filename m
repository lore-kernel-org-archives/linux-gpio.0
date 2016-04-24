From: Colin King <colin.king@canonical.com>
Subject: [PATCH] pinctrl: sirf/atlas7: trivial fix of spelling mistake on flagged
Date: Sun, 24 Apr 2016 23:02:09 +0100
Message-ID: <1461535329-19935-1-git-send-email-colin.king@canonical.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60470 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753124AbcDXWCT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Apr 2016 18:02:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Barry Song <baohua@kernel.org>, Jiri Kosina <trivial@kernel.org>, Wei Chen <Wei.Chen@csr.com>, Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

fix spelling mistake, flaged -> flagged

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index 3d233fc..168c0f5 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5798,7 +5798,7 @@ static void atlas7_gpio_handle_irq(struct irq_desc *desc)
 
 	status = readl(ATLAS7_GPIO_INT_STATUS(bank));
 	if (!status) {
-		pr_warn("%s: gpio [%s] status %#x no interrupt is flaged\n",
+		pr_warn("%s: gpio [%s] status %#x no interrupt is flagged\n",
 			__func__, gc->label, status);
 		handle_bad_irq(desc);
 		return;
-- 
2.7.4

