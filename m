Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6332AC433DB
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 11:57:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2152E22CA1
	for <linux-gpio@archiver.kernel.org>; Fri, 22 Jan 2021 11:57:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbhAVK5o (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 22 Jan 2021 05:57:44 -0500
Received: from mga05.intel.com ([192.55.52.43]:63728 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727069AbhAVKwf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 Jan 2021 05:52:35 -0500
IronPort-SDR: INkrXjrQ+C2zdR3GWcBRNHUKM3Wbem7wi4iOvMjNv6tiLsnrx3lLA2oNn4P/lx+jvFx6vr008R
 O0+OAREoaqsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="264248570"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="264248570"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 02:50:48 -0800
IronPort-SDR: GzAi/tjOC/djHIyrxuRjhWyQDDmc26oxmeH+5TJ+PXD6meooEqXd04sHzgLJs6JLjrpBWC7Rpw
 LGWpfhT+jbuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; 
   d="scan'208";a="502672968"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 22 Jan 2021 02:50:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 598032A7; Fri, 22 Jan 2021 12:50:46 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: aggregator: Use compound literal from the header
Date:   Fri, 22 Jan 2021 12:50:45 +0200
Message-Id: <20210122105045.23820-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of doing it in place, convert GPIO_LOOKUP_IDX() and GPIO_HOG()
to be compund literals that's allow to use them as rvalue in assignments.

Due to above conversion, use compound literal from the header
in the gpio-aggregator.c.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-aggregator.c | 3 +--
 include/linux/gpio/machine.h   | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 0cab833fbd81..08171431bb8f 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -72,8 +72,7 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 	if (!lookups)
 		return -ENOMEM;
 
-	lookups->table[*n] =
-		(struct gpiod_lookup)GPIO_LOOKUP_IDX(key, hwnum, NULL, *n, 0);
+	lookups->table[*n] = GPIO_LOOKUP_IDX(key, hwnum, NULL, *n, 0);
 
 	(*n)++;
 	memset(&lookups->table[*n], 0, sizeof(lookups->table[*n]));
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 781a053abbb9..d755e529c1e3 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -75,7 +75,7 @@ struct gpiod_hog {
  * gpiod_get_index()
  */
 #define GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, _idx, _flags)         \
-{                                                                         \
+(struct gpiod_lookup) {                                                   \
 	.key = _key,                                                      \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.con_id = _con_id,                                                \
@@ -87,7 +87,7 @@ struct gpiod_hog {
  * Simple definition of a single GPIO hog in an array.
  */
 #define GPIO_HOG(_chip_label, _chip_hwnum, _line_name, _lflags, _dflags)  \
-{                                                                         \
+(struct gpiod_hog) {                                                      \
 	.chip_label = _chip_label,                                        \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.line_name = _line_name,                                          \
-- 
2.29.2

