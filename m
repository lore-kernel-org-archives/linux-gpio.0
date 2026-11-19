Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795078528;
	b=s9GYgqb9kXTiUplQLSpRXR85y62xsgGTUsDMEX7/H1KjeBSwuOuyZUG+4XRR+UHCA+rJ
	 FQnT4cB/zACqzz0Y3pm9EgSyZ+KB9THjvF2kgRXiG/UHFOsr6HcDOXn2WMGsNzQkBZ5SY
	 i3nSr+jv076pdqfnmr/A/2T/ywnPl/WvUdFBq3dgFTbMv5RaFViM2yCr6jqtfCQMf3kLW
	 sdnbZ1t2tNzTeSibvcefle5aSKABWEAhCiKZaqd4NloJdyNPPjk1TxReA/2/0x8X9S7G7
	 iQru3DVHH3unU4XuEHPiYlFps0YLLnJqh9xOwg039VckSlXwpSvKS5X1bhuBBMZr5lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=RyccqeJdymJOiRg4VMSH1mrQmrCidcwtC+hOOg8zN30=;
	b=yC1Q61DZmPrDwjfWDnYomvIeE/lSEG/k3bN9/TjlB3vrKbi25bjCvN7EjA2Cv7toFNZI
	 alsPPDJHQOh/svU3BO2fwSxveoMNwbtvGe4MHSnX3WOh6M3He0xFEJ3Arm46Mcp2+H1FW
	 HrTl80YacGChqlvFiiCZb2mUupVqJwwLfiBuUeyihZ65e86JdhOfOPtjN3RVCXE8w4EeN
	 U3mHPEMrjNTOrgZHSMivWrZebNGPvGzpsynU+QaQr0Dwf1Wlu4KNsio9DJobahofUAQeT
	 Im1rY+sO6UZqR/hwda6oMdiTl6cjBLaC/+uJHhXCDJsszSKzkl5+iRBYD1E+4J54uwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuoRz6sc;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AE0606A320
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 08:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1AE0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OuoRz6sc
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13695725e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 00:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1795078526; x=1795683326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyccqeJdymJOiRg4VMSH1mrQmrCidcwtC+hOOg8zN30=;
        b=OuoRz6sceN5JfbnfuhMiyKKK6j7TOYL2/Bn5bz8oeMsYENyF9Y2EumIrY0XEBiJ3/z
         R/+BylA1Z56McUOEHqfKsxwzH/e6OTkHc/D6syCmxG0iAbtBlqKwNgdzEZDE/fmA2mBE
         C/bSU4Vqh1eRvy+9SSkpwRP495LPwMdvUrbAJqcIteg1ZQl0yKeWnThQU8SvSlJK8Z77
         EtwouYNXhvPMqKJVl4UuGOnRGozgzsOz+V9Rvq1VILMNPcjlanb1Xh/M13AU8GiBYX+s
         voY/SbbE7gz28aYAzKINdge1/xUETi+fgEMtIdP6He8idaOatGfg9ETI55zSQgu+db6R
         h5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795078526; x=1795683326;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyccqeJdymJOiRg4VMSH1mrQmrCidcwtC+hOOg8zN30=;
        b=yVaqfm4G+id3rg9JbIze+Z98LMF6M/u3Hzr0aBO9XsGJ7zT3i/UrYEdX83/Z0AY0be
         xyID46PChbhWpRwg2UsmQ3aXrYAgU8D1+YTvhcZ2hXq6NnGlEKv5btxM9/Gvb0FVXYcf
         LZ7ZsfRmCYq5Y6HAB4NMbV4ShhHFRGqV9914ZBzkz0aQt6RWWFt70FnpPAoD/ax2hmB5
         y7L+BtZaHVFnr5LKSRWLpQkQstRiLKTKKkv+sTGRnvxgO6BXQJAP3N3BZK3qCDKQgxIE
         CidvgT7omGLExwEZG/OdF3Ux0+Qk2Vuw0zGooZbCwaRa6GnmOjys4Kg0u/hkJ9dq9Kn5
         lBmQ==
X-Forwarded-Encrypted: i=1; AL+hErHv0ZIoC+9x0tmjd06C67Q1XTHgmN1JwMhU225QyxduHQbutjbQvtw5guUG1iOam2N11a1zfufr4oxd@vger.kernel.org
X-Gm-Message-State: APuU4Z9TE0tbuFi3KjhPZdUKsFJEOHjGuwn4ZnHSdQrQND6v174ERLLb
	HCB3moQ1NZ2eN/Hzkq4bVDFUnLR9c+4cFlYLqGCm25uWdo3A0o+TzngR6EyKtmkinHHjWXMZw5v
	DyS/ew9U=
X-Gm-Gg: AYBFou2cZoR9aFbJ+czl6lV7TLCImGR0BjNz+ExqnvdjYF3IgU5TiVMuCz1XfVv8Ouc
	Zh86TmIe+DttdWWaNMsu5P7Z+VAWhjBntSguuFmOLWJw2lRTBBvLXx+JOzYCQs6V+ORVTzg1DNc
	N+EgUZfjt7iaqI/Rsl+fwtdSncz/uxSckqOqXXxXGoztm09HfWUE8FTldc6qfE4c5TjDV1VaZUJ
	W0Nf7SmP4XzSzOy7ltZCpx/x/BKj0eoGXpGfF/QKY0ICRrhfRYj8NGuOt7bprZ6CE/quD/fHZFo
	746LZLjKXOPwlzlwlGqsOZk0w/bnrIqjAcxr9vO8G5shGL5blDevs+p5L6kEH0LbDPYsUmKOGzL
	P08WpvNNnVHvGkK2sT8wK6ftbheHBE6x1gqp2Ebz/yyxuph9fWApo8P40oGVqjsyoeS4JkusgIy
	s7IuilBmAZU4NcU+zjO+11L7XtTAkLvWQZmkQ/u93xBNSYNgskbq95s/muJbHt7bPWqa7lijppz
	SluqSjJQMZPqaexf42dp8WkkpItfg5xfL/pBuUDFuMtHim6yqXn6vvTXMKKJa9MsVWB3/u5in1X
	NhaznZc87AnXOAmYLmL4JN6qdaQNbkbcnZSH2dK6NdwcmhDmHZGUYbZeIJ1K9MjUSw8Z
X-Received: by 2002:a05:600c:3494:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb7da4efd4mr99770435e9.35.1795078525805;
        Thu, 19 Nov 2026 00:55:25 -0800 (PST)
Received: from [192.168.2.26] (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560ab64sm8640554f8f.25.2026.11.19.00.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:55:25 -0800 (PST)
Message-ID: <0a4623a1-0c3e-4802-a7fd-cfceb84de40f@bytesatwork.ch>
Date: Thu, 19 Nov 2026 09:55:23 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: gpio: pca953x: TCA6418 support and driver design
To: =?UTF-8?B?TWFyw61hIEdhcmPDrWEgRmVybsOhbmRleg==?=
 <mariagarcia7293@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org
References: <0935c08b-828e-4a8f-95fc-04b82ab30fe7@bytesatwork.ch>
 <knel65hfjbq3j4trrtrkdwg5brf4mu6md4fzudtkrf2mznqrnp@6nitoipqu7k5>
 <CAFOBSkR9eHu_2UZkyu-v8saQ2YrKNcQxbLbyKNkFWtZw3XvMMQ@mail.gmail.com>
 <CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com>
Content-Language: en-US
From: Guy Morand <guy.morand@bytesatwork.ch>
Autocrypt: addr=guy.morand@bytesatwork.ch; keydata=
 xjMEYVrH0BYJKwYBBAHaRw8BAQdAoTOFJG+2Y+RQADup0trJWVq0txsRD9cwnFvJDOP972XN
 Jkd1eSBNb3JhbmQgPGd1eS5tb3JhbmRAYnl0ZXNhdHdvcmsuY2g+wosEExYIADMWIQRteh66
 gtptph+nQZni3NUZ5EzT5QUCYVrH0AIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQ4tzVGeRM
 0+XCrAD/fcnTVlpmfLk44MXE155KhfZlGF2ohVATPa2AFC0khfAA/1Avp55HOzMVCY2iwwbx
 VJXFd/3lwrqp90zqH2ORd+cAzjgEYVrH0BIKKwYBBAGXVQEFAQEHQKyxw9Yob3k4YKr/6iRL
 es1udYw9k9Eb7HJHxeIoPhBjAwEIB8J4BBgWCAAgFiEEbXoeuoLabaYfp0GZ4tzVGeRM0+UF
 AmFax9ACGwwACgkQ4tzVGeRM0+U3ZwEAp3vzYVz8JtxGQ8Q+n3pTdR5TOwMdkbE6EBMCiE/s
 Y58A+gLI+AWyJ3L0V5rINV7FxBc0caP0OJskWOYyN0aN7R8P
In-Reply-To: <CAFOBSkSHt5nwdqsf=V0esBh23oTkOzy--9-vBQFPBoroGK3-HA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bartosz, María,

Thanks for the quick feedback.

Maria, my intention is not to assign blame. These issues can look like 
userspace bugs, so I would like to help prevent others from spending 
time debugging the wrong layer. I would be happy to work together on 
more specific test scenarios.

Bartosz, I have implemented a preliminary set of changes to the TCA6418 
support in gpio-pca953x and tested input, output and interrupts on our 
board. I’ve included the patch below as a starting point for discussion, 
it is not yet a formal submission.

My preference would be to move the TCA6418 support to a dedicated 
driver, since it requires a number of chip-specific operations. Our 
existing driver could serve as a starting point:
https://github.com/bytesatwork/linux-imx/blob/baw-lf-6.18.20-2.0.0/drivers/gpio/gpio-tca6418.c

By keeping the existing ti,tca6418 compatible, it will remain compatible 
with existing device trees.

Maria, if you have time to test the dedicated driver with your hardware 
and use case, I would highly appreciate your feedback.

Would you prefer that I prepare the dedicated driver as an RFC, or clean 
up the gpio-pca953x changes instead?

Best regards,
Guy Morand
-- 
bytesatwork
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

 From 5e4be90be3d240893bb1125b5b763493be6d2605 Mon Sep 17 00:00:00 2001
From: Guy Morand <guy.morand@bytesatwork.ch>
Date: Wed, 18 Nov 2026 09:33:49 +0100
Subject: [PATCH] gpio: gpio-pca953x: Fix tca6418 support

The original support was only working when configuring a single line,
without changing its value at runtime (gpioset -c xxx 0=1). When
toggling the line at runtime, multiple write was generated on the i2c
bus which lead to corrupted register due to auto increment not being
supported by the chip (gpioset -c xxx -t 10ms,10ms,0 0=0).

Moreover, gpioget was not working due to regmap INPUT register not
declared as volatile, reading a staled value.

Interrupt handling was missing.

To make it work, the following changes were done:
* Do not use auto increment
* Declare INT_STATUS and INPUT registers volatile
* Add configuring interrupt handling registers
* Add tca6418 specific interrupt handler
* Revert the first bank bit order in set multiple line

Signed-off-by: Guy Morand <guy.morand@bytesatwork.ch>
---
  drivers/gpio/gpio-pca953x.c | 252 +++++++++++++++++++++++++++++++++---
  1 file changed, 234 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index ead20c357418..bbedbd35e97c 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -10,6 +10,7 @@

  #include <linux/atomic.h>
  #include <linux/bitmap.h>
+#include <linux/bitrev.h>
  #include <linux/cleanup.h>
  #include <linux/device.h>
  #include <linux/errno.h>
@@ -38,9 +39,14 @@
  #define PCA953X_INVERT		0x02
  #define PCA953X_DIRECTION	0x03

+#define TCA6418_INT_STATUS	0x02
+#define TCA6418_GPIO_INT_STATUS	0x11
  #define TCA6418_INPUT		0x14
  #define TCA6418_OUTPUT		0x17
+#define TCA6418_GPIO_INT_ENABLE	0x1a
  #define TCA6418_DIRECTION	0x23
+#define TCA6418_GPIO_INT_LEVEL	0x26
+#define TCA6418_GPI_INT		BIT(1)

  #define REG_ADDR_MASK		GENMASK(5, 0)
  #define REG_ADDR_EXT		BIT(6)
@@ -385,22 +391,45 @@ static bool pcal6534_check_register(struct 
pca953x_chip *chip, unsigned int reg,
  	return true;
  }

+static void tca6418_revert_low_byte(unsigned long *reg_val)
+{
+	bitmap_set_value8(reg_val, bitrev8(bitmap_get_value8(reg_val, 0)),
+					  0);
+}
+
  /* TCA6418 breaks the PCA953x register order rule */
  static bool tca6418_check_register(struct pca953x_chip *chip, unsigned 
int reg,
  				   u32 access_type_mask)
  {
-	/*  Valid Input Registers - BIT(0) for readable access */
+	/*
+	 * BIT(0) readable
+	 * BIT(1) writable
+	 * BIT(2) volatile
+	 */
+	if (reg == TCA6418_INT_STATUS)
+		return access_type_mask & (BIT(0) | BIT(1) | BIT(2));
+
+	if (reg >= TCA6418_GPIO_INT_STATUS &&
+	    reg < TCA6418_GPIO_INT_STATUS + NBANK(chip))
+		return access_type_mask & (BIT(0) | BIT(2));
+
  	if (reg >= TCA6418_INPUT && reg < (TCA6418_INPUT + NBANK(chip)))
-		return (access_type_mask & BIT(0));
+		return (access_type_mask & (BIT(0) | BIT(2)));

-	/*  Valid Output Registers - BIT(1) for writeable access */
  	if (reg >= TCA6418_OUTPUT && reg < (TCA6418_OUTPUT + NBANK(chip)))
  		return (access_type_mask & (BIT(0) | BIT(1)));

-	/*  Valid Direction Registers - BIT(2) for volatile access */
+	if (reg >= TCA6418_GPIO_INT_ENABLE &&
+	    reg < TCA6418_GPIO_INT_ENABLE + NBANK(chip))
+		return access_type_mask & (BIT(0) | BIT(1));
+
  	if (reg >= TCA6418_DIRECTION && reg < (TCA6418_DIRECTION + NBANK(chip)))
  		return (access_type_mask & (BIT(0) | BIT(1)));

+	if (reg >= TCA6418_GPIO_INT_LEVEL &&
+	    reg < TCA6418_GPIO_INT_LEVEL + NBANK(chip))
+		return access_type_mask & (BIT(0) | BIT(1));
+
  	return false;
  }

@@ -711,14 +740,18 @@ static int pca953x_gpio_get_multiple(struct 
gpio_chip *gc,
  	if (ret)
  		return ret;

+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		tca6418_revert_low_byte(reg_val);
+
  	bitmap_replace(bits, bits, reg_val, mask, gc->ngpio);
  	return 0;
  }

-static int pca953x_gpio_set_multiple(struct gpio_chip *gc,
-				     unsigned long *mask, unsigned long *bits)
+static int pca953x_gpio_set_multiple(struct gpio_chip *gc, unsigned 
long *mask,
+				     unsigned long *bits)
  {
  	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	bool is_tca6418 = PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE;
  	DECLARE_BITMAP(reg_val, MAX_LINE);
  	int ret;

@@ -728,8 +761,15 @@ static int pca953x_gpio_set_multiple(struct 
gpio_chip *gc,
  	if (ret)
  		return ret;

+	/* TCA6418's first bank is reversed relative to GPIO offsets. */
+	if (is_tca6418)
+		tca6418_revert_low_byte(reg_val);
+
  	bitmap_replace(reg_val, reg_val, bits, mask, gc->ngpio);

+	if (is_tca6418)
+		tca6418_revert_low_byte(reg_val);
+
  	return pca953x_write_regs(chip, chip->regs->output, reg_val);
  }

@@ -925,6 +965,74 @@ static void pca953x_irq_print_chip(struct irq_data 
*data, struct seq_file *p)
  	seq_puts(p, dev_name(gc->parent));
  }

+static int tca6418_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *pca953x = gpiochip_get_data(gc);
+
+	if (type != IRQ_TYPE_EDGE_RISING && type != IRQ_TYPE_EDGE_FALLING) {
+		dev_err(&pca953x->client->dev, "Only rising or falling edge are 
supported\n");
+		return -EINVAL;
+	}
+
+	return pca953x_irq_set_type(d, type);
+}
+
+static void tca6418_irq_bus_sync_unlock(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct pca953x_chip *chip = gpiochip_get_data(gc);
+	struct device *dev = &chip->client->dev;
+	DECLARE_BITMAP(irq_enabled, MAX_LINE);
+	DECLARE_BITMAP(irq_level, MAX_LINE);
+	DECLARE_BITMAP(irq_inputs, MAX_LINE);
+	unsigned int offset;
+	int ret;
+
+	bitmap_or(irq_inputs, chip->irq_trig_raise, chip->irq_trig_fall,
+		  gc->ngpio);
+	bitmap_copy(irq_enabled, chip->irq_mask, gc->ngpio);
+	for_each_set_bit(offset, irq_inputs, gc->ngpio) {
+		ret = pca953x_gpio_direction_input(gc, offset);
+		if (ret) {
+			dev_err(dev, "failed to set IRQ line %u as input: %d\n",
+				offset, ret);
+			clear_bit(offset, irq_enabled);
+		}
+	}
+
+	bitmap_copy(irq_level, chip->irq_trig_raise, gc->ngpio);
+	tca6418_revert_low_byte(irq_level);
+	tca6418_revert_low_byte(irq_enabled);
+
+	{
+		guard(mutex)(&chip->i2c_lock);
+		ret = pca953x_write_regs(chip, TCA6418_GPIO_INT_LEVEL,
+					 irq_level);
+		if (!ret)
+			ret = pca953x_write_regs(chip, TCA6418_GPIO_INT_ENABLE,
+						 irq_enabled);
+	}
+	if (ret)
+		dev_err(dev, "failed to configure TCA6418 interrupts: %d\n",
+			ret);
+
+	mutex_unlock(&chip->irq_lock);
+}
+
+static const struct irq_chip tca6418_irq_chip = {
+	.irq_mask		= pca953x_irq_mask,
+	.irq_unmask		= pca953x_irq_unmask,
+	.irq_set_wake		= pca953x_irq_set_wake,
+	.irq_bus_lock		= pca953x_irq_bus_lock,
+	.irq_bus_sync_unlock	= tca6418_irq_bus_sync_unlock,
+	.irq_set_type		= tca6418_irq_set_type,
+	.irq_shutdown		= pca953x_irq_shutdown,
+	.irq_print_chip		= pca953x_irq_print_chip,
+	.flags			= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
  static const struct irq_chip pca953x_irq_chip = {
  	.irq_mask		= pca953x_irq_mask,
  	.irq_unmask		= pca953x_irq_unmask,
@@ -1011,6 +1119,80 @@ static bool pca953x_irq_pending(struct 
pca953x_chip *chip, unsigned long *pendin
  	return !bitmap_empty(pending, gc->ngpio);
  }

+static int tca6418_irq_pending(struct pca953x_chip *chip,
+			       unsigned long *pending, bool *asserted)
+{
+	struct gpio_chip *gc = &chip->gpio_chip;
+	struct device *dev = &chip->client->dev;
+	u8 int_status[MAX_BANK];
+	unsigned int status;
+	int i, ret;
+
+	lockdep_assert_held(&chip->irq_lock);
+	lockdep_assert_held(&chip->i2c_lock);
+
+	*asserted = false;
+	ret = regmap_read(chip->regmap, TCA6418_INT_STATUS, &status);
+	if (ret || !(status & TCA6418_GPI_INT))
+		return ret;
+
+	*asserted = true;
+	ret = regmap_bulk_read(chip->regmap, TCA6418_GPIO_INT_STATUS,
+			       int_status, NBANK(chip));
+	if (ret) {
+		dev_err_ratelimited(dev, "failed read int status: %d\n", ret);
+		return ret;
+	}
+
+	for (i = 0; i < NBANK(chip); i++)
+		bitmap_set_value8(pending, int_status[i], i * BANK_SZ);
+	tca6418_revert_low_byte(pending);
+	bitmap_and(pending, pending, chip->irq_mask, gc->ngpio);
+
+	ret = regmap_write(chip->regmap, TCA6418_INT_STATUS, TCA6418_GPI_INT);
+	if (ret)
+		dev_err_ratelimited(dev, "failed to handle TCA6418 IRQ: %d\n", ret);
+
+	return ret;
+}
+
+static irqreturn_t tca6418_irq_handler(struct pca953x_chip *chip)
+{
+	struct gpio_chip *gc = &chip->gpio_chip;
+	struct device *dev = &chip->client->dev;
+	DECLARE_BITMAP(pending, MAX_LINE);
+	bool asserted = false;
+	int level, ret;
+
+	for (;;) {
+		bitmap_zero(pending, MAX_LINE);
+		{
+			guard(mutex)(&chip->irq_lock);
+			guard(mutex)(&chip->i2c_lock);
+			ret = tca6418_irq_pending(chip, pending, &asserted);
+		}
+
+		if (ret || !asserted)
+			break;
+
+		for_each_set_bit(level, pending, gc->ngpio) {
+			int nested_irq =
+				irq_find_mapping(gc->irq.domain, level);
+
+			if (unlikely(nested_irq <= 0)) {
+				dev_warn_ratelimited(
+					dev, "unmapped interrupt %d\n", level);
+				continue;
+			}
+			handle_nested_irq(nested_irq);
+		}
+		if (ret)
+			break;
+	}
+
+	return IRQ_RETVAL(asserted);
+}
+
  static irqreturn_t pca953x_irq_handler(int irq, void *devid)
  {
  	struct pca953x_chip *chip = devid;
@@ -1019,6 +1201,9 @@ static irqreturn_t pca953x_irq_handler(int irq, 
void *devid)
  	int level;
  	bool ret;

+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		return tca6418_irq_handler(chip);
+
  	bitmap_zero(pending, MAX_LINE);

  	scoped_guard(mutex, &chip->i2c_lock)
@@ -1042,6 +1227,27 @@ static irqreturn_t pca953x_irq_handler(int irq, 
void *devid)
  	return IRQ_RETVAL(ret);
  }

+static int tca6418_irq_init(struct pca953x_chip *chip)
+{
+	DECLARE_BITMAP(disabled, MAX_LINE);
+	u8 int_status[MAX_BANK];
+	int ret;
+
+	bitmap_zero(disabled, MAX_LINE);
+
+	guard(mutex)(&chip->i2c_lock);
+	ret = pca953x_write_regs(chip, TCA6418_GPIO_INT_ENABLE, disabled);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(chip->regmap, TCA6418_GPIO_INT_STATUS,
+			       int_status, NBANK(chip));
+	if (ret)
+		return ret;
+
+	return regmap_write(chip->regmap, TCA6418_INT_STATUS, TCA6418_GPI_INT);
+}
+
  static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
  {
  	struct i2c_client *client = chip->client;
@@ -1067,21 +1273,30 @@ static int pca953x_irq_setup(struct pca953x_chip 
*chip, int irq_base)
  	if (!(chip->driver_data & PCA_INT))
  		return 0;

-	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
-	if (ret)
-		return ret;
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE) {
+		ret = tca6418_irq_init(chip);
+		if (ret)
+			return ret;
+	} else {
+		ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
+		if (ret)
+			return ret;

-	/*
-	 * There is no way to know which GPIO line generated the
-	 * interrupt.  We have to rely on the previous read for
-	 * this purpose.
-	 */
-	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-	bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+		/*
+		 * There is no way to know which GPIO line generated the
+		 * interrupt.  We have to rely on the previous read for
+		 * this purpose.
+		 */
+		pca953x_read_regs(chip, chip->regs->direction, reg_direction);
+		bitmap_and(chip->irq_stat, irq_stat, reg_direction, gc->ngpio);
+	}
  	mutex_init(&chip->irq_lock);

  	girq = &chip->gpio_chip.irq;
-	gpio_irq_chip_set_chip(girq, &pca953x_irq_chip);
+	if (PCA_CHIP_TYPE(chip->driver_data) == TCA6418_TYPE)
+		gpio_irq_chip_set_chip(girq, &tca6418_irq_chip);
+	else
+		gpio_irq_chip_set_chip(girq, &pca953x_irq_chip);
  	/* This will let us handle the parent IRQ in the driver */
  	girq->parent_handler = NULL;
  	girq->num_parents = 0;
@@ -1236,7 +1451,8 @@ static int pca953x_probe(struct i2c_client *client)

  	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);

-	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+	if ((NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == 
PCA957X_TYPE) &&
+	    PCA_CHIP_TYPE(chip->driver_data) != TCA6418_TYPE) {
  		dev_info(dev, "using AI\n");
  		regmap_config = &pca953x_ai_i2c_regmap;
  	} else {
-- 
2.47.3


On 18/11/2026 16:16, María García Fernández wrote:
> (Resending in plain text mode, sorry)
> 
> Hi Bartosz, Guy,
> 
> Very sorry about these bugs you encountered. The testing I did back
> then did not reveal any of these problems, and the teams that use this
> chip in one of the products at the company where I work have never
> complained about the chip not working properly. I will raise it ASAP
> and have a look. We can try to work together on this and define more
> specific testing scenarios other than the few tests I did by hand
> myself. I do think at this point we may be better off moving the
> TCA6418 to its own driver if the differences are so many.
> 
> Thank you.
> 
> Kind regards,
> 
> María García.
> 
> 
> El mié, 18 nov 2026 a las 16:04, María García Fernández
> (<mariagarcia7293@gmail.com>) escribió:
>>
>> Hi Bartosz, Guy,
>>
>> Very sorry about these bugs you encountered. The testing I did back then did not reveal any of these problems, and the teams that use this chip in one of the products at the company where I work have never complained about the chip not working properly. I will raise it ASAP and have a look. We can try to work together on this and define more specific testing scenarios other than the few tests I did by hand myself. I do think at this point we may be better off moving the TCA6418 to its own driver if the differences are so many.
>>
>> Thank you.
>>
>> Kind regards,
>>
>> María García.
>>
>> El mié, 18 nov 2026 a las 15:48, Bartosz Golaszewski (<brgl@kernel.org>) escribió:
>>>
>>> On Wed, Nov 18, 2026 at 01:25:35PM +0100, Guy Morand wrote:
>>>> Hi Linus, Bartosz, Maria,
>>>>
>>>> We have been testing the TCA6418 support added to gpio-pca953x by the
>>>> following patch:
>>>> https://lore.kernel.org/all/20250703205740.45385-3-mariagarcia7293@gmail.com/
>>>>
>>>> On our board, using a 6.18-based NXP linux-imx kernel, the following command
>>>> does not toggle the requested GPIO as expected:
>>>> gpioset -c /dev/gpiochip4 -t 10ms,10ms,0 0=0
>>>>
>>>> While investigating, we found several issues in the TCA6418 support:
>>>> * The driver uses the PCA-style i2c auto-increment which is not documented
>>>> in the TCA6418 datasheet, leading to corrupted registers.
>>>> * Input-status registers are not marked volatile, so reads can return stale
>>>> cached values.
>>>> * The bulk get/set paths do not reverse the bit order of the first GPIO
>>>> bank, so they can read or update the wrong line.
>>>> * Interrupt handling is incomplete: the generic IRQ path does not configure
>>>> the TCA6418’s interrupt-enable and edge-selection registers or handle its
>>>> status and acknowledgement registers.
>>>>
>>>> I have spent some time trying to fix the integration, but the TCA6418 seems
>>>> to require several chip-specific operations.
>>>> Before this support was added, we used an out-of-tree TCA6418 driver that
>>>> worked well for our use case.
>>>>
>>>> I think the current support needs to be fixed, but I’m unsure whether it
>>>> would be preferable to add the necessary chip-specific operations to
>>>> gpio-pca953x or replace its TCA6418 support with a dedicated driver based on
>>>> our existing one.
>>>>
>>>> I’m not familiar with the subsystem’s design preferences. Which approach
>>>> would you prefer?
>>>>
>>>
>>> It really depends on how much model-specific operations there are. If
>>> every callback needs a completely different implementation for TCA6418
>>> then clearly, a separate driver is the way to go. Just make sure it
>>> doesn't break the ABI for OF systems.
>>>
>>> Bart

-- 
bytesatwork
Technoparkstrasse 7
CH-8406 Winterthur
Switzerland

phone: +41 52 213 79 79

