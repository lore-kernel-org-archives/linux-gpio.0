Return-Path: <SRS0=Gzc7=5Z=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F75C2BBFD
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Apr 2020 14:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9D3D20857
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Apr 2020 14:12:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbgDIOMd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Apr 2020 10:12:33 -0400
Received: from mga04.intel.com ([192.55.52.120]:28946 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727041AbgDIOMd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 9 Apr 2020 10:12:33 -0400
IronPort-SDR: WoWFCpKIAm6myQs6EELF9098BUhTtqFYjQ8JlRQi6CgDpqajf9Rgw72DYPOC1HsCQh+a0qThHp
 e2HAs4m9RRWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 07:12:34 -0700
IronPort-SDR: tV6NLuelwffw2tWvqe10zBiVWN3oFf0QiJH7Ig99mdn5AaOanlaHq+hXzVNWUK211e0g3lX5IU
 id8i4CWT4jZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="242659532"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2020 07:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A942898E; Thu,  9 Apr 2020 17:12:29 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 08/13] gpio: dwapb: Switch to more usual pattern of RMW in dwapb_gpio_set_debounce()
Date:   Thu,  9 Apr 2020 17:12:23 +0300
Message-Id: <20200409141228.49561-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
References: <20200409141228.49561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

More usual pattern is to prepare value and then write it in a single place.
Switch code in dwapb_gpio_set_debounce() to it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-dwapb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index 916a42fea456..a15652ff9495 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -327,9 +327,10 @@ static int dwapb_gpio_set_debounce(struct gpio_chip *gc,
 
 	val_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 	if (debounce)
-		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb | mask);
+		val_deb |= mask;
 	else
-		dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb & ~mask);
+		val_deb &= ~mask;
+	dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, val_deb);
 
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-- 
2.25.1

