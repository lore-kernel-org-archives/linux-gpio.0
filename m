Return-Path: <SRS0=HvKM=57=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DA3C3815B
	for <linux-gpio@archiver.kernel.org>; Wed, 15 Apr 2020 14:16:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C6E220857
	for <linux-gpio@archiver.kernel.org>; Wed, 15 Apr 2020 14:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636550AbgDOOQJ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 15 Apr 2020 10:16:09 -0400
Received: from mga01.intel.com ([192.55.52.88]:38643 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636554AbgDOOPv (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 15 Apr 2020 10:15:51 -0400
IronPort-SDR: w+l0ZF2NqZ94TF2XuuYEYZTKDAbV84debK6geZaOn9Rq4NxF8IeHpsKwiATjnsOHVxFK36D+ZB
 ewym9IZnMO2A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 07:15:40 -0700
IronPort-SDR: Ntb2mJopzxDnMjdN2BeH449yrxBUUnSc9acUg+Q+xzgW7Q35u0LDDRosKg68Rv8TXrWsPU6eWy
 Uu8zb5COfyoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; 
   d="scan'208";a="454924080"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 15 Apr 2020 07:15:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E8009E8C; Wed, 15 Apr 2020 17:15:35 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v2 10/14] gpio: dwapb: Drop bogus BUG_ON()s
Date:   Wed, 15 Apr 2020 17:15:30 +0300
Message-Id: <20200415141534.31240-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no case when no context is provided in the ->suspend() and
->resume() hooks. Moreover, BUG_ON() is harmful to user and makes kernel
inoperable after the crash. Drop the BUG_ON()s for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/gpio/gpio-dwapb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 0b073cbc003b..ae4c4db8b156 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -723,8 +723,6 @@ static int dwapb_gpio_suspend(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(!ctx);
-
 		offset = GPIO_SWPORTA_DDR + idx * GPIO_SWPORT_DDR_STRIDE;
 		ctx->dir = dwapb_read(gpio, offset);
 
@@ -773,8 +771,6 @@ static int dwapb_gpio_resume(struct device *dev)
 		unsigned int idx = gpio->ports[i].idx;
 		struct dwapb_context *ctx = gpio->ports[i].ctx;
 
-		BUG_ON(!ctx);
-
 		offset = GPIO_SWPORTA_DR + idx * GPIO_SWPORT_DR_STRIDE;
 		dwapb_write(gpio, offset, ctx->data);
 
-- 
2.25.1

