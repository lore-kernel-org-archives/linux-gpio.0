Return-Path: <SRS0=1fa9=5Y=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE285C2D0EA
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Apr 2020 15:23:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC445206C0
	for <linux-gpio@archiver.kernel.org>; Wed,  8 Apr 2020 15:23:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgDHPXu (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 8 Apr 2020 11:23:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:53647 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbgDHPXu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 8 Apr 2020 11:23:50 -0400
IronPort-SDR: ojkES/rXTMJCBZ0Y9Ry3iKzzvQ342YzlxfBUWuypyg+RftT2fnGhzdu1VZCS4azxgT1c5D1aAz
 c2XueKfAlmXg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 08:23:48 -0700
IronPort-SDR: 9hfDCL4vuJeJ/s0Eb9O2f7m0twikgdAv8mGQ+LrdAPV//miPJDbbG6yd3wxe+UyXDfHFiGWlqN
 lDMQamfsV8ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; 
   d="scan'208";a="244064588"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2020 08:23:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id C9CB5130; Wed,  8 Apr 2020 18:23:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/2] gpio: merrifield: Switch over to MSI interrupts
Date:   Wed,  8 Apr 2020 18:23:45 +0300
Message-Id: <20200408152346.59718-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some devices may support MSI interrupts. Let's at least try to use them
in platforms that provide MSI capability.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-merrifield.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 48918a016cd8..1f0cf909ea40 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -473,6 +473,10 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 
 	raw_spin_lock_init(&priv->lock);
 
+	ret = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
+
 	girq = &priv->chip.irq;
 	girq->chip = &mrfld_irqchip;
 	girq->init_hw = mrfld_irq_init_hw;
@@ -482,7 +486,7 @@ static int mrfld_gpio_probe(struct pci_dev *pdev, const struct pci_device_id *id
 				     sizeof(*girq->parents), GFP_KERNEL);
 	if (!girq->parents)
 		return -ENOMEM;
-	girq->parents[0] = pdev->irq;
+	girq->parents[0] = pci_irq_vector(pdev, 0);
 	girq->first = irq_base;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
-- 
2.25.1

