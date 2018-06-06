From: Rafael David Tinoco <rafael.tinoco@linaro.org>
Subject: [PATCH] selftests: gpio: gpio-mockup-chardev GPIOHANDLE_REQUEST_OUTPUT fix
Date: Wed,  6 Jun 2018 14:44:24 -0300
Message-ID: <20180606174424.9630-1-rafael.tinoco@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bamv2005@gmail.com
Cc: brgl@bgdev.pl, shuah@kernel.org, linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, rafael.tinoco@linaro.org
List-Id: linux-gpio@vger.kernel.org

Following logic from commit: 22f6592b23, GPIOHANDLE_REQUEST_OUTPUT
should handle errors same way as GPIOHANDLE_REQUEST_INPUT does, or else
the following error occurs:

gpio-mockup-chardev: gpio<gpiochip1> line<0> test flag<0x2> value<0>: No
such file or directory

despite the real result of gpio_pin_test(), gpio_debugfs_get() and
gpiotools_request_linehandle() functions.

Signed-off-by: Rafael David Tinoco <rafael.tinoco@linaro.org>
---
 tools/testing/selftests/gpio/gpio-mockup-chardev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
index 667e916fa7cc..f8d468f54e98 100644
--- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
+++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
@@ -225,10 +225,10 @@ int gpio_pin_test(struct gpiochip_info *cinfo, int line, int flag, int value)
 		if (flag & GPIOHANDLE_REQUEST_ACTIVE_LOW)
 			debugfs_value = !debugfs_value;
 
-		if (!(debugfs_dir == OUT && value == debugfs_value))
+		if (!(debugfs_dir == OUT && value == debugfs_value)) {
 			errno = -EINVAL;
-		ret = -errno;
-
+			ret = -errno;
+		}
 	}
 	gpiotools_release_linehandle(fd);
 
-- 
2.17.1
