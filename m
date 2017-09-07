From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 2/2] pinctrl: sprd: fix off by one bugs
Date: Thu, 7 Sep 2017 14:12:05 +0300
Message-ID: <20170907073211.zgcgmdfrphtqy3d7@mwanda>
References: <20170907072926.56oqezwk4r72yjgt@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170907072926.56oqezwk4r72yjgt@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

info->groups[] has info->ngroups elements so these comparisons should be
>= instead of >.

Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index 673b77bbbc8c..939e1bbf6253 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -400,7 +400,7 @@ static int sprd_pmx_set_mux(struct pinctrl_dev *pctldev,
 	unsigned long reg;
 	unsigned int val = 0;
 
-	if (group_selector > info->ngroups)
+	if (group_selector >= info->ngroups)
 		return -EINVAL;
 
 	switch (func_selector) {
@@ -734,7 +734,7 @@ static int sprd_pinconf_group_get(struct pinctrl_dev *pctldev,
 	struct sprd_pin_group *grp;
 	unsigned int pin_id;
 
-	if (selector > info->ngroups)
+	if (selector >= info->ngroups)
 		return -EINVAL;
 
 	grp = &info->groups[selector];
@@ -753,7 +753,7 @@ static int sprd_pinconf_group_set(struct pinctrl_dev *pctldev,
 	struct sprd_pin_group *grp;
 	int ret, i;
 
-	if (selector > info->ngroups)
+	if (selector >= info->ngroups)
 		return -EINVAL;
 
 	grp = &info->groups[selector];
@@ -813,7 +813,7 @@ static void sprd_pinconf_group_dbg_show(struct pinctrl_dev *pctldev,
 	const char *name;
 	int i, ret;
 
-	if (selector > info->ngroups)
+	if (selector >= info->ngroups)
 		return;
 
 	grp = &info->groups[selector];
