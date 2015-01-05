From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] pinctrl: dove: Constify struct regmap_config and
 of_device_id
Date: Mon, 05 Jan 2015 10:03:09 +0100
Message-ID: <1420448590-9503-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Wolfram Sang <wsa@the-dreams.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The regmap_config struct may be const because it is not modified by the
driver and regmap_init() accepts pointer to const. Make also
of_device_id array const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/pinctrl/mvebu/pinctrl-dove.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-dove.c b/drivers/pinctrl/mvebu/pinctrl-dove.c
index 89a52e15f0ae..95bfd0653e8f 100644
--- a/drivers/pinctrl/mvebu/pinctrl-dove.c
+++ b/drivers/pinctrl/mvebu/pinctrl-dove.c
@@ -751,12 +751,12 @@ static struct mvebu_pinctrl_soc_info dove_pinctrl_info = {
 
 static struct clk *clk;
 
-static struct of_device_id dove_pinctrl_of_match[] = {
+static const struct of_device_id dove_pinctrl_of_match[] = {
 	{ .compatible = "marvell,dove-pinctrl", .data = &dove_pinctrl_info },
 	{ }
 };
 
-static struct regmap_config gc_regmap_config = {
+static const struct regmap_config gc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-- 
1.9.1
