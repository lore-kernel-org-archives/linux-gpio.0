Return-Path: <SRS0=9k7y=DP=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04125C4363A
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 13:22:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889302083B
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Oct 2020 13:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgJHNWW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Oct 2020 09:22:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:4957 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbgJHNWV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Oct 2020 09:22:21 -0400
IronPort-SDR: 043YBFyJGCb2w1MnuiPm0CSyD3zau+wl6mE7lod0DhN0pcuFq4lL56rnZ4HP2EKh0S2dmPBJrl
 3vkxXbkV0MIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="144654097"
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="144654097"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2020 06:22:21 -0700
IronPort-SDR: xVO0lh9EYh6cG9MdyLKxeGKQlWDJ2Q9C8rjEOkLGXHlxTaKZMsZQbQ0Vrl2S4WNpS+njaOZX6m
 X8NukdhZpngw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,350,1596524400"; 
   d="scan'208";a="354493429"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Oct 2020 06:22:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 554131EF; Thu,  8 Oct 2020 16:22:19 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpiolib: Switch to use compat_need_64bit_alignment_fixup() helper
Date:   Thu,  8 Oct 2020 16:22:17 +0300
Message-Id: <20201008132217.45037-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The new compat_need_64bit_alignment_fixup() helper allows to avoid
ugly ifdefferu in IOCTL compatible code. Use it in GPIO cdev code.

Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
Depends-on: cc7886d25bca ("compat: lift compat_s64 and compat_u64 to <asm-generic/compat.h>")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib-cdev.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e9faeaf65d14..03f33521e737 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1479,19 +1479,15 @@ static __poll_t lineevent_poll(struct file *file,
 	return events;
 }
 
+struct compat_gpioeevent_data {
+	compat_u64	timestamp;
+	u32		id;
+};
+
 static ssize_t lineevent_get_size(void)
 {
-#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
-	/* i386 has no padding after 'id' */
-	if (in_ia32_syscall()) {
-		struct compat_gpioeevent_data {
-			compat_u64	timestamp;
-			u32		id;
-		};
-
+	if (compat_need_64bit_alignment_fixup())
 		return sizeof(struct compat_gpioeevent_data);
-	}
-#endif
 	return sizeof(struct gpioevent_data);
 }
 
-- 
2.28.0

