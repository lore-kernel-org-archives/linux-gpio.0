From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5.0 080/101] gpio: of: Check propname before applying "cs-gpios" quirks
Date: Thu,  2 May 2019 17:21:22 +0200
Message-ID: <20190502143345.235274686@linuxfoundation.org>
References: <20190502143339.434882399@linuxfoundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190502143339.434882399@linuxfoundation.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, linux-gpio@vger.kernel.org, "Sasha Levin (Microsoft)" <sashal@kernel.org>
List-Id: linux-gpio@vger.kernel.org

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
