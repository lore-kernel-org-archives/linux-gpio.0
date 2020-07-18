Return-Path: <SRS0=/SYs=A5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E28C433E2
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Jul 2020 21:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 063572065E
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Jul 2020 21:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgGRV0M (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 18 Jul 2020 17:26:12 -0400
Received: from mga01.intel.com ([192.55.52.88]:30320 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgGRV0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 17:26:12 -0400
IronPort-SDR: MBRW0FrZdvgbgO+lXmaC+dBJxkg+fisjKvmn/zQjdmobSGzk26gzicUQhvdLK/3DEQONQFD3AZ
 d4dnq3Eby3bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="167899647"
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="167899647"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2020 14:26:11 -0700
IronPort-SDR: GHR4Ks4HxFYA3EleADq2CGMUrDcRMIkwpBCr6KSxzPdKRGWSCEjF82OlC8gbfXQxDcp3RWYuQW
 tj4YcaHVxFoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="269801007"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 18 Jul 2020 14:26:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9CD4C924; Sun, 19 Jul 2020 00:26:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpio: aggregator: Assign name and offsets only once in a loop
Date:   Sun, 19 Jul 2020 00:26:08 +0300
Message-Id: <20200718212608.65328-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The for-loop looks a bit hard to read when we extract two arguments
per iteration. The 'do {} while (true)' makes it easier to read
despite being infinite loop.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-aggregator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index de9ae622ca23..962ec9373d6f 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -109,14 +109,17 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 	if (!bitmap)
 		return -ENOMEM;
 
-	for (name = get_arg(&args), offsets = get_arg(&args); name;
-	     offsets = get_arg(&args)) {
+	do {
+		name = get_arg(&args);
+		if (!name)
+			break;
 		if (IS_ERR(name)) {
 			pr_err("Cannot get GPIO specifier: %pe\n", name);
 			error = PTR_ERR(name);
 			goto free_bitmap;
 		}
 
+		offsets = get_arg(&args);
 		if (!isrange(offsets)) {
 			/* Named GPIO line */
 			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
@@ -139,9 +142,7 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 			if (error)
 				goto free_bitmap;
 		}
-
-		name = get_arg(&args);
-	}
+	} while (true);
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-- 
2.27.0

