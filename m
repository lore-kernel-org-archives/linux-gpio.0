From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next v2] gpio: owl: Fix return value check in owl_gpio_probe()
Date: Mon, 7 May 2018 06:25:56 +0000
Message-ID: <1525674356-39189-1-git-send-email-weiyongjun1@huawei.com>
References: <1525657224-88189-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1525657224-88189-1-git-send-email-weiyongjun1@huawei.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linus.walleij@linaro.org, afaerber@suse.de, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

In case of error, the function of_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: d3654d38809c ("gpio: Add gpio driver for Actions OWL S900 SoC")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: return -ENXIO instead of -ENOMEM
---
 drivers/gpio/gpio-owl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-owl.c b/drivers/gpio/gpio-owl.c
index 3546362..f35e80f 100644
--- a/drivers/gpio/gpio-owl.c
+++ b/drivers/gpio/gpio-owl.c
@@ -128,8 +128,8 @@ static int owl_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	gpio->base = of_iomap(dev->of_node, 0);
-	if (IS_ERR(gpio->base))
-		return PTR_ERR(gpio->base);
+	if (!gpio->base)
+		return -ENXIO;
 
 	/*
 	 * Get the number of gpio's for this bank. If none specified,
