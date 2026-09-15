Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DDA3B42EF
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459514; cv=none; b=XCqJ1ZMIMxIl/9r4h9MkM5ixoReIIvHHCOep+hbo2n8JVnzfjBfM7/Cwki0b79knILeIaPDe+FBa2BQjZ6jKz3m7Mysvfrq/qn/6RDivVQJMUgs4Td7ezxiRXwNnirVN0UBaX/IOI6WzmaZQrbIpQpLMAyWVG0BaaIhTwj6rfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459514; c=relaxed/simple;
	bh=+kqeTqpcEjn+LLVVihM/uu8q4NnBEHCrxafwfSxU/xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et97Wzje8d0R0SJv8VSX7fgNby4JDVn2VB0InU7rxiHiBx/o7oep4xYE61sozyje1HC5TGhiS78DsZIXdyonyrODWq6Og1wmtjfVSbIvHFNNB+X4htd//WWuCKykSKgysIuUzKvGXT3lXYEiacTa7UrGN7XWI251WuqwKDNTOKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuPjSEno; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuPjSEno"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356256so1040331f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459508; x=1790064308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=PuPjSEnoftskUjhjdtF/0myv9nDRwJAk78WCJU4IjA8cLNITL+eY4dnLYXVYkEFi78
         CW0LuU4YQBCvbqL/oMStQN7nSmde38HaOq16KhKQs/u0lfu/YPM77On8i/FtLF99l9+4
         eVb093EHH9LihKoC41RvBX/OeWE2k3BVuykdUsjcj5cBo3SiROLulrk7QX3N5YNhfATo
         96G4GT2CbWjyHEBMVRDUhdm1XAHatiK3d6aAgz7b9nWNft/nfAbLZHQctXShf6brjZbc
         4CUXoA8HaTp/NtbYbuW9AUNKbk+8WObryH4JpkxJqG1q8SdMgqa/ym9wpVGweyCMflxn
         9mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459508; x=1790064308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H137qfG3h8enrbCR8FlT5MD3WdEANP9LGcr88jAxASI=;
        b=l6bpCUnYzzVW//QwtrRavz/p7bzgJ1OxH72u6CpvA3kFUwhzYwAlFoexbfjLctqi22
         ajrUTAipyjstz00AnzBj5yAUWDdfxCj1bxHZRwGmXBQLUHPhev9hGsWSa+UiZ6z8kJGX
         N359yQB603Poz5Vab2BZ+7fwp1xd233xS1FKz0QyppZ22cROl7wYC2OBntx8AGKG3w8n
         eJMhtVGLg3c1kH0XpqcS9/USFZVwFGEbs+Bewog6Ayr70VlXclTn9xhN8gZgUHqXnWA5
         7Q1IIQCoD/K7oTA1BOqtUc0vt1tOt9m/ETfmuVSxogY8b/qFmqDo5ZKAJJ83NanQVoka
         Ks3A==
X-Forwarded-Encrypted: i=1; AKwUvBy2d+kSrEBIwaW5GmH0xct+dMk0eMpv0rpGNU3kZYa4pLvNpJkeaptl+Kg/oVXw54yeHUiKyenXxDHF@vger.kernel.org
X-Gm-Message-State: AFuF++nG5bK0HZaZN1SqQoG9HJCUyHK7rc2OyyfDvh1oo5DS7HC0Qqbz
	/QCZqLbArrJk6TRhHWyfP5ZbNw1Aqos4bQ61/o4QzrjKYLhoc8qAUb98
X-Gm-Gg: AYBFou00RJVHf3U8EqCIKCGirKGW9cNOJwnE+I5k4mJ7pYi06zvQbWq6gLfDreghHpb
	t8M/QbMEGCi6hrhflJgZL3prizfmV/tiQlI25xpMTa0KfbGxRE9jLMwgEolHtT5ugacybyst/CG
	Zr7zJHf5TAWT4vVkWpwzPXhH/9y3vGRs3XuJ6ZSyfNAmZ6DDyh62gNFjPesuqVoJ84qAGL97vha
	fJdvOdZmMUV24YG8HBVAv2Mg5Hg0PzwzRyEvf8w7wv5JNPcw8bA4SvXD2B6lwVzXtyunJ8iE5Ag
	P6KPJvgRTWdLME3fITB7Ju4vlz/VH3EJ7wfLdwEYvGsS3n8IGcQwr1Qp3QdvVScbQf1MTP6VjHm
	1pekvYL0e15MszW0DyJVxqjhmsRkJ8YcwEgyDvZ/Z8PQ3xyunLfTAIuVAyIi4FKQ2N2eCtH+E/m
	SbXI8oHepa1T530R3Wh0+Cb6Rvo8fGIenTB21+u9WcedXjqotv0amhVEzwkSiNXaJm1durlBnDM
	FcU
X-Received: by 2002:a05:600c:3e10:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49e7d722aa2mr32668075e9.1.1789459508063;
        Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:07 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
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
Subject: [PATCH v6 4/4] gpio: mmio: track the direction of chips without direction registers
Date: Tue, 15 Sep 2026 10:05:01 +0200
Message-ID: <20260915080501.329424-5-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
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
Colibri module the i2c core, asking for the SDA line's direction before
bus recovery, gets that backtrace on every boot, and so does any other
caller outside gpiolib.

Keep the direction of such a chip in the existing shadow: the direction
setters update sdir under the chip lock, and get_direction() is the
shadow-reading path already used for unreadable direction registers.
That keeps the callback usable in atomic context, which it has to be:
gpiochip_lock_as_irq() calls it for !can_sleep chips from
gpiochip_irq_domain_activate(), under the irq descriptor lock.

The pad's actual state is read once, in process context, when a line is
requested: gpiolib calls request() right before get_direction() for a
new line, so the shadow is seeded there from PIN_CONFIG_OUTPUT_ENABLE
through the chip's get_config(), which is gpiochip_generic_get_config()
for the pinctrl backend, and the line reports what the pin controller
says. Lines pinctrl cannot answer for keep the input default, which is
what gpiolib assumed before.

dir_unreadable, so far set only for GPIO_GENERIC_UNREADABLE_REG_DIR, is
now also set for a pinctrl-backed chip without direction registers: both
kinds of chip have no register to read the direction from and serve it
from the shadow.

The answers depend on the pinctrl driver decoding the parameter. On
Vybrid that is the preceding pinctrl-imx patch: without it
pin_config_get() returns the raw pad register, which would seed every
requested line as an output, so this patch must not land ahead of it.

Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-mmio.c | 60 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index 7e4b3e8d609f..0709ffaab4de 100644
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
@@ -601,20 +622,51 @@ static int gpio_mmio_setup_direction(struct gpio_generic_chip *chip,
 			gc->direction_input = gpio_mmio_dir_in_err;
 		else
 			gc->direction_input = gpio_mmio_simple_dir_in;
+
+		if (cfg->flags & GPIO_GENERIC_PINCTRL_BACKEND) {
+			chip->dir_unreadable = true;
+			gc->get_direction = gpio_mmio_get_dir;
+			gc->get_config = gpiochip_generic_get_config;
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
+	if (!gc->get_config || chip->reg_dir_out || chip->reg_dir_in)
+		return;
+
+	config = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+	if (gc->get_config(gc, gpio, &config))
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
2.55.0

