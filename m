From: Perr Zhang <strongbox8@zoho.com>
Subject: [RESEND][PATCH v2] remove duplicate calls in irq handler
Date: Tue, 16 Aug 2016 18:37:21 +0800
Message-ID: <1471343841-7422-1-git-send-email-strongbox8@zoho.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sender153-mail.zoho.com ([74.201.84.153]:21768 "EHLO
	sender153-mail.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753136AbcHPKjL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Aug 2016 06:39:11 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: tomasz.figa@gmail.com
Cc: k.kozlowski@samsung.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

Because chained_irq_enter() has already called chip->irq_mask() and 
chip->irq_ack(), also chained_irq_exit() will call chip->irq_unmask(), 
so it's not necessary to call chip->irq_*() here. 

Signed-off-by: Perr Zhang <strongbox8@zoho.com> 
Acked-by: Tomasz Figa <tomasz.figa@gmail.com> 
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---
 drivers/pinctrl/samsung/pinctrl-exynos.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index 051b5bf..d32fa2b 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -428,14 +428,10 @@ static void exynos_irq_eint0_15(struct irq_desc *desc)
 	int eint_irq;
 
 	chained_irq_enter(chip, desc);
-	chip->irq_mask(&desc->irq_data);
-
-	if (chip->irq_ack)
-		chip->irq_ack(&desc->irq_data);
 
 	eint_irq = irq_linear_revmap(bank->irq_domain, eintd->irq);
 	generic_handle_irq(eint_irq);
-	chip->irq_unmask(&desc->irq_data);
+
 	chained_irq_exit(chip, desc);
 }
 
-- 
1.9.3


