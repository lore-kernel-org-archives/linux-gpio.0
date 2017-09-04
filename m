From: Colin King <colin.king@canonical.com>
Subject: [PATCH][pinctrl-next] pinctrl: sprd: make three local functions static
Date: Mon,  4 Sep 2017 11:53:22 +0100
Message-ID: <20170904105322.23228-1-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The functions sprd_pmx_get_function_count, sprd_pmx_get_function_name
and sprd_pmx_get_function_groups are local to the source and do not
need to be in global scope, so make them static.

Cleans up sparse warnings:
"symbol 'sprd_pmx_get_function_count' was not declared. Should it be 
static?"
"symbol 'sprd_pmx_get_function_name' was not declared. Should it be
static?"
"symbol 'sprd_pmx_get_function_groups' was not declared. Should it be 
static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 7e7b9ac7e836..c178b4a6d7f5 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -353,13 +353,13 @@ static const struct pinctrl_ops sprd_pctrl_ops = {
 	.dt_free_map = pinctrl_utils_free_map,
 };
 
-int sprd_pmx_get_function_count(struct pinctrl_dev *pctldev)
+static int sprd_pmx_get_function_count(struct pinctrl_dev *pctldev)
 {
 	return PIN_FUNC_MAX;
 }
 
-const char *sprd_pmx_get_function_name(struct pinctrl_dev *pctldev,
-				       unsigned int selector)
+static const char *sprd_pmx_get_function_name(struct pinctrl_dev *pctldev,
+					      unsigned int selector)
 {
 	switch (selector) {
 	case PIN_FUNC_1:
@@ -375,10 +375,10 @@ const char *sprd_pmx_get_function_name(struct pinctrl_dev *pctldev,
 	}
 }
 
-int sprd_pmx_get_function_groups(struct pinctrl_dev *pctldev,
-				 unsigned int selector,
-				 const char * const **groups,
-				 unsigned int * const num_groups)
+static int sprd_pmx_get_function_groups(struct pinctrl_dev *pctldev,
+					unsigned int selector,
+					const char * const **groups,
+					unsigned int * const num_groups)
 {
 	struct sprd_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
 	struct sprd_pinctrl_soc_info *info = pctl->info;
-- 
2.14.1
