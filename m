Return-Path: <SRS0=/SYs=A5=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD785C433E3
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Jul 2020 21:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BF1F20684
	for <linux-gpio@archiver.kernel.org>; Sat, 18 Jul 2020 21:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728043AbgGRV0N (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sat, 18 Jul 2020 17:26:13 -0400
Received: from mga12.intel.com ([192.55.52.136]:27081 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726933AbgGRV0M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 18 Jul 2020 17:26:12 -0400
IronPort-SDR: qZqUfFTC30xzYE9Hv5Kb7ntCB0a3L07A1SPaDLfQ4cP2GQp8TZrdBPnvCfqcl6hdOPcCPMvaUc
 Simz9MWSgK8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9686"; a="129339395"
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="129339395"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2020 14:26:12 -0700
IronPort-SDR: E+d1hfzK15CNvXtOXFJcc/dzPvMKxUKvAWcCFU364sBrwe8g8rY2USUmIWoIIOT1n4bJdKmU4I
 T1OaKzMMaQVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,368,1589266800"; 
   d="scan'208";a="287154881"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 18 Jul 2020 14:26:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 95ACB7A6; Sun, 19 Jul 2020 00:26:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] gpio: aggregator: Simplify isrange() by  using get_option()
Date:   Sun, 19 Jul 2020 00:26:07 +0300
Message-Id: <20200718212608.65328-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
References: <20200718212608.65328-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

We already have a nice helper called get_option() which can be used
to validate the input format. Simplify isrange() by using it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-aggregator.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 5be166e73381..de9ae622ca23 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -64,30 +64,17 @@ static char *get_arg(char **args)
 
 static bool isrange(const char *s)
 {
-	size_t n;
+	char **args = (char **)&s;
+	int dummy;
+	int res;
 
-	if (IS_ERR_OR_NULL(s))
+	if (IS_ERR_OR_NULL(s) || *s == '\0')
 		return false;
 
-	while (1) {
-		n = strspn(s, "0123456789");
-		if (!n)
-			return false;
-
-		s += n;
-
-		switch (*s++) {
-		case '\0':
-			return true;
-
-		case '-':
-		case ',':
-			break;
-
-		default:
-			return false;
-		}
-	}
+	do {
+		res = get_option(args, &dummy);
+	} while (res);
+	return **args == '\0';
 }
 
 static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
-- 
2.27.0

