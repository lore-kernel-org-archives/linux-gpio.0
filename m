From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpiolib: don't allow OPEN_DRAIN & OPEN_SOURCE flags for input
Date: Mon, 16 Oct 2017 11:32:30 +0200
Message-ID: <20171016093230.5329-3-brgl@bgdev.pl>
References: <20171016093230.5329-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171016093230.5329-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

OPEN_DRAIN and OPEN_SOURCE flags only affect the way we drive a GPIO
line, so they only make sense for output mode. Just as we only allow
input mode for event handle requests, don't allow passing open-drain
and open-source flags for any other mode than explicit output.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpiolib.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5d98345c9dc8..eac86ead6cfa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -457,6 +457,12 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
 	if (lflags & ~GPIOHANDLE_REQUEST_VALID_FLAGS)
 		return -EINVAL;
 
+	/* OPEN_DRAIN and OPEN_SOURCE flags only make sense for output mode. */
+	if (!(lflags & GPIOHANDLE_REQUEST_OUTPUT) &&
+	    ((lflags & GPIOHANDLE_REQUEST_OPEN_DRAIN) ||
+	     (lflags & GPIOHANDLE_REQUEST_OPEN_SOURCE)))
+		return -EINVAL;
+
 	lh = kzalloc(sizeof(*lh), GFP_KERNEL);
 	if (!lh)
 		return -ENOMEM;
-- 
2.13.2
