From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 8/8] Documentation: gpio: Move drivers-on-gpio.txt to driver-api
Date: Fri,  9 Mar 2018 00:40:24 +0100
Message-ID: <20180308234024.24145-9-j.neuschaefer@gmx.net>
References: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180308234024.24145-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>
List-Id: linux-gpio@vger.kernel.org

Move gpio/drivers-on-gpio.txt to driver-api/gpio/drivers-on-gpio.rst and
make sure it builds cleanly as ReST.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---

This patch applies cleanly on top of 93db446a424c ("mtd: nand: move raw
NAND related code to the raw/ subdir")
---
 .../drivers-on-gpio.txt => driver-api/gpio/drivers-on-gpio.rst}      | 1 +
 Documentation/driver-api/gpio/index.rst                              | 1 +
 Documentation/gpio/00-INDEX                                          | 3 ---
 Documentation/gpio/sysfs.txt                                         | 5 ++---
 4 files changed, 4 insertions(+), 6 deletions(-)
 rename Documentation/{gpio/drivers-on-gpio.txt => driver-api/gpio/drivers-on-gpio.rst} (99%)

diff --git a/Documentation/gpio/drivers-on-gpio.txt b/Documentation/driver-api/gpio/drivers-on-gpio.rst
similarity index 99%
rename from Documentation/gpio/drivers-on-gpio.txt
rename to Documentation/driver-api/gpio/drivers-on-gpio.rst
index a3e612f55bc7..7da0c1dd1f7a 100644
--- a/Documentation/gpio/drivers-on-gpio.txt
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -1,3 +1,4 @@
+============================
 Subsystem drivers using GPIO
 ============================
 
diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 2b73ea5a1fbb..6a374ded1287 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -11,6 +11,7 @@ Contents:
    driver
    consumer
    board
+   drivers-on-gpio
    legacy
 
 Core
diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 650cb0696211..17e19a68058f 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -1,7 +1,4 @@
 00-INDEX
 	- This file
-drivers-on-gpio.txt:
-	- Drivers in other subsystems that can use GPIO to provide more
-	  complex functionality.
 sysfs.txt
 	- Information about the GPIO sysfs interface
diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index 6cdeab8650cd..58eeab81f349 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -32,9 +32,8 @@ standard kernels won't know about. And for some tasks, simple userspace
 GPIO drivers could be all that the system really needs.
 
 DO NOT ABUSE SYSFS TO CONTROL HARDWARE THAT HAS PROPER KERNEL DRIVERS.
-PLEASE READ THE DOCUMENT NAMED "drivers-on-gpio.txt" IN THIS DOCUMENTATION
-DIRECTORY TO AVOID REINVENTING KERNEL WHEELS IN USERSPACE. I MEAN IT.
-REALLY.
+PLEASE READ THE DOCUMENT AT Documentation/driver-api/gpio/drivers-on-gpio.rst
+TO AVOID REINVENTING KERNEL WHEELS IN USERSPACE. I MEAN IT. REALLY.
 
 Paths in Sysfs
 --------------
-- 
2.16.1
