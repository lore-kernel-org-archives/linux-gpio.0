From: Anson Huang <Anson.Huang@nxp.com>
Subject: [PATCH V2] gpio: mxc: add clock operation
Date: Tue, 22 May 2018 09:15:17 +0800
Message-ID: <1526951717-12347-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Linux-imx@nxp.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Some i.MX SoCs have GPIO clock gates in CCM CCGR, such as
i.MX6SLL, need to enable clocks before accessing GPIO
registers, add optional clock operation for GPIO driver.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
changes since V1:
	add missing clk header;
	remove FSF addresses in copyright to avoid check patch ERROR.
 drivers/gpio/gpio-mxc.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 11ec722..2026f94 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -14,12 +14,9 @@
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
  */
 
+#include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -60,6 +57,7 @@ struct mxc_gpio_hwdata {
 struct mxc_gpio_port {
 	struct list_head node;
 	void __iomem *base;
+	struct clk *clk;
 	int irq;
 	int irq_high;
 	struct irq_domain *domain;
@@ -434,6 +432,17 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (port->irq < 0)
 		return port->irq;
 
+	/* the controller clock is optional */
+	port->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(port->clk))
+		port->clk = NULL;
+
+	err = clk_prepare_enable(port->clk);
+	if (err) {
+		dev_err(&pdev->dev, "Unable to enable clock.\n");
+		return err;
+	}
+
 	/* disable the interrupt and clear the status */
 	writel(0, port->base + GPIO_IMR);
 	writel(~0, port->base + GPIO_ISR);
@@ -502,6 +511,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 out_irqdomain_remove:
 	irq_domain_remove(port->domain);
 out_bgio:
+	clk_disable_unprepare(port->clk);
 	dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, err);
 	return err;
 }
-- 
2.7.4
