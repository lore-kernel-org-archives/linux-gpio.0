From: Varka Bhadram <varkabhadram@gmail.com>
Subject: [PATCH RESEND gpio] gpio-amd8111: check ioport_map return value
Date: Fri,  9 Jan 2015 10:38:51 +0530
Message-ID: <1420780131-6984-1-git-send-email-varkab@cdac.in>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:64067 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750709AbbAIFNH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Jan 2015 00:13:07 -0500
Received: by mail-pa0-f50.google.com with SMTP id bj1so16215317pad.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jan 2015 21:13:06 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Varka Bhadram <varkabhadram@gmail.com>, Varka Bhadram <varkab@cdac.in>

From: Varka Bhadram <varkabhadram@gmail.com>

ioport_map() may fail. Its safe to check the return value.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-amd8111.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index d3d2d10..2c4d9ab 100644
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

