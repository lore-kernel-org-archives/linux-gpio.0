From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] gpiolib: Fix potential Spectre v1 vulnerabilities
Date: Mon, 17 Dec 2018 15:34:30 -0600
Message-ID: <20181217213430.GA28450@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-gpio@vger.kernel.org

offset and lineinfo.line_offset are indirectly controlled by user-space,
hence leading to a potential exploitation of the Spectre variant 1
vulnerability.

This issue was detected with the help of Smatch:

drivers/gpio/gpiolib.c:580 linehandle_create() warn: potential spectre issue 'gdev->descs' [r] (local cap)
drivers/gpio/gpiolib.c:927 lineevent_create() warn: potential spectre issue 'gdev->descs' [r] (local cap)
drivers/gpio/gpiolib.c:1053 gpio_ioctl() warn: potential spectre issue 'gdev->descs' [r] (local cap)

Fix this by sanitizing both offset and lineinfo.line_offset before
using them to index gdev->descs.

Notice that given that speculation windows are large, the policy is
to kill the speculation on the first load and not worry if it can be
completed with a dependent load/store [1].

[1] https://marc.info/?l=linux-kernel&m=152449131114778&w=2

Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fc36dc358716..73a0a550162e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -29,6 +29,8 @@
 #include <linux/timekeeping.h>
 #include <uapi/linux/gpio.h>
 
+#include <linux/nospec.h>
+
 #include "gpiolib.h"
 
 #define CREATE_TRACE_POINTS
@@ -576,6 +578,7 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 			ret = -EINVAL;
 			goto out_free_descs;
 		}
+		offset = array_index_nospec(offset, gdev->ngpio);
 
 		desc = &gdev->descs[offset];
 		ret = gpiod_request(desc, lh->label);
@@ -910,6 +913,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		ret = -EINVAL;
 		goto out_free_label;
 	}
+	offset = array_index_nospec(offset, gdev->ngpio);
 
 	/* Return an error if a unknown flag is set */
 	if ((lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS) ||
@@ -1049,6 +1053,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 			return -EFAULT;
 		if (lineinfo.line_offset >= gdev->ngpio)
 			return -EINVAL;
+		lineinfo.line_offset = array_index_nospec(lineinfo.line_offset,
+							  gdev->ngpio);
 
 		desc = &gdev->descs[lineinfo.line_offset];
 		if (desc->name) {
-- 
2.19.2
