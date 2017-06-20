From: Bastien Nocera <hadess@hadess.net>
Subject: [PATCH] mfd: intel_soc_pmic_crc: Uniquify device name
Date: Tue, 20 Jun 2017 18:33:23 +0200
Message-ID: <20170620163323.16345-1-hadess@hadess.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
List-Id: linux-gpio@vger.kernel.org

---
 drivers/mfd/intel_soc_pmic_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 4a7494872da2..f47dadaf644c 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -147,7 +147,7 @@ static const struct regmap_irq crystal_cove_irqs[] = {
 };
 
 static const struct regmap_irq_chip crystal_cove_irq_chip = {
-	.name = "Crystal Cove",
+	.name = "Crystal Cove (PMIC)",
 	.irqs = crystal_cove_irqs,
 	.num_irqs = ARRAY_SIZE(crystal_cove_irqs),
 	.num_regs = 1,
-- 
2.13.0
