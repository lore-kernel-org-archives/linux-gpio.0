From: Alexandre Torgue <alexandre.torgue@st.com>
Subject: [PATCH 2/2] pinctrl: stm32: Enable suspend/resume for stm32mp157c SoC
Date: Fri, 10 May 2019 09:42:30 +0200
Message-ID: <1557474150-19618-3-git-send-email-alexandre.torgue@st.com>
References: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557474150-19618-1-git-send-email-alexandre.torgue@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@st.com
List-Id: linux-gpio@vger.kernel.org

Apply suspend/resume management for stm32mp157c MPU.

Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
index 320544f..2ccb99d 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32mp157.c
@@ -2342,11 +2342,16 @@ static const struct of_device_id stm32mp157_pctrl_match[] = {
 	{ }
 };
 
+static const struct dev_pm_ops stm32_pinctrl_dev_pm_ops = {
+	 SET_LATE_SYSTEM_SLEEP_PM_OPS(NULL, stm32_pinctrl_resume)
+};
+
 static struct platform_driver stm32mp157_pinctrl_driver = {
 	.probe = stm32_pctl_probe,
 	.driver = {
 		.name = "stm32mp157-pinctrl",
 		.of_match_table = stm32mp157_pctrl_match,
+		.pm = &stm32_pinctrl_dev_pm_ops,
 	},
 };
 
-- 
2.7.4
