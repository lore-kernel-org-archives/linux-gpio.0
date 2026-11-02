Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735438;
	b=ciLJnLJ/vOSBmN6qlH/YuBmu/nZV3PyEhOhC9D0fG2XSeVHy5UkoKcbLktYoW9x0qZP5
	 VIKSJm2tuxDjUbpJwW5mh3MPvmcoHoYKVh4Q+IiI+RcC9PyWSKTQu7LSzXxBXmkRcw+R3
	 ArZ5vvwsGpBuZXfRxiMTteHosVDEKmbULll2QNnKMOFZHfqF+9lc6tjvi8+3ZWAOqJeye
	 Hc6v36ao5a7k0IE2OJDji6rJAc2VcvkxpDlhfRJb8+UdXAUyCHVBCSB5iIhtFmIkiyMwF
	 qe9vd9htNQyrSdMWqBIej0ykpbxse4Pj7B0iLnmuXXYdO9+WQAqFVhDFP+ckZaUCxQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
	b=5JRhG05BsiLzZAeHuCJDwXnYDzGAESaRe/Bvqow1ZEL+oNvomEKg5Yb8WY4Z6oPtJ+H2
	 f+/5Pncm45WerfJkj6eTCee2CAxeUWMdmLvjHin8Hsabsq2Smdx4DTb9Rip9JDL6Mvy8P
	 Aycl6zYdfbju56wGm8IMWLBrq2HsbIrvesy1XHk9ls7SS19ew1E6Bi9ILHbcKhiZ10qeD
	 isK1BiFK3ffcX+ULC3umik7rSJSb1tw9qCoVI5xQHrklPO1ABNX7IDwCNowv7RmmhKGtc
	 flFYEy7aLh/o1ZvlKoSmaxpl9No5B1C5h1852SLk+JCR8BGm2eDlrupCpel4u/ileyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUBVJEct;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBE6606A328
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 19:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBBE6606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUBVJEct
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so40935765e9.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 11:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735436; x=1794340236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
        b=TUBVJEct10giEVxI+REQOsUVl/VR6wr9G9IeimsArAq8Hlfl30ZW2d9L86yDo5VVEU
         igUTTxWl92VEbrqA20uQuD8EyNNoOuURUoXa24DqUzTmCg5e7KcjIZlaChuT6YQF8sXf
         qwnN/caRfuuuLUvvKkRFHy707BUhIxhhD9xRFnLF8F2ukocdCIORR8O5YeGjVdrfYtQP
         mKOfl22vNyxjVSsUntiwNSVUOjYGJyL1qNtSvHKZgZuAal/9ZKrFefvvpyuUyCk4K09e
         y6sTmjaHuWb3Ib/xH8OZSt/mUWmVwj3pdad+jFQGmjSFR1VUxL3GMH3SNUQhM7V/lrjC
         1CNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735436; x=1794340236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IiL0Mmm7Vbm8DLCpNNsbRGxt141gR/0pM7t32RfF7I=;
        b=mnzBnOpiwc6sMILx5h3V45/++J3w1FM6CUCHbh72MPdnqlr+Ifp1Ezo4KBKCRPXDQZ
         DXcySBfEjcjIWJor05KWMIXb/FLVdljDOUJQQMPQ6rBkgRgIGDTsO8VkMlX1KN6Lt77J
         IlVWmy9na3thaeqjaisnpOrhR7+nTZO68IOVMSF9onFMwjEh+hpe3zmIqXvlNsB2VUdl
         Xl0sPp/VikKZFW/9uLtewDh+7pRa9oYAY0kahNeKzzGXMCf6ihzrQI0vWTKL+rK4yaty
         zfincNyub/gQOUB4xs4L4QRX0k/wpgx8GWjhyQHH4kjEYCFYsj8aOJ6DZYDONszg52Ix
         N7SA==
X-Gm-Message-State: APuU4Z/C5LYQKYeI0uEPYsJEKExZUhxWyIE3nhTBRj0y8hH1tujyjnq9
	FCjIi3o3FHISXImDPdEjJZEDdPfQgRgMSFrOtug3PakEVdoTZado1C5D
X-Gm-Gg: AYBFou1QmxSmlvZpDXjgO2HbW5Me82orAOtMlQqUrIA3EKU4l1FWhhyvjz32z45uDpO
	ayw8IioTnbmC3IaBpuOBjLPxJRHkeX8OeZLnzhHxDamWp/jCz28dvGBntFxfP9XlrvJUqpiX7Xr
	rShg5/HEKzXVutEKdxMwMYREuyUHNV4XVx/GbaGf68Liz+M0xeN2atH9BSEIORAaythgAqxbvY3
	+m+hZkAcp8MR65tLcOughMjgQu7iuiyzPz5VJzm8mOcmTJlOG4Y5nksKFK4tSehAiXEAwDB39EE
	t2F0+aw4hyb7kssvqvP/5jk2xrXFxuMw4CkXSbxZxqDUiVJQ1yXEqRJvy7QOM3hHY9m3ZgxwTya
	KWI4BxlxFyOZ2dhXe9FpCSXBaCHNm9ItXANLW/P3kH3imY2L2bQRgt0s76w3/4HTkHaTVgOo2RJ
	0JFyG9gw39F1pA9uxD+uv+1tgZg3rMunNJ7BPxD+HI6e4xJ5a9T/DP7bOkXj+OMKtumyDnZ/JE2
	Nv23mdJ3+ukualHZ3Abm8UNfw6xIJWDN9SdFGOreEPzUv2StoLqoJPqprYgKfaur2udmbPjnVf9
	EB+BncwjLCusoKBTNyHu1U7P+aFUM0T3/ffsWyDEFbmukhTa0hhjx5MbpA/pbPfROZvZ2uR1CWP
	NLPJiUeNN/FtE9g3Ylw7x/mnez/lcZOR061GEZOav+Q==
X-Received: by 2002:a05:600c:470a:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4ac16acfe61mr320942815e9.5.1793735436259;
        Tue, 03 Nov 2026 11:50:36 -0800 (PST)
Received: from ubuntu-gnu-linux-24-04-3 (host86-148-231-190.range86-148.btcentralplus.com. [86.148.231.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcd03d028sm309364f8f.47.2026.11.03.11.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:50:35 -0800 (PST)
From: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Areeb Ul Haq Mirza <auhmirza02@gmail.com>
Subject: [PATCH] pinctrl: keembay: make keembay_gpio_irqchip const
Date: Mon,  2 Nov 2026 21:25:00 +0000
Message-ID: <20261102212500.195783-1-auhmirza02@gmail.com>
X-Mailer: git-send-email 2.53.0
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

gpiolib warns about mutable irq_chips at probe time:
"not an immutable chip, please consider fixing it!"

Make keembay_gpio_irqchip const, flag it as IRQCHIP_IMMUTABLE, add the
GPIOCHIP_IRQ_RESOURCE_HELPERS and register it with
gpio_irq_chip_set_chip().

The chip only implements .irq_enable() and .irq_disable(), so call
gpiochip_enable_irq() and gpiochip_disable_irq() from those callbacks,
following commit 35d008679a5a ("pinctrl: plgpio: Convert to immutable
irq_chip") [1] and commit 2993d2dd8ff4 ("gpio: timberdale: Make irq_chip
immutable") [2]. gpiochip_enable_irq() is called once a free interrupt
source and slot have been found, so a line is only marked enabled when
it is actually routed. gpiochip_disable_irq() is called after the line
has been cleared from the interrupt configuration register.

Link: https://lore.kernel.org/r/20230414-immutable-irqchips-2-v1-3-6b59a5186b00@linaro.org [1]
Link: https://lore.kernel.org/r/20250509-gpio-v1-8-639377c98288@nxp.com [2]
Signed-off-by: Areeb Ul Haq Mirza <auhmirza02@gmail.com>
---
Compile-tested only (arm64, W=1, sparse).

 drivers/pinctrl/pinctrl-keembay.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 3241d3ae6219..486577458883 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1380,6 +1380,8 @@ static void keembay_gpio_irq_enable(struct irq_data *data)
 	if (src < 0 || slot < 0)
 		return;
 
+	gpiochip_enable_irq(gc, pin);
+
 	if (trig & KEEMBAY_GPIO_SENSE_LOW)
 		keembay_gpio_invert(kpc, pin);
 
@@ -1412,6 +1414,7 @@ static void keembay_gpio_irq_disable(struct irq_data *data)
 		for_each_set_clump8(pos, clump, &reg, BITS_PER_TYPE(typeof(reg))) {
 			if ((clump & ~KEEMBAY_GPIO_IRQ_ENABLE) == pin) {
 				keembay_gpio_clear_irq(data, pos, src, pin);
+				gpiochip_disable_irq(gc, pin);
 				return;
 			}
 		}
@@ -1451,12 +1454,14 @@ static int keembay_gpio_add_pin_ranges(struct gpio_chip *chip)
 	return ret;
 }
 
-static struct irq_chip keembay_gpio_irqchip = {
+static const struct irq_chip keembay_gpio_irqchip = {
 	.name = "keembay-gpio",
 	.irq_enable = keembay_gpio_irq_enable,
 	.irq_disable = keembay_gpio_irq_disable,
 	.irq_set_type = keembay_gpio_irq_set_type,
 	.irq_ack = keembay_gpio_irq_ack,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
 
 static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
@@ -1468,7 +1473,7 @@ static int keembay_gpiochip_probe(struct keembay_pinctrl *kpc,
 
 	/* Setup GPIO IRQ chip */
 	girq			= &kpc->chip.irq;
-	girq->chip		= &keembay_gpio_irqchip;
+	gpio_irq_chip_set_chip(girq, &keembay_gpio_irqchip);
 	girq->parent_handler	= keembay_gpio_irq_handler;
 	girq->num_parents	= KEEMBAY_GPIO_NUM_IRQ;
 	girq->parents		= devm_kcalloc(kpc->dev, girq->num_parents,

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.53.0

