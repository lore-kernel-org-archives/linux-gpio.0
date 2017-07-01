From: Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH] pinctrl: zte: fix dereference of 'data' in zx_set_mux()
Date: Sat,  1 Jul 2017 11:45:36 +0800
Message-ID: <1498880736-18143-1-git-send-email-shawnguo@kernel.org>
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
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>, linux-arm-kernel@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: linux-gpio@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

It fixes the following Smatch complaint:

drivers/pinctrl/zte/pinctrl-zx.c:76 zx_set_mux()
warn: variable dereferenced before check 'data' (see line 67)

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: cbff0c4d27f4 ("pinctrl: add ZTE ZX pinctrl driver support")
Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/pinctrl/zte/pinctrl-zx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/zte/pinctrl-zx.c b/drivers/pinctrl/zte/pinctrl-zx.c
index 787e3967bd5c..f828ee340a98 100644
--- a/drivers/pinctrl/zte/pinctrl-zx.c
+++ b/drivers/pinctrl/zte/pinctrl-zx.c
@@ -64,10 +64,8 @@ static int zx_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 	struct zx_pinctrl_soc_info *info = zpctl->info;
 	const struct pinctrl_pin_desc *pindesc = info->pins + group_selector;
 	struct zx_pin_data *data = pindesc->drv_data;
-	struct zx_mux_desc *mux = data->muxes;
-	u32 mask = (1 << data->width) - 1;
-	u32 offset = data->offset;
-	u32 bitpos = data->bitpos;
+	struct zx_mux_desc *mux;
+	u32 mask, offset, bitpos;
 	struct function_desc *func;
 	unsigned long flags;
 	u32 val, mval;
@@ -76,6 +74,11 @@ static int zx_set_mux(struct pinctrl_dev *pctldev, unsigned int func_selector,
 	if (!data)
 		return -EINVAL;
 
+	mux = data->muxes;
+	mask = (1 << data->width) - 1;
+	offset = data->offset;
+	bitpos = data->bitpos;
+
 	func = pinmux_generic_get_function(pctldev, func_selector);
 	if (!func)
 		return -EINVAL;
-- 
1.9.1
