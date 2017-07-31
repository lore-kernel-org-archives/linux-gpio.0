From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/6] pinctrl: uniphier: remove unneeded EXPORT_SYMBOL_GPL()
Date: Mon, 31 Jul 2017 15:21:06 +0900
Message-ID: <1501482071-9819-2-git-send-email-yamada.masahiro@socionext.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

All UniPhier pinctrl drivers are built-in.  Exporting the symbol
is meaningless.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index 30dec0ee7f35..c649e835bd54 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -13,7 +13,6 @@
  * GNU General Public License for more details.
  */
 
-#include <linux/export.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
 #include <linux/pinctrl/pinconf.h>
@@ -731,4 +730,3 @@ int uniphier_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(uniphier_pinctrl_probe);
-- 
2.7.4
