From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] pinctrl: vt8500: Delete an error message for a failed memory
 allocation in five functions
Date: Thu, 28 Dec 2017 16:20:15 +0100
Message-ID: <62a3836f-cd3c-2a56-232a-db401b1f88ca@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Tony Prisk <linux@prisktech.co.nz>, Stephen Warren <swarren@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 28 Dec 2017 16:12:17 +0100

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/vt8500/pinctrl-vt8500.c | 4 +---
 drivers/pinctrl/vt8500/pinctrl-wm8505.c | 4 +---
 drivers/pinctrl/vt8500/pinctrl-wm8650.c | 4 +---
 drivers/pinctrl/vt8500/pinctrl-wm8750.c | 4 +---
 drivers/pinctrl/vt8500/pinctrl-wm8850.c | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/vt8500/pinctrl-vt8500.c b/drivers/pinctrl/vt8500/pinctrl-vt8500.c
index 767f340d6b11..9086a3758eee 100644
--- a/drivers/pinctrl/vt8500/pinctrl-vt8500.c
+++ b/drivers/pinctrl/vt8500/pinctrl-vt8500.c
@@ -458,10 +458,8 @@ static int vt8500_pinctrl_probe(struct platform_device *pdev)
 	struct wmt_pinctrl_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate data\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->banks = vt8500_banks;
 	data->nbanks = ARRAY_SIZE(vt8500_banks);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8505.c b/drivers/pinctrl/vt8500/pinctrl-wm8505.c
index a56fdbd87e42..e1aae1d4b0b1 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8505.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8505.c
@@ -489,10 +489,8 @@ static int wm8505_pinctrl_probe(struct platform_device *pdev)
 	struct wmt_pinctrl_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate data\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->banks = wm8505_banks;
 	data->nbanks = ARRAY_SIZE(wm8505_banks);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8650.c b/drivers/pinctrl/vt8500/pinctrl-wm8650.c
index 270dd491f5a1..4678227d4001 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8650.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8650.c
@@ -327,10 +327,8 @@ static int wm8650_pinctrl_probe(struct platform_device *pdev)
 	struct wmt_pinctrl_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate data\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->banks = wm8650_banks;
 	data->nbanks = ARRAY_SIZE(wm8650_banks);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8750.c b/drivers/pinctrl/vt8500/pinctrl-wm8750.c
index 74f7b3a18f3a..c46d6946c8f5 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8750.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8750.c
@@ -366,10 +366,8 @@ static int wm8750_pinctrl_probe(struct platform_device *pdev)
 	struct wmt_pinctrl_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate data\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->banks = wm8750_banks;
 	data->nbanks = ARRAY_SIZE(wm8750_banks);
diff --git a/drivers/pinctrl/vt8500/pinctrl-wm8850.c b/drivers/pinctrl/vt8500/pinctrl-wm8850.c
index 45792aa7a06e..e2e85316a65e 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wm8850.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wm8850.c
@@ -345,10 +345,8 @@ static int wm8850_pinctrl_probe(struct platform_device *pdev)
 	struct wmt_pinctrl_data *data;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		dev_err(&pdev->dev, "failed to allocate data\n");
+	if (!data)
 		return -ENOMEM;
-	}
 
 	data->banks = wm8850_banks;
 	data->nbanks = ARRAY_SIZE(wm8850_banks);
-- 
2.15.1
