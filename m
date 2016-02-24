From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 18/50] pinctrl: spmi: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:45:43 +0530
Message-ID: <1456319775-3216-19-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, Bjorn Andersson <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and clean
the error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jonas Gorski <jogo@openwrt.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-mpp.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
index 2a3e549..418367e 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-mpp.c
@@ -877,14 +877,14 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 	state->chip.of_gpio_n_cells = 2;
 	state->chip.can_sleep = false;
 
-	state->ctrl = pinctrl_register(pctrldesc, dev, state);
+	state->ctrl = devm_pinctrl_register(dev, pctrldesc, state);
 	if (IS_ERR(state->ctrl))
 		return PTR_ERR(state->ctrl);
 
 	ret = gpiochip_add_data(&state->chip, state);
 	if (ret) {
 		dev_err(state->dev, "can't add gpio chip\n");
-		goto err_chip;
+		return ret;
 	}
 
 	ret = gpiochip_add_pin_range(&state->chip, dev_name(dev), 0, 0, npins);
@@ -897,8 +897,6 @@ static int pmic_mpp_probe(struct platform_device *pdev)
 
 err_range:
 	gpiochip_remove(&state->chip);
-err_chip:
-	pinctrl_unregister(state->ctrl);
 	return ret;
 }
 
@@ -907,7 +905,6 @@ static int pmic_mpp_remove(struct platform_device *pdev)
 	struct pmic_mpp_state *state = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&state->chip);
-	pinctrl_unregister(state->ctrl);
 	return 0;
 }
 
-- 
2.1.4
