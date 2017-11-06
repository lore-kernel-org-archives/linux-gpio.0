From: Henrik Juul Pedersen <hjp@liab.dk>
Subject: Possible bug in Armada-37xx pincontroller
Date: Mon, 6 Nov 2017 15:12:31 +0100
Message-ID: <CABQZ+_Qy1ghA3_zMTHGjbfhwmfRNGaGRxUfsgUmayeOKxpEJvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:56524 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753125AbdKFOMd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Nov 2017 09:12:33 -0500
Received: by mail-lf0-f66.google.com with SMTP id 90so10627258lfs.13
        for <linux-gpio@vger.kernel.org>; Mon, 06 Nov 2017 06:12:32 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Emil Vesterdahl <emil@liab.dk>

Hi,

After some review of a current Armada 37xx design, we stumbled upon
some pin numbering, which seems doubly-defined, and doesn't seem to
follow the documentation available to us.

We haven't gotten our hardware yet, so we haven't been able to test
it, but the following patch is as we believe it should be defined.

Best regards,
Henrik Juul Pedersen
LIAB ApS

---

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 71b944748304..e223fac20993 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -157,8 +157,8 @@ static struct armada_37xx_pin_group
armada_37xx_nb_groups[] = {
        PIN_GRP_GPIO("pwm1", 12, 1, BIT(4), "pwm"),
        PIN_GRP_GPIO("pwm2", 13, 1, BIT(5), "pwm"),
        PIN_GRP_GPIO("pwm3", 14, 1, BIT(6), "pwm"),
-       PIN_GRP_GPIO("pmic1", 17, 1, BIT(7), "pmic"),
-       PIN_GRP_GPIO("pmic0", 16, 1, BIT(8), "pmic"),
+       PIN_GRP_GPIO("pmic1", 7, 1, BIT(7), "pmic"),
+       PIN_GRP_GPIO("pmic0", 6, 1, BIT(8), "pmic"),
        PIN_GRP_GPIO("i2c2", 2, 2, BIT(9), "i2c"),
        PIN_GRP_GPIO("i2c1", 0, 2, BIT(10), "i2c"),
        PIN_GRP_GPIO("spi_cs1", 17, 1, BIT(12), "spi"),
