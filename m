From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pca953x: make inclusion of <linux/of_platform.h> unconditional
Date: Wed,  9 Dec 2015 11:06:14 +0100
Message-ID: <1449655574-6550-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f181.google.com ([209.85.217.181]:34901 "EHLO
	mail-lb0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750962AbbLIKGU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 05:06:20 -0500
Received: by lbpu9 with SMTP id u9so26699399lbp.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 02:06:18 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Ben Dooks <ben.dooks@codethink.co.uk>

After adding the DT matching in
commit 6f29c9afbe636fc0e35c82a11eaf45c3b85eb07a
"gpio: pca935x: fix of-only probed devices"
compilation fails like this:

CC [M]  drivers/gpio/gpio-pca953x.o
gpio-pca953x.c: In function =E2=80=98pca953x_probe=E2=80=99:
gpio-pca953x.c:693:11: error: implicit declaration of
function =E2=80=98of_match_device=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
match =3D of_match_device(pca953x_dt_ids, &client->dev);
        ^
gpio-pca953x.c:693:9: warning: assignment makes pointer from
integer without a cast [-Wint-conversion]
match =3D of_match_device(pca953x_dt_ids, &client->dev);
        ^
cc1: some warnings being treated as errors
=2E./scripts/Makefile.build:264: recipe for target
'drivers/gpio/gpio-pca953x.o' failed

After removing the conditional inclusion guards compilation
works fine again. Might be a module problem so that
fix.

Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pca953x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 14729657a112..2eaf235a39e5 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -18,9 +18,7 @@
 #include <linux/i2c.h>
 #include <linux/platform_data/pca953x.h>
 #include <linux/slab.h>
-#ifdef CONFIG_OF_GPIO
 #include <linux/of_platform.h>
-#endif
 #include <linux/acpi.h>
=20
 #define PCA953X_INPUT		0
--=20
2.4.3

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
