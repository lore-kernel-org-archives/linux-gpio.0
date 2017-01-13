From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH RFC 5/5] pinctrl: mvebu: add simple regmap based pinctrl
 implementation
Date: Fri, 13 Jan 2017 11:03:35 +0000
Message-ID: <E1cRzdv-0002Ys-Pe@rmk-PC.armlinux.org.uk>
References: <20170113110240.GA29164@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170113110240.GA29164@n2100.armlinux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux-gpio@vger.kernel.org, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Add a simple regmap based pinctrl implementation for mvebu, for syscon
based regmap drivers.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 60 +++++++++++++++++++++++++++++++++++
 drivers/pinctrl/mvebu/pinctrl-mvebu.h | 16 +++++++++-
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 9c6736d0595d..2f9a4e3e1ff1 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -23,6 +23,8 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #include "pinctrl-mvebu.h"
 
@@ -788,3 +790,61 @@ int mvebu_pinctrl_simple_mmio_probe(struct platform_device *pdev)
 
 	return mvebu_pinctrl_probe(pdev);
 }
+
+int mvebu_regmap_mpp_ctrl_get(struct mvebu_mpp_ctrl_data *data,
+			      unsigned int pid, unsigned long *config)
+{
+	unsigned off = (pid / MVEBU_MPPS_PER_REG) * MVEBU_MPP_BITS;
+	unsigned shift = (pid % MVEBU_MPPS_PER_REG) * MVEBU_MPP_BITS;
+	unsigned int val;
+	int err;
+
+	err = regmap_read(data->regmap.map, data->regmap.offset + off, &val);
+	if (err)
+		return err;
+
+	*config = (val >> shift) & MVEBU_MPP_MASK;
+
+	return 0;
+}
+
+int mvebu_regmap_mpp_ctrl_set(struct mvebu_mpp_ctrl_data *data,
+			      unsigned int pid, unsigned long config)
+{
+	unsigned off = (pid / MVEBU_MPPS_PER_REG) * MVEBU_MPP_BITS;
+	unsigned shift = (pid % MVEBU_MPPS_PER_REG) * MVEBU_MPP_BITS;
+
+	return regmap_update_bits(data->regmap.map, data->regmap.offset + off,
+				  MVEBU_MPP_MASK << shift, config << shift);
+}
+
+int mvebu_pinctrl_simple_regmap_probe(struct platform_device *pdev,
+				      struct device *syscon_dev)
+{
+	struct mvebu_pinctrl_soc_info *soc = dev_get_platdata(&pdev->dev);
+	struct mvebu_mpp_ctrl_data *mpp_data;
+	struct regmap *regmap;
+	u32 offset;
+	int i;
+
+	regmap = syscon_node_to_regmap(syscon_dev->of_node);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	if (of_property_read_u32(pdev->dev.of_node, "offset", &offset))
+		return -EINVAL;
+
+	mpp_data = devm_kcalloc(&pdev->dev, soc->ncontrols, sizeof(*mpp_data),
+				GFP_KERNEL);
+	if (!mpp_data)
+		return -ENOMEM;
+
+	for (i = 0; i < soc->ncontrols; i++) {
+		mpp_data[i].regmap.map = regmap;
+		mpp_data[i].regmap.offset = offset;
+	}
+
+	soc->control_data = mpp_data;
+
+	return mvebu_pinctrl_probe(pdev);
+}
diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.h b/drivers/pinctrl/mvebu/pinctrl-mvebu.h
index a9304cdc23e2..c90704e74884 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.h
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.h
@@ -16,9 +16,17 @@
 /**
  * struct mvebu_mpp_ctrl_data - private data for the mpp ctrl operations
  * @base: base address of pinctrl hardware
+ * @regmap.map: regmap structure
+ * @regmap.offset: regmap offset
  */
 struct mvebu_mpp_ctrl_data {
-	void __iomem *base;
+	union {
+		void __iomem *base;
+		struct {
+			struct regmap *map;
+			u32 offset;
+		} regmap;
+	};
 };
 
 /**
@@ -194,8 +202,14 @@ int mvebu_mmio_mpp_ctrl_get(struct mvebu_mpp_ctrl_data *data, unsigned pid,
 			       unsigned long *config);
 int mvebu_mmio_mpp_ctrl_set(struct mvebu_mpp_ctrl_data *data, unsigned pid,
 			       unsigned long config);
+int mvebu_regmap_mpp_ctrl_get(struct mvebu_mpp_ctrl_data *data, unsigned pid,
+			      unsigned long *config);
+int mvebu_regmap_mpp_ctrl_set(struct mvebu_mpp_ctrl_data *data, unsigned pid,
+			      unsigned long config);
 
 int mvebu_pinctrl_probe(struct platform_device *pdev);
 int mvebu_pinctrl_simple_mmio_probe(struct platform_device *pdev);
+int mvebu_pinctrl_simple_regmap_probe(struct platform_device *pdev,
+				      struct device *syscon_dev);
 
 #endif
-- 
2.7.4
