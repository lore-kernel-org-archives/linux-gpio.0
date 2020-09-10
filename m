Return-Path: <SRS0=Xj1b=CT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B724C433E2
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Sep 2020 10:21:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2441B20BED
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Sep 2020 10:21:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgIJKUp (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Sep 2020 06:20:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:55456 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730633AbgIJKTo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 10 Sep 2020 06:19:44 -0400
IronPort-SDR: 7tx80McmbaHV72PunVqHpLiGme8YfKubFRiGrDUd+20vDNtDdRqSTw93zOYu9xm5RuNm7+swfE
 l3r5hhSRlsJQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9739"; a="146209969"
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="146209969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2020 03:19:38 -0700
IronPort-SDR: DAz+OALEVS10GSX+EX5Zt6aL5d41fbvBteQDNo/6D9JRCQPcuSRR6TSVhjQ3SwnLQ1EgR/YJs4
 ogN1WloAVmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,412,1592895600"; 
   d="scan'208";a="334131402"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 10 Sep 2020 03:19:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 378BCE7; Thu, 10 Sep 2020 13:19:36 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Kent Gibson <warthog618@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/2] gpiolib: convert to use DEFINE_SEQ_ATTRIBUTE macro
Date:   Thu, 10 Sep 2020 13:19:35 +0300
Message-Id: <20200910101935.47140-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
References: <20200910101935.47140-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpiolib.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 80137c1b3cdc..1300650dc308 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4402,31 +4402,18 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	return 0;
 }
 
-static const struct seq_operations gpiolib_seq_ops = {
+static const struct seq_operations gpiolib_sops = {
 	.start = gpiolib_seq_start,
 	.next = gpiolib_seq_next,
 	.stop = gpiolib_seq_stop,
 	.show = gpiolib_seq_show,
 };
-
-static int gpiolib_open(struct inode *inode, struct file *file)
-{
-	return seq_open(file, &gpiolib_seq_ops);
-}
-
-static const struct file_operations gpiolib_operations = {
-	.owner		= THIS_MODULE,
-	.open		= gpiolib_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= seq_release,
-};
+DEFINE_SEQ_ATTRIBUTE(gpiolib);
 
 static int __init gpiolib_debugfs_init(void)
 {
 	/* /sys/kernel/debug/gpio */
-	debugfs_create_file("gpio", S_IFREG | S_IRUGO, NULL, NULL,
-			    &gpiolib_operations);
+	debugfs_create_file("gpio", 0444, NULL, NULL, &gpiolib_fops);
 	return 0;
 }
 subsys_initcall(gpiolib_debugfs_init);
-- 
2.28.0

