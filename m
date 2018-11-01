From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] pinctrl: max77620: Use define directive for max77620_pinconf_param values
Date: Wed, 31 Oct 2018 17:50:21 -0700
Message-ID: <20181101005021.8393-1-natechancellor@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <natechancellor@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Clang warns when one enumerated type is implicitly converted to another:

drivers/pinctrl/pinctrl-max77620.c:56:12: warning: implicit conversion
from enumeration type 'enum max77620_pinconf_param' to different
enumeration type 'enum pin_config_param' [-Wenum-conversion]
                .param = MAX77620_ACTIVE_FPS_SOURCE,
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~

It is expected that pinctrl drivers can extend pin_config_param because
of the gap between PIN_CONFIG_END and PIN_CONFIG_MAX so this conversion
isn't an issue. Most drivers that take advantage of this define the
PIN_CONFIG variables as constants, rather than enumerated values. Do the
same thing here so that Clang no longer warns.

Link: https://github.com/ClangBuiltLinux/linux/issues/139
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/pinctrl/pinctrl-max77620.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-max77620.c b/drivers/pinctrl/pinctrl-max77620.c
index a7f37063518e..3d05bc1937d4 100644
--- a/drivers/pinctrl/pinctrl-max77620.c
+++ b/drivers/pinctrl/pinctrl-max77620.c
@@ -34,14 +34,12 @@ enum max77620_pin_ppdrv {
 	MAX77620_PIN_PP_DRV,
 };
 
-enum max77620_pinconf_param {
-	MAX77620_ACTIVE_FPS_SOURCE = PIN_CONFIG_END + 1,
-	MAX77620_ACTIVE_FPS_POWER_ON_SLOTS,
-	MAX77620_ACTIVE_FPS_POWER_DOWN_SLOTS,
-	MAX77620_SUSPEND_FPS_SOURCE,
-	MAX77620_SUSPEND_FPS_POWER_ON_SLOTS,
-	MAX77620_SUSPEND_FPS_POWER_DOWN_SLOTS,
-};
+#define MAX77620_ACTIVE_FPS_SOURCE		(PIN_CONFIG_END + 1)
+#define MAX77620_ACTIVE_FPS_POWER_ON_SLOTS	(PIN_CONFIG_END + 2)
+#define MAX77620_ACTIVE_FPS_POWER_DOWN_SLOTS	(PIN_CONFIG_END + 3)
+#define MAX77620_SUSPEND_FPS_SOURCE		(PIN_CONFIG_END + 4)
+#define MAX77620_SUSPEND_FPS_POWER_ON_SLOTS	(PIN_CONFIG_END + 5)
+#define MAX77620_SUSPEND_FPS_POWER_DOWN_SLOTS	(PIN_CONFIG_END + 6)
 
 struct max77620_pin_function {
 	const char *name;
-- 
2.19.1
