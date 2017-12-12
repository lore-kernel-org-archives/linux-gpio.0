From: Brian Norris <briannorris@chromium.org>
Subject: [PATCH] pinctrl: rockchip: enable clock when reading pin direction register
Date: Tue, 12 Dec 2017 09:43:43 -0800
Message-ID: <20171212174343.192017-1-briannorris@chromium.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:45520 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752323AbdLLRo1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Dec 2017 12:44:27 -0500
Received: by mail-it0-f67.google.com with SMTP id z6so311403iti.4
        for <linux-gpio@vger.kernel.org>; Tue, 12 Dec 2017 09:44:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>

We generally leave the GPIO clock disabled, unless an interrupt is
requested or we're accessing IO registers. We forgot to do this for the
->get_direction() callback, which means we can sometimes [1] get
incorrect results [2] from, e.g., /sys/kernel/debug/gpio.

Enable the clock, so we get the right results!

[1] Sometimes, because many systems have 1 or mor interrupt requested on
each GPIO bank, so they always leave their clock on.

[2] Incorrect, meaning the register returns 0, and so we interpret that
as "input".

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
 drivers/pinctrl/pinctrl-rockchip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 2ba17548ad5b..073de6a9ed34 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2014,8 +2014,16 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct rockchip_pin_bank *bank = gpiochip_get_data(chip);
 	u32 data;
+	int ret;
 
+	ret = clk_enable(bank->clk);
+	if (ret < 0) {
+		dev_err(bank->drvdata->dev,
+			"failed to enable clock for bank %s\n", bank->name);
+		return ret;
+	}
 	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
+	clk_disable(bank->clk);
 
 	return !(data & BIT(offset));
 }
-- 
2.15.1.424.g9478a66081-goog

