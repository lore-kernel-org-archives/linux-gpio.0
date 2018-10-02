From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] pinctrl: qcom: fix 'const' pointer handling
Date: Tue,  2 Oct 2018 23:15:44 +0200
Message-ID: <20181002211555.2779637-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The 'tiles' array is initialized to a constant pointers to constant
strings, but the declaration is only half as constant:

drivers/pinctrl/qcom/pinctrl-qcs404.c:1660:11: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
drivers/pinctrl/qcom/pinctrl-sdm660.c:1417:11: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]

Let's make it more constant.

Fixes: 22eb8301dbc1 ("pinctrl: qcom: Add qcs404 pinctrl driver")
Fixes: a46d5e98190d ("pinctrl: qcom: Support dispersed tiles")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/qcom/pinctrl-msm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 0ad4bc55e2e1..29172fdf5882 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -119,7 +119,7 @@ struct msm_pinctrl_soc_data {
 	unsigned ngroups;
 	unsigned ngpios;
 	bool pull_no_keeper;
-	const char **tiles;
+	const char *const *tiles;
 	unsigned int ntiles;
 };
 
-- 
2.18.0
