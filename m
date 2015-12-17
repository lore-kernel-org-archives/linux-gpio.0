From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: revert get() to non-errorprogating behaviour
Date: Thu, 17 Dec 2015 10:21:11 +0100
Message-ID: <1450344071-7169-1-git-send-email-linus.walleij@linaro.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Michael Trimarchi <michael@amarulasolutions.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
List-Id: linux-gpio@vger.kernel.org

commit e20538b82f1ffcc06e68feb117f24f211cff7a4d
"gpio: Propagate errors from chip->get()"
started to propagate errors from the .get() functions since
we can get errors from the infrastructure of e.g. slowbus
GPIO expanders.

However it turns out a bunch of drivers relied on the core
to clamp the value, so we need to revert to the old behaviour
and go over all drivers and fix them to conform to the
expectations of the core before we go back to propagating
the error code.

Cc: stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Reported-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2a91f3287e3b..4e4c3083ae56 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1279,7 +1279,13 @@ static int _gpiod_get_raw_value(const struct gpio_desc *desc)
 	chip = desc->chip;
 	offset = gpio_chip_hwgpio(desc);
 	value = chip->get ? chip->get(chip, offset) : -EIO;
-	value = value < 0 ? value : !!value;
+	/*
+	 * FIXME: fix all drivers to clamp to [0,1] or return negative,
+	 * then change this to:
+	 * value = value < 0 ? value : !!value;
+	 * so we can properly propagate error codes.
+	 */
+	value = !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
 }
-- 
2.4.3
