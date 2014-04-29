From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 05/17] gpio: janz-ttl: remove unnecessary OOM messages
Date: Tue, 29 Apr 2014 17:35:07 +0900
Message-ID: <003601cf6385$ed2419c0$c76c4d40$%han@samsung.com>
References: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:22805 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932739AbaD2IfJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Apr 2014 04:35:09 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N4S00MMWAIK4Z00@mailout1.samsung.com> for
 linux-gpio@vger.kernel.org; Tue, 29 Apr 2014 17:35:08 +0900 (KST)
In-reply-to: <003101cf6385$2751dbb0$75f59310$%han@samsung.com>
Content-language: ko
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org, 'Jingoo Han' <jg1.han@samsung.com>, "'Ira W. Snyder'" <iws@ovro.caltech.edu>

The site-specific OOM messages are unnecessary, because they
duplicate the MM subsystem generic OOM message.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/gpio/gpio-janz-ttl.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-janz-ttl.c b/drivers/gpio/gpio-janz-ttl.c
index 2ecd3a0..255806b 100644
--- a/drivers/gpio/gpio-janz-ttl.c
+++ b/drivers/gpio/gpio-janz-ttl.c
@@ -158,7 +158,6 @@ static int ttl_probe(struct platform_device *pdev)
 
 	mod = kzalloc(sizeof(*mod), GFP_KERNEL);
 	if (!mod) {
-		dev_err(dev, "unable to allocate private data\n");
 		ret = -ENOMEM;
 		goto out_return;
 	}
-- 
1.7.10.4


