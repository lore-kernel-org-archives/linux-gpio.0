From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH] pinctrl: meson: axg: fix gpio_ao bank stop pin
Date: Tue, 16 Jan 2018 17:29:54 +0100
Message-ID: <20180116162954.4945-1-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37612 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751247AbeAPQ36 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jan 2018 11:29:58 -0500
Received: by mail-wr0-f193.google.com with SMTP id f11so5359796wre.4
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jan 2018 08:29:58 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org

GPIO bank mistakenly stops at GPIOAO_9 while it should stop at GPIOAO_13.
This gives -EINVAL if one tries to set/get anything on GPIOAO_10 to
GPIOAO_13 (pull, direction, value)

Correcting the bank last pin fixes this problem

Fixes: e072b0f1b03a ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---

Hi Linus,

This changes fixes code which was added during this cycle, so it intended
for your "for-next" branch, not the "fixes" one.

Thanks
Jerome

 drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
index a1a7d42afd42..6431d77a4704 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
@@ -897,8 +897,8 @@ static struct meson_bank meson_axg_periphs_banks[] = {
 };
 
 static struct meson_bank meson_axg_aobus_banks[] = {
-	/*   name    first      last      irq	pullen  pull    dir     out     in  */
-	BANK("AO",   GPIOAO_0,  GPIOAO_9, 0, 13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
+	/*   name    first      last       irq    pullen   pull   dir     out     in  */
+	BANK("AO",   GPIOAO_0,  GPIOAO_13, 0, 13, 0,  16,  0, 0,  0,  0,  0, 16,  1,  0),
 };
 
 static struct meson_pmx_bank meson_axg_periphs_pmx_banks[] = {
-- 
2.14.3

