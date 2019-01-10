From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/2] ARM: config: spear3xx: Activate PL111 DRM driver
Date: Thu, 10 Jan 2019 15:39:17 +0100
Message-ID: <20190110143917.9054-2-linus.walleij@linaro.org>
References: <20190110143917.9054-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110143917.9054-1-linus.walleij@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Viresh Kumar <viresh.linux@gmail.com>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-gpio@vger.kernel.org

This disables the old FBDEV driver and enables the PL111
DRM driver on the SPEAr3xx.

There are some device trees in the kernel that switches
the DT node for the PL110 to "okay" but none of these
have any display defined, so we can safely switch to this
driver before we get any users starting to define
displays. Let them do it on top of the new driver
infrastructure instead.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/configs/spear3xx_defconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/spear3xx_defconfig b/arch/arm/configs/spear3xx_defconfig
index 6753b373bee8..c42e3204e2fa 100644
--- a/arch/arm/configs/spear3xx_defconfig
+++ b/arch/arm/configs/spear3xx_defconfig
@@ -50,8 +50,10 @@ CONFIG_GPIO_PL061=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
-CONFIG_FB=y
-CONFIG_FB_ARMCLCD=y
+CONFIG_DRM=y
+CONFIG_DRM_PL111=y
+CONFIG_BACKLIGHT_LCD_SUPPORT=y
+CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.19.2
