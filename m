From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 1/2] pinctrl: bcm2835: declare pin config as generic
Date: Sun,  3 Feb 2019 14:02:33 +0100
Message-ID: <1549198954-4711-2-git-send-email-stefan.wahren@i2se.com>
References: <1549198954-4711-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1549198954-4711-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Eric Anholt <eric@anholt.net>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, linux-gpio@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Peter Robinson <pbrobinson@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Since commit 0de704955ee44 ("pinctrl: bcm2835: Add support for
generic pinctrl binding") this driver is capable to use the generic
interface. So declare this accordingly.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/pinctrl/bcm/pinctrl-bcm2835.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index f180aa4..19eb4fd 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -969,6 +969,7 @@ static int bcm2835_pinconf_set(struct pinctrl_dev *pctldev,
 }
 
 static const struct pinconf_ops bcm2835_pinconf_ops = {
+	.is_generic = true,
 	.pin_config_get = bcm2835_pinconf_get,
 	.pin_config_set = bcm2835_pinconf_set,
 };
-- 
2.7.4
