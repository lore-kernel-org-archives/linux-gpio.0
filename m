From: Colin King <colin.king@canonical.com>
Subject: [PATCH][pinctrl-next] pinctrl/amd: make functions amd_gpio_suspend and amd_gpio_resume static
Date: Wed, 13 Sep 2017 17:15:01 +0100
Message-ID: <20170913161501.7356-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Daniel Drake <drake@endlessm.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions amd_gpio_suspend and amd_gpio_resume are local to the
source and do not need to be in global scope, so make them static.

Cleans up sparse warnings:
symbol 'amd_gpio_suspend' was not declared. Should it be static?
symbol 'amd_gpio_resume' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 3f6b34febbf1..d10d280ab1c9 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -745,7 +745,7 @@ static bool amd_gpio_should_save(struct amd_gpio *gpio_dev, unsigned int pin)
 	return false;
 }
 
-int amd_gpio_suspend(struct device *dev)
+static int amd_gpio_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
@@ -764,7 +764,7 @@ int amd_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-int amd_gpio_resume(struct device *dev)
+static int amd_gpio_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct amd_gpio *gpio_dev = platform_get_drvdata(pdev);
-- 
2.14.1
