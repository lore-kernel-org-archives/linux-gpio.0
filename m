From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.0 77/98] gpio: of: Check propname before applying "cs-gpios" quirks
Date: Mon, 22 Apr 2019 15:41:44 -0400
Message-ID: <20190422194205.10404-77-sashal@kernel.org>
References: <20190422194205.10404-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190422194205.10404-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, linux-gpio@vger.kernel.org, Sasha Levin <sashal@kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Andrey Smirnov <andrew.smirnov@gmail.com>

[ Upstream commit e5545c94e43b8f6599ffc01df8d1aedf18ee912a ]

SPI GPIO device has more than just "cs-gpio" property in its node and
would request those GPIOs as a part of its initialization. To avoid
applying CS-specific quirk to all of them add a check to make sure
that propname is "cs-gpios".

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin (Microsoft) <sashal@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a1dd2f1c0d02..9470563f2506 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -119,7 +119,8 @@ static void of_gpio_flags_quirks(struct device_node *np,
 	 * to determine if the flags should have inverted semantics.
 	 */
 	if (IS_ENABLED(CONFIG_SPI_MASTER) &&
-	    of_property_read_bool(np, "cs-gpios")) {
+	    of_property_read_bool(np, "cs-gpios") &&
+	    !strcmp(propname, "cs-gpios")) {
 		struct device_node *child;
 		u32 cs;
 		int ret;
-- 
2.19.1
