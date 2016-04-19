From: <patrice.chotard@st.com>
Subject: [PATCH 8/8] gpio: stmpe: configure GPIO as output by default
Date: Tue, 19 Apr 2016 14:18:37 +0200
Message-ID: <1461068317-28016-9-git-send-email-patrice.chotard@st.com>
References: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1461068317-28016-1-git-send-email-patrice.chotard@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: lee.jones@linaro.org, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: gnurou@gmail.com, amelie.delaunay@st.com, swarren@wwwdotorg.org, vireshk@kernel.org, Patrice Chotard <patrice.chotard@st.com>, thierry.reding@gmail.com, kernel@pengutronix.de, dinguyen@opensource.altera.com, shawnguo@kernel.org, shiraz.linux.kernel@gmail.com, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com
List-Id: linux-gpio@vger.kernel.org

From: Patrice Chotard <patrice.chotard@st.com>

Configures all GPIOs as output, in order to minimize power
consumption when GPIOs are unused.

Signed-off-by: Amelie DELAUNAY <amelie.delaunay@st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
---
 drivers/gpio/gpio-stmpe.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 45e5b92..80c6ae6 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -410,7 +410,7 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 	struct stmpe *stmpe = dev_get_drvdata(pdev->dev.parent);
 	struct device_node *np = pdev->dev.of_node;
 	struct stmpe_gpio *stmpe_gpio;
-	int ret;
+	int ret, i;
 	int irq = 0;
 
 	irq = platform_get_irq(pdev, 0);
@@ -475,6 +475,10 @@ static int stmpe_gpio_probe(struct platform_device *pdev)
 					     NULL);
 	}
 
+	/* To minimize power consumption, configure unused GPIOs as outputs */
+	for (i = 0; i < stmpe_gpio->chip.ngpio; i++)
+		stmpe_gpio_direction_output(&stmpe_gpio->chip, i, 0);
+
 	platform_set_drvdata(pdev, stmpe_gpio);
 
 	return 0;
-- 
1.9.1
