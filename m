From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: amd: avoid maybe-uninitalized warning
Date: Wed, 11 Jan 2017 15:36:56 +0100
Message-ID: <20170111143712.510147-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Agrawal, Nitesh-kumar" <Nitesh-kumar.Agrawal@amd.com>, Pankaj Sen <Pankaj.Sen@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>, Shyam-sundar S-k <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Since gpio_dev->hwbank_num is now a variable, the compiler cannot
figure out if pin_num is initialized at all:

drivers/pinctrl/pinctrl-amd.c: In function 'amd_gpio_dbg_show':
drivers/pinctrl/pinctrl-amd.c:210:3: warning: 'pin_num' may be used uninitialized in this function [-Wmaybe-uninitialized]
   for (; i < pin_num; i++) {
   ^~~
drivers/pinctrl/pinctrl-amd.c:172:21: warning: 'i' may be used uninitialized in this function [-Wmaybe-uninitialized]

This adds a 'default' statement to make that case well-defined.

Fixes: 3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/pinctrl-amd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 7b95c1886f7b..9495e6eb76d1 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -206,6 +206,8 @@ static void amd_gpio_dbg_show(struct seq_file *s, struct gpio_chip *gc)
 			i = 192;
 			pin_num = AMD_GPIO_PINS_BANK3 + i;
 			break;
+		default:
+			return;
 		}
 		for (; i < pin_num; i++) {
 			seq_printf(s, "pin%d\t", i);
-- 
2.9.0
