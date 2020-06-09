Return-Path: <SRS0=U95Q=7W=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A40C433DF
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Jun 2020 18:24:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B53A52067B
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Jun 2020 18:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbgFISY4 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 9 Jun 2020 14:24:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:29300 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389157AbgFISY4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:24:56 -0400
IronPort-SDR: F7M2Q3Iud+8sTyRJUikjPfKISJiB4BZgdMknZ1ScvRtcFBLFmJkoJnZg8AoXJXQi88us1HQ6h4
 f8b7vj4MBMAA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:52 -0700
IronPort-SDR: lYmciz9Iz9jF/R/0eh+2ak+f/t6WZugfvPXROiXMAdqKFyP6m3vijDLOlaSE6RwKfnnC4g7mGZ
 5gBCpYgJ0v5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="274692802"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 09 Jun 2020 11:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ECA944D9; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/6] pinctrl: intel: Allow drivers to define ACPI address space ID
Date:   Tue,  9 Jun 2020 21:24:48 +0300
Message-Id: <20200609182449.45813-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Individual drivers may install ACPI OpRegion handlers based on
address space ID which differs from community to community.
Add special field in the struct intel_community for that purpose.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-intel.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.h b/drivers/pinctrl/intel/pinctrl-intel.h
index 0f01ef3fdfdd..4e17308d33e9 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.h
+++ b/drivers/pinctrl/intel/pinctrl-intel.h
@@ -104,6 +104,7 @@ enum {
  * @ngpps: Number of pad groups in this community
  * @pad_map: Optional non-linear mapping of the pads
  * @nirqs: Optional total number of IRQs this community can generate
+ * @acpi_space_id: Optional address space ID for ACPI OpRegion handler
  * @regs: Community specific common registers (reserved for core driver)
  * @pad_regs: Community specific pad registers (reserved for core driver)
  *
@@ -129,6 +130,7 @@ struct intel_community {
 	size_t ngpps;
 	const unsigned int *pad_map;
 	unsigned short nirqs;
+	unsigned short acpi_space_id;
 
 	/* Reserved for the core driver */
 	void __iomem *regs;
-- 
2.27.0.rc2

