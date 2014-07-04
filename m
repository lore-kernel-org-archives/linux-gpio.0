From: Varka Bhadram <varkabhadram@gmail.com>
Subject: =?UTF-8?q?=5BPATCH=5D=20drivers/gpio/gpio-sch311x=3A=20check=20return=20value=20of=20gpiochip=5Fremove=28=29?=
Date: Fri,  4 Jul 2014 12:07:31 +0530
Message-ID: <1404455851-9996-1-git-send-email-varkab@cdac.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:60751 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbaGDGiw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Jul 2014 02:38:52 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-kernel@vger.kernel.org, Varka Bhadram <varkab@cdac.in>

This patch eliminates the following warning

drivers/gpio/gpio-sch311x.c: In function =E2=80=98sch311x_gpio_probe=E2=
=80=99:
drivers/gpio/gpio-sch311x.c:286:18: warning: ignoring return value of =E2=
=80=98gpiochip_remove=E2=80=99, declared with attribute warn_unused_res=
ult

Signed-off-by: Varka Bhadram <varkab@cdac.in>
---
 drivers/gpio/gpio-sch311x.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sch311x.c b/drivers/gpio/gpio-sch311x.c
index f942b80..8a4ab8f 100644
--- a/drivers/gpio/gpio-sch311x.c
+++ b/drivers/gpio/gpio-sch311x.c
@@ -232,7 +232,7 @@ static int sch311x_gpio_probe(struct platform_devic=
e *pdev)
 	struct sch311x_pdev_data *pdata =3D pdev->dev.platform_data;
 	struct sch311x_gpio_priv *priv;
 	struct sch311x_gpio_block *block;
-	int err, i;
+	int err, i, ret;
=20
 	/* we can register all GPIO data registers at once */
 	if (!request_region(pdata->runtime_reg + GP1, 6, DRV_NAME)) {
@@ -283,7 +283,11 @@ exit_err:
 	release_region(pdata->runtime_reg + GP1, 6);
 	/* release already registered chips */
 	for (--i; i >=3D 0; i--)
-		gpiochip_remove(&priv->blocks[i].chip);
+		ret =3D gpiochip_remove(&priv->blocks[i].chip);
+
+		WARN(ret, "%s(): gpiochip_remove() failed, ret=3D%d\n",
+		     __func__, ret);
+
 	return err;
 }
=20
--=20
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
