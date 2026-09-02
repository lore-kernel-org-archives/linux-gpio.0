Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3424A3F18
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788363936; cv=none; b=a5YEV+2rl1dAVXHfB9wCEWzQhnitFrN3bzhaGSFQfiT1UEp+nF6uBMwke+bOEHpe31c7F090NT3YATxlZpPFO9Nc0OUyYyr/usElTnC7zNjoURs3gp5AC3v0FfFCbM1sW75ICXkMHwNmLlqRc4M2RzswermsGCy+6jiLs6bGwbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788363936; c=relaxed/simple;
	bh=2cVQm2hyDOussy9LNB0Uh8MJoeGRDGhTixY4iyHbvQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnU9HGvo0vHjCltEqFUwVnfQRDgCfKqZRy5HO9pxqpWbRu5lPxCbyzNaQ2501yTP529lyikwS9vPscFa0Y768Fnm7mNEnNbXRVg5IAQAvMjvINarHnPpQmzs7XcJddblTOPYjyYrux28BUC9ZMmStycrRnDCGrLnOCjrkjDkymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAbEWnLZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAbEWnLZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e067e908so1105762f8f.2
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 08:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788363930; x=1788968730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=dAbEWnLZSmibOtOTHf0dCYfaC/xLGBDCFU4zaKfh7wLwLKSRXq9L/91gkHag1H2Yyt
         /YkxdX7iTvR5qDul6g7m+2jCloEQz//xtMd052f5pEM3jtsxqG5pKlsSOjWv/1+z13K7
         IrlYcYeJXb5+cKugPOrR8L96+VuO8nPuU9Zb82STWUeg165UgzGFegnsAaPUJTOIefbi
         ZXbPEaWKmHZkdKedmiuetNZqc5KYVpFxrXGQpT+AmyCFITOSZLsRiyBxHSrxrlaaBZ5L
         XZOF/EDmdn/Hns1HToKW5ueq1pCGhbTWZSPcBW6wpAUsT/URZl2jjSazSnT0oov71p7e
         3hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788363930; x=1788968730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ABWq6yl6RmD8WKfldYZOiTpcwQ6GawnJnekuHKy7JS0=;
        b=LrqQBPZLOdeNIczOzyEdWva+NHREYf4hiJp5usy+tc8lzL+UYIzwpTjoV5u8yc1k57
         DaQJs1LsAQZPaMdWnXd1AecFWpRIVUEfkJ3QSWrNo+UAtrEHgiTULGhwWTOFwmR78pqe
         TCd4uRzf84fLxMqrycOfS35fPVzIMjlLmfWE5haZ54+hvJ1430MgVQb+5j+kzJC9jySp
         UYu0s68RA+SA6TaxfuMQzA8OdoljNyrOZ3NWpRym3tkxLrFdJLDI16iyNmfTJx5qDzkU
         J6Umr+Vc7/I6WdRetxQQQ3FPZg7kKx+dvE6JlixjKhUNvxyJ+0wGYzhVWD2nhDHsArzY
         6Obw==
X-Forwarded-Encrypted: i=1; AHgh+Roi9eLW9jPI275yC2tLTGI0TwK3LrwkIxKORGiO5vcVizZqTVlN+LFEs24Rd2IOVVyZKyK7Z0wZliAY@vger.kernel.org
X-Gm-Message-State: AFuF++kekkBBUIRMe6IXloFdE389yJamSUwHoJfbyLwdzXNzVLaU/A5D
	ispyqmVCqL3omdWpdTARa8rw9kdI6swdihpo7Qt8PAPfgDp9wRW9YNEv
X-Gm-Gg: AR+sD11S1DMUDPYqfObPLMyxUPn5U7egp+J/UPxzU2zOTJtXcaQfhR+HksULjMTMSW6
	7X2UndCi1tDkTE/dEYs6XdAI9WcrkbTFf8rbq0WUWpvw+owOpGh4wcU3qfJqZxJMVVIpHC/D76g
	4V6uHpejf07Daq++Ddp0+q1J5zG5GRiGrwJP1peeiJB9wIrEY0JrWhnNPoPk+Melutxu55vSEUG
	IQVBeAbfGK+u4dLmOxhKCg9CaPTobWY0ojO0TCm898JBgm99HU7vvGgI0sjDLyvDhCb58YXVZDm
	I3MIljCgHnw4SAO58rWXQoA9+Fegdbz8BrEVyeb37e2X76PM6Aj044b/Bs0wgchLck6wLJe7n+b
	9IJ52EgO51sl5iSlPfpFmWo6Ly5awTgZLjO+RoyC8CPc5jqRVjmharr6Hzrc2gNwSPZeNMScvMl
	iBTPyAfV9UNU9nmKqtPkIs6AuRwH+XVGoZod6QZp8ZSZPpViJs/q1Hqagkwiir10Po44Y=
X-Received: by 2002:a05:600c:6296:b0:499:621a:2ec2 with SMTP id 5b1f17b1804b1-49ce581635bmr118401635e9.3.1788363929530;
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e686fsm530655e9.15.2026.09.02.08.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 08:45:29 -0700 (PDT)
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
Subject: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  2 Sep 2026 17:45:25 +0200
Message-ID: <20260902154525.4090276-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260902154525.4090276-1-mehmet.fide@gmail.com>
References: <20260902154525.4090276-1-mehmet.fide@gmail.com>
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
 drivers/gpio/gpio-mmio.c | 59 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..987285c33f45 100644
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
@@ -601,20 +622,50 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
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

