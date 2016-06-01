From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: fix documentation for UAPI
Date: Wed,  1 Jun 2016 15:08:21 +0200
Message-ID: <1464786501-11293-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:32945 "EHLO
	mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751570AbcFANI1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2016 09:08:27 -0400
Received: by mail-lf0-f54.google.com with SMTP id s64so12503162lfe.0
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jun 2016 06:08:26 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

The kerneldoc was referencing the wrong flag names from an
earlier draft. Fix this up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/uapi/linux/gpio.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index c45f7a0a453b..21905531dcf4 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -67,13 +67,13 @@ struct gpioline_info {
  * @lineoffsets: an array desired lines, specified by offset index for the
  * associated GPIO device
  * @flags: desired flags for the desired GPIO lines, such as
- * GPIOLINE_IS_OUT, GPIOLINE_FLAG_ACTIVE_LOW etc, OR:ed together.
- * Note that even if multiple lines are requested, the same flags
+ * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
+ * together. Note that even if multiple lines are requested, the same flags
  * must be applicable to all of them, if you want lines with individual
  * flags set, request them one by one. It is possible to select
  * a batch of input or output lines, but they must all have the same
  * characteristics, i.e. all inputs or all outputs, all active low etc
- * @default_values: if the GPIOLINE_FLAG_IS_OUT is set for a requested
+ * @default_values: if the GPIOHANDLE_REQUEST_OUTPUT is set for a requested
  * line, this specifies the default output value, should be 0 (low) or
  * 1 (high), anything else than 0 or 1 will be interpreted as 1 (high)
  * @consumer_label: a desired consumer label for the selected GPIO line(s)
-- 
2.4.11

