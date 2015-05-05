From: Shobhit Kumar <shobhit.kumar@intel.com>
Subject: [PATCH 4/8] mfd: intel_soc_pmic_crc: Add PWM cell device for Crystalcove PMIC
Date: Tue,  5 May 2015 15:06:43 +0530
Message-ID: <1430818603-27102-1-git-send-email-shobhit.kumar@intel.com>
References: <1430316005-16480-5-git-send-email-shobhit.kumar@intel.com>
Return-path: <linux-pwm-owner@vger.kernel.org>
In-Reply-To: <1430316005-16480-5-git-send-email-shobhit.kumar@intel.com>
Sender: linux-pwm-owner@vger.kernel.org
To: intel-gfx <intel-gfx@lists.freedesktop.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-pwm <linux-pwm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Samuel Ortiz <sameo@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jani Nikula <jani.nikula@intel.com>, Lee Jones <lee.jones@linaro.org>, Povilas Staniulis <wdmonster@gmail.com>, Chih-Wei Huang <cwhuang@android-x86.org>, Shobhit Kumar <shobhit.kumar@intel.com>
List-Id: linux-gpio@vger.kernel.org

Needed for PWM control suuported by the PMIC

v2: Correct the subject line (Lee jones)

CC: Samuel Ortiz <sameo@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Shobhit Kumar <shobhit.kumar@intel.com>
---
 drivers/mfd/intel_soc_pmic_crc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
index 4cc1b32..8839e25 100644
--- a/drivers/mfd/intel_soc_pmic_crc.c
+++ b/drivers/mfd/intel_soc_pmic_crc.c
@@ -109,6 +109,9 @@ static struct mfd_cell crystal_cove_dev[] = {
 	{
 		.name = "crystal_cove_pmic",
 	},
+	{
+		.name = "crystal_cove_pwm",
+	},
 };
 
 static const struct regmap_config crystal_cove_regmap_config = {
-- 
2.1.0
