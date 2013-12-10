From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] MAINTAINERS: update GPIO maintainers entry
Date: Tue, 10 Dec 2013 09:45:25 +0100
Message-ID: <1386665125-402-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f50.google.com ([209.85.215.50]:52069 "EHLO
	mail-la0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752369Ab3LJIpi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 10 Dec 2013 03:45:38 -0500
Received: by mail-la0-f50.google.com with SMTP id el20so2430605lab.9
        for <linux-gpio@vger.kernel.org>; Tue, 10 Dec 2013 00:45:36 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Add Alexandre Courbot as co-maintainer of the GPIO subsystem.
Provide a pointer to the GPIO GIT tree. Update the documentation
file path. Move around to put people and git tree on top.

Cc: Alexandre Courbot <gnurou@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 MAINTAINERS | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f216db847022..18a5a77c3924 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3764,9 +3764,11 @@ F:	include/uapi/linux/gigaset_dev.h
 
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
-S:	Maintained
+M:	Alexandre Courbot <gnurou@gmail.com>
 L:	linux-gpio@vger.kernel.org
-F:	Documentation/gpio.txt
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
+S:	Maintained
+F:	Documentation/gpio/
 F:	drivers/gpio/
 F:	include/linux/gpio*
 F:	include/asm-generic/gpio.h
-- 
1.8.3.1

