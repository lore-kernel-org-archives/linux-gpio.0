From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 17/50] pinctrl: spmi-gpio: Use devm_pinctrl_register() for pinctrl registration
Date: Wed, 24 Feb 2016 18:45:42 +0530
Message-ID: <1456319775-3216-18-git-send-email-ldewangan@nvidia.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, corbet@lwn.net, lee@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-mediatek@lists.infradead.org, Laxman Dewangan <ldewangan@nvidia.com>, =?UTF-8?q?Bj=C3=B6rn=20Andersson?= <bjorn.andersson@sonymobile.com>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Lee Jones <lee.jones@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
List-Id: linux-gpio@vger.kernel.org

Use devm_pinctrl_register() for pin control registration and clean
the error path.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Cc: "Bj=C3=B6rn Andersson" <bjorn.andersson@sonymobile.com>
Cc: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Jonas Gorski <jogo@openwrt.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-spmi-gpio.c
index 4e12ded..330e822 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -764,14 +764,14 @@ static int pmic_gpio_probe(struct platform_device=
 *pdev)
 	state->chip.of_gpio_n_cells =3D 2;
 	state->chip.can_sleep =3D false;
=20
-	state->ctrl =3D pinctrl_register(pctrldesc, dev, state);
+	state->ctrl =3D devm_pinctrl_register(dev, pctrldesc, state);
 	if (IS_ERR(state->ctrl))
 		return PTR_ERR(state->ctrl);
=20
 	ret =3D gpiochip_add_data(&state->chip, state);
 	if (ret) {
 		dev_err(state->dev, "can't add gpio chip\n");
-		goto err_chip;
+		return ret;
 	}
=20
 	ret =3D gpiochip_add_pin_range(&state->chip, dev_name(dev), 0, 0, npi=
ns);
@@ -784,8 +784,6 @@ static int pmic_gpio_probe(struct platform_device *=
pdev)
=20
 err_range:
 	gpiochip_remove(&state->chip);
-err_chip:
-	pinctrl_unregister(state->ctrl);
 	return ret;
 }
=20
@@ -794,7 +792,6 @@ static int pmic_gpio_remove(struct platform_device =
*pdev)
 	struct pmic_gpio_state *state =3D platform_get_drvdata(pdev);
=20
 	gpiochip_remove(&state->chip);
-	pinctrl_unregister(state->ctrl);
 	return 0;
 }
=20
--=20
2.1.4
