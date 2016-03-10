From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: uapi: use 0xB4 as ioctl() major
Date: Thu, 10 Mar 2016 15:57:58 +0700
Message-ID: <1457600278-30124-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:35407 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753677AbcCJI6P (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2016 03:58:15 -0500
Received: by mail-pa0-f53.google.com with SMTP id td3so35721042pab.2
        for <linux-gpio@vger.kernel.org>; Thu, 10 Mar 2016 00:58:15 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>
Cc: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>, Linus Walleij <linus.walleij@linaro.org>

The previous 'o' is in conflict and not very orderly assigned.
We want to select an ioctl() major that does not conflict with
the existining ones.

Add the new reserved major (0xB4) to Documentation/ioctl/ioctl-number.txt

Fixes: 3c702e9987e2 ("gpio: add a userspace chardev ABI for GPIOs")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This fixes a serious number space collission in the ABI, because
of my incompetence. Ideally I would augment the original commit,
but at this point I can not rebase my tree. The merged end result
will be OK.
---
 Documentation/ioctl/ioctl-number.txt | 1 +
 include/uapi/linux/gpio.h            | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/ioctl/ioctl-number.txt b/Documentation/ioctl/ioctl-number.txt
index 91261a32a573..9369d3b0f09a 100644
--- a/Documentation/ioctl/ioctl-number.txt
+++ b/Documentation/ioctl/ioctl-number.txt
@@ -319,6 +319,7 @@ Code  Seq#(hex)	Include File		Comments
 					<mailto:vgo@ratio.de>
 0xB1	00-1F	PPPoX			<mailto:mostrows@styx.uwaterloo.ca>
 0xB3	00	linux/mmc/ioctl.h
+0xB4	00-0F	linux/gpio.h		<mailto:linux-gpio@vger.kernel.org>
 0xC0	00-0F	linux/usb/iowarrior.h
 0xCA	00-0F	uapi/misc/cxl.h
 0xCA	80-8F	uapi/scsi/cxlflash_ioctl.h
diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index dfe8ade2742d..d0a3cac72250 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -52,7 +52,7 @@ struct gpioline_info {
 	char consumer[32];
 };
 
-#define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info)
-#define GPIO_GET_LINEINFO_IOCTL _IOWR('o', 0x02, struct gpioline_info)
+#define GPIO_GET_CHIPINFO_IOCTL _IOR(0xB4, 0x01, struct gpiochip_info)
+#define GPIO_GET_LINEINFO_IOCTL _IOWR(0xB4, 0x02, struct gpioline_info)
 
 #endif /* _UAPI_GPIO_H_ */
-- 
2.4.3

