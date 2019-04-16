From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH 15/57] docs: gpio: convert it to ReST
Date: Mon, 15 Apr 2019 23:55:40 -0300
Message-ID: <0f2d522a80f96391d3f7b51389d08b4afaedb618.1555382110.git.mchehab+samsung@kernel.org>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1555382110.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The API described at sysfs.txt is deprecated.

Still, as it is still part of the Kernel (and will likely be
there for some time, as we don't simply remove APIs). So,
it makes sense to keep it there.

The conversion of this file is trivial.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/gpio/sysfs.txt | 39 +++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/Documentation/gpio/sysfs.txt b/Documentation/gpio/sysfs.txt
index 58eeab81f349..ec09ffd983e7 100644
--- a/Documentation/gpio/sysfs.txt
+++ b/Documentation/gpio/sysfs.txt
@@ -1,10 +1,12 @@
 GPIO Sysfs Interface for Userspace
 ==================================
 
-THIS ABI IS DEPRECATED, THE ABI DOCUMENTATION HAS BEEN MOVED TO
-Documentation/ABI/obsolete/sysfs-gpio AND NEW USERSPACE CONSUMERS
-ARE SUPPOSED TO USE THE CHARACTER DEVICE ABI. THIS OLD SYSFS ABI WILL
-NOT BE DEVELOPED (NO NEW FEATURES), IT WILL JUST BE MAINTAINED.
+.. warning::
+
+  THIS ABI IS DEPRECATED, THE ABI DOCUMENTATION HAS BEEN MOVED TO
+  Documentation/ABI/obsolete/sysfs-gpio AND NEW USERSPACE CONSUMERS
+  ARE SUPPOSED TO USE THE CHARACTER DEVICE ABI. THIS OLD SYSFS ABI WILL
+  NOT BE DEVELOPED (NO NEW FEATURES), IT WILL JUST BE MAINTAINED.
 
 Refer to the examples in tools/gpio/* for an introduction to the new
 character device ABI. Also see the userspace header in
@@ -51,13 +53,15 @@ The control interfaces are write-only:
 
     /sys/class/gpio/
 
-    	"export" ... Userspace may ask the kernel to export control of
+	"export" ...
+		Userspace may ask the kernel to export control of
 		a GPIO to userspace by writing its number to this file.
 
 		Example:  "echo 19 > export" will create a "gpio19" node
 		for GPIO #19, if that's not requested by kernel code.
 
-    	"unexport" ... Reverses the effect of exporting to userspace.
+	"unexport" ...
+		Reverses the effect of exporting to userspace.
 
 		Example:  "echo 19 > unexport" will remove a "gpio19"
 		node exported using the "export" file.
@@ -67,7 +71,8 @@ and have the following read/write attributes:
 
     /sys/class/gpio/gpioN/
 
-	"direction" ... reads as either "in" or "out". This value may
+	"direction" ...
+		reads as either "in" or "out". This value may
 		normally be written. Writing as "out" defaults to
 		initializing the value as low. To ensure glitch free
 		operation, values "low" and "high" may be written to
@@ -78,7 +83,8 @@ and have the following read/write attributes:
 		it was exported by kernel code that didn't explicitly
 		allow userspace to reconfigure this GPIO's direction.
 
-	"value" ... reads as either 0 (low) or 1 (high). If the GPIO
+	"value" ...
+		reads as either 0 (low) or 1 (high). If the GPIO
 		is configured as an output, this value may be written;
 		any nonzero value is treated as high.
 
@@ -92,14 +98,16 @@ and have the following read/write attributes:
 		file and read the new value or close the file and re-open it
 		to read the value.
 
-	"edge" ... reads as either "none", "rising", "falling", or
+	"edge" ...
+		reads as either "none", "rising", "falling", or
 		"both". Write these strings to select the signal edge(s)
 		that will make poll(2) on the "value" file return.
 
 		This file exists only if the pin can be configured as an
 		interrupt generating input pin.
 
-	"active_low" ... reads as either 0 (false) or 1 (true). Write
+	"active_low" ...
+		reads as either 0 (false) or 1 (true). Write
 		any nonzero value to invert the value attribute both
 		for reading and writing. Existing and subsequent
 		poll(2) support configuration via the edge attribute
@@ -112,11 +120,14 @@ read-only attributes:
 
     /sys/class/gpio/gpiochipN/
 
-    	"base" ... same as N, the first GPIO managed by this chip
+	"base" ...
+		same as N, the first GPIO managed by this chip
 
-    	"label" ... provided for diagnostics (not always unique)
+	"label" ...
+		provided for diagnostics (not always unique)
 
-        "ngpio" ... how many GPIOs this manages (N to N + ngpio - 1)
+	"ngpio" ...
+		how many GPIOs this manages (N to N + ngpio - 1)
 
 Board documentation should in most cases cover what GPIOs are used for
 what purposes. However, those numbers are not always stable; GPIOs on
@@ -129,7 +140,7 @@ the correct GPIO number to use for a given signal.
 Exporting from Kernel code
 --------------------------
 Kernel code can explicitly manage exports of GPIOs which have already been
-requested using gpio_request():
+requested using gpio_request()::
 
 	/* export the GPIO to userspace */
 	int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
-- 
2.20.1
