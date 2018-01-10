From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] gpio: thunderx: fix error return code in thunderx_gpio_probe()
Date: Wed, 10 Jan 2018 14:37:13 +0000
Message-ID: <1515595033-83888-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:50851 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755583AbeAJObG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jan 2018 09:31:06 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENOMEM from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 5a2a30024d8c ("gpio: Add gpio driver support for ThunderX and OCTEON-TX")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-thunderx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-thunderx.c b/drivers/gpio/gpio-thunderx.c
index b5adb79..d16e9d4 100644
--- a/drivers/gpio/gpio-thunderx.c
+++ b/drivers/gpio/gpio-thunderx.c
@@ -553,8 +553,10 @@ static int thunderx_gpio_probe(struct pci_dev *pdev,
 	txgpio->irqd = irq_domain_create_hierarchy(irq_get_irq_data(txgpio->msix_entries[0].vector)->domain,
 						   0, 0, of_node_to_fwnode(dev->of_node),
 						   &thunderx_gpio_irqd_ops, txgpio);
-	if (!txgpio->irqd)
+	if (!txgpio->irqd) {
+		err = -ENOMEM;
 		goto out;
+	}
 
 	/* Push on irq_data and the domain for each line. */
 	for (i = 0; i < ngpio; i++) {

