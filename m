From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 1/2] gpiolib: prevent fault 'Unable to handle kernel paging request at virtual address'
Date: Fri,  4 Dec 2015 17:06:24 +0800
Message-ID: <1449219985-67261-2-git-send-email-preid@electromag.com.au>
References: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:52064 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1755625AbbLDJQE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Dec 2015 04:16:04 -0500
In-Reply-To: <1449219985-67261-1-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

gpiod_request when gpio returns -EBUSY results in fault.
Changing to pr_warn fixes the problem.

Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a18f00f..0ef01b8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -961,7 +961,7 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 
 done:
 	if (status)
-		gpiod_dbg(desc, "%s: status %d\n", __func__, status);
+		pr_warn("%s: status %d\n", __func__, status);
 
 	return status;
 }
-- 
1.8.3.1

