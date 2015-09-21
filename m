From: Vincent Donnefort <vdonnefort@gmail.com>
Subject: [PATCH] gpio: add GPIO support for IT87xx, replacing gpio-it8761e
Date: Mon, 21 Sep 2015 18:24:24 +0200
Message-ID: <1442852664-8948-2-git-send-email-vincent.donnefort@seagate.com>
References: <1442852664-8948-1-git-send-email-vincent.donnefort@seagate.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:33461 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757248AbbIUQYf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 12:24:35 -0400
Received: by wiclk2 with SMTP id lk2so154888611wic.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2015 09:24:34 -0700 (PDT)
In-Reply-To: <1442852664-8948-1-git-send-email-vincent.donnefort@seagate.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: gnurou@gmail.com, linus.walleij@linaro.org, simon.guinot@sequanux.org, =?UTF-8?q?Diego=20Elio=20Petten=C3=B2?= <flameeyes@flameeyes.eu>

=46rom: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>

This patch adds support for the GPIOs found on the ITE super-I/O chips
IT87xx.

Signed-off-by: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
Signed-off-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 8949b3f..3583999 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -235,11 +235,17 @@ config GPIO_IOP
=20
 	  If unsure, say N.
=20
-config GPIO_IT8761E
-	tristate "IT8761E GPIO support"
-	depends on X86  # unconditional access to IO space.
+config GPIO_IT87
+	tristate "IT87xx GPIO support"
+	depends on X86 # unconditional access to IO space.
 	help
-	  Say yes here to support GPIO functionality of IT8761E super I/O chi=
p.
+	  Say yes here to support GPIO functionality of IT87xx Super I/O chip=
s.
+
+	  This driver is tested with ITE IT8728 and IT8732 Super I/O chips, a=
nd
+	  supports the IT8761E Super I/O chip as well.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio_it87
=20
 config GPIO_LOONGSON
 	bool "Loongson-2/3 GPIO support"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index f79a7c4..be6c28a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -40,7 +40,7 @@ obj-$(CONFIG_GPIO_GE_FPGA)	+=3D gpio-ge.o
 obj-$(CONFIG_GPIO_GRGPIO)	+=3D gpio-grgpio.o
 obj-$(CONFIG_GPIO_ICH)		+=3D gpio-ich.o
 obj-$(CONFIG_GPIO_IOP)		+=3D gpio-iop.o
-obj-$(CONFIG_GPIO_IT8761E)	+=3D gpio-it8761e.o
+obj-$(CONFIG_GPIO_IT87)		+=3D gpio-it87.o
 obj-$(CONFIG_GPIO_JANZ_TTL)	+=3D gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)	+=3D gpio-kempld.o
 obj-$(CONFIG_ARCH_KS8695)	+=3D gpio-ks8695.o
diff --git a/drivers/gpio/gpio-it87.c b/drivers/gpio/gpio-it87.c
new file mode 100644
index 0000000..120063f
--- /dev/null
+++ b/drivers/gpio/gpio-it87.c
@@ -0,0 +1,411 @@
+/*
+ *  GPIO interface for IT87xx Super I/O chips
+ *
+ *  Author: Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>
+ *
+ *  Based on it87_wdt.c     by Oliver Schuster
+ *           gpio-it8761e.c by Denis Turischev
+ *           gpio-stmpe.c   by Rabin Vincent
+ *
+ *  This program is free software; you can redistribute it and/or modi=
fy
+ *  it under the terms of the GNU General Public License 2 as publishe=
d
+ *  by the Free Software Foundation.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; see the file COPYING.  If not, write to
+ *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, U=
SA.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/io.h>
+#include <linux/errno.h>
+#include <linux/ioport.h>
+#include <linux/slab.h>
+#include <linux/gpio.h>
+
+/* Chip Id numbers */
+#define NO_DEV_ID	0xffff
+#define IT8728_ID	0x8728
+#define IT8732_ID	0x8732
+#define IT8761_ID	0x8761
+
+/* IO Ports */
+#define REG		0x2e
+#define VAL		0x2f
+
+/* Logical device Numbers LDN */
+#define GPIO		0x07
+
+/* Configuration Registers and Functions */
+#define LDNREG		0x07
+#define CHIPID		0x20
+#define CHIPREV		0x22
+
+/**
+ * struct it87_gpio - it87-specific GPIO chip
+ * @chip the underlying gpio_chip structure
+ * @lock a lock to avoid races between operations
+ * @io_base base address for gpio ports
+ * @io_size size of the port rage starting from io_base.
+ * @output_base Super I/O register address for Output Enable register
+ * @simple_base Super I/O 'Simple I/O' Enable register
+ * @simple_size Super IO 'Simple I/O' Enable register size; this is
+ *	required because IT87xx chips might only provide Simple I/O
+ *	switches on a subset of lines, whereas the others keep the
+ *	same status all time.
+ */
+struct it87_gpio {
+	struct gpio_chip chip;
+	spinlock_t lock;
+	u16 io_base;
+	u16 io_size;
+	u8 output_base;
+	u8 simple_base;
+	u8 simple_size;
+};
+
+static struct it87_gpio it87_gpio_chip =3D {
+	.lock =3D __SPIN_LOCK_UNLOCKED(it87_gpio_chip.lock),
+};
+
+static inline struct it87_gpio *to_it87_gpio(struct gpio_chip *chip)
+{
+	return container_of(chip, struct it87_gpio, chip);
+}
+
+/* Superio chip access functions; copied from wdt_it87 */
+
+static inline int superio_enter(void)
+{
+	/*
+	 * Try to reserve REG and REG + 1 for exclusive access.
+	 */
+	if (!request_muxed_region(REG, 2, KBUILD_MODNAME))
+		return -EBUSY;
+
+	outb(0x87, REG);
+	outb(0x01, REG);
+	outb(0x55, REG);
+	outb(0x55, REG);
+	return 0;
+}
+
+static inline void superio_exit(void)
+{
+	outb(0x02, REG);
+	outb(0x02, VAL);
+	release_region(REG, 2);
+}
+
+static inline void superio_select(int ldn)
+{
+	outb(LDNREG, REG);
+	outb(ldn, VAL);
+}
+
+static inline int superio_inb(int reg)
+{
+	outb(reg, REG);
+	return inb(VAL);
+}
+
+static inline void superio_outb(int val, int reg)
+{
+	outb(reg, REG);
+	outb(val, VAL);
+}
+
+static inline int superio_inw(int reg)
+{
+	int val;
+
+	outb(reg++, REG);
+	val =3D inb(VAL) << 8;
+	outb(reg, REG);
+	val |=3D inb(VAL);
+	return val;
+}
+
+static inline void superio_outw(int val, int reg)
+{
+	outb(reg++, REG);
+	outb(val >> 8, VAL);
+	outb(reg, REG);
+	outb(val, VAL);
+}
+
+static inline void superio_set_mask(int mask, int reg)
+{
+	u8 curr_val =3D superio_inb(reg);
+	u8 new_val =3D curr_val | mask;
+
+	if (curr_val !=3D new_val)
+		superio_outb(new_val, reg);
+}
+
+static inline void superio_clear_mask(int mask, int reg)
+{
+	u8 curr_val =3D superio_inb(reg);
+	u8 new_val =3D curr_val & ~mask;
+
+	if (curr_val !=3D new_val)
+		superio_outb(new_val, reg);
+}
+
+static int it87_gpio_request(struct gpio_chip *chip, unsigned gpio_num=
)
+{
+	u8 mask, group;
+	int rc =3D 0;
+	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+
+	mask =3D 1 << (gpio_num % 8);
+	group =3D (gpio_num / 8);
+
+	spin_lock(&it87_gpio->lock);
+
+	rc =3D superio_enter();
+	if (rc)
+		goto exit;
+
+	/* not all the IT87xx chips support Simple I/O and not all of
+	 * them allow all the lines to be set/unset to Simple I/O.
+	 */
+	if (group < it87_gpio->simple_size)
+		superio_set_mask(mask, group + it87_gpio->simple_base);
+
+	/* clear output enable, setting the pin to input, as all the
+	 * newly-exported GPIO interfaces are set to input.
+	 */
+	superio_clear_mask(mask, group + it87_gpio->output_base);
+
+	superio_exit();
+
+exit:
+	spin_unlock(&it87_gpio->lock);
+	return rc;
+}
+
+static int it87_gpio_get(struct gpio_chip *chip, unsigned gpio_num)
+{
+	u16 reg;
+	u8 mask;
+	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+
+	mask =3D 1 << (gpio_num % 8);
+	reg =3D (gpio_num / 8) + it87_gpio->io_base;
+
+	return !!(inb(reg) & mask);
+}
+
+static int it87_gpio_direction_in(struct gpio_chip *chip, unsigned gpi=
o_num)
+{
+	u8 mask, group;
+	int rc =3D 0;
+	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+
+	mask =3D 1 << (gpio_num % 8);
+	group =3D (gpio_num / 8);
+
+	spin_lock(&it87_gpio->lock);
+
+	rc =3D superio_enter();
+	if (rc)
+		goto exit;
+
+	/* clear the output enable bit */
+	superio_clear_mask(mask, group + it87_gpio->output_base);
+
+	superio_exit();
+
+exit:
+	spin_unlock(&it87_gpio->lock);
+	return rc;
+}
+
+static void it87_gpio_set(struct gpio_chip *chip,
+			  unsigned gpio_num, int val)
+{
+	u8 mask, curr_vals;
+	u16 reg;
+	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+
+	mask =3D 1 << (gpio_num % 8);
+	reg =3D (gpio_num / 8) + it87_gpio->io_base;
+
+	curr_vals =3D inb(reg);
+	if (val)
+		outb(curr_vals | mask, reg);
+	else
+		outb(curr_vals & ~mask, reg);
+}
+
+static int it87_gpio_direction_out(struct gpio_chip *chip,
+				   unsigned gpio_num, int val)
+{
+	u8 mask, group;
+	int rc =3D 0;
+	struct it87_gpio *it87_gpio =3D to_it87_gpio(chip);
+
+	mask =3D 1 << (gpio_num % 8);
+	group =3D (gpio_num / 8);
+
+	spin_lock(&it87_gpio->lock);
+
+	rc =3D superio_enter();
+	if (rc)
+		goto exit;
+
+	/* set the output enable bit */
+	superio_set_mask(mask, group + it87_gpio->output_base);
+
+	it87_gpio_set(chip, gpio_num, val);
+
+	superio_exit();
+
+exit:
+	spin_unlock(&it87_gpio->lock);
+	return rc;
+}
+
+static struct gpio_chip it87_template_chip =3D {
+	.label			=3D KBUILD_MODNAME,
+	.owner			=3D THIS_MODULE,
+	.request		=3D it87_gpio_request,
+	.get			=3D it87_gpio_get,
+	.direction_input	=3D it87_gpio_direction_in,
+	.set			=3D it87_gpio_set,
+	.direction_output	=3D it87_gpio_direction_out,
+	.base			=3D -1
+};
+
+static int __init it87_gpio_init(void)
+{
+	int rc =3D 0, i;
+	u16 chip_type;
+	u8 chip_rev, gpio_ba_reg;
+	char *labels, **labels_table;
+
+	struct it87_gpio *it87_gpio =3D &it87_gpio_chip;
+
+	rc =3D superio_enter();
+	if (rc)
+		return rc;
+
+	chip_type =3D superio_inw(CHIPID);
+	chip_rev  =3D superio_inb(CHIPREV) & 0x0f;
+	superio_exit();
+
+	it87_gpio->chip =3D it87_template_chip;
+
+	switch (chip_type) {
+	case IT8728_ID:
+	case IT8732_ID:
+		gpio_ba_reg =3D 0x62;
+		it87_gpio->io_size =3D 8;
+		it87_gpio->output_base =3D 0xc8;
+		it87_gpio->simple_base =3D 0xc0;
+		it87_gpio->simple_size =3D 5;
+		it87_gpio->chip.ngpio =3D 64;
+		break;
+	case IT8761_ID:
+		gpio_ba_reg =3D 0x60;
+		it87_gpio->io_size =3D 4;
+		it87_gpio->output_base =3D 0xf0;
+		it87_gpio->simple_size =3D 0;
+		it87_gpio->chip.ngpio =3D 16;
+		break;
+	case NO_DEV_ID:
+		pr_err("no device\n");
+		return -ENODEV;
+	default:
+		pr_err("Unknown Chip found, Chip %04x Revision %x\n",
+		       chip_type, chip_rev);
+		return -ENODEV;
+	}
+
+	rc =3D superio_enter();
+	if (rc)
+		return rc;
+
+	superio_select(GPIO);
+
+	/* fetch GPIO base address */
+	it87_gpio->io_base =3D superio_inw(gpio_ba_reg);
+
+	superio_exit();
+
+	pr_info("Found Chip IT%04x rev %x. %u GPIO lines starting at %04xh\n"=
,
+		chip_type, chip_rev, it87_gpio->chip.ngpio,
+		it87_gpio->io_base);
+
+	if (!request_region(it87_gpio->io_base, it87_gpio->io_size,
+							KBUILD_MODNAME))
+		return -EBUSY;
+
+	/* Set up aliases for the GPIO connection.
+	 *
+	 * ITE documentation for recent chips such as the IT8728F
+	 * refers to the GPIO lines as GPxy, with a coordinates system
+	 * where x is the GPIO group (starting from 1) and y is the
+	 * bit within the group.
+	 *
+	 * By creating these aliases, we make it easier to understand
+	 * to which GPIO pin we're referring to.
+	 */
+	labels =3D kcalloc(it87_gpio->chip.ngpio, sizeof("it87_gpXY"),
+								GFP_KERNEL);
+	labels_table =3D kcalloc(it87_gpio->chip.ngpio, sizeof(const char *),
+								GFP_KERNEL);
+
+	if (!labels || !labels_table) {
+		rc =3D -ENOMEM;
+		goto labels_free;
+	}
+
+	for (i =3D 0; i < it87_gpio->chip.ngpio; i++) {
+		char *label =3D &labels[i * sizeof("it87_gpXY")];
+
+		sprintf(label, "it87_gp%u%u", 1+(i/8), i%8);
+		labels_table[i] =3D label;
+	}
+
+	it87_gpio->chip.names =3D (const char *const*)labels_table;
+
+	rc =3D gpiochip_add(&it87_gpio->chip);
+	if (rc)
+		goto labels_free;
+
+	return 0;
+
+labels_free:
+	kfree(labels_table);
+	kfree(labels);
+	release_region(it87_gpio->io_base, it87_gpio->io_size);
+	return rc;
+}
+
+static void __exit it87_gpio_exit(void)
+{
+	struct it87_gpio *it87_gpio =3D &it87_gpio_chip;
+
+	gpiochip_remove(&it87_gpio->chip);
+	release_region(it87_gpio->io_base, it87_gpio->io_size);
+	kfree(it87_gpio->chip.names[0]);
+	kfree(it87_gpio->chip.names);
+}
+
+module_init(it87_gpio_init);
+module_exit(it87_gpio_exit);
+
+MODULE_AUTHOR("Diego Elio Petten=C3=B2 <flameeyes@flameeyes.eu>");
+MODULE_DESCRIPTION("GPIO interface for IT87xx Super I/O chips");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpio/gpio-it8761e.c b/drivers/gpio/gpio-it8761e.c
deleted file mode 100644
index 30a8f24..0000000
--- a/drivers/gpio/gpio-it8761e.c
+++ /dev/null
@@ -1,230 +0,0 @@
-/*
- *  GPIO interface for IT8761E Super I/O chip
- *
- *  Author: Denis Turischev <denis@compulab.co.il>
- *
- *  This program is free software; you can redistribute it and/or modi=
fy
- *  it under the terms of the GNU General Public License 2 as publishe=
d
- *  by the Free Software Foundation.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; see the file COPYING.  If not, write to
- *  the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, U=
SA.
- */
-
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/io.h>
-#include <linux/errno.h>
-#include <linux/ioport.h>
-
-#include <linux/gpio.h>
-
-#define SIO_CHIP_ID		0x8761
-#define CHIP_ID_HIGH_BYTE	0x20
-#define CHIP_ID_LOW_BYTE	0x21
-
-static u8 ports[2] =3D { 0x2e, 0x4e };
-static u8 port;
-
-static DEFINE_SPINLOCK(sio_lock);
-
-#define GPIO_NAME		"it8761-gpio"
-#define GPIO_BA_HIGH_BYTE	0x60
-#define GPIO_BA_LOW_BYTE	0x61
-#define GPIO_IOSIZE		4
-#define GPIO1X_IO		0xf0
-#define GPIO2X_IO		0xf1
-
-static u16 gpio_ba;
-
-static u8 read_reg(u8 addr, u8 port)
-{
-	outb(addr, port);
-	return inb(port + 1);
-}
-
-static void write_reg(u8 data, u8 addr, u8 port)
-{
-	outb(addr, port);
-	outb(data, port + 1);
-}
-
-static void enter_conf_mode(u8 port)
-{
-	outb(0x87, port);
-	outb(0x61, port);
-	outb(0x55, port);
-	outb((port =3D=3D 0x2e) ? 0x55 : 0xaa, port);
-}
-
-static void exit_conf_mode(u8 port)
-{
-	outb(0x2, port);
-	outb(0x2, port + 1);
-}
-
-static void enter_gpio_mode(u8 port)
-{
-	write_reg(0x2, 0x7, port);
-}
-
-static int it8761e_gpio_get(struct gpio_chip *gc, unsigned gpio_num)
-{
-	u16 reg;
-	u8 bit;
-
-	bit =3D gpio_num % 8;
-	reg =3D (gpio_num >=3D 8) ? gpio_ba + 1 : gpio_ba;
-
-	return !!(inb(reg) & (1 << bit));
-}
-
-static int it8761e_gpio_direction_in(struct gpio_chip *gc, unsigned gp=
io_num)
-{
-	u8 curr_dirs;
-	u8 io_reg, bit;
-
-	bit =3D gpio_num % 8;
-	io_reg =3D (gpio_num >=3D 8) ? GPIO2X_IO : GPIO1X_IO;
-
-	spin_lock(&sio_lock);
-
-	enter_conf_mode(port);
-	enter_gpio_mode(port);
-
-	curr_dirs =3D read_reg(io_reg, port);
-
-	if (curr_dirs & (1 << bit))
-		write_reg(curr_dirs & ~(1 << bit), io_reg, port);
-
-	exit_conf_mode(port);
-
-	spin_unlock(&sio_lock);
-	return 0;
-}
-
-static void it8761e_gpio_set(struct gpio_chip *gc,
-				unsigned gpio_num, int val)
-{
-	u8 curr_vals, bit;
-	u16 reg;
-
-	bit =3D gpio_num % 8;
-	reg =3D (gpio_num >=3D 8) ? gpio_ba + 1 : gpio_ba;
-
-	spin_lock(&sio_lock);
-
-	curr_vals =3D inb(reg);
-	if (val)
-		outb(curr_vals | (1 << bit), reg);
-	else
-		outb(curr_vals & ~(1 << bit), reg);
-
-	spin_unlock(&sio_lock);
-}
-
-static int it8761e_gpio_direction_out(struct gpio_chip *gc,
-					unsigned gpio_num, int val)
-{
-	u8 curr_dirs, io_reg, bit;
-
-	bit =3D gpio_num % 8;
-	io_reg =3D (gpio_num >=3D 8) ? GPIO2X_IO : GPIO1X_IO;
-
-	it8761e_gpio_set(gc, gpio_num, val);
-
-	spin_lock(&sio_lock);
-
-	enter_conf_mode(port);
-	enter_gpio_mode(port);
-
-	curr_dirs =3D read_reg(io_reg, port);
-
-	if (!(curr_dirs & (1 << bit)))
-		write_reg(curr_dirs | (1 << bit), io_reg, port);
-
-	exit_conf_mode(port);
-
-	spin_unlock(&sio_lock);
-	return 0;
-}
-
-static struct gpio_chip it8761e_gpio_chip =3D {
-	.label			=3D GPIO_NAME,
-	.owner			=3D THIS_MODULE,
-	.get			=3D it8761e_gpio_get,
-	.direction_input	=3D it8761e_gpio_direction_in,
-	.set			=3D it8761e_gpio_set,
-	.direction_output	=3D it8761e_gpio_direction_out,
-};
-
-static int __init it8761e_gpio_init(void)
-{
-	int i, id, err;
-
-	/* chip and port detection */
-	for (i =3D 0; i < ARRAY_SIZE(ports); i++) {
-		spin_lock(&sio_lock);
-		enter_conf_mode(ports[i]);
-
-		id =3D (read_reg(CHIP_ID_HIGH_BYTE, ports[i]) << 8) +
-				read_reg(CHIP_ID_LOW_BYTE, ports[i]);
-
-		exit_conf_mode(ports[i]);
-		spin_unlock(&sio_lock);
-
-		if (id =3D=3D SIO_CHIP_ID) {
-			port =3D ports[i];
-			break;
-		}
-	}
-
-	if (!port)
-		return -ENODEV;
-
-	/* fetch GPIO base address */
-	enter_conf_mode(port);
-	enter_gpio_mode(port);
-	gpio_ba =3D (read_reg(GPIO_BA_HIGH_BYTE, port) << 8) +
-				read_reg(GPIO_BA_LOW_BYTE, port);
-	exit_conf_mode(port);
-
-	if (!request_region(gpio_ba, GPIO_IOSIZE, GPIO_NAME))
-		return -EBUSY;
-
-	it8761e_gpio_chip.base =3D -1;
-	it8761e_gpio_chip.ngpio =3D 16;
-
-	err =3D gpiochip_add(&it8761e_gpio_chip);
-	if (err < 0)
-		goto gpiochip_add_err;
-
-	return 0;
-
-gpiochip_add_err:
-	release_region(gpio_ba, GPIO_IOSIZE);
-	gpio_ba =3D 0;
-	return err;
-}
-
-static void __exit it8761e_gpio_exit(void)
-{
-	if (gpio_ba) {
-		gpiochip_remove(&it8761e_gpio_chip);
-		release_region(gpio_ba, GPIO_IOSIZE);
-		gpio_ba =3D 0;
-	}
-}
-module_init(it8761e_gpio_init);
-module_exit(it8761e_gpio_exit);
-
-MODULE_AUTHOR("Denis Turischev <denis@compulab.co.il>");
-MODULE_DESCRIPTION("GPIO interface for IT8761E Super I/O chip");
-MODULE_LICENSE("GPL");
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
