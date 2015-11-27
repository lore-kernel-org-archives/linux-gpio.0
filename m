From: Sudeep Holla <sudeep.holla@arm.com>
Subject: [PATCH 2/2] pinctrl: single: remove misuse of IRQF_NO_SUSPEND flag
Date: Fri, 27 Nov 2015 17:21:00 +0000
Message-ID: <1448644860-29323-2-git-send-email-sudeep.holla@arm.com>
References: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50593 "EHLO foss.arm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755065AbbK0RVV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 27 Nov 2015 12:21:21 -0500
In-Reply-To: <1448644860-29323-1-git-send-email-sudeep.holla@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, Sudeep Holla <Sudeep.Holla@arm.com>

From: Sudeep Holla <Sudeep.Holla@arm.com>

The IRQF_NO_SUSPEND flag is used to identify the interrupts that should
be left enabled so as to allow them to work as expected during the
suspend-resume cycle, but doesn't guarantee that it will wake the system
from a suspended state, enable_irq_wake is recommended to be used for
the wakeup.

This patch removes the use of IRQF_NO_SUSPEND flags replacing it with
irq_set_irq_wake instead.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/pinctrl/pinctrl-single.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 945a7d0f0704..a1e32c6b554a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1622,12 +1622,14 @@ static void pcs_irq_unmask(struct irq_data *d)
  */
 static int pcs_irq_set_wake(struct irq_data *d, unsigned int state)
 {
+	struct pcs_soc_data *pcs_soc = irq_data_get_irq_chip_data(d);
+
 	if (state)
 		pcs_irq_unmask(d);
 	else
 		pcs_irq_mask(d);
 
-	return 0;
+	return irq_set_irq_wake(pcs_soc->irq, state);
 }
 
 /**
@@ -1763,8 +1765,7 @@ static int pcs_irq_init_chained_handler(struct pcs_device *pcs,
 		int res;
 
 		res = request_irq(pcs_soc->irq, pcs_irq_handler,
-				  IRQF_SHARED | IRQF_NO_SUSPEND |
-				  IRQF_NO_THREAD,
+				  IRQF_SHARED | IRQF_NO_THREAD,
 				  name, pcs_soc);
 		if (res) {
 			pcs_soc->irq = -1;
-- 
1.9.1

