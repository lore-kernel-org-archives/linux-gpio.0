From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 1/2] pinctrl/nomadik/abx500: Delete an error message for a
 failed memory allocation in abx500_gpio_probe()
Date: Wed, 20 Dec 2017 10:51:15 +0100
Message-ID: <1fa81c02-0b51-16d1-b713-971f7f44eb31@users.sourceforge.net>
References: <e5be1da7-460d-a47d-59b8-c1902907f5a4@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e5be1da7-460d-a47d-59b8-c1902907f5a4@users.sourceforge.net>
Content-Language: en-GB
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alessandro Rubini <rubini@unipv.it>, Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Dec 2017 10:12:56 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/nomadik/pinctrl-abx500.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/pinctrl-abx500.c b/drivers/pinctrl/nomadik/pinctrl-abx500.c
index b32c0d602024..feb030d1ea63 100644
--- a/drivers/pinctrl/nomadik/pinctrl-abx500.c
+++ b/drivers/pinctrl/nomadik/pinctrl-abx500.c
@@ -1157,11 +1157,8 @@ static int abx500_gpio_probe(struct platform_device *pdev)
 
 	pct = devm_kzalloc(&pdev->dev, sizeof(struct abx500_pinctrl),
 				   GFP_KERNEL);
-	if (pct == NULL) {
-		dev_err(&pdev->dev,
-			"failed to allocate memory for pct\n");
+	if (!pct)
 		return -ENOMEM;
-	}
 
 	pct->dev = &pdev->dev;
 	pct->parent = dev_get_drvdata(pdev->dev.parent);
-- 
2.15.1
