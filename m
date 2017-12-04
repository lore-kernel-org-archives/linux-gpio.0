From: Colin King <colin.king@canonical.com>
Subject: [PATCH][next] pinctrl: intel: ensure error return ret is initialized
Date: Mon,  4 Dec 2017 17:08:15 +0000
Message-ID: <20171204170815.14779-1-colin.king@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

In the (unlikely) event that community->ngpps is zero, or if every
gpp->gpio_base is less than zero, then an ininitialized value in
ret is returned by function intel_gpio_add_pin_ranges. Fix this by
ensuring ret is initialized to zero.  It's a moot point, but I think
it is worthwhile ensuring this corner case is fixed.

Detected by CoverityScan, CID#1462415 ("Uninitialized scalar variable")

Fixes: a60eac3239f0 ("pinctrl: intel: Allow custom GPIO base for pad groups")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/pinctrl/intel/pinctrl-intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 359800fcb951..96e73e30204e 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -1083,7 +1083,7 @@ static struct irq_chip intel_gpio_irqchip = {
 static int intel_gpio_add_pin_ranges(struct intel_pinctrl *pctrl,
 				     const struct intel_community *community)
 {
-	int ret, i;
+	int ret = 0, i;
 
 	for (i = 0; i < community->ngpps; i++) {
 		const struct intel_padgroup *gpp = &community->gpps[i];
-- 
2.14.1
