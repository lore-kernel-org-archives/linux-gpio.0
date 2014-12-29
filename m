From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH gpio] gpio-amd8111: check ioport_map return value
Date: Mon, 29 Dec 2014 14:09:01 +0530
Message-ID: <1419842341-22694-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:51824 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751941AbaL2InR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Dec 2014 03:43:17 -0500
Received: by mail-pd0-f177.google.com with SMTP id ft15so16633342pdb.36
        for <linux-gpio@vger.kernel.org>; Mon, 29 Dec 2014 00:43:17 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Varka Bhadram <varkab@cdac.in>

ioport_map() may fail. Its safe to check the return value.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-amd8111.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 3c09f1a6..a0585c3 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -213,6 +213,11 @@ found:
 		goto out;
 	}
 	gp.pm = ioport_map(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
+	if (!gp.pm) {
+		dev_err(&pdev->dev, "Couldn't map io port into io memory\n");
+		err = -ENOMEM;
+		goto out;
+	}
 	gp.pdev = pdev;
 	gp.chip.dev = &pdev->dev;
 
-- 
1.7.9.5

