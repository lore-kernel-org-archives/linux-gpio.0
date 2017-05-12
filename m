From: Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH] MAINTAINERS: remove self from GPIO maintainers
Date: Fri, 12 May 2017 10:01:18 -0700
Message-ID: <20170512170118.15373-1-acourbot@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:34393 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751407AbdELRB1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 May 2017 13:01:27 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <gnurou@gmail.com>

From: Alexandre Courbot <gnurou@gmail.com>

I have not been able to dedicate time to the GPIO subsystem since quite
some time, and I don't see the situation improving in the near future.
Update the maintainers list to reflect this unfortunate fact.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
---
Linus,

I apologize for not being able to help you further (and not having done
anything useful for way too long!). As I need to focus on other areas of
the kernel (V4L) it is clear that I won't be able to be more active in
the near future. If things improve I would be very happy to send a reverse
patch someday though.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 07a9a5906c59..946fa1a78b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5670,7 +5670,6 @@ F:	tools/testing/selftests/gpio/
 
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
-M:	Alexandre Courbot <gnurou@gmail.com>
 L:	linux-gpio@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
-- 
2.13.0.rc2.291.g57267f2277-goog

