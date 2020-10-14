Return-Path: <SRS0=QqSN=DV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0405DC433DF
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 13:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 985B222202
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 13:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727660AbgJNNb7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 14 Oct 2020 09:31:59 -0400
Received: from mga09.intel.com ([134.134.136.24]:55600 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727250AbgJNNb7 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 09:31:59 -0400
IronPort-SDR: QfXhm0rMJMy+P+p2/QaurcAv/9wK4Ok6yhUWV3vFrqQyOeE22uLpGqmbocIFi7iRagGcWc7l5u
 XUcyIpFigd7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166225248"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="166225248"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 06:31:58 -0700
IronPort-SDR: ExQw5Y2yQKWaPTt3q35ennsUwAFhVuJmWCIMMA087DP+WHZWWPNJHwa/8EAitBUbiBtamgQKU0
 rnZLSXxDOkGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="346508366"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 14 Oct 2020 06:31:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 231341CC; Wed, 14 Oct 2020 16:31:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/3] gpiolib: of: Use named item for enum gpiod_flags variable
Date:   Wed, 14 Oct 2020 16:31:54 +0300
Message-Id: <20201014133154.30610-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
References: <20201014133154.30610-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use named item instead of plain integer for enum gpiod_flags
to make it clear that even 0 has its own meaning.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2f895a2b8411..892a513b7a64 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -593,7 +593,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	xlate_flags = 0;
 	*lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
-	*dflags = 0;
+	*dflags = GPIOD_ASIS;
 
 	ret = of_property_read_u32(chip_np, "#gpio-cells", &tmp);
 	if (ret)
-- 
2.28.0

