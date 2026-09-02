Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4D9328B7B
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 07:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334794; cv=none; b=hXUYnvqgL9Qi9DI9aX/HZsyTpFy3MzuCHAeLFRSyT8pJ7BRU8jjlBibBybVA9HwXokLnBJDBt0w5RGFL/zOSArOkglUbo9l/HsCqLHMyyT84PtDqvhjVU3js6pLj8cQSSuuMhSotna3W4o+g9y1CepJqh2NlIflkjVpzUYRim/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334794; c=relaxed/simple;
	bh=ilpC4FCHdlA4H9uyWtCLuUO0bSAPtZOeSQKIqdsgpWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1MSDY8/eyX9J7WGho8n15YZ1LbJ3Bil5U07+FXZ/RgHD3CxspSGUfg9FsqN7Ure3zNBHnmLvQjtsDTpIiYDxZFaA/DztYgYR6zxWsBQXevq4Z6eO2fphcqh9n+FnMKV/mhHqrft2W1cY8HqGiZnnuXUC8WzvYDNOKweyXijLjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2ATjAzP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2ATjAzP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482dbe4d247so299122f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 00:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334791; x=1788939591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=;
        b=A2ATjAzPwTITDw220SL0sE9YRvqWQdEuyS4VUlVPAnchPlYuRQVXpsDxWauDv1q4kd
         m2ceyq03MkRylvq7uB01n6Rftd2OIOaAK/knqMxciK5sHTdSiMk6D9u4H6Ghne02WHAj
         7PzIjLKAuL15b6aYYzya5Dk7x5Vj18dUwV9/0BRSTXbpR2FZuTyjXJFEYUmPyuZTZxe5
         EdT9vqgIW0yINxq60jTGSoAuPsi6Hu0yRdqshIIhyG4xfcqywwJ417IHW7ItFTF9g1xH
         6oi+qxcqpcR4dEMjE7eDdv3bkDVyX3b+Dq4CxqxeJ/P4QDAZkVbanJV7cghDWSs7xIPa
         lG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334791; x=1788939591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i3PGsxzvr5pYDG64U4cbt7QQR2dVwmU3hq+h46iagFg=;
        b=lnxn8F5KZ1gzwaUEU8UocagmVvoLGdzdfDuWVmkJnQZWMneK7oRPkxDiYEP+Y6HYKa
         MAhACkPoQPrpIHa96Qw7WuRj2FA5diqOy92yRPiiCJ9mMvWYljsfI+OzIOVBDofK4+Gl
         xEND2iryCR66TUWW1bG/4kl5FQXImXAGY9dZHQS12Rx2F2EiIFFDPgjNgfUAN1pd0fzk
         egGAeDIf50dl+ReII1qX4aSmZV4U22yU5JM+6MnUVSknZVQCiDtvGVVu/ctlXmDvJtZg
         SDNOuR5/7DZagbzTARn61uu3fC0/nrMKzobCkUx72KebXNrQCBMfwTX/TSOX6Wdk3FKn
         zZRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM8iP/Sp23QbdwBPolTFvLzv6/20EtWQTmYt//AkHSBHvtVqimCD+su8pCRut35a6cYHjzwv7PrGyV@vger.kernel.org
X-Gm-Message-State: AFuF++krYUgRM7HvJdmvHPmQwug+vWb30xiz0DhVWBu5ghHHuCsykWdJ
	w4YbBCarVW/Y6H5H2vL2XUYVcIuWNzG5kQb4zyZqRXN/kdIMnLYKM35g
X-Gm-Gg: AYBFou2fIrgQXegURzJ+hUcfUjSKldAItcn3NWTS+Zu0l04A6JiDXKaNvxwJQ88mdRX
	lTsawuQNdRBlT8bg9/7SsyS0QYq2V5YELIJm4ArKN2CmPZsceoxvlReNDMXHepNaYvlICJGC9WB
	sfKS9Mk8AH1jwCtHPsZ0PZIAHxGlstEgh34LP3Wg5i4Uzpb6BT54OAwJvTPGpl1vPF4y1ousdle
	oSaII1p9fRReIi9k2YVu9iEiu6x96J1/JXj8+AQdV86K0w24XJUuYAibuzhlo3aszAhpXISKGUH
	oC+83vvU1kQq9KnhDBmCn+xjWaLV9zIyjIiQoEHTjEZRZ/8oGHtRvY4tyi9g/fSglXvBtmcgqb/
	1xbB/WAHr2EPif2CwwqbHI+ahVItjTWjpc18OwPvuyaFQTGy6jhvMwa+RPyQsHkqE6D55Pe/BPL
	zbIhvFxUCUKFqhtXS6+aPbvl0pLPMEb86S9QOoiqPQ4vQDA+rJuq8ZjYnuYuaxiNWkYQ==
X-Received: by 2002:a05:6000:4910:b0:482:f61c:7cdd with SMTP id ffacd0b85a97d-48488df9e0dmr4742560f8f.4.1788334790310;
        Wed, 02 Sep 2026 00:39:50 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492ce5e5sm4209375f8f.36.2026.09.02.00.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:39:49 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v2 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 09:39:46 +0200
Message-ID: <20260902073946.3709080-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902073946.3709080-1-mehmet.fide@gmail.com>
References: <20260902073946.3709080-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
registers sets the direction through pinctrl but has no get_direction
callback, so every gpiod_get_direction() call trips the WARN in gpiolib
and the direction gpiolib reports is whatever it assumed. On a Vybrid
Colibri module that is 21 backtraces per boot.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
the line reports what the pin controller says. Lines pinctrl cannot
answer for keep the input default, which is what gpiolib assumed before.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
v2:
 - keep the direction in the chip's shadow and reuse the shadow-reading
   get_direction(); seed the shadow from pinctrl in request(), because
   gpiochip_lock_as_irq() calls get_direction() under the irq descriptor
   lock for !can_sleep chips (Sashiko)
 - lines pinctrl cannot answer for keep the input default, no error
   returned to gpiochip_lock_as_irq() (Sashiko)
 - drop the claim about the initial direction scan, it runs before the
   pin ranges exist (Sashiko)
 drivers/gpio/gpio-mmio.c | 65 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 61 insertions(+), 4 deletions(-)
 drivers/gpio/gpio-mmio.c | 63 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..84bf8cc7a0c7 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -49,6 +49,7 @@ o        `                     ~~~~\___/~~~~    ` controller in FPGA is ,.`
 #include <linux/log2.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/pinconf-generic.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/spinlock.h>
@@ -372,7 +373,17 @@ static int gpio_mmio_dir_in_err(struct gpio_chip *gc, unsigned int gpio)
 
 static int gpio_mmio_simple_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
-	return gpio_mmio_dir_return(gc, gpio, false);
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
+	ret = gpio_mmio_dir_return(gc, gpio, false);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
@@ -384,9 +395,19 @@ static int gpio_mmio_dir_out_err(struct gpio_chip *gc, unsigned int gpio,
 static int gpio_mmio_simple_dir_out(struct gpio_chip *gc, unsigned int gpio,
 				    int val)
 {
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
+
 	gc->set(gc, gpio, val);
 
-	return gpio_mmio_dir_return(gc, gpio, true);
+	ret = gpio_mmio_dir_return(gc, gpio, true);
+	if (ret)
+		return ret;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+
+	return 0;
 }
 
 static int gpio_mmio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -601,20 +622,54 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+		}
 	}
 
 	return 0;
 }
 
+/*
+ * Without direction registers the direction lives in the pin controller,
+ * so seed the shadow from there when a line is requested.
+ */
+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+					    unsigned int gpio)
+{
+	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	unsigned long config;
+
+	if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (pinctrl_gpio_get_config(gc, gpio, &config))
+		return;
+
+	guard(raw_spinlock_irqsave)(&chip->lock);
+	if (config)
+		chip->sdir |= gpio_mmio_line2mask(gc, gpio);
+	else
+		chip->sdir &= ~gpio_mmio_line2mask(gc, gpio);
+}
+
 static int gpio_mmio_request(struct gpio_chip *gc, unsigned int gpio_pin)
 {
 	struct gpio_generic_chip *chip = to_gpio_generic_chip(gc);
+	int ret;
 
 	if (gpio_pin >= gc->ngpio)
 		return -EINVAL;
 
-	if (chip->pinctrl)
-		return gpiochip_generic_request(gc, gpio_pin);
+	if (chip->pinctrl) {
+		ret = gpiochip_generic_request(gc, gpio_pin);
+		if (ret)
+			return ret;
+		gpio_mmio_seed_dir_from_pinctrl(gc, gpio_pin);
+	}
 
 	return 0;
 }
-- 
2.54.0

