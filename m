From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [RFC v1 7/9] ARM: keystone_defconfig: enable gpio support
Date: Tue, 26 Nov 2013 21:40:13 +0200
Message-ID: <1385494815-15740-8-git-send-email-grygorii.strashko@ti.com>
References: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1385494815-15740-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Santosh Shilimkar <santosh.shilimkar@ti.com>, linux-gpio@vger.kernel.org, nsekhar@ti.com
Cc: prabhakar.csengg@gmail.com, linux-kernel@vger.kernel.org, davinci-linux-open-source@linux.davincidsp.com, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Enable enable GPIO support for Keystone by setting CONFIG_GPIOLIB and
CONFIG_GPIO_DAVINCI options in keystone_defconfig.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/configs/keystone_defconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/keystone_defconfig b/arch/arm/configs/keystone_defconfig
index 9943e5d..e911f7f 100644
--- a/arch/arm/configs/keystone_defconfig
+++ b/arch/arm/configs/keystone_defconfig
@@ -158,3 +158,6 @@ CONFIG_CRYPTO_DES=y
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_USER_API_SKCIPHER=y
+CONFIG_GPIOLIB=y
+CONFIG_GPIO_SYSFS=y
+CONFIG_GPIO_DAVINCI=y
-- 
1.7.9.5
