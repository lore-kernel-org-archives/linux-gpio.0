From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH] pinctrl: qcom: ssbi: fix compilation with DEBUG_FS=n
Date: Sun, 11 Oct 2015 17:39:31 +0200
Message-ID: <1444577971-17705-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54685 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751635AbbJKPjc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:39:32 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>

The DEBUG_FS=3Dn #defines for the dbg_show functions were missed when
renaming the driver from msm_ to pm8xxx_, causing it to break the build
when DEBUG_FS isn't enabled:

  CC [M]  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.o
drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c:597:14: error: =E2=80=98pm8xxx=
_gpio_dbg_show=E2=80=99 undeclared here (not in a function)
  .dbg_show =3D pm8xxx_gpio_dbg_show,

=46ix this by renaming them correctly.

=46ixes: b4c45fe974bc ("pinctrl: qcom: ssbi: Family A gpio & mpp driver=
s")
Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c | 2 +-
 drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl=
/qcom/pinctrl-ssbi-gpio.c
index e1a3721..d809c9e 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
@@ -584,7 +584,7 @@ static void pm8xxx_gpio_dbg_show(struct seq_file *s=
, struct gpio_chip *chip)
 }
=20
 #else
-#define msm_gpio_dbg_show NULL
+#define pm8xxx_gpio_dbg_show NULL
 #endif
=20
 static struct gpio_chip pm8xxx_gpio_template =3D {
diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c b/drivers/pinctrl/=
qcom/pinctrl-ssbi-mpp.c
index 6652b8d..8982027 100644
--- a/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
+++ b/drivers/pinctrl/qcom/pinctrl-ssbi-mpp.c
@@ -639,7 +639,7 @@ static void pm8xxx_mpp_dbg_show(struct seq_file *s,=
 struct gpio_chip *chip)
 }
=20
 #else
-#define msm_mpp_dbg_show NULL
+#define pm8xxx_mpp_dbg_show NULL
 #endif
=20
 static struct gpio_chip pm8xxx_mpp_template =3D {
--=20
2.1.4
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
