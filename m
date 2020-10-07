Return-Path: <SRS0=pKPn=DO=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAACC47095
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 14:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8558A21548
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Oct 2020 14:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728637AbgJGOiW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:38:22 -0400
Received: from mga14.intel.com ([192.55.52.115]:37456 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728535AbgJGOiV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 10:38:21 -0400
IronPort-SDR: lFsGsiqb3rL8z4tM5cHC9U2gmtAgvJPW3QHHgATKqBKvMOGGPx2fcYHKok3R4tCj3oLLqjDRjF
 AAhkdoGgKRPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="164194151"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="164194151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2020 07:38:21 -0700
IronPort-SDR: Np++mvahEkNacbGXOpLzVKFIka7R5HlA7jx5gDCTliMZYZi9CnHppSUw5Tw8OwnCNU+iI34kKi
 7QdSzuCVB7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
   d="scan'208";a="461348356"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Oct 2020 07:38:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9489A1D7; Wed,  7 Oct 2020 17:38:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Update indentation in driver.rst for code excerpts
Date:   Wed,  7 Oct 2020 17:38:17 +0300
Message-Id: <20201007143817.76335-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When TABs are being used to indent the code excerpts inside
the bullet lists some of the tools fail to recognize it and
continue interpreting the special characters inside
the quoted excerpt.

Update indentation in driver.rst for code excerpts to avoid
their special interpretation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/gpio/driver.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 9809f593c0ab..072a7455044e 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -342,12 +342,12 @@ Cascaded GPIO irqchips usually fall in one of three categories:
   forced to a thread. The "fake?" raw lock can be used to work around this
   problem::
 
-	raw_spinlock_t wa_lock;
-	static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
-		unsigned long wa_lock_flags;
-		raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
-		generic_handle_irq(irq_find_mapping(bank->chip.irq.domain, bit));
-		raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
+    raw_spinlock_t wa_lock;
+    static irqreturn_t omap_gpio_irq_handler(int irq, void *gpiobank)
+        unsigned long wa_lock_flags;
+        raw_spin_lock_irqsave(&bank->wa_lock, wa_lock_flags);
+        generic_handle_irq(irq_find_mapping(bank->chip.irq.domain, bit));
+        raw_spin_unlock_irqrestore(&bank->wa_lock, wa_lock_flags);
 
 - GENERIC CHAINED GPIO IRQCHIPS: these are the same as "CHAINED GPIO irqchips",
   but chained IRQ handlers are not used. Instead GPIO IRQs dispatching is
-- 
2.28.0

