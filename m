From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH 3/8] Documentation: gpio: Move introduction to driver-api
Date: Fri,  9 Mar 2018 00:40:19 +0100
Message-ID: <20180308234024.24145-4-j.neuschaefer@gmx.net>
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

Move gpio/intro.txt to driver-api/gpio/intro.rst and make sure it builds
cleanly as ReST.

Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/driver-api/gpio/index.rst                    | 7 +++++++
 Documentation/{gpio/gpio.txt => driver-api/gpio/intro.rst} | 9 +++++++--
 Documentation/gpio/00-INDEX                                | 2 --
 3 files changed, 14 insertions(+), 4 deletions(-)
 rename Documentation/{gpio/gpio.txt => driver-api/gpio/intro.rst} (96%)

diff --git a/Documentation/driver-api/gpio/index.rst b/Documentation/driver-api/gpio/index.rst
index 6dd4aa647f27..db47d845f473 100644
--- a/Documentation/driver-api/gpio/index.rst
+++ b/Documentation/driver-api/gpio/index.rst
@@ -2,6 +2,13 @@
 General Purpose Input/Output (GPIO)
 ===================================
 
+Contents:
+
+.. toctree::
+   :maxdepth: 2
+
+   intro
+
 Core
 ====
 
diff --git a/Documentation/gpio/gpio.txt b/Documentation/driver-api/gpio/intro.rst
similarity index 96%
rename from Documentation/gpio/gpio.txt
rename to Documentation/driver-api/gpio/intro.rst
index cd9b356e88cd..74591489d0b5 100644
--- a/Documentation/gpio/gpio.txt
+++ b/Documentation/driver-api/gpio/intro.rst
@@ -1,3 +1,8 @@
+============
+Introduction
+============
+
+
 GPIO Interfaces
 ===============
 
@@ -9,9 +14,9 @@ Due to the history of GPIO interfaces in the kernel, there are two different
 ways to obtain and use GPIOs:
 
   - The descriptor-based interface is the preferred way to manipulate GPIOs,
-and is described by all the files in this directory excepted gpio-legacy.txt.
+    and is described by all the files in this directory excepted gpio-legacy.txt.
   - The legacy integer-based interface which is considered deprecated (but still
-usable for compatibility reasons) is documented in gpio-legacy.txt.
+    usable for compatibility reasons) is documented in gpio-legacy.txt.
 
 The remainder of this document applies to the new descriptor-based interface.
 gpio-legacy.txt contains the same information applied to the legacy
diff --git a/Documentation/gpio/00-INDEX b/Documentation/gpio/00-INDEX
index 179beb234f98..52fe0fa6c964 100644
--- a/Documentation/gpio/00-INDEX
+++ b/Documentation/gpio/00-INDEX
@@ -1,7 +1,5 @@
 00-INDEX
 	- This file
-gpio.txt
-	- Introduction to GPIOs and their kernel interfaces
 consumer.txt
 	- How to obtain and use GPIOs in a driver
 driver.txt
-- 
2.16.1
