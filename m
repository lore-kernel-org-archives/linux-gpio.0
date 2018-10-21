From: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/6] gpio: gpio-lynxpoint: simplify getting .driver_data
Date: Sun, 21 Oct 2018 21:59:57 +0200
Message-ID: <20181021200002.1472-3-wsa+renesas@sang-engineering.com>
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

We should get 'driver_data' from 'struct device' directly. Going via
platform_device is an unneeded step back and forth.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Build tested only. buildbot is happy.

 drivers/gpio/gpio-lynxpoint.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-lynxpoint.c b/drivers/gpio/gpio-lynxpoint.c
index b5b5e500e72c..ca12d9f96914 100644
--- a/drivers/gpio/gpio-lynxpoint.c
+++ b/drivers/gpio/gpio-lynxpoint.c
@@ -408,8 +408,7 @@ static int lp_gpio_runtime_resume(struct device *dev)
 
 static int lp_gpio_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct lp_gpio *lg = platform_get_drvdata(pdev);
+	struct lp_gpio *lg = dev_get_drvdata(dev);
 	unsigned long reg;
 	int i;
 
-- 
2.19.0
