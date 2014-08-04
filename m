From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] MAINTAINERS: update GPIO include files
Date: Mon, 4 Aug 2014 13:06:58 +0900
Message-ID: <1407125218-22026-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:19108 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbaHDEHF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Aug 2014 00:07:05 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

Files under include/linux/gpio/ were not reported as part of the GPIO
subsystem. Fix this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e0d24dcb122..d9ca71a31101 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4031,7 +4031,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
 S:	Maintained
 F:	Documentation/gpio/
 F:	drivers/gpio/
-F:	include/linux/gpio*
+F:	include/linux/gpio/
+F:	include/linux/gpio.h
 F:	include/asm-generic/gpio.h
 
 GRE DEMULTIPLEXER DRIVER
-- 
2.0.3

