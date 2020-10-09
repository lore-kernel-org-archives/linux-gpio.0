Return-Path: <SRS0=fgCB=DQ=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A81C433DF
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 18:09:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79BF722281
	for <linux-gpio@archiver.kernel.org>; Fri,  9 Oct 2020 18:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgJISJc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 9 Oct 2020 14:09:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:21095 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgJISJc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 9 Oct 2020 14:09:32 -0400
IronPort-SDR: o5mXj1ABjNmeodKQqfuIP31tkePWMc9c9LRPzuz+xM5P1LJb1cK4HoYNUa/h6rMtV6FSXK/5Li
 HfHCnC+yLh3g==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="144840740"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="144840740"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 11:09:00 -0700
IronPort-SDR: cdB8IArMP2+dQk81zysh49icgw0AlBOq0DZWo3TTi+GGiU3VApkSTfQNodsgd5SzDGGH7RMnid
 SGWfiN0WhStw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; 
   d="scan'208";a="529021697"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 09 Oct 2020 11:08:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1AAE112A; Fri,  9 Oct 2020 21:08:57 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH v2 2/2] pinctrl: mcp23s08: Print error message when regmap init fails
Date:   Fri,  9 Oct 2020 21:08:56 +0300
Message-Id: <20201009180856.4738-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
References: <20201009180856.4738-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It is useful for debugging to have the error message printed
when regmap initialisation fails. Add it to the driver.

Cc: Martin Hundebøll <martin@geanix.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
index 7c72cffe1412..9ae10318f6f3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -126,6 +126,8 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 	copy->name = name;
 
 	mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp, copy);
+	if (IS_ERR(mcp->regmap))
+		dev_err(dev, "regmap init failed for %s\n", mcp->chip.label);
 	return PTR_ERR_OR_ZERO(mcp->regmap);
 }
 
-- 
2.28.0

