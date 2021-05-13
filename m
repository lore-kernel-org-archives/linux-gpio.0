Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228EDC433ED
	for <linux-gpio@archiver.kernel.org>; Thu, 13 May 2021 08:52:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9D2A613D3
	for <linux-gpio@archiver.kernel.org>; Thu, 13 May 2021 08:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhEMIxl (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 13 May 2021 04:53:41 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56815 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231517AbhEMIxl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 May 2021 04:53:41 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <colin.king@canonical.com>)
        id 1lh751-0006fu-U5; Thu, 13 May 2021 08:52:28 +0000
From:   Colin King <colin.king@canonical.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] gpio: xilinx: Fix potential integer overflow on shift of a u32 int
Date:   Thu, 13 May 2021 09:52:27 +0100
Message-Id: <20210513085227.54392-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The left shift of the u32 integer v is evaluated using 32 bit
arithmetic and then assigned to a u64 integer. There are cases
where v will currently overflow on the shift. Avoid this by
casting it to unsigned long (same type as map[]) before shifting
it.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 02b3f84d9080 ("gpio: xilinx: Switch to use bitmap APIs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpio/gpio-xilinx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 109b32104867..164a3a5a9393 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -99,7 +99,7 @@ static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
 	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
 
 	map[index] &= ~(0xFFFFFFFFul << offset);
-	map[index] |= v << offset;
+	map[index] |= (unsigned long)v << offset;
 }
 
 static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
-- 
2.30.2

