Return-Path: <SRS0=HMxX=7Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7043C433E0
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 14:50:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CC6EE2067B
	for <linux-gpio@archiver.kernel.org>; Fri, 12 Jun 2020 14:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgFLOu0 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 12 Jun 2020 10:50:26 -0400
Received: from mga17.intel.com ([192.55.52.151]:33679 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgFLOu0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Jun 2020 10:50:26 -0400
IronPort-SDR: Am4dXrmp9A6LNMRTLklypN6AlXZ0cz8U9JDzZifZ69coY/+RVkdZ6jqpLPahjKrMCpbplq1xEp
 DZv/Co9uCStA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2020 07:50:13 -0700
IronPort-SDR: PyJXM5rlmDuh6r6WWaRd9qWlp6PtYzbO9frPp/szA0k14S16xQ0M+w3kBi6njoLZH9b3oCA3Hr
 nzWz/Qu6cOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,503,1583222400"; 
   d="scan'208";a="474228506"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2020 07:50:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5305C88D; Fri, 12 Jun 2020 17:50:07 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 13/13] pinctrl: baytrail: Drop no-op ACPI_PTR() call
Date:   Fri, 12 Jun 2020 17:50:06 +0300
Message-Id: <20200612145006.9145-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
References: <20200612145006.9145-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since we dependent on ACPI, there is no need to use ACPI_PTR()
which is a no-op in this case.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 0ff7c55173da..e3ceb3dfeabe 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1757,9 +1757,8 @@ static struct platform_driver byt_gpio_driver = {
 	.driver         = {
 		.name			= "byt_gpio",
 		.pm			= &byt_gpio_pm_ops,
+		.acpi_match_table	= byt_gpio_acpi_match,
 		.suppress_bind_attrs	= true,
-
-		.acpi_match_table = ACPI_PTR(byt_gpio_acpi_match),
 	},
 };
 
-- 
2.27.0.rc2

