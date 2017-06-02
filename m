From: Scott Branden <scott.branden@broadcom.com>
Subject: [PATCH 1/1] pinctrl: bcm: cleanup Broadcom license headers
Date: Fri,  2 Jun 2017 11:52:21 -0700
Message-ID: <1496429541-5348-1-git-send-email-scott.branden@broadcom.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36633 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751007AbdFBSwg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Jun 2017 14:52:36 -0400
Received: by mail-qk0-f176.google.com with SMTP id p66so49950335qkf.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Jun 2017 11:52:35 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>
Cc: BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>, Scott Branden <scott.branden@broadcom.com>

Use consistent license headers for Broadcom files by
placing additional comments outside of standard legal header.

Also, update legal header to 2017 format as "Broadcom Corporation"
has changed to "Broadcom".

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c   | 9 ++-------
 drivers/pinctrl/bcm/pinctrl-cygnus-mux.c | 9 +++++----
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c | 6 ++++--
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c   | 6 ++++--
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index e630f4d..a7cceff 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -1,11 +1,5 @@
 /*
- * Broadcom BCM281xx pinctrl driver
- *
- * Author(s):
- *	Sherman Yin <syin@broadcom.com>
- *	Broadcom Corporation <bcm-kernel-feedback-list@broadcom.com>
- *
- * Copyright (C) 2013 Broadcom Corporation
+ * Copyright (C) 2013-2017 Broadcom
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -16,6 +10,7 @@
  * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  */
+
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/init.h>
diff --git a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
index 3684cca..44df359 100644
--- a/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
+++ b/drivers/pinctrl/bcm/pinctrl-cygnus-mux.c
@@ -1,8 +1,5 @@
 /*
- * Broadcom Cygnus IOMUX driver
- *
- * Author: Ray Jui <rjui@broadcom.com>
- * Copyright (C) 2014-2015 Broadcom Corporation
+ * Copyright (C) 2014-2017 Broadcom
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -12,6 +9,10 @@
  * kind, whether express or implied; without even the implied warranty
  * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
+ */
+
+/*
+ * Broadcom Cygnus IOMUX driver
  *
  * This file contains the Cygnus IOMUX driver that supports group based PINMUX
  * configuration. Although PINMUX configuration is mainly group based, the
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index af5e904..85a8c97 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2014-2015 Broadcom Corporation
+ * Copyright (C) 2014-2017 Broadcom
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -9,7 +9,9 @@
  * kind, whether express or implied; without even the implied warranty
  * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
+ */
+
+/*
  * This file contains the Broadcom Iproc GPIO driver that supports 3
  * GPIO controllers on Iproc including the ASIU GPIO controller, the
  * chipCommonG GPIO controller, and the always-on GPIO controller. Basic
diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 2244243..1cfe45f 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -1,5 +1,5 @@
 /*
- * Copyright (C) 2015 Broadcom Corporation
+ * Copyright (C) 2014-2017 Broadcom
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License as
@@ -9,7 +9,9 @@
  * kind, whether express or implied; without even the implied warranty
  * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
+ */
+
+/*
  * This file contains the Broadcom Northstar Plus (NSP) GPIO driver that
  * supports the chipCommonA GPIO controller. Basic PINCONF such as bias,
  * pull up/down, slew and drive strength are also supported in this driver.
-- 
2.5.0

