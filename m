From: Olof Johansson <olof@lixom.net>
Subject: [PATCH] gpio: pl061: print resource_size_t as %pa
Date: Tue, 26 Nov 2013 10:56:01 -0800
Message-ID: <1385492161-27624-1-git-send-email-olof@lixom.net>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:48650 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757631Ab3KZS6Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Nov 2013 13:58:25 -0500
Received: by mail-pd0-f175.google.com with SMTP id w10so8270196pde.34
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2013 10:58:24 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

commit 73675c8aa07 ('gpio: pl061: proper error messages') added a printout
of a resource_size_t using %x, which produces an error for builds with
64-bit resources:

drivers/gpio/gpio-pl061.c:345:3: warning: format '%x' expects argument of
    type 'unsigned int', but argument 3 has type 'resource_size_t'

Switch to %pa (and pass in a pointer to the resource instead).

Fixes: 73675c8aa07 ('gpio: pl061: proper error messages')
Signed-off-by: Olof Johansson <olof@lixom.net>
---
 drivers/gpio/gpio-pl061.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index f08e5e2cbe50..4ed16d7bd13d 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -341,8 +341,8 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	amba_set_drvdata(adev, chip);
-	dev_err(&adev->dev, "PL061 GPIO chip @%08x registered\n",
-		adev->res.start);
+	dev_err(&adev->dev, "PL061 GPIO chip @%pa registered\n",
+		&adev->res.start);
 
 	return 0;
 }
-- 
1.8.4.1.601.g02b3b1d

