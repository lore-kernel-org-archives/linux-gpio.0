Return-Path: <SRS0=QqSN=DV=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD69C433DF
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 10:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3293620878
	for <linux-gpio@archiver.kernel.org>; Wed, 14 Oct 2020 10:33:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728254AbgJNKdW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 14 Oct 2020 06:33:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:48023 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgJNKdW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Oct 2020 06:33:22 -0400
IronPort-SDR: B8TYcqt6nOI3S+RUY3p3GgMcdprI1FYAXE2Z0U6sloYP5IMKE1+IAn0axEv8tNUx70pRvBXWVt
 Rqf+uha6COPw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="145941136"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="145941136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 03:33:20 -0700
IronPort-SDR: j5L4i7QEVH6QmMILZQAoBec83E+GGABKjp5EJviUGlMAWwDahXeXIyrdjCKxgN2KEbpC7/wFfN
 8OXe7q5M4kRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="scan'208";a="299911760"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 14 Oct 2020 03:33:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 3D8083A1; Wed, 14 Oct 2020 13:33:18 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v3] gpiolib: Switch to use compat_need_64bit_alignment_fixup() helper
Date:   Wed, 14 Oct 2020 13:33:15 +0300
Message-Id: <20201014103315.82662-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the new compat_need_64bit_alignment_fixup() helper to avoid
ugly ifdeffery in IOCTL compatibility code.

Depends-on: 527c412519eb ("compat: add a compat_need_64bit_alignment_fixup() helper")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Kent Gibson <warthog618@gmail.com>
---
v3: reworded commit message (Kent), added Tb tag (Kent), dropped extra Dep-on
 drivers/gpio/gpiolib-cdev.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index e9faeaf65d14..192721f829a3 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1479,21 +1479,10 @@ static __poll_t lineevent_poll(struct file *file,
 	return events;
 }
 
-static ssize_t lineevent_get_size(void)
-{
-#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
-	/* i386 has no padding after 'id' */
-	if (in_ia32_syscall()) {
-		struct compat_gpioeevent_data {
-			compat_u64	timestamp;
-			u32		id;
-		};
-
-		return sizeof(struct compat_gpioeevent_data);
-	}
-#endif
-	return sizeof(struct gpioevent_data);
-}
+struct compat_gpioeevent_data {
+	compat_u64	timestamp;
+	u32		id;
+};
 
 static ssize_t lineevent_read(struct file *file,
 			      char __user *buf,
@@ -1515,7 +1504,10 @@ static ssize_t lineevent_read(struct file *file,
 	 * actual sizeof() and pass this as an argument to copy_to_user() to
 	 * drop unneeded bytes from the output.
 	 */
-	ge_size = lineevent_get_size();
+	if (compat_need_64bit_alignment_fixup())
+		ge_size = sizeof(struct compat_gpioeevent_data);
+	else
+		ge_size = sizeof(struct gpioevent_data);
 	if (count < ge_size)
 		return -EINVAL;
 
-- 
2.28.0

