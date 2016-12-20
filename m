From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH 2/2] pinctrl: sirf: atlas7: Improve code layout
Date: Tue, 20 Dec 2016 06:41:22 +0100
Message-ID: <20161220054122.25508-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, baohua@kernel.org
Cc: linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Add some tab in order to improve indentation.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/sirf/pinctrl-atlas7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-atlas7.c b/drivers/pinctrl/sirf/pinctrl-atlas7.c
index f714f67c4b64..76df538fa814 100644
--- a/drivers/pinctrl/sirf/pinctrl-atlas7.c
+++ b/drivers/pinctrl/sirf/pinctrl-atlas7.c
@@ -5444,7 +5444,7 @@ static int atlas7_pinmux_probe(struct platform_device *pdev)
 		pmx->regs[idx] = of_iomap(np, idx);
 		if (!pmx->regs[idx]) {
 			dev_err(&pdev->dev,
-			"can't map ioc bank#%d registers\n", idx);
+				"can't map ioc bank#%d registers\n", idx);
 			ret = -ENOMEM;
 			goto unmap_io;
 		}
@@ -6057,8 +6057,8 @@ static int atlas7_gpio_probe(struct platform_device *pdev)
 	ret = gpiochip_add_data(chip, a7gc);
 	if (ret) {
 		dev_err(&pdev->dev,
-		"%s: error in probe function with status %d\n",
-		np->name, ret);
+			"%s: error in probe function with status %d\n",
+			np->name, ret);
 		goto failed;
 	}
 
-- 
2.9.3
