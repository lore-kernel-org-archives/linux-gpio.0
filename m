From: Brian Masney <masneyb@onstation.org>
Subject: [PATCH -next 3/3] qcom: ssbi-gpio: correct boundary conditions in pm8xxx_domain_translate
Date: Wed, 13 Feb 2019 20:36:41 -0500
Message-ID: <20190214013641.9740-3-masneyb@onstation.org>
References: <20190214013641.9740-1-masneyb@onstation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214013641.9740-1-masneyb@onstation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: sboyd@kernel.org, lee.jones@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

SSBI GPIOs are numbered 1..ngpio, so the boundary check in
pm8xxx_domain_translate() is off by one. This patch corrects that check.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Originally found by Bjorn Andersson in spmi-gpio.

Linus: For your ib-qcom-ssbi branch.

 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
index 84a232450000..10575d6e2ba5 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -710,7 +710,8 @@ static int pm8xxx_domain_translate(struct irq_domain *domain,
 	struct pm8xxx_gpio *pctrl = container_of(domain->host_data,
 						 struct pm8xxx_gpio, chip);
 
-	if (fwspec->param_count != 2 || fwspec->param[0] >= pctrl->chip.ngpio)
+	if (fwspec->param_count != 2 || fwspec->param[0] < 1 ||
+	    fwspec->param[0] > pctrl->chip.ngpio)
 		return -EINVAL;
 
 	*hwirq = fwspec->param[0] - PM8XXX_GPIO_PHYSICAL_OFFSET;
-- 
2.17.2
