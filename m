From: ville.syrjala@linux.intel.com
Subject: [PATCH] mfd: intel_soc_pmic_core: Terminate panel control GPIO lookup table correctly
Date: Fri, 22 Apr 2016 22:38:55 +0300
Message-ID: <1461353935-8078-1-git-send-email-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:5452 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752499AbcDVTjB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 22 Apr 2016 15:39:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: intel-gfx@lists.freedesktop.org, Shobhit Kumar <shobhit.kumar@intel.com>, Samuel Ortiz <sameo@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, stable@vger.kernel.org

=46rom: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

GPIO lookup tables are supposed to be zero terminated. Let's do that
and avoid accidentally walking off the end.

Cc: Shobhit Kumar <shobhit.kumar@intel.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: stable@vger.kernel.org
=46ixes: 61dd2ca2d44e ("mfd: intel_soc_pmic_core: Add lookup table for =
Panel Control as GPIO signal")
Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
---
 drivers/mfd/intel_soc_pmic_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_=
pmic_core.c
index d9e15cf7c6c8..12d6ebb4ae5d 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -35,6 +35,7 @@ static struct gpiod_lookup_table panel_gpio_table =3D=
 {
 	.table =3D {
 		/* Panel EN/DISABLE */
 		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
+		{ },
 	},
 };
=20
--=20
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
