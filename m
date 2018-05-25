From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] gpio: dwapb: Fix rework support for 1 interrupt per port A GPIO
Date: Fri, 25 May 2018 16:11:34 +0100
Message-ID: <1527261094-10412-1-git-send-email-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, Michel Pollet <michel.pollet@bp.renesas.com>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: linux-gpio@vger.kernel.org

Commit da069d5d2b814d9887989dcdb29fb0202eac8b38 ("gpio: dwapb: Rework
support for 1 interrupt per port A GPIO"), was an incremental patch that
was supposed to provide the delta between v5 and v6 patch set for
adding support for 1 interupt per port A GPIO. v5 was applied, then some
other feedback came afterwards.

However, in my haste I managed to drop the changes made to dwapb_port_property
struct. This patch includes those missing changes.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 include/linux/platform_data/gpio-dwapb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/gpio-dwapb.h b/include/linux/platform_data/gpio-dwapb.h
index 5a52d69..419cfac 100644
--- a/include/linux/platform_data/gpio-dwapb.h
+++ b/include/linux/platform_data/gpio-dwapb.h
@@ -19,7 +19,7 @@ struct dwapb_port_property {
 	unsigned int	idx;
 	unsigned int	ngpio;
 	unsigned int	gpio_base;
-	unsigned int	irq[32];
+	int		irq[32];
 	bool		has_irq;
 	bool		irq_shared;
 };
-- 
2.7.4
