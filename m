From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC v1 9/9] ARM: keystone_defconfig: enable LED support
Date: Tue, 26 Nov 2013 21:40:15 +0200
Message-ID: <1385494815-15740-10-git-send-email-grygorii.strashko@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, nsekhar@ti.com
Cc: prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

The Keystone GPIO functionality is ready for use, so LED support can be
enabled in config.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/configs/keystone_defconfig |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index e911f7f..fb1eb8a 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -161,3 +161,11 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_DAVINCI=y
+CONFIG_LEDS_CLASS=y
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=y
+CONFIG_LEDS_TRIGGER_GPIO=y
-- 
1.7.9.5
