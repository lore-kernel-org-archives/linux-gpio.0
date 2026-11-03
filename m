Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723262;
	b=Fe5F46kL70v5F1DiA7pHCH5AK6NEkZ2/Kc94IBInccNhpbBjbtW8vMV8IzHPBf4N4FdX
	 fIGTKXQbxBFEQKDKKcEP9qKwA5bRgBIAt+DxT8l2zW1NmfVeMqtDKKvwOuY0IEGGK8hiQ
	 PVADPK6cXj7tW6+oQkQb8Y0G0KZZbyHTzjDa1iVIclj0ptNEdMOtP8L5Q36tmxd6RNXs3
	 trZY10JqSlFdhJ3Vdq06hHU1JUMUHp5+1YSNDutKGsDxHUV0Yo8gE/TJXQP5MeI11GMPh
	 TyJ0zfjLayALfLaxmA3ybk3q+6MFVARogzDlHkYBw5MyQII73lKMSLexUooTsrPGvZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723262;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
	b=UscdMK8Y11MehYq8u2kSTPkrKnsX0thZfWTPeDZYbrt6usTVz73WGn17WUTwMEWq/p1H
	 HTOJjmglEPJUcC5rO20tQwHMkWjzup5ayPUDT3B32Z4iAnQZHXZYRSjfDRQlrb2KofWdn
	 QBVSHKM47rkIu+Ugc2FjKBYbkO0wqKZ5QkbEfGE4hjgXR7Qf2i2BcL+QElMSPRdos7SqT
	 4zi//ZiKbeCsEyWi3cq6zW5W05eBK657mOGuPWmWK5lK620gv1OFuSdwpSVZgPrrAuGj+
	 TNVKJ3+4nijk70VOrypCKgOTAVJA6HXV+droleDz8ObdIBiF0Mcpy/nJxePgmkEfkkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXPzpZWz;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFC606A327
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 16:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBAFC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uXPzpZWz
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so37563055e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 08:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793723260; x=1794328060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
        b=uXPzpZWzffhrN2p3XG1K6rb86QdFCBUWw84A8AySy3Vsn2IvDe+ZsqmaXkPNmaM6ru
         ed5wLV3jfjr6od1dgjHUQH0StPfKGg400gEwRHR6SZfbalkq4EM6GiEYP9wZAeVcaX4l
         fA3JnyowqwReGEUC7otkOWjTyBBuN7OV+SlNeEysFaEFlLCfQnaLPfLgJucr+EQjuBGf
         HHFXHsdq2NgGppqlCM5gAffiwtA3u8dbSnmtyLFp2XXs4PaHHkDcdHdiagBoeeaR6a/+
         +BYnZ1cdLe1iA99g3iRTvkvORjW936hH9mM4L4IYS5xMUptDZPuEARwFxE9BU3xnS/A2
         cMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723260; x=1794328060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bkPatPhoIRl80vpo0H3GcNW/Dj+ibBJMXucPTH/+R50=;
        b=jkjSXsj3TI904kl9pHgSJAq4gdEyLakZwT6FqOmPRYvZ011Gvk9z2byP+jMNXQRHlp
         IvGdSRhGKOoGty0mP0MxqMtp4d0MNp/uGLNtbOU8JhmBdB2lm//eaAfHggLO1UbaxBbN
         p4VHCaV/hB+9fpevDIq6PI7Ah9/YsCLf1K41gCfYQbtlis07Mwh+D0taoD/kvY+pghuH
         zZ5rmt1YVh5tcK5I1y7Px58Uso2B8dcLXij39TFBEh7anYJw+Zshvjj3unvMBe6lSnSn
         ftr8pGTMOdzB6y1YhL+Ap2oorJjRTmotCqyiX9q0hPN375pEHgXC2DnnXKeajQTvkqnQ
         uLYA==
X-Gm-Message-State: APuU4Z+ZoZWdOZWoyEVP0FXQZ3oSaQbc/psEvyusBPJ9ktI50a+9k47y
	xZjBqU7S7y/4vq1j7alXKz4mm8GamvpuXbJhQ3GNdYma7hfzF4K8/Kya
X-Gm-Gg: AYBFou3GKJbbmR2kMij1L2YgEdIHEefPBKRvxk/MrwDqNDM9gJAq0iC80zHeq1JTQNj
	zV2IFGxkWpoH/8x5WMtyyf8EWF4E0GzUIWuoksNOUsNk07vJNrsfHMMUIAVeclZOa4mHqqHMoLs
	FZHRoSfxe0g70zu38AOD4CNt1TsVh4mW/RE5QHr7tDnJBuQ6zqEv3pNWyAbQJqVkH3AOKnCNd6w
	3ohAS5F9WPOczR+mWrxbVQpP3RS5oGLrzRBPXHXoGG+zvT5InLz7Jt31ZB4sMImA62l+nyi5jw1
	DgUqeuMypsFRRcMkzMYh7rKcFF62QNSPHCLNEHDyOeCpe60RjYxBOFuOw9dLbAxD25LFQBX1xYH
	4DgbzgWJgYIxjElMJlaflY6qrLgvAG5MP73I4Fgf5byS7ATOsFDALUZjatU7bqiaVHuJLOsP7B7
	PvPLCxUK3T9i/VSTp8Fqbx4jStSf2a5vgxPmoOsT1ziNYiMG/Cg6826m9pkL9s6+jDYcQX2a7p0
	sBFrBDbyva1w3GQ3Lt1Hwfg293/0JFRPZlyhKKZ3ZTJUYXHdKgqjpbPB7xuO2/Cmjsx2x+pOT4J
	sBW1EaNOFukczAueT2UEgfWl3yK+VZD5D9i6qJfaAh+46wtJBb6Rp9uNSqAJWVXf6jksT6j4j5M
	tk1i8YUalp14VQi2SSODPVvpjjG2oBlAbKz0=
X-Received: by 2002:a05:600c:524b:b0:4b2:612d:908c with SMTP id 5b1f17b1804b1-4b2612d90d4mr86724965e9.34.1793723259495;
        Tue, 03 Nov 2026 08:27:39 -0800 (PST)
Received: from gmail.com ([2a01:e11:1403:8620:297d:39b2:12a3:6322])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fbba47a32sm2983463f8f.1.2026.11.03.08.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:27:38 -0800 (PST)
From: Paolo Pisati <p.pisati@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] gpio-f7188x: Add support for NCT5104D
Date: Tue,  3 Nov 2026 17:27:37 +0100
Message-ID: <20261103162738.135836-1-p.pisati@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton NCT5104D is a Super I/O with four UARTs and 17 GPIO lines,
found on PC Engines APU2 boards. Like the NCT6126D, it keeps its GPIOs
in logical device 7, uses 1 for input in the direction register, and
has a single data register and no Fintek vendor ID.

It differs from the NCT6126D in three ways:
- the device ID carries the silicon revision in its low nibble, so
  match 0xC452 (rev. B) and 0xC453 (rev. C); the NCT6102D and NCT6106D
  report the same IDs and are untested
- the output type sits in logical device 0x0F, one register per group,
  with 1 for open drain
- GP0x and GP1x share their pins with UART C and UART D (CR1C bits 3
  and 2). Register a bank only when its pins are routed to GPIO and its
  group is enabled in LD7 CR30, and log each skipped bank

Only GP0x and GP1x are supported; GP67, the one line of group 6, is
left out: its pin is not connected on the APU2.

This replaces the out-of-tree gpio-nct5104d driver that PC Engines
ships with the datasheet, which was posted once in 2017:
https://github.com/tasanakorn/linux-gpio-nct5104d
https://lore.kernel.org/r/77f71974-541e-7e06-d37d-c52b9623ed25@pignat.org

Tested push-pull and open-drain configurations on a PC Engines APU2,
with UART C and D switched to GPIO in the firmware.

The code is the author's; Claude (Opus 5.5 and Fable 5.1) reviewed it
and drafted this changelog.

Signed-off-by: Paolo Pisati <p.pisati@gmail.com>
---
 drivers/gpio/Kconfig       |   2 +-
 drivers/gpio/gpio-f7188x.c | 102 +++++++++++++++++++++++++++++++++----
 2 files changed, 92 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 55e4280029d8..7edc8a2d9262 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1060,7 +1060,7 @@ config GPIO_F7188X
 	help
 	  This option enables support for GPIOs found on Fintek Super-I/O
 	  chips F71869, F71869A, F71882FG, F71889F and F81866.
-	  As well as Nuvoton Super-I/O chip NCT6126D.
+	  As well as Nuvoton Super-I/O chips NCT6126D and NCT5104D.
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called f7188x-gpio.
diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
index fb007b978729..7abbc3f86de7 100644
--- a/drivers/gpio/gpio-f7188x.c
+++ b/drivers/gpio/gpio-f7188x.c
@@ -23,6 +23,8 @@
 #define SIO_LDSEL		0x07	/* Logical device select */
 #define SIO_DEVID		0x20	/* Device ID (2 bytes) */
 
+#define SIO_ENABLE		0x30	/* Logical device enable */
+
 #define SIO_UNLOCK_KEY		0x87	/* Key to enable Super-I/O */
 #define SIO_LOCK_KEY		0xAA	/* Key to disable Super-I/O */
 
@@ -50,8 +52,12 @@
  */
 #define SIO_NCT6126D_VER_A_ID		0xD283  /* NCT6126D version A chipset ID */
 #define SIO_NCT6126D_VER_B_ID		0xD284  /* NCT6126D version B chipset ID */
+#define SIO_NCT5104D_VER_B_ID		0xC452  /* NCT5104D version B chipset ID */
+#define SIO_NCT5104D_VER_C_ID		0xC453  /* NCT5104D version C chipset ID */
 
 #define SIO_LD_GPIO_NUVOTON	0x07	/* GPIO logical device */
+#define SIO_NCT5104D_LD_OUTMODE	0x0F	/* GPIO output mode logical device */
+#define SIO_NCT5104D_MFS	0x1C	/* Multi-function select */
 
 
 enum chips {
@@ -64,6 +70,7 @@ enum chips {
 	f81804,
 	f81865,
 	nct6126d,
+	nct5104d,
 };
 
 static const char * const f7188x_names[] = {
@@ -76,6 +83,7 @@ static const char * const f7188x_names[] = {
 	"f81804",
 	"f81865",
 	"nct6126d",
+	"nct5104d",
 };
 
 struct f7188x_sio {
@@ -188,9 +196,16 @@ static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 #define f7188x_gpio_data_in(base) ((base) + 2)
 /* Output mode register (0:open drain 1:push-pull). */
 #define f7188x_gpio_out_mode(base) ((base) + 3)
+/*
+ * NCT5104D output type register, in LD 0x0F (0:push-pull 1:open drain).
+ * LD7 spaces the groups 4 apart (E0, E4, F8); LD 0x0F uses one register
+ * per group (E0, E1, E6).
+ */
+#define nct5104d_gpio_out_mode(base) (0xE0 + ((base) - 0xE0) / 4)
 
-#define f7188x_gpio_dir_invert(type)	((type) == nct6126d)
-#define f7188x_gpio_data_single(type)	((type) == nct6126d)
+#define f7188x_is_nuvoton(type)		((type) == nct6126d || (type) == nct5104d)
+#define f7188x_gpio_dir_invert(type)	f7188x_is_nuvoton(type)
+#define f7188x_gpio_data_single(type)	f7188x_is_nuvoton(type)
 
 static struct f7188x_gpio_bank f71869_gpio_bank[] = {
 	F7188X_GPIO_BANK(6, 0xF0, DRVNAME "-0"),
@@ -287,6 +302,11 @@ static struct f7188x_gpio_bank nct6126d_gpio_bank[] = {
 	F7188X_GPIO_BANK(8, 0xFC, DRVNAME "-7"),
 };
 
+static struct f7188x_gpio_bank nct5104d_gpio_bank[] = {
+	F7188X_GPIO_BANK(8, 0xE0, DRVNAME "-0"),
+	F7188X_GPIO_BANK(8, 0xE4, DRVNAME "-1"),
+};
+
 static int f7188x_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	int err;
@@ -419,6 +439,36 @@ static int f7188x_gpio_set(struct gpio_chip *chip, unsigned int offset,
 	return 0;
 }
 
+static void __f7188x_gpio_set_out_mode(struct f7188x_gpio_bank *bank,
+				       unsigned int offset, bool open_drain)
+{
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 data;
+
+	superio_select(sio->addr, sio->device);
+	data = superio_inb(sio->addr, f7188x_gpio_out_mode(bank->regbase));
+	if (open_drain)
+		data &= ~BIT(offset);
+	else
+		data |= BIT(offset);
+	superio_outb(sio->addr, f7188x_gpio_out_mode(bank->regbase), data);
+}
+
+static void __nct5104d_gpio_set_out_mode(struct f7188x_gpio_bank *bank,
+					 unsigned int offset, bool open_drain)
+{
+	struct f7188x_sio *sio = bank->data->sio;
+	u8 data;
+
+	superio_select(sio->addr, SIO_NCT5104D_LD_OUTMODE);
+	data = superio_inb(sio->addr, nct5104d_gpio_out_mode(bank->regbase));
+	if (open_drain)
+		data |= BIT(offset);
+	else
+		data &= ~BIT(offset);
+	superio_outb(sio->addr, nct5104d_gpio_out_mode(bank->regbase), data);
+}
+
 static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 				  unsigned long config)
 {
@@ -426,23 +476,21 @@ static int f7188x_gpio_set_config(struct gpio_chip *chip, unsigned offset,
 	enum pin_config_param param = pinconf_to_config_param(config);
 	struct f7188x_gpio_bank *bank = gpiochip_get_data(chip);
 	struct f7188x_sio *sio = bank->data->sio;
-	u8 data;
+	bool open_drain;
 
 	if (param != PIN_CONFIG_DRIVE_OPEN_DRAIN &&
 	    param != PIN_CONFIG_DRIVE_PUSH_PULL)
 		return -ENOTSUPP;
 
+	open_drain = param == PIN_CONFIG_DRIVE_OPEN_DRAIN;
 	err = superio_enter(sio->addr);
 	if (err)
 		return err;
-	superio_select(sio->addr, sio->device);
 
-	data = superio_inb(sio->addr, f7188x_gpio_out_mode(bank->regbase));
-	if (param == PIN_CONFIG_DRIVE_OPEN_DRAIN)
-		data &= ~BIT(offset);
+	if (sio->type == nct5104d)
+		__nct5104d_gpio_set_out_mode(bank, offset, open_drain);
 	else
-		data |= BIT(offset);
-	superio_outb(sio->addr, f7188x_gpio_out_mode(bank->regbase), data);
+		__f7188x_gpio_set_out_mode(bank, offset, open_drain);
 
 	superio_exit(sio->addr);
 	return 0;
@@ -458,6 +506,7 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 	int i;
 	struct f7188x_sio *sio = dev_get_platdata(&pdev->dev);
 	struct f7188x_gpio_data *data;
+	bool nct5104d_bank_0 = true, nct5104d_bank_1 = true;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -500,6 +549,10 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		data->nr_bank = ARRAY_SIZE(nct6126d_gpio_bank);
 		data->bank = nct6126d_gpio_bank;
 		break;
+	case nct5104d:
+		data->nr_bank = ARRAY_SIZE(nct5104d_gpio_bank);
+		data->bank = nct5104d_gpio_bank;
+		break;
 	default:
 		return -ENODEV;
 	}
@@ -507,6 +560,23 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
+	if (sio->type == nct5104d) {
+		int cr1c, cr30;
+
+		err = superio_enter(sio->addr);
+		if (err)
+			return err;
+		cr1c = superio_inb(sio->addr, SIO_NCT5104D_MFS);
+		superio_select(sio->addr, sio->device);
+		cr30 = superio_inb(sio->addr, SIO_ENABLE);
+		superio_exit(sio->addr);
+
+		/* Bank 0: register it only if CR1C bit 3 (UART C) is clear and CR30 bit 0 is set */
+		nct5104d_bank_0 = !(cr1c & BIT(3)) && (cr30 & BIT(0));
+		/* Bank 1: register it only if CR1C bit 2 (UART D) is clear and CR30 bit 1 is set */
+		nct5104d_bank_1 = !(cr1c & BIT(2)) && (cr30 & BIT(1));
+	}
+
 	/* For each GPIO bank, register a GPIO chip. */
 	for (i = 0; i < data->nr_bank; i++) {
 		struct f7188x_gpio_bank *bank = &data->bank[i];
@@ -514,6 +584,11 @@ static int f7188x_gpio_probe(struct platform_device *pdev)
 		bank->chip.parent = &pdev->dev;
 		bank->data = data;
 
+		if ((i == 0 && !nct5104d_bank_0) || (i == 1 && !nct5104d_bank_1)) {
+			dev_info(&pdev->dev, "NCT5104D: Skip registering GPIO bank %d\n", i);
+			continue;
+		}
+
 		err = devm_gpiochip_add_data(&pdev->dev, &bank->chip, bank);
 		if (err) {
 			dev_err(&pdev->dev,
@@ -570,13 +645,18 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 		sio->device = SIO_LD_GPIO_NUVOTON;
 		sio->type = nct6126d;
 		break;
+	case SIO_NCT5104D_VER_B_ID:
+	case SIO_NCT5104D_VER_C_ID:
+		sio->device = SIO_LD_GPIO_NUVOTON;
+		sio->type = nct5104d;
+		break;
 	default:
 		pr_info("Unsupported Fintek device 0x%04x\n", devid);
 		goto err;
 	}
 
 	/* double check manufacturer where possible */
-	if (sio->type != nct6126d) {
+	if (!f7188x_is_nuvoton(sio->type)) {
 		manid = superio_inw(addr, SIO_FINTEK_MANID);
 		if (manid != SIO_FINTEK_ID) {
 			pr_debug("Not a Fintek device at 0x%08x\n", addr);
@@ -588,7 +668,7 @@ static int __init f7188x_find(int addr, struct f7188x_sio *sio)
 	err = 0;
 
 	pr_info("Found %s at %#x\n", f7188x_names[sio->type], (unsigned int)addr);
-	if (sio->type != nct6126d)
+	if (!f7188x_is_nuvoton(sio->type))
 		pr_info("   revision %d\n", superio_inb(addr, SIO_FINTEK_DEVREV));
 
 err:

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

