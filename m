From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH] gpio: pca953x: hack to fix 24 bit gpio expanders
Date: Tue,  4 Jun 2019 14:35:58 +0200
Message-ID: <9bb9ca6102e795dc2495d92b7b661779509adebc.1559651758.git.hns@goldelico.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, kernel@pyra-handheld.com, "H. Nikolaus Schaller" <hns@goldelico.com>
List-Id: linux-gpio@vger.kernel.org

24 bit expanders use REG_ADDR_AI in combination with register addressing. This
conflicts with regmap which takes this bit as part of the register number,
i.e. a second cache entry is defined for accessed with REG_ADDR_AI being
set although on the chip it is the same register as with REG_ADDR_AI being
cleared.

The problem was introduced by

	commit b32cecb46bdc ("gpio: pca953x: Extract the register address mangling to single function")

but only became visible by

	commit 8b9f9d4dc511 ("regmap: verify if register is writeable before writing operations")

because before, the regmap size was effectively ignored and
pca953x_writeable_register() did know to ignore REG_ADDR_AI. Still, there
were two separate cache entries created.

Since the use of REG_ADDR_AI seems to be static we can work around this
issue by simply increasing the size of the regmap to cover the "virtual"
registers with REG_ADDR_AI being set. This only means that half of the
regmap buffer will be unused.

Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/gpio/gpio-pca953x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b7ef33f63392..2b27d18410aa 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -308,7 +308,8 @@ static const struct regmap_config pca953x_i2c_regmap = {
 	.volatile_reg = pca953x_volatile_register,
 
 	.cache_type = REGCACHE_RBTREE,
-	.max_register = 0x7f,
+	/* REVISIT: should be 0x7f but some 24 bit chips use REG_ADDR_AI */
+	.max_register = 0xff,
 };
 
 static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
-- 
2.19.1
