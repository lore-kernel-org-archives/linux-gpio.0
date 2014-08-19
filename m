From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] mmc: slot-gpio: restore error reporting
Date: Mon, 18 Aug 2014 22:28:00 -0500
Message-ID: <1408418880-10250-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f171.google.com ([209.85.213.171]:32836 "EHLO
	mail-ig0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752505AbaHSD2H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Aug 2014 23:28:07 -0400
Received: by mail-ig0-f171.google.com with SMTP id l13so9377802iga.4
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2014 20:28:05 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-mmc@vger.kernel.org, Chris Ball <cjb@laptop.org>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Simon Baatz <gmbnomis@gmail.com>

The patch switching the MMC core to use GPIO descriptors
depromoted errors to debug messages for unsuccessful attempt
to get CD or WP GPIOs. This was because sometimes these are
not specified, and that should not be an error.

However that is not so helpful: explicitly check whether a
GPIO is not specified (i.e. -ENOENT is returned) and if there
is some other error, report it with dev_err().

Reported-by: Simon Baatz <gmbnomis@gmail.com>
Cc: Simon Baatz <gmbnomis@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mmc/core/host.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 048c6d687cc9..6f7ed9c50346 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -368,9 +368,11 @@ int mmc_of_parse(struct mmc_host *host)
 		if (ret) {
 			if (ret == -EPROBE_DEFER)
 				return ret;
-			dev_dbg(host->parent,
-				"Failed to request CD GPIO: %d\n",
-				ret);
+			if (ret != -ENOENT) {
+				dev_err(host->parent,
+					"Failed to request CD GPIO: %d\n",
+					ret);
+			}
 		} else
 			dev_info(host->parent, "Got CD GPIO\n");
 	}
@@ -383,9 +385,11 @@ int mmc_of_parse(struct mmc_host *host)
 	if (ret) {
 		if (ret == -EPROBE_DEFER)
 			goto out;
-		dev_dbg(host->parent,
-			"Failed to request WP GPIO: %d\n",
-			ret);
+		if (ret != -ENOENT) {
+			dev_err(host->parent,
+				"Failed to request WP GPIO: %d\n",
+				ret);
+		}
 	} else
 		dev_info(host->parent, "Got WP GPIO\n");
 
-- 
1.9.3

