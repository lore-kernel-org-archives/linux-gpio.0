From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH] drivers/pinctrl: make mediatek/pinctrl-mt8* driver explicitly
 non-modular
Date: Mon, 4 Jan 2016 12:44:10 -0500
Message-ID: <1451929450-18150-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-gpio@vger.kernel.org

The Kconfig for these drivers are currently:

config PINCTRL_MT8127
        bool "Mediatek MT8127 pin control" if COMPILE_TEST && !MACH_MT8127

config PINCTRL_MT8135
        bool "Mediatek MT8135 pin control" if COMPILE_TEST && !MACH_MT8135

config PINCTRL_MT8173
        bool "Mediatek MT8173 pin control"

...meaning that they are currently not being built as a module by anyone.
Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

A recent commit moved these from module_init to arch_initcall already, so
the init ordering remains untouched with this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Signed-off-by: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
---

[The "recent commit" is 6c741c74092c61465af206672ba567940a23d709
 "pinctrl: mediatek: convert to arch_initcall" but since I was not
 sure if the pinctrl branch ever got rebased, I avoided referencing
 the commit by what might be a transient SHA directly.]

 drivers/pinctrl/mediatek/pinctrl-mt8127.c | 8 +-------
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 8 +-------
 drivers/pinctrl/mediatek/pinctrl-mt8173.c | 8 +-------
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index 98e0bebfdf92..d76491574841 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -13,7 +13,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -336,7 +336,6 @@ static const struct of_device_id mt8127_pctrl_match[] = {
 	{ .compatible = "mediatek,mt8127-pinctrl", },
 	{ }
 };
-MODULE_DEVICE_TABLE(of, mt8127_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt8127_pinctrl_probe,
@@ -350,9 +349,4 @@ static int __init mtk_pinctrl_init(void)
 {
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
-
 arch_initcall(mtk_pinctrl_init);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("MediaTek MT8127 Pinctrl Driver");
-MODULE_AUTHOR("Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index 1c153b860f36..d8c645f16f21 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -351,7 +351,6 @@ static const struct of_device_id mt8135_pctrl_match[] = {
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, mt8135_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt8135_pinctrl_probe,
@@ -365,9 +364,4 @@ static int __init mtk_pinctrl_init(void)
 {
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
-
 arch_initcall(mtk_pinctrl_init);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MediaTek Pinctrl Driver");
-MODULE_AUTHOR("Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
index a62514eb2129..8bfd427b9135 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
@@ -12,7 +12,7 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -378,7 +378,6 @@ static const struct of_device_id mt8173_pctrl_match[] = {
 	},
 	{ }
 };
-MODULE_DEVICE_TABLE(of, mt8173_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
 	.probe = mt8173_pinctrl_probe,
@@ -393,9 +392,4 @@ static int __init mtk_pinctrl_init(void)
 {
 	return platform_driver_register(&mtk_pinctrl_driver);
 }
-
 arch_initcall(mtk_pinctrl_init);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("MediaTek Pinctrl Driver");
-MODULE_AUTHOR("Hongzhou Yang <hongzhou.yang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
-- 
2.6.1
