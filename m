From: Rajat Jain <rajatja@google.com>
Subject: [PATCH] pinctrl: icelake: Fix the resource number for community-4/5
Date: Thu, 13 Sep 2018 15:31:43 -0700
Message-ID: <20180913223143.12664-1-rajatja@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rajatxjain@gmail.com, subrata.banik@intel.com, aamir.bohra@intel.com, Rajat Jain <rajatja@google.com>
List-Id: linux-gpio@vger.kernel.org

The Icelake does not have a community-3, and the memory resources are
laid out in the following order in the ACPI:

resource-0: community-0 registers
resource-1: community-1 registers
resource-2: community-2 registers
resource-3: community-4 registers
resource-4: community-5 registers

(EDS also describes the communities in the above order).

Since the pinctrl driver exposes communities 0, 1, 4, 5, it needs to get
the corresponding community registers by getting the resourse number right.
Currently the resourse number is not correct for community 4 and 5, thus
fix that.

Signed-off-by: Rajat Jain <rajatja@google.com>
---
 drivers/pinctrl/intel/pinctrl-icelake.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
index 630b966ce081..5b4eaf7c90df 100644
--- a/drivers/pinctrl/intel/pinctrl-icelake.c
+++ b/drivers/pinctrl/intel/pinctrl-icelake.c
@@ -331,8 +331,8 @@ static const struct intel_padgroup icllp_community5_gpps[] = {
 static const struct intel_community icllp_communities[] = {
 	ICL_COMMUNITY(0, 0, 58, icllp_community0_gpps),
 	ICL_COMMUNITY(1, 59, 152, icllp_community1_gpps),
-	ICL_COMMUNITY(2, 153, 215, icllp_community4_gpps),
-	ICL_COMMUNITY(3, 216, 240, icllp_community5_gpps),
+	ICL_COMMUNITY(3, 153, 215, icllp_community4_gpps),
+	ICL_COMMUNITY(4, 216, 240, icllp_community5_gpps),
 };
 
 static const unsigned int icllp_spi0_pins[] = { 22, 23, 24, 25, 26 };
-- 
2.19.0.397.gdd90340f6a-goog
