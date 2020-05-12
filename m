Return-Path: <SRS0=LosB=62=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24F4C2D0F6
	for <linux-gpio@archiver.kernel.org>; Tue, 12 May 2020 18:45:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A85662176D
	for <linux-gpio@archiver.kernel.org>; Tue, 12 May 2020 18:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbgELSpQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 12 May 2020 14:45:16 -0400
Received: from mga01.intel.com ([192.55.52.88]:45368 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725938AbgELSpP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 12 May 2020 14:45:15 -0400
IronPort-SDR: PaQLF/5nIGBE2z9Myhz+GfBMVn00P8nn++KeTvqXfX80x7LTDCavGuGdsmQuRqcXRTq2yvpaUl
 EKISdwK7a6aA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2020 11:45:15 -0700
IronPort-SDR: MtSQq4+VcRWNkvrO25HsBH1tiX5PVjxcR+kZQWzlS/5qM+cBRO54azZMT2WOOJhdsP7ODK4apC
 WlEnGS7XXFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,384,1583222400"; 
   d="scan'208";a="251542166"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2020 11:45:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8B26E76; Tue, 12 May 2020 21:45:13 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v1 1/4] gpio: dwapb: avoid error message for optional IRQ
Date:   Tue, 12 May 2020 21:45:10 +0300
Message-Id: <20200512184513.86883-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

platform_get_irq() will generate an error message if the requested IRQ
is not present. Use platform_get_irq_optional() to avoid the error message
being generated.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 8639c4a7f46974..5bc5057f071f37 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -542,7 +542,7 @@ static void dwapb_get_irq(struct device *dev, struct fwnode_handle *fwnode,
 		if (np)
 			pp->irq[j] = of_irq_get(np, j);
 		else if (has_acpi_companion(dev))
-			pp->irq[j] = platform_get_irq(to_platform_device(dev), j);
+			pp->irq[j] = platform_get_irq_optional(to_platform_device(dev), j);
 
 		if (pp->irq[j] >= 0)
 			pp->has_irq = true;
-- 
2.26.2

