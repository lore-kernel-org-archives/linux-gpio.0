Return-Path: <SRS0=QcYp=B4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2464EC433E1
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Aug 2020 14:24:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D9E220786
	for <linux-gpio@archiver.kernel.org>; Tue, 18 Aug 2020 14:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgHROX6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 18 Aug 2020 10:23:58 -0400
Received: from mga05.intel.com ([192.55.52.43]:51173 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726968AbgHROX5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Aug 2020 10:23:57 -0400
IronPort-SDR: WByMp2whm6FXOrGM3DyDQMIYlbgiyDeWQnD7DDSK7KsH4zAqmc7uaj4WRymwZCQEBew03OJU8z
 BNEWd/snEjHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239734303"
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="239734303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 07:23:56 -0700
IronPort-SDR: F001ABtdhxg/u1Zn22xo3LRNW0nQYZWAg4tp9QjSxqrj3el/W0fnUTuZibVJL7wFM+02RfY71v
 yWKxL+ndfvOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,327,1592895600"; 
   d="scan'208";a="320103685"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 18 Aug 2020 07:23:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7E2191FD; Tue, 18 Aug 2020 17:23:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: intel: Update header block to reflect direct dependencies
Date:   Tue, 18 Aug 2020 17:23:53 +0300
Message-Id: <20200818142353.34083-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update header inclusion block to reflect all direct dependencies
that are being involved in pinctrl-intel.h.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 38a1d6af7427..c4fef03b663f 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -10,12 +10,15 @@
 #ifndef PINCTRL_INTEL_H
 #define PINCTRL_INTEL_H
 
+#include <linux/bits.h>
+#include <linux/compiler_types.h>
 #include <linux/gpio/driver.h>
 #include <linux/irq.h>
+#include <linux/kernel.h>
 #include <linux/pm.h>
+#include <linux/pinctrl/pinctrl.h>
 #include <linux/spinlock_types.h>
 
-struct pinctrl_pin_desc;
 struct platform_device;
 struct device;
 
-- 
2.28.0

