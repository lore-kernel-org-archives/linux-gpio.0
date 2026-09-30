Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA13ACF00
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790744316; cv=none; b=M4hrmmbH2TmeiUJxai57x9agg9XLbDcHFRoDyEA3qqIWBRf7D3Ro1FC4r4EQSObSB640xA2Wz5+MY4rVoKm5W0ADsFcNdhjG3T+2ycvtUNKPWg5hctu5s86I+/KADBbkSZ1QeSC1m8zb59kBFlFWrFmnaVW2ty2tqWxykGmnsW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790744316; c=relaxed/simple;
	bh=+HmdXT+V3VdY88H938k8OL6ZMd616XicDgHEPfMX+Q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEw0VmmIfFHq4amFZOt1Zg7v+XNy8v5JFwT9zaD6zQGvf+CUe69c1WtuOKO8h06LD7eQIFLwT+dVJYWYSgBIOPpPEPSddp7qTaa5WZT7ytNZqwRVmj5iYLx0cS2HVkQvLZoCar1TZgV5SAax8UK5MUncAVdfV6XHDERUVrdCK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3YLLdGi; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3YLLdGi"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so4706310eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790744313; x=1791349113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysdOOT1TGhwXZTAjDpt4u3/w8hbcaqTakzQVsdcz7JA=;
        b=g3YLLdGieqGarTwF2iFwDfNweU7bK6oyKVvmbFc51tQbXMh4253LelpyVJK2gRejqJ
         9zs/jmOwR6hb+Bko9vVp+E3FJ5kqzV1lDE/BKN2c0EXfElxJAX0uKk/iqP29KV54QRVu
         M+aLmdKCA5wFSy4arT5JZRBuPlUnzMegiWwViVjBp3Rz6yX5thSdbnem2hbHynD9y7Hz
         Zaf5NTsSuSN9Gwo5P+LwyVsTPRDThalx8EXR4KcBT4qM6SELRZkJTnuszfrn/8ph0KJl
         r9+XS4bl95dr2vMqXcmcPtpsavrjv2WaZa8L1Z0t3OYILqp3EU3cZVWIxEHZoLsPnpXL
         AIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790744313; x=1791349113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysdOOT1TGhwXZTAjDpt4u3/w8hbcaqTakzQVsdcz7JA=;
        b=xncOGdc6107sJBIPOj/VgPaM5Wo7Aum/abH5jL0mnh63GWmiDxVgKtioFYnB6XI88v
         AzYfZlQgktiPirdbQjEHa/V3m0VmVl/5qmx+dlxWzrTx0++MkmibA87yC5fC5LKZLk1r
         5BgiVNh9cqw9789ktgPiGbavxbkd8IS1VGXbmarsdtXRYxBgAlHZ08xp0DwW9mLirNZn
         w0YHoNLHI+hx42+8DlaaQA8vkS77XNWbdygbzdZiIWwQZ64z6pXfqxExUrz/pr9xTrqh
         M2NV/sBROaNuRmUF+eey8mf8JPsmLeg6Hl0HQXWuF8+MDi9wtlQOrJygqmMqDhZbkzb6
         jjkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN+HNwOokcVoEbbiJX/Lpf8uT2ODXXWTBTJPnirhnWE3n891VbjEBlUMIUyffBqaG/JT5qRoN8yJ4Z@vger.kernel.org
X-Gm-Message-State: AFq9FYJrHPMsowLGT0P8IBI6HcHKuKiQGTVS0OBWR7bZLx6saHNnTYrU
	FJVSyXDybIi9ShBUukWAXN519LyEEbMVMGNz6w72JQ/HdPRVIEHrOQIAUGIijpCR
X-Gm-Gg: AYBFou3ZVqxgyreBNjUaCE6J2FZbeJ/MruHPsw4MAVseeiR/uzsY54L0j/e8OCYkVFX
	MNVEepiFuaYNW99oYmkQXaZQfui2qynjNaUKbWnUvekcnr3swcUguZNee9U5nMY2US6P0gY/6CE
	a6LUPVzl3HtSKKUFT02Xt1z0SRdpa6M2TCs2YyD3JC6bRilK7TxHvsyp+9C6I2Ws75xWUyrjAhd
	0Sqzt1PcPsKgSA01JCngnQKrj6cCVmo8j9pL4Klg2jcu9od/kzkXpI6ZSNDWd5cyEzAAUPlUK7R
	Vc3TU8TWGHB/WH0sbjzdEA1d5d/LXyin00X/wbsWaCxZD9GOYM431HRSotoZyxKy+DunPfjm/eI
	bRuOUU9zOCg13QiYy+1g6nPd3QHxsbYeMESOfZineF8TyverkqWpZvn+Vxpp50wNDOPeL3g7SSr
	0i7RPdiMZmWMxo9WrypaIk7us/H+vr2nl/FtDyeaehHHYaFRl0n9R5aRxYRpXgUzGc8rymXevC8
	/MXLhz33nqo9FCwEPGFHroBrrpvBt0OHp3h5T9V6nr9n6ZZd0+4QQQCe+5uoXp9HEUIceC0fg==
X-Received: by 2002:a05:7300:50d7:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34cdc6c414cmr557932eec.24.1790744313325;
        Tue, 29 Sep 2026 21:58:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:101a:5ce6:a15e:d8ca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm571056eec.13.2026.09.29.21.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 21:58:32 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 29 Sep 2026 21:58:04 -0700
Subject: [PATCH v3 5/5] sh: mach-rsk: rsk7203: convert pin configuration to
 using software nodes
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-rsk7203-properties-v3-5-02f84aeb8e47@gmail.com>
References: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
In-Reply-To: <20260929-rsk7203-properties-v3-0-02f84aeb8e47@gmail.com>
To: Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Arnd Bergmann <arnd@kernel.org>, linux-sh@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev-6c14f

Replace legacy gpio_request() calls used to configure function pins
(SCIF0 TXD/RXD and LAN9118 IRQ) with software nodes describing GPIO
hogs. These hogs are attached to the PFC gpiochip node, allowing the
GPIO subsystem to automatically configure these pins when the driver is
registered.

Assisted-by: LLM
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-rsk/devices-rsk7203.c | 103 ++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 12 deletions(-)

diff --git a/arch/sh/boards/mach-rsk/devices-rsk7203.c b/arch/sh/boards/mach-rsk/devices-rsk7203.c
index 8076c9d15f87..7a2e73bb9645 100644
--- a/arch/sh/boards/mach-rsk/devices-rsk7203.c
+++ b/arch/sh/boards/mach-rsk/devices-rsk7203.c
@@ -12,7 +12,6 @@
 #include <linux/smsc911x.h>
 #include <linux/input.h>
 #include <linux/io.h>
-#include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
 #include <asm/machvec.h>
@@ -147,6 +146,62 @@ static const struct software_node rsk7203_sw3_key_node = {
 	.properties = rsk7203_sw3_key_props,
 };
 
+/* The base of the function GPIOs in the flat enum */
+#define SH7203_FN_BASE GPIO_FN_PINT7_PB
+
+static const struct software_node rsk7203_pfc_functions_node = {
+	.name = "functions",
+	.parent = &pfc_gpiochip_node,
+};
+
+static const struct property_entry rsk7203_txd0_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+		GPIO_FN_TXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+	})),
+	PROPERTY_ENTRY_BOOL("input"),
+	PROPERTY_ENTRY_STRING("line-name", "TXD0"),
+	{ }
+};
+
+static const struct software_node rsk7203_txd0_hog_node = {
+	.name = "txd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = rsk7203_txd0_hog_props,
+};
+
+static const struct property_entry rsk7203_rxd0_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+		GPIO_FN_RXD0 - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+	})),
+	PROPERTY_ENTRY_BOOL("input"),
+	PROPERTY_ENTRY_STRING("line-name", "RXD0"),
+	{ }
+};
+
+static const struct software_node rsk7203_rxd0_hog_node = {
+	.name = "rxd0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = rsk7203_rxd0_hog_props,
+};
+
+static const struct property_entry rsk7203_irq0_hog_props[] = {
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	PROPERTY_ENTRY_U32_ARRAY("gpios", ((u32[]){
+		GPIO_FN_IRQ0_PB - SH7203_FN_BASE, GPIO_ACTIVE_HIGH
+	})),
+	PROPERTY_ENTRY_BOOL("input"),
+	PROPERTY_ENTRY_STRING("line-name", "IRQ0_PB"),
+	{ }
+};
+
+static const struct software_node rsk7203_irq0_hog_node = {
+	.name = "irq0-hog",
+	.parent = &rsk7203_pfc_functions_node,
+	.properties = rsk7203_irq0_hog_props,
+};
+
 static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_gpio_leds_node,
 	&rsk7203_green_led_node,
@@ -157,6 +212,10 @@ static const struct software_node * const rsk7203_swnodes[] __initconst = {
 	&rsk7203_sw1_key_node,
 	&rsk7203_sw2_key_node,
 	&rsk7203_sw3_key_node,
+	&rsk7203_pfc_functions_node,
+	&rsk7203_txd0_hog_node,
+	&rsk7203_rxd0_hog_node,
+	&rsk7203_irq0_hog_node,
 	NULL
 };
 
@@ -181,26 +240,46 @@ static const struct platform_device_info rsk7203_devices[] __initconst = {
 	},
 };
 
-static int __init rsk7203_devices_setup(void)
+/*
+ * The pfc-sh7203 device is registered at arch_initcall level, and the
+ * sh-pfc driver (registered at postcore_initcall level) probes as soon
+ * as the device is created.
+ *
+ * We need to register our software nodes at postcore_initcall level so
+ * they are already present in the system when the driver probes and
+ * tries to apply GPIO hogs.
+ */
+static int __init rsk7203_sw_nodes_setup(void)
 {
-	struct platform_device *pd;
 	int error;
-	int i;
 
-	/* Select pins for SCIF0 */
-	gpio_request(GPIO_FN_TXD0, NULL);
-	gpio_request(GPIO_FN_RXD0, NULL);
-
-	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
-	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
-	gpio_request(GPIO_FN_IRQ0_PB, NULL);
+	error = software_node_register(&pfc_gpiochip_node);
+	if (error && error != -EEXIST) {
+		pr_err("RSK7203: failed to register PFC software node: %d\n",
+		       error);
+		return error;
+	}
 
 	error = software_node_register_node_group(rsk7203_swnodes);
 	if (error) {
-		pr_err("failed to register software nodes: %d\n", error);
+		pr_err("RSK7203: failed to register board software nodes: %d\n",
+		       error);
 		return error;
 	}
 
+	return 0;
+}
+postcore_initcall(rsk7203_sw_nodes_setup);
+
+static int __init rsk7203_devices_setup(void)
+{
+	struct platform_device *pd;
+	int error;
+	int i;
+
+	/* Setup LAN9118: CS1 in 16-bit Big Endian Mode, IRQ0 at Port B */
+	__raw_writel(0x36db0400, 0xfffc0008); /* CS1BCR */
+
 	for (i = 0; i < ARRAY_SIZE(rsk7203_devices); i++) {
 		pd = platform_device_register_full(&rsk7203_devices[i]);
 		error = PTR_ERR_OR_ZERO(pd);

-- 
2.56.0.rc1.315.gc6ed9934b7-goog

