From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 4/5] pinctrl: pinctrl-amd: simplify getting .driver_data
Date: Sun, 21 Oct 2018 22:00:30 +0200
Message-ID: <20181021200032.1833-5-wsa+renesas@sang-engineering.com>
References: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021200032.1833-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/pinctrl/pinctrl-amd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 67718b0f978d..2a7d638978d8 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -791,8 +791,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 
 static int amd_gpio_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
+	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
@@ -810,8 +809,7 @@ static int amd_gpio_suspend(struct device *dev)
 
 static int amd_gpio_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
+	struct amd_gpio *gpio_dev = dev_get_drvdata(dev);
 	struct pinctrl_desc *desc = gpio_dev->pctrl->desc;
 	int i;
 
-- 
2.19.0
