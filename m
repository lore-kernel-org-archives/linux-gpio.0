From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/5] pinctrl: intel: pinctrl-cherryview: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:28 +0200
Message-ID: <20181021200032.1833-3-wsa+renesas@sang-engineering.com>
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

 drivers/pinctrl/intel/pinctrl-cherryview.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 9b0f4b9ef482..f685abef68c3 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1744,8 +1744,7 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int chv_pinctrl_suspend_noirq(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
 	unsigned long flags;
 	int i;
 
@@ -1778,8 +1777,7 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 
 static int chv_pinctrl_resume_noirq(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct chv_pinctrl *pctrl = platform_get_drvdata(pdev);
+	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
 	unsigned long flags;
 	int i;
 
-- 
2.19.0
