From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH trivial] gpio: uapi: Grammar s/array/array of/
Date: Tue, 11 Sep 2018 16:32:43 +0200
Message-ID: <20180911143243.8860-1-geert+renesas@glider.be>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Jiri Kosina <trivial@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index 1bf6e6df084b8a18..4ebfe0ac6c5b942e 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -65,7 +65,7 @@ struct gpioline_info {
 
 /**
  * struct gpiohandle_request - Information about a GPIO handle request
- * @lineoffsets: an array desired lines, specified by offset index for the
+ * @lineoffsets: an array of desired lines, specified by offset index for the
  * associated GPIO device
  * @flags: desired flags for the desired GPIO lines, such as
  * GPIOHANDLE_REQUEST_OUTPUT, GPIOHANDLE_REQUEST_ACTIVE_LOW etc, OR:ed
-- 
2.17.1
