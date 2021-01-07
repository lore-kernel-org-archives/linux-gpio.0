Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF06C433E0
	for <linux-gpio@archiver.kernel.org>; Thu,  7 Jan 2021 18:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F06F523406
	for <linux-gpio@archiver.kernel.org>; Thu,  7 Jan 2021 18:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbhAGSz5 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 7 Jan 2021 13:55:57 -0500
Received: from mga14.intel.com ([192.55.52.115]:61971 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbhAGSz5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 7 Jan 2021 13:55:57 -0500
IronPort-SDR: SFsL4rbZ49egeUzQ40/Rx+/n9HZ38SBlB8/+Lad6/cuC/5iHC614k/sKOdpI7U+Ul1/GLf3HiG
 ZelSKk1yMzTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="176699278"
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="176699278"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 10:54:11 -0800
IronPort-SDR: MNzP59TNE/TEEpNh/I11nsto9nu3frHY0Zmjrbqu1+HhF4s6ACo1/exekdDVL2mqOjmPD7LHmO
 vAKQImv6xH9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,329,1602572400"; 
   d="scan'208";a="387958418"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 07 Jan 2021 10:54:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4EB501C4; Thu,  7 Jan 2021 20:54:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] pinctrl: tigerlake: Add Alder Lake-P ACPI ID
Date:   Thu,  7 Jan 2021 20:54:06 +0200
Message-Id: <20210107185406.40415-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Intel Alder Lake-P PCH has the same GPIO hardware than Tiger Lake-LP
PCH but the ACPI ID is different. Add this new ACPI ID to the list of
supported devices.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-tigerlake.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 3e354e02f408..75b6d66955bf 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -748,6 +748,7 @@ static const struct intel_pinctrl_soc_data tglh_soc_data = {
 static const struct acpi_device_id tgl_pinctrl_acpi_match[] = {
 	{ "INT34C5", (kernel_ulong_t)&tgllp_soc_data },
 	{ "INT34C6", (kernel_ulong_t)&tglh_soc_data },
+	{ "INTC1055", (kernel_ulong_t)&tgllp_soc_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tgl_pinctrl_acpi_match);
-- 
2.29.2

