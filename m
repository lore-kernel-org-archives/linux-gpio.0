From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 2/3] pinctrl: msm: Mux out gpio function with gpio_request()
Date: Wed, 25 Jul 2018 15:28:59 -0700
Message-ID: <20180725222900.33231-3-swboyd@chromium.org>
References: <20180725222900.33231-1-swboyd@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180725222900.33231-1-swboyd@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Doug Anderson <dianders@chromium.org>
List-Id: linux-gpio@vger.kernel.org

We rely on devices to use pinmuxing configurations in DT to select the
GPIO function (function 0) if they're going to use the gpio in GPIO
mode. Let's simplify things for driver authors by implementing
gpio_request_enable() for this pinctrl driver to mux out the GPIO
function when the gpio is use from gpiolib.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Changes from v1:
 * None

 drivers/pinctrl/qcom/pinctrl-msm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 3970dc599092..1d7367149268 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -176,11 +176,27 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
+				   struct pinctrl_gpio_range *range,
+				   unsigned offset)
+{
+	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+	const struct msm_pingroup *g = &pctrl->soc->groups[offset];
+
+	/* No funcs? Probably ACPI so can't do anything here */
+	if (!g->nfuncs)
+		return 0;
+
+	/* For now assume function 0 is GPIO because it always is */
+	return msm_pinmux_set_mux(pctldev, 0, offset);
+}
+
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
 	.get_functions_count	= msm_get_functions_count,
 	.get_function_name	= msm_get_function_name,
 	.get_function_groups	= msm_get_function_groups,
+	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
 
-- 
Sent by a computer through tubes
