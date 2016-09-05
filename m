From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] soc: fsl/qe: fix gpio save_regs functions
Date: Tue,  6 Sep 2016 00:52:16 +0200 (CEST)
Message-ID: <20160905225217.C34571A245A@localhost.localdomain>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from pegase1.c-s.fr ([93.17.236.30]:59246 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932286AbcIEWwZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Sep 2016 18:52:25 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Scott Wood <oss@buserror.net>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org, stable@vger.kernel.org

of_mm_gpiochip_add_data() calls mm_gc->save_regs() before
setting the data. Therefore ->save_regs() cannot use
gpiochip_get_data()

An Oops is encountered without this fix.

fixes: 1e714e54b5ca5 ("powerpc: qe_lib-gpio: use gpiochip data pointer")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: <stable@vger.kernel.org>
---
 drivers/soc/fsl/qe/gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/gpio.c b/drivers/soc/fsl/qe/gpio.c
index 333eb22..0aaf429 100644
--- a/drivers/soc/fsl/qe/gpio.c
+++ b/drivers/soc/fsl/qe/gpio.c
@@ -41,7 +41,8 @@ struct qe_gpio_chip {
 
 static void qe_gpio_save_regs(struct of_mm_gpio_chip *mm_gc)
 {
-	struct qe_gpio_chip *qe_gc = gpiochip_get_data(&mm_gc->gc);
+	struct qe_gpio_chip *qe_gc =
+		container_of(mm_gc, struct qe_gpio_chip, mm_gc);
 	struct qe_pio_regs __iomem *regs = mm_gc->regs;
 
 	qe_gc->cpdata = in_be32(&regs->cpdata);
-- 
2.1.0

