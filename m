From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/5] pinctrl: intel: pinctrl-baytrail: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:27 +0200
Message-ID: <20181021200032.1833-2-wsa+renesas@sang-engineering.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/pinctrl/intel/pinctrl-baytrail.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 6d1a43c0c251..a1c2548123a1 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1838,8 +1838,7 @@ static int byt_pinctrl_probe(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int byt_gpio_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct byt_gpio *vg = platform_get_drvdata(pdev);
+	struct byt_gpio *vg = dev_get_drvdata(dev);
 	int i;
 
 	for (i = 0; i < vg->soc_data->npins; i++) {
@@ -1867,8 +1866,7 @@ static int byt_gpio_suspend(struct device *dev)
 
 static int byt_gpio_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct byt_gpio *vg = platform_get_drvdata(pdev);
+	struct byt_gpio *vg = dev_get_drvdata(dev);
 	int i;
 
 	for (i = 0; i < vg->soc_data->npins; i++) {
-- 
2.19.0
