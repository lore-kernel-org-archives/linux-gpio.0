From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [RESEND PATCH] pinctrl: qcom: fix wrong pull status display for no_keeper SoC
Date: Fri,  4 May 2018 16:57:28 -0700
Message-ID: <20180504235728.805-1-bjorn.andersson@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Clément Péron <peron.clem@gmail.com>

DebugFS strings about pin pull status for no_keeper SoC are wrong

Fix this by adding a different string array for no_keeper SoC

Signed-off-by: Clément Péron <peron.clem@gmail.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Hi Linus,

Forwarding this patch which was posted to linux-arm-msm@ only. LGTM, please apply.

@Clémen, please use ./scripts/get_maintaine.pl to find appropriate recipients
for future patches.

Regards,
Bjorn

 drivers/pinctrl/qcom/pinctrl-msm.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index fa4e94fedb8c..c3c77b86eff7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -504,13 +504,19 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 	int pull;
 	u32 ctl_reg;
 
-	static const char * const pulls[] = {
+	static const char * const pulls_keeper[] = {
 		"no pull",
 		"pull down",
 		"keeper",
 		"pull up"
 	};
 
+	static const char * const pulls_no_keeper[] = {
+		"no pull",
+		"pull down",
+		"pull up",
+	};
+
 	if (!gpiochip_line_is_valid(chip, offset))
 		return;
 
@@ -524,7 +530,10 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 
 	seq_printf(s, " %-8s: %-3s %d", g->name, is_out ? "out" : "in", func);
 	seq_printf(s, " %dmA", msm_regval_to_drive(drive));
-	seq_printf(s, " %s", pulls[pull]);
+	if (pctrl->soc->pull_no_keeper)
+		seq_printf(s, " %s", pulls_no_keeper[pull]);
+	else
+		seq_printf(s, " %s", pulls_keeper[pull]);
 	seq_puts(s, "\n");
 }
 
-- 
2.17.0
