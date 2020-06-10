Return-Path: <SRS0=sbuz=7X=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3864C433E0
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 18:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B7DD2070B
	for <linux-gpio@archiver.kernel.org>; Wed, 10 Jun 2020 18:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgFJSfv (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 10 Jun 2020 14:35:51 -0400
Received: from mga06.intel.com ([134.134.136.31]:55188 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727078AbgFJSfu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Jun 2020 14:35:50 -0400
IronPort-SDR: rx1ayb/qaR2Ry5PMKLDUmc2//gGK01PdGrkzMLIs573VrBe+6m7XwXAf3c8oYSDkX0YP9MK1PX
 jPZ9QWloog/w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2020 11:35:49 -0700
IronPort-SDR: W7ou5DZ/+HPyUsT1kH4fgKMacpuQreTNTQaoSGGXrjrh5jhJR1xzhFi7y0VqYW7wiHQ9L5TWRl
 YVQuzq5nWHRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,496,1583222400"; 
   d="scan'208";a="275066738"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 Jun 2020 11:35:48 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3F2425FC; Wed, 10 Jun 2020 21:35:45 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 09/10] pinctrl: intel: Make use of for_each_requested_gpio()
Date:   Wed, 10 Jun 2020 21:35:42 +0300
Message-Id: <20200610183543.89414-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
References: <20200610183543.89414-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 7e25e20293a8..ef4bbd72c9a9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1628,19 +1628,6 @@ static void intel_gpio_irq_init(struct intel_pinctrl *pctrl)
 	}
 }
 
-static u32
-intel_gpio_is_requested(struct gpio_chip *chip, int base, unsigned int size)
-{
-	u32 requested = 0;
-	unsigned int i;
-
-	for (i = 0; i < size; i++)
-		if (gpiochip_is_requested(chip, base + i))
-			requested |= BIT(i);
-
-	return requested;
-}
-
 static bool intel_gpio_update_reg(void __iomem *reg, u32 mask, u32 value)
 {
 	u32 curr, updated;
@@ -1661,12 +1648,15 @@ static void intel_restore_hostown(struct intel_pinctrl *pctrl, unsigned int c,
 	const struct intel_community *community = &pctrl->communities[c];
 	const struct intel_padgroup *padgrp = &community->gpps[gpp];
 	struct device *dev = pctrl->dev;
-	u32 requested;
+	u32 requested = 0;
+	unsigned int i;
 
 	if (padgrp->gpio_base == INTEL_GPIO_BASE_NOMAP)
 		return;
 
-	requested = intel_gpio_is_requested(&pctrl->chip, padgrp->gpio_base, padgrp->size);
+	for_each_requested_gpio(&pctrl->chip, i, padgrp->gpio_base, padgrp->size)
+		requested |= BIT(i);
+
 	if (!intel_gpio_update_reg(base + gpp * 4, requested, saved))
 		return;
 
-- 
2.27.0.rc2

