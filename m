Return-Path: <SRS0=fgCB=DQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4002C433DF
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 17:11:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6552C2226B
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 17:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389954AbgJIRLq (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Oct 2020 13:11:46 -0400
Received: from mga07.intel.com ([134.134.136.100]:43547 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389944AbgJIRLp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 13:11:45 -0400
IronPort-SDR: KK/NtE9IP+0SM0AR93BK/+kCOjgIOebXPxHuctULhF2uzFgKihtpQKJ6/dTYdQ3y1k3QNmev7U
 NSUiivEC/L5w==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="229697206"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="229697206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 10:11:43 -0700
IronPort-SDR: fW3rhLmM6GQ4e9zQUiMvSTPavTcXLIx/1XDYfblekzRCzwUxsWhKXyWvS/EVGy1ft3bw0Y5Hll
 dGA5xGqt9BDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="354915298"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Oct 2020 10:11:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 57C471D7; Fri,  9 Oct 2020 20:11:40 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v1 1/2] pinctrl-mcp23s08: Dup full chunk of memory for regmap configuration
Date:   Fri,  9 Oct 2020 20:11:36 +0300
Message-Id: <20201009171137.81663-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It appears that simplification of mcp23s08_spi_regmap_init() made
a regression due to wrong size calculation for dev,_kmemdup() call.
It mises the fact that config variable is already a pointer, thus
the sizeof() calculation is wrong and only 4/8 bytes were copied.

Fix the parameters to devm_kmemdup() to copy full chunk of memory.

Fixes: 0874758ecb2b ("pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()")
Reported-by: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 1f47a661b0a7..7c72cffe1412 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -119,7 +119,7 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 		return -EINVAL;
 	}
 
-	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
+	copy = devm_kmemdup(dev, config, sizeof(*config), GFP_KERNEL);
 	if (!copy)
 		return -ENOMEM;
 
-- 
2.28.0

