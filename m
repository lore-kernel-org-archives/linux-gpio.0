From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] Documentation: gpiolib: add 00-INDEX file
Date: Sat, 23 Nov 2013 19:32:20 +0900
Message-ID: <1385202740-8733-1-git-send-email-acourbot@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Rob Landley <rob@landley.net>
Cc: linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

Give a short overview of the various GPIO documentation files.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpio/00-INDEX | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 Documentation/gpio/00-INDEX

diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
new file mode 100644
index 0000000..1de43ae
--- /dev/null
+++ b/Documentation/gpio/00-INDEX
@@ -0,0 +1,14 @@
+00-INDEX
+	- This file
+gpio.txt
+	- Introduction to GPIOs and their kernel interfaces
+consumer.txt
+	- How to obtain and use GPIOs in a driver
+driver.txt
+	- How to write a GPIO driver
+board.txt
+	- How to assign GPIOs to a consumer device and a function
+sysfs.txt
+	- Information about the GPIO sysfs interface
+gpio-legacy.txt
+	- Historical documentation of the deprecated GPIO integer interface
-- 
1.8.4.2
