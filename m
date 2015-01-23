From: Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 3/8] MIPS: Cleanup Loongson-2F's gpio driver
Date: Fri, 23 Jan 2015 16:56:07 +0800
Message-ID: <1422003369-3019-1-git-send-email-chenhc@lemote.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: John Crispin <john@phrozen.org>, "Steven J. Hill" <Steven.Hill@imgtec.com>, linux-mips@linux-mips.org, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, linux-gpio@vger.kernel.org, Huacai Chen <chenhc@lemote.com>
List-Id: linux-gpio@vger.kernel.org

This cleanup is prepare to move the driver to drivers/gpio. Custom
definitions of gpio_get_value()/gpio_set_value() are dropped.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/include/asm/mach-loongson/gpio.h |   15 +++---
 arch/mips/loongson/common/gpio.c           |   80 ++++++++------------=
--------
 2 files changed, 31 insertions(+), 64 deletions(-)

diff --git a/arch/mips/include/asm/mach-loongson/gpio.h b/arch/mips/inc=
lude/asm/mach-loongson/gpio.h
index 211a7b7..b3b2169 100644
--- a/arch/mips/include/asm/mach-loongson/gpio.h
+++ b/arch/mips/include/asm/mach-loongson/gpio.h
@@ -1,8 +1,9 @@
 /*
- * STLS2F GPIO Support
+ * Loongson GPIO Support
  *
  * Copyright (c) 2008  Richard Liu, STMicroelectronics <richard.liu@st=
=2Ecom>
  * Copyright (c) 2008-2010  Arnaud Patard <apatard@mandriva.com>
+ * Copyright (c) 2014  Huacai Chen <chenhc@lemote.com>
  *
  * This program is free software; you can redistribute it and/or modif=
y
  * it under the terms of the GNU General Public License as published b=
y
@@ -10,14 +11,14 @@
  * (at your option) any later version.
  */
=20
-#ifndef __STLS2F_GPIO_H
-#define __STLS2F_GPIO_H
+#ifndef __LOONGSON_GPIO_H
+#define __LOONGSON_GPIO_H
=20
 #include <asm-generic/gpio.h>
=20
-extern void gpio_set_value(unsigned gpio, int value);
-extern int gpio_get_value(unsigned gpio);
-extern int gpio_cansleep(unsigned gpio);
+#define gpio_get_value __gpio_get_value
+#define gpio_set_value __gpio_set_value
+#define gpio_cansleep __gpio_cansleep
=20
 /* The chip can do interrupt
  * but it has not been tested and doc not clear
@@ -32,4 +33,4 @@ static inline int irq_to_gpio(int gpio)
 	return -EINVAL;
 }
=20
-#endif				/* __STLS2F_GPIO_H */
+#endif	/* __LOONGSON_GPIO_H */
diff --git a/arch/mips/loongson/common/gpio.c b/arch/mips/loongson/comm=
on/gpio.c
index 29dbaa2..b4e69e0 100644
--- a/arch/mips/loongson/common/gpio.c
+++ b/arch/mips/loongson/common/gpio.c
@@ -24,63 +24,11 @@
=20
 static DEFINE_SPINLOCK(gpio_lock);
=20
-int gpio_get_value(unsigned gpio)
-{
-	u32 val;
-	u32 mask;
-
-	if (gpio >=3D STLS2F_N_GPIO)
-		return __gpio_get_value(gpio);
-
-	mask =3D 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
-	spin_lock(&gpio_lock);
-	val =3D LOONGSON_GPIODATA;
-	spin_unlock(&gpio_lock);
-
-	return (val & mask) !=3D 0;
-}
-EXPORT_SYMBOL(gpio_get_value);
-
-void gpio_set_value(unsigned gpio, int state)
-{
-	u32 val;
-	u32 mask;
-
-	if (gpio >=3D STLS2F_N_GPIO) {
-		__gpio_set_value(gpio, state);
-		return ;
-	}
-
-	mask =3D 1 << gpio;
-
-	spin_lock(&gpio_lock);
-	val =3D LOONGSON_GPIODATA;
-	if (state)
-		val |=3D mask;
-	else
-		val &=3D (~mask);
-	LOONGSON_GPIODATA =3D val;
-	spin_unlock(&gpio_lock);
-}
-EXPORT_SYMBOL(gpio_set_value);
-
-int gpio_cansleep(unsigned gpio)
-{
-	if (gpio < STLS2F_N_GPIO)
-		return 0;
-	else
-		return __gpio_cansleep(gpio);
-}
-EXPORT_SYMBOL(gpio_cansleep);
-
 static int ls2f_gpio_direction_input(struct gpio_chip *chip, unsigned =
gpio)
 {
 	u32 temp;
 	u32 mask;
=20
-	if (gpio >=3D STLS2F_N_GPIO)
-		return -EINVAL;
-
 	spin_lock(&gpio_lock);
 	mask =3D 1 << gpio;
 	temp =3D LOONGSON_GPIOIE;
@@ -97,9 +45,6 @@ static int ls2f_gpio_direction_output(struct gpio_chi=
p *chip,
 	u32 temp;
 	u32 mask;
=20
-	if (gpio >=3D STLS2F_N_GPIO)
-		return -EINVAL;
-
 	gpio_set_value(gpio, level);
 	spin_lock(&gpio_lock);
 	mask =3D 1 << gpio;
@@ -113,13 +58,33 @@ static int ls2f_gpio_direction_output(struct gpio_=
chip *chip,
=20
 static int ls2f_gpio_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	return gpio_get_value(gpio);
+	u32 val;
+	u32 mask;
+
+	mask =3D 1 << (gpio + STLS2F_GPIO_IN_OFFSET);
+	spin_lock(&gpio_lock);
+	val =3D LOONGSON_GPIODATA;
+	spin_unlock(&gpio_lock);
+
+	return (val & mask) !=3D 0;
 }
=20
 static void ls2f_gpio_set_value(struct gpio_chip *chip,
 		unsigned gpio, int value)
 {
-	gpio_set_value(gpio, value);
+	u32 val;
+	u32 mask;
+
+	mask =3D 1 << gpio;
+
+	spin_lock(&gpio_lock);
+	val =3D LOONGSON_GPIODATA;
+	if (value)
+		val |=3D mask;
+	else
+		val &=3D (~mask);
+	LOONGSON_GPIODATA =3D val;
+	spin_unlock(&gpio_lock);
 }
=20
 static struct gpio_chip ls2f_chip =3D {
@@ -130,6 +95,7 @@ static struct gpio_chip ls2f_chip =3D {
 	.set			=3D ls2f_gpio_set_value,
 	.base			=3D 0,
 	.ngpio			=3D STLS2F_N_GPIO,
+	.can_sleep		=3D false,
 };
=20
 static int __init ls2f_gpio_setup(void)
--=20
1.7.7.3



=CE=F7=81=06
