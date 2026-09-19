Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3553B187346
	for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 08:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789807020; cv=none; b=ZrtCK+LDkG5JzdBAWJtZsPyY2AQGSijiB2D3MuyKlv+rKzpmpr0DfRUt4ipXVywig7uEWdScqtxGimSNtuEVKrDiFZC5lNu2E6CIkuy6Xnpalu7bQOdvrBKsgbql6SD6vQebNsbpGC4YwrwiYF0hDqoKGf7ndvkTX7upNAP84oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789807020; c=relaxed/simple;
	bh=r3q3ONwfauxjYPmu1SXSETbq7TkFFnBp/YS9QQ9DLTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=expN+yp1A1j6IhdsP462UaZ2Ck/yBDJmHSOYYonwfO/vzTMXIXCUdcMKp2Zt40LMtA11h/8MFIz1ckkl1CCU8H6qcBgo+cizrM/Wm7IDRy7cj6IYLmucRGKS2w3xhEXNzYL1LKbOMHekSvEuKfEADTCa1ZCS80iEJNNJ2F4S9WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCNfuNEE; arc=none smtp.client-ip=74.125.227.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCNfuNEE"
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so619807a91.1
        for <linux-gpio@vger.kernel.org>; Sat, 19 Sep 2026 01:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789807018; x=1790411818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NpbGjR9E3S+VQ56UjZg8lJY0xXEMUmDHZy58TWvJq/s=;
        b=FCNfuNEExCKE5k2vq54KIYdwlFzwlndvcCooIBvafmBYRC4gsX4nYJ53UckHt428Mh
         HNgIXTmlii55k7DeJ8OJSDFz1ipqzpzNqW0XPRe7Fi4Iu7AkeleePt5KT0SoWuxwUEl+
         W/j6pj7cnDjU/KhuE7uOERUakQ4xHYeP317lnGQj72K6r5j7tz/1MgOTlA7HdI4uZTa6
         DAfUL+JO5z3FMet7Sahzz2tsnFOkTRA9nzSnscpJnDNl9KhJaTqxRrxPAs/+UysTmU6n
         AByStYvAGg6VnJtX8bqjAuQawuU4Gg4N3HNcy38g1qHK+Sb48taTUz+OvZr+D2iCTahR
         j9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789807018; x=1790411818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NpbGjR9E3S+VQ56UjZg8lJY0xXEMUmDHZy58TWvJq/s=;
        b=1RbXahaZTdkfQssRDeQD+vlR4nCaJh63eIRe6NOP8RqsY+6deU9ZdXBL7t4NxcWhCf
         9L9URBeiV1xqFLOZNObDfYkC97lQsGxtptHzOHMDVF6T7K5XtoY6ery1dvsAPb5zEKs1
         Vc5qwqSJ4MHVChkoWt1wgVS/w+kRraCS2ZmFlW+J+mMB73/7/L+lBGdiq11Eio2ur+IG
         pPedpFWny2dAhRrFZPq1CkcQ3RCGSc8Z5oAyFJ5yNvXTgYXS+7dThkuhWeP32pLZ7I4R
         1D4QDmDx38Binkvm+hSzqvUsk02JPtGDBFtdyVVjZ4thRADTPK3zLr+68+LnfrkWLHiz
         Adqw==
X-Forwarded-Encrypted: i=1; AKwUvBwMDvnsfjQrVtNV3Jn5vxAl++xK/+Bf+JPic9F9Snx29a2vcb8rxzvPiRESO5+yxZMI7VgZBDlt+3FG@vger.kernel.org
X-Gm-Message-State: AFuF++ka/Uj/mCjOG80w0ua2QRTrrIGTUsg/lj2SEJkh5H72tYuItglE
	XKYq3EzdpXNrAumUENAnF6VKhusty9kHXNDHpqcVYaYEqDff4g9Eib2R
X-Gm-Gg: AYBFou3TNYPzqNtGAruAJLLI7dQSJX6Z30NIkfyiZJ0lhoO5Fkv17qDNQZ5jt7tvhjF
	iMBsM8WPEm8Sonyn51fwyQRaFN3Qx/hbx+K6VjHNUyFBNNysyzMcbgRajYgo5LMek+bCoEAtOrs
	xahT98NBQ65XH8xUsfdvJQm1yp2VJkVz5ywSM1ngfhBh7fx1zEFJDJCjp4sXAWb2nNVdtTZKm51
	GeCXummLl3nS2OwNCaEowtnyhGNBAJceWuKKdn7SIZYSOu6hSZqGV2RYNtxvu2+bH+kYyjuRaWC
	MM77IZRci6fyKRzItzL5k5kJUhvFcy6hZTIOaveUzT2bY5z0KIX9hcsqJRpEJMPhDHEh3Y4mW6k
	uX+P7LiT9C5SK1FyGCdGqh0kmp/hY3Ff9taT5LB8CF+0Itn76fA/ZFRYbRC7O6vvsKWbatMZHAZ
	nb/l0LTFf2h6XR2pzr0xqreBYGoE5BkCWthlTCwpkE3l2hsCG7Ce7RU9QSgmvQEzzkbgkiv8K7X
	xydvl62azBY46z2RLu9a8qFmU6ypHchWvzcq9NHkIoxSuudyU2PddDYK+vgjOgBEqe8N6JTQEe8
	9MQvQHOBkmZ1/upbpQfbQK8UwL/Swv3LBxhUpmPEFAljPkBVYFO94ljOEkjd1TxY
X-Received: by 2002:a17:90b:4c46:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39e54922644mr13476570a91.0.1789807018405;
        Sat, 19 Sep 2026 01:36:58 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a111sm3920735eec.6.2026.09.19.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 01:36:58 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andres Salomon <dilinger@queued.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Input: gpio_mouse - remove driver that has never been used in the kernel
Date: Sat, 19 Sep 2026 01:36:40 -0700
Message-ID: <20260919083655.586922-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio_mouse driver was added in 2007, but it has never been
referenced by any platform data or DTS files in the kernel, and it does
not support ACPI probing. Therefore, it has clearly never been used by
any users of unmodified mainline Linux. Remove it.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 .../driver-api/gpio/drivers-on-gpio.rst       |   5 -
 drivers/input/mouse/Kconfig                   |  15 --
 drivers/input/mouse/Makefile                  |   1 -
 drivers/input/mouse/gpio_mouse.c              | 170 ------------------
 4 files changed, 191 deletions(-)
 delete mode 100644 drivers/input/mouse/gpio_mouse.c

diff --git a/Documentation/driver-api/gpio/drivers-on-gpio.rst b/Documentation/driver-api/gpio/drivers-on-gpio.rst
index 95572d2a94ce..e386d909bc08 100644
--- a/Documentation/driver-api/gpio/drivers-on-gpio.rst
+++ b/Documentation/driver-api/gpio/drivers-on-gpio.rst
@@ -21,11 +21,6 @@ hardware descriptions such as device tree or ACPI:
   GPIO line cannot generate interrupts, so it needs to be periodically polled
   by a timer.
 
-- gpio_mouse: drivers/input/mouse/gpio_mouse.c is used to provide a mouse with
-  up to three buttons by simply using GPIOs and no mouse port. You can cut the
-  mouse cable and connect the wires to GPIO lines or solder a mouse connector
-  to the lines for a more permanent solution of this type.
-
 - gpio-beeper: drivers/input/misc/gpio-beeper.c is used to provide a beep from
   an external speaker connected to a GPIO line. (If the beep is controlled by
   off/on, for an actual PWM waveform, see pwm-gpio below.)
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 074130d88953..5f2466c08b9a 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -332,21 +332,6 @@ config MOUSE_VSXXXAA
 	  described in the source file). This driver also works with the
 	  digitizer (VSXXX-AB) DEC produced.
 
-config MOUSE_GPIO
-	tristate "GPIO mouse"
-	depends on GPIOLIB || COMPILE_TEST
-	help
-	  This driver simulates a mouse on GPIO lines of various CPUs (and some
-	  other chips).
-
-	  Say Y here if your device has buttons or a simple joystick connected
-	  directly to GPIO lines. Your board-specific setup logic must also
-	  provide a platform device and platform data saying which GPIOs are
-	  used.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called gpio_mouse.
-
 config MOUSE_MAPLE
 	tristate "Maple mouse (for the Dreamcast)"
 	depends on MAPLE
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index ed40f141691e..52c0a99853b0 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -11,7 +11,6 @@ obj-$(CONFIG_MOUSE_ATARI)		+= atarimouse.o
 obj-$(CONFIG_MOUSE_BCM5974)		+= bcm5974.o
 obj-$(CONFIG_MOUSE_CYAPA)		+= cyapatp.o
 obj-$(CONFIG_MOUSE_ELAN_I2C)		+= elan_i2c.o
-obj-$(CONFIG_MOUSE_GPIO)		+= gpio_mouse.o
 obj-$(CONFIG_MOUSE_MAPLE)		+= maplemouse.o
 obj-$(CONFIG_MOUSE_PS2)			+= psmouse.o
 obj-$(CONFIG_MOUSE_RISCPC)		+= rpcmouse.o
diff --git a/drivers/input/mouse/gpio_mouse.c b/drivers/input/mouse/gpio_mouse.c
deleted file mode 100644
index 18ccbd45004a..000000000000
--- a/drivers/input/mouse/gpio_mouse.c
+++ /dev/null
@@ -1,170 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for simulating a mouse on GPIO lines.
- *
- * Copyright (C) 2007 Atmel Corporation
- * Copyright (C) 2017 Linus Walleij <linus.walleij@linaro.org>
- */
-
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/gpio/consumer.h>
-#include <linux/property.h>
-#include <linux/of.h>
-
-/**
- * struct gpio_mouse
- * @scan_ms: the scan interval in milliseconds.
- * @up: GPIO line for up value.
- * @down: GPIO line for down value.
- * @left: GPIO line for left value.
- * @right: GPIO line for right value.
- * @bleft: GPIO line for left button.
- * @bmiddle: GPIO line for middle button.
- * @bright: GPIO line for right button.
- *
- * This struct must be added to the platform_device in the board code.
- * It is used by the gpio_mouse driver to setup GPIO lines and to
- * calculate mouse movement.
- */
-struct gpio_mouse {
-	u32 scan_ms;
-	struct gpio_desc *up;
-	struct gpio_desc *down;
-	struct gpio_desc *left;
-	struct gpio_desc *right;
-	struct gpio_desc *bleft;
-	struct gpio_desc *bmiddle;
-	struct gpio_desc *bright;
-};
-
-/*
- * Timer function which is run every scan_ms ms when the device is opened.
- * The dev input variable is set to the input_dev pointer.
- */
-static void gpio_mouse_scan(struct input_dev *input)
-{
-	struct gpio_mouse *gpio = input_get_drvdata(input);
-	int x, y;
-
-	if (gpio->bleft)
-		input_report_key(input, BTN_LEFT,
-				 gpiod_get_value(gpio->bleft));
-	if (gpio->bmiddle)
-		input_report_key(input, BTN_MIDDLE,
-				 gpiod_get_value(gpio->bmiddle));
-	if (gpio->bright)
-		input_report_key(input, BTN_RIGHT,
-				 gpiod_get_value(gpio->bright));
-
-	x = gpiod_get_value(gpio->right) - gpiod_get_value(gpio->left);
-	y = gpiod_get_value(gpio->down) - gpiod_get_value(gpio->up);
-
-	input_report_rel(input, REL_X, x);
-	input_report_rel(input, REL_Y, y);
-	input_sync(input);
-}
-
-static int gpio_mouse_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct gpio_mouse *gmouse;
-	struct input_dev *input;
-	int error;
-
-	gmouse = devm_kzalloc(dev, sizeof(*gmouse), GFP_KERNEL);
-	if (!gmouse)
-		return -ENOMEM;
-
-	/* Assign some default scanning time */
-	error = device_property_read_u32(dev, "scan-interval-ms",
-					 &gmouse->scan_ms);
-	if (error || gmouse->scan_ms == 0) {
-		dev_warn(dev, "invalid scan time, set to 50 ms\n");
-		gmouse->scan_ms = 50;
-	}
-
-	gmouse->up = devm_gpiod_get(dev, "up", GPIOD_IN);
-	if (IS_ERR(gmouse->up))
-		return PTR_ERR(gmouse->up);
-	gmouse->down = devm_gpiod_get(dev, "down", GPIOD_IN);
-	if (IS_ERR(gmouse->down))
-		return PTR_ERR(gmouse->down);
-	gmouse->left = devm_gpiod_get(dev, "left", GPIOD_IN);
-	if (IS_ERR(gmouse->left))
-		return PTR_ERR(gmouse->left);
-	gmouse->right = devm_gpiod_get(dev, "right", GPIOD_IN);
-	if (IS_ERR(gmouse->right))
-		return PTR_ERR(gmouse->right);
-
-	gmouse->bleft = devm_gpiod_get_optional(dev, "button-left", GPIOD_IN);
-	if (IS_ERR(gmouse->bleft))
-		return PTR_ERR(gmouse->bleft);
-	gmouse->bmiddle = devm_gpiod_get_optional(dev, "button-middle",
-						  GPIOD_IN);
-	if (IS_ERR(gmouse->bmiddle))
-		return PTR_ERR(gmouse->bmiddle);
-	gmouse->bright = devm_gpiod_get_optional(dev, "button-right",
-						 GPIOD_IN);
-	if (IS_ERR(gmouse->bright))
-		return PTR_ERR(gmouse->bright);
-
-	input = devm_input_allocate_device(dev);
-	if (!input)
-		return -ENOMEM;
-
-	input->name = pdev->name;
-	input->id.bustype = BUS_HOST;
-
-	input_set_drvdata(input, gmouse);
-
-	input_set_capability(input, EV_REL, REL_X);
-	input_set_capability(input, EV_REL, REL_Y);
-	if (gmouse->bleft)
-		input_set_capability(input, EV_KEY, BTN_LEFT);
-	if (gmouse->bmiddle)
-		input_set_capability(input, EV_KEY, BTN_MIDDLE);
-	if (gmouse->bright)
-		input_set_capability(input, EV_KEY, BTN_RIGHT);
-
-	error = input_setup_polling(input, gpio_mouse_scan);
-	if (error)
-		return error;
-
-	input_set_poll_interval(input, gmouse->scan_ms);
-
-	error = input_register_device(input);
-	if (error) {
-		dev_err(dev, "could not register input device\n");
-		return error;
-	}
-
-	dev_dbg(dev, "%d ms scan time, buttons: %s%s%s\n",
-		gmouse->scan_ms,
-		gmouse->bleft ? "" : "left ",
-		gmouse->bmiddle ? "" : "middle ",
-		gmouse->bright ? "" : "right");
-
-	return 0;
-}
-
-static const struct of_device_id gpio_mouse_of_match[] = {
-	{ .compatible = "gpio-mouse", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, gpio_mouse_of_match);
-
-static struct platform_driver gpio_mouse_device_driver = {
-	.probe		= gpio_mouse_probe,
-	.driver		= {
-		.name	= "gpio_mouse",
-		.of_match_table = gpio_mouse_of_match,
-	}
-};
-module_platform_driver(gpio_mouse_device_driver);
-
-MODULE_AUTHOR("Hans-Christian Egtvedt <egtvedt@samfundet.no>");
-MODULE_DESCRIPTION("GPIO mouse driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:gpio_mouse"); /* work with hotplug and coldplug */
-- 
2.43.0

