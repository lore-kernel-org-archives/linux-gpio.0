From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 3/3] pinctrl: berlin: make bool drivers explicitly non-modular
Date: Mon, 6 Feb 2017 03:03:52 -0500
Message-ID: <20170206080352.17808-4-paul.gortmaker@windriver.com>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:57061 "EHLO
        mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbdBFIEU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 03:04:20 -0500
In-Reply-To: <20170206080352.17808-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jisheng Zhang <jszhang@marvell.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org

None of the Kconfigs for any of these drivers are tristate,
meaning that they currently are not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: "Antoine Ténart" <antoine.tenart@free-electrons.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jisheng Zhang <jszhang@marvell.com>
Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
Cc: Thomas Hebb <tommyhebb@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/berlin/berlin-bg2.c   | 9 ++-------
 drivers/pinctrl/berlin/berlin-bg2cd.c | 9 ++-------
 drivers/pinctrl/berlin/berlin-bg2q.c  | 9 ++-------
 drivers/pinctrl/berlin/berlin-bg4ct.c | 9 ++-------
 4 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin-bg2.c b/drivers/pinctrl/berlin/berlin-bg2.c
index fabe728ae268..bf2e17d0d6e4 100644
--- a/drivers/pinctrl/berlin/berlin-bg2.c
+++ b/drivers/pinctrl/berlin/berlin-bg2.c
@@ -10,7 +10,7 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -227,7 +227,6 @@ static const struct of_device_id berlin2_pinctrl_match[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, berlin2_pinctrl_match);
 
 static int berlin2_pinctrl_probe(struct platform_device *pdev)
 {
@@ -244,8 +243,4 @@ static struct platform_driver berlin2_pinctrl_driver = {
 		.of_match_table = berlin2_pinctrl_match,
 	},
 };
-module_platform_driver(berlin2_pinctrl_driver);
-
-MODULE_AUTHOR("Antoine Ténart <antoine.tenart@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Berlin BG2 pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(berlin2_pinctrl_driver);
diff --git a/drivers/pinctrl/berlin/berlin-bg2cd.c b/drivers/pinctrl/berlin/berlin-bg2cd.c
index ad8c75861373..9bee7bd1650f 100644
--- a/drivers/pinctrl/berlin/berlin-bg2cd.c
+++ b/drivers/pinctrl/berlin/berlin-bg2cd.c
@@ -10,7 +10,7 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -172,7 +172,6 @@ static const struct of_device_id berlin2cd_pinctrl_match[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, berlin2cd_pinctrl_match);
 
 static int berlin2cd_pinctrl_probe(struct platform_device *pdev)
 {
@@ -189,8 +188,4 @@ static struct platform_driver berlin2cd_pinctrl_driver = {
 		.of_match_table = berlin2cd_pinctrl_match,
 	},
 };
-module_platform_driver(berlin2cd_pinctrl_driver);
-
-MODULE_AUTHOR("Antoine Ténart <antoine.tenart@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Berlin BG2CD pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(berlin2cd_pinctrl_driver);
diff --git a/drivers/pinctrl/berlin/berlin-bg2q.c b/drivers/pinctrl/berlin/berlin-bg2q.c
index cd171aea8ca8..eee6763f114c 100644
--- a/drivers/pinctrl/berlin/berlin-bg2q.c
+++ b/drivers/pinctrl/berlin/berlin-bg2q.c
@@ -10,7 +10,7 @@
  * warranty of any kind, whether express or implied.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -389,7 +389,6 @@ static const struct of_device_id berlin2q_pinctrl_match[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, berlin2q_pinctrl_match);
 
 static int berlin2q_pinctrl_probe(struct platform_device *pdev)
 {
@@ -406,8 +405,4 @@ static struct platform_driver berlin2q_pinctrl_driver = {
 		.of_match_table = berlin2q_pinctrl_match,
 	},
 };
-module_platform_driver(berlin2q_pinctrl_driver);
-
-MODULE_AUTHOR("Antoine Ténart <antoine.tenart@free-electrons.com>");
-MODULE_DESCRIPTION("Marvell Berlin BG2Q pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(berlin2q_pinctrl_driver);
diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index c617ec49e9ed..e6740656ee7c 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -18,7 +18,7 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
@@ -457,7 +457,6 @@ static const struct of_device_id berlin4ct_pinctrl_match[] = {
 	},
 	{}
 };
-MODULE_DEVICE_TABLE(of, berlin4ct_pinctrl_match);
 
 static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 {
@@ -496,8 +495,4 @@ static struct platform_driver berlin4ct_pinctrl_driver = {
 		.of_match_table = berlin4ct_pinctrl_match,
 	},
 };
-module_platform_driver(berlin4ct_pinctrl_driver);
-
-MODULE_AUTHOR("Jisheng Zhang <jszhang@marvell.com>");
-MODULE_DESCRIPTION("Marvell berlin4ct pinctrl driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(berlin4ct_pinctrl_driver);
-- 
2.11.0

