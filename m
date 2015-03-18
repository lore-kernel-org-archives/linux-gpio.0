From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 3/6] pinctrl: st: Move st_get_pio_control() further up the source file
Date: Wed, 18 Mar 2015 10:51:36 +0000
Message-ID: <1426675899-19882-4-git-send-email-lee.jones@linaro.org>
References: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1426675899-19882-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc: lee.jones@linaro.org, kernel@stlinux.com
List-Id: linux-gpio@vger.kernel.org

st_get_pio_control() will be used by subsequent calls which are
to be located above its original position.  This is required to
prevent the need for an unnecessary forward-declaration/prototype.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/pinctrl/pinctrl-st.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 5362e45..10ad19c 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -398,6 +398,16 @@ static const struct st_pctl_data stih407_flashdata = {
 	.rt = 100,
 };
 
+static struct st_pio_control *st_get_pio_control(
+			struct pinctrl_dev *pctldev, int pin)
+{
+	struct pinctrl_gpio_range *range =
+			 pinctrl_find_gpio_range_from_pin(pctldev, pin);
+	struct st_gpio_bank *bank = gpio_range_to_bank(range);
+
+	return &bank->pc;
+}
+
 /* Low level functions.. */
 static inline int st_gpio_bank(int gpio)
 {
@@ -918,16 +928,6 @@ static int st_pmx_get_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static struct st_pio_control *st_get_pio_control(
-			struct pinctrl_dev *pctldev, int pin)
-{
-	struct pinctrl_gpio_range *range =
-			 pinctrl_find_gpio_range_from_pin(pctldev, pin);
-	struct st_gpio_bank *bank = gpio_range_to_bank(range);
-
-	return &bank->pc;
-}
-
 static int st_pmx_set_mux(struct pinctrl_dev *pctldev, unsigned fselector,
 			unsigned group)
 {
-- 
1.9.1
