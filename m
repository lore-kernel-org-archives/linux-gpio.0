Return-Path: <SRS0=wtV1=74=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0EC8C433DF
	for <linux-gpio@archiver.kernel.org>; Mon, 15 Jun 2020 15:06:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C18E72074D
	for <linux-gpio@archiver.kernel.org>; Mon, 15 Jun 2020 15:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgFOPGH (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 15 Jun 2020 11:06:07 -0400
Received: from mga03.intel.com ([134.134.136.65]:41068 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730939AbgFOPFv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 11:05:51 -0400
IronPort-SDR: PRR0+GpPLXyXAX+ngq1OxetQqID9MXj2nFTIfl2A5BJBAlO8Igl2v7n6h2tPxv+PWk0jHkCW0d
 epKsmkMB91Uw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 08:05:49 -0700
IronPort-SDR: R8XkT+bwpHFuKo/yI9NgpndUVT+JMSy9DDpxNtkhtZcoRXPXIzFbtiDX1MAdxN30g6FrrwaLKW
 FGwxE3OZy2bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="316930539"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2020 08:05:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id F31DE2AA; Mon, 15 Jun 2020 18:05:46 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>
Subject: [PATCH v1 2/5] ARM/orion/gpio: Make use of for_each_requested_gpio()
Date:   Mon, 15 Jun 2020 18:05:42 +0300
Message-Id: <20200615150545.87964-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
References: <20200615150545.87964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make use of for_each_requested_gpio() instead of home grown analogue.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>
---
 arch/arm/plat-orion/gpio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 26a531ebb6e9..734f0be4f14a 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -442,6 +442,7 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 
 	struct orion_gpio_chip *ochip = gpiochip_get_data(chip);
 	u32 out, io_conf, blink, in_pol, data_in, cause, edg_msk, lvl_msk;
+	const char *label;
 	int i;
 
 	out	= readl_relaxed(GPIO_OUT(ochip));
@@ -453,15 +454,10 @@ static void orion_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	edg_msk	= readl_relaxed(GPIO_EDGE_MASK(ochip));
 	lvl_msk	= readl_relaxed(GPIO_LEVEL_MASK(ochip));
 
-	for (i = 0; i < chip->ngpio; i++) {
-		const char *label;
+	for_each_requested_gpio(chip, i, label) {
 		u32 msk;
 		bool is_out;
 
-		label = gpiochip_is_requested(chip, i);
-		if (!label)
-			continue;
-
 		msk = 1 << i;
 		is_out = !(io_conf & msk);
 
-- 
2.27.0.rc2

