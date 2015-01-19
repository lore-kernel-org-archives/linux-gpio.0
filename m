From: varkabhadram@gmail.com
Subject: [PATCH gpio] gpio-amd8111: add release_region on ioport_map failure
Date: Mon, 19 Jan 2015 13:35:48 +0530
Message-ID: <1421654748-32141-1-git-send-email-varkabhadram@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:47120 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbbASIKL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jan 2015 03:10:11 -0500
Received: by mail-pa0-f53.google.com with SMTP id kq14so37270269pab.12
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jan 2015 00:10:11 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, Varka Bhadram <varkab@cdac.in>

From: Varka Bhadram <varkab@cdac.in>

Commit ffe4770b9b3483f74 ("gpio-amd8111: check ioport_map return value")
adds the error check on ioport_map(). It doesnt release the requested region.

On failure this patch release the region that has requested before.

Signed-off-by: Varka Bhadram <varkab@cdac.in>
Reported-by: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/gpio-amd8111.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-amd8111.c b/drivers/gpio/gpio-amd8111.c
index 2c4d9ab..d00d819 100644
--- a/drivers/gpio/gpio-amd8111.c
+++ b/drivers/gpio/gpio-amd8111.c
@@ -215,6 +215,7 @@ found:
 	gp.pm = ioport_map(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 	if (!gp.pm) {
 		dev_err(&pdev->dev, "Couldn't map io port into io memory\n");
+		release_region(gp.pmbase + PMBASE_OFFSET, PMBASE_SIZE);
 		err = -ENOMEM;
 		goto out;
 	}
-- 
1.7.9.5

