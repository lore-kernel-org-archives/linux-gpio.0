From: Jisheng Zhang <jszhang@marvell.com>
Subject: [PATCH] gpio: dwapb: use dwapb_read instead of readl_relaxed
Date: Thu, 13 Apr 2017 17:46:39 +0800
Message-ID: <20170413094639.484-1-jszhang@marvell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:58009 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751678AbdDMJvU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 13 Apr 2017 05:51:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@marvell.com>

Commit 67809b974a07 ("GPIO: gpio-dwapb: Change readl&writel to
dwapb_read&dwapb_write") missed this readl_relaxed() usage, I'm not
sure the reason, maybe for performance reason? But if we do care
the performance, we could use the relaxed io in dwapb_read and
dwapb_write.

Signed-off-by: Jisheng Zhang <jszhang@marvell.com>
---
 drivers/gpio/gpio-dwapb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 9c15ee4ef4e9..fe6cdb5d03d9 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -128,7 +128,7 @@ static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 
 static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 {
-	u32 irq_status = readl_relaxed(gpio->regs + GPIO_INTSTATUS);
+	u32 irq_status = dwapb_read(gpio, GPIO_INTSTATUS);
 	u32 ret = irq_status;
 
 	while (irq_status) {
-- 
2.11.0

