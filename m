Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CA41C433F5
	for <linux-gpio@archiver.kernel.org>; Fri, 25 Mar 2022 20:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbiCYUIb (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 25 Mar 2022 16:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232341AbiCYUH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Mar 2022 16:07:57 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2F42B18C;
        Fri, 25 Mar 2022 13:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648238654; x=1679774654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KugfsYLZVZCrCzDcruBf/OOyAOySyQSAT5HxYxx99mU=;
  b=U7XyWDFQwnE7PBjzw5HFxoj7PZhgdUNwMu/x3mWe3ran6G5TJ4rYQzfc
   7TxoCgZJO0fKCZBA8uXL0ul+U5m28s2b8Nk0pRveXKNsk3+6UkzCttwzh
   HeXBjTK/1YZ5kK1AUG+XRQBrO6L6NO8pYU5rZQINOu39oqlEfj/5ENqVB
   Fg+Orp2Y0Z78PZfYlAvOZHDVp7AdcWJm6hVOo0SbcA4Fm3bb2hS3hsrBu
   f6NOJibfi2nNrKMDfEufPBkfRHOMsmLi9fn/+fSnz0OE0aRYL0GeawT6L
   B5QDoJT8tJ5N2wu/3YCNltnMxyC7SKvz8g3MKjD5k5gxXQsYgeESNwrlj
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="256283599"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="256283599"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 13:04:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="584576733"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 25 Mar 2022 13:04:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 80AEB73; Fri, 25 Mar 2022 22:04:30 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v1 2/5] pinctrl: stm32: Replace custom code by gpiochip_count() call
Date:   Fri, 25 Mar 2022 22:03:35 +0200
Message-Id: <20220325200338.54270-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we have generic function to count GPIO controller nodes
under given device, there is no need to open code it. Replace
custom code by gpiochip_count() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 9ed764731570..d4bbeec82c1f 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1423,7 +1423,8 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_pinctrl *pctl;
 	struct pinctrl_pin_desc *pins;
-	int i, ret, hwlock_id, banks = 0;
+	int i, ret, hwlock_id;
+	unsigned int banks;
 
 	if (!np)
 		return -EINVAL;
@@ -1513,10 +1514,7 @@ int stm32_pctl_probe(struct platform_device *pdev)
 		return PTR_ERR(pctl->pctl_dev);
 	}
 
-	for_each_available_child_of_node(np, child)
-		if (of_property_read_bool(child, "gpio-controller"))
-			banks++;
-
+	banks = gpiochip_count(dev);
 	if (!banks) {
 		dev_err(dev, "at least one GPIO bank is required\n");
 		return -EINVAL;
-- 
2.35.1

