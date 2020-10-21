Return-Path: <SRS0=WRE+=D4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC6FC561F8
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Oct 2020 11:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0291B21D6C
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Oct 2020 11:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439418AbgJULZz (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Oct 2020 07:25:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:60906 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439368AbgJULZz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 21 Oct 2020 07:25:55 -0400
IronPort-SDR: YQVLS7GzhhQPrZt5WIp36JYXk+RDByn16JYTTLzGn+CUe7lzc3ud7zsEnOFFZTIi502cNa7lKl
 kB64VH621//g==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="185005230"
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="185005230"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 04:25:40 -0700
IronPort-SDR: UE5o6qBCZ8On0v8nuCwRLzP7+SJ2mNHw1Dwot5RZV2n1MwRweX0c6cGEhbq/cUAeQyArGymN4g
 ZrDpCpOpq+AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,401,1596524400"; 
   d="scan'208";a="522713303"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 21 Oct 2020 04:25:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 17CB75B; Wed, 21 Oct 2020 14:25:38 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpiolib: split error path in gpiod_request_commit()
Date:   Wed, 21 Oct 2020 14:25:37 +0300
Message-Id: <20201021112537.40738-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com>
References: <20201021112537.40738-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For better maintenance and micro optimization split error path
in the gpiod_request_commit().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0e6dddce207d..43ddcf454b5f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1968,11 +1968,9 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 
 	if (test_and_set_bit(FLAG_REQUESTED, &desc->flags) == 0) {
 		desc_set_label(desc, label ? : "?");
-		ret = 0;
 	} else {
-		kfree_const(label);
 		ret = -EBUSY;
-		goto done;
+		goto out_free_unlock;
 	}
 
 	if (gc->request) {
@@ -1987,9 +1985,8 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 
 		if (ret) {
 			desc_set_label(desc, NULL);
-			kfree_const(label);
 			clear_bit(FLAG_REQUESTED, &desc->flags);
-			goto done;
+			goto out_free_unlock;
 		}
 	}
 	if (gc->get_direction) {
@@ -1998,8 +1995,12 @@ static int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 		gpiod_get_direction(desc);
 		spin_lock_irqsave(&gpio_lock, flags);
 	}
-done:
 	spin_unlock_irqrestore(&gpio_lock, flags);
+	return 0;
+
+out_free_unlock:
+	spin_unlock_irqrestore(&gpio_lock, flags);
+	kfree_const(label);
 	return ret;
 }
 
-- 
2.28.0

