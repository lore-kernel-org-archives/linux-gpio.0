Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253714;
	b=D9UuxgV5hTOMh3kSPLZUVh2tYUk7dUDJscruwhJ4KRvmq6R+Rgw2T+2CSnDVmbKGnjrY
	 fbPpBp+XcZ2GXRu6PZEt3JyevneHUeYm78mY9ogEe0kiTcAKE32Q51KvXMO0/P2S1NblT
	 5XKtJ2q7RX+Hn7YZZrzOTB2JYjlYunvasFybYPrB8NlYbQTJLEarJ5kLPIUx7TwUl030A
	 x/83v3YkzRbjXyE9tdTSAeGvIr/3+31uHR1LS3GAiQXUmOEiloing8UABfcXWmNeS1Pqw
	 Arqqr+As4bct6qX00RRLfPJ69LTkRqy29wc2z6W3ij1Ex8eVuRuvhEI5q0VTUE6yk8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
	b=36jm4Eqgk1LRAVXgTGLAD6skxIY7yiN7Umj2s4ivzxFcDFoftjgVZIWzOhxl4WQB6prz
	 6AAaL5KiSup9ATpKKa4ASJrvr0p0AuGDW4kv5jKUXbOEEFJrmdv+m9LMnp4Ibklpzmz6f
	 8+k938Yjcov17G5Zm1Uo9cJZ4rfRw4VmhGDVeIj2Q12HfeWKA07mTePRLMzRl1Pa/+cmW
	 gIloooR0gsapG5fyGWJgjH16ryds4PfFoBPlH79AxpINDzmZSIwiiL1MS/CJ+yN0yNJMl
	 RopPKLxinim1WpLD54OEH9tNDlv/IMkq8GZFl6yGz7bDSuiBqm0FFycanDZBxapc4cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkBlloGT;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BC960A260A
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 19:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BC960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vkBlloGT
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b3ada81853so1040672c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253713; x=1794858513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
        b=vkBlloGTCA95RBaB+i3kq0dG40kqd5rAdmF6OoULbKrTf37YiyQGLWhqKZ0HSJDQky
         ih+b4XAudsOjRWQut8MJbdnUFV1wQSpucIWE3X3ZnDaVLu+TeyJL5RGn3BFYLeulfCfy
         UCiDOBioy8Z8d2bN22PG9H72T+Y+ERtaAJSqQ6vJq5ru3eCo8sOpeiXViiamsGqgZryX
         Tm7JcfKrS2ZHbPnHQ9Jh+Jd5k3jvekL5TIEFVMJmyLJmGjJANCanI3lHajsxuh1rtvg9
         BVT8WRis1iIL1N88H4b5hD7oRyg8vqF073gqSJc8UkM17P0FjnN9ZW60k4IeQvhfksMP
         hCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253713; x=1794858513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=38YkGSuhDvTuq5veTZ6Adl0FWR6KD9P9IHveutw8QFQ=;
        b=M5YZD0UFlmTt6bjpoXNa2h++k6AfBlWX2Vn8F4zIvqpPbs+7LRKlqnZzQgZsyiaVD2
         e4WsegqoWB5tUyDuRgt0wE75wkpxXnyahWunfmkNwZXbh+IslLc/ijKkWp1ELTpxIpuL
         Dxx32wlO0SzwkSG8iUI0EL5yLE8gA0JmVEK2YBjHGVJ30Sb7/Npp/eWd+eBPqaGtRM1v
         8BrDjP7GkIRMdkUjCEYBug0Itx3NQaBN7uPXckNKdleK4xNudtVghzmlxsRFyTDe1OSk
         tn5GVuVTrvBfTFDJgH+2IYUzr2bSOLH2pcXppl3ida/2yFqZeHF+bmCjxl8vGLpPmV+0
         i/XQ==
X-Forwarded-Encrypted: i=1; AL+hErEBtC0JcBZHcdQulcYwwHFc/QGtydaWg94tCDGkFS1oNBx9TTVC+FwKYW0K9ijgUvh0oNpi6JCy0vJG@vger.kernel.org
X-Gm-Message-State: APuU4Z/xkLAoufjyMZlILXDEtYD2BqpMgOTNVCmaA33KltR6WFxptobk
	5V+FTWsj0WhYcP7E3GgvwaNXAEze6kSKPZsLpMwVchB2lNUXiqtQ9+H1
X-Gm-Gg: AYBFou15A/oJ3gk7cM6uJ1NUk/Pfdu7bvK3i1NLXzAXdXDFyqdHnlxx6JgQ4lzESiot
	+JuFMmKOzq9SJxevgnfIlMr8/l2x0cPGYs8udJiWWv0MUZXJjtfK/gGZZXD9KILlOwgXZ9VLYiz
	mtvc6FB9hPzEjMF/PLUJ8213LEAgCbQ6U2CnxbNYaj24/lMO6PARFvBjtAfzOeSA9ypPxZ1okOh
	J9NgP9uBsu49UpGn1nzVG5yrSErbfjtnvCL+8GYmyYkSPk2dQb5HPyz5/QtBsSr/BbMHbMnBRFH
	J5XQ/HQrgZJhrVIFisFKaldnQF35GgxrAslexLaG0wuMSkubuZ3StemDtVy0DzGSRAKro8LPjmj
	TVxpUuaMG5GeWqrKVTMgxWC3Zntz5d5V99FPlUYURIidrhqZv2cE6ebx0iDOPHvjAM8k1rAz60w
	bVJnQ2TBc9bZ3n2IugE0ndfsYuuVwRx7vpAhztl99TMwGoQPK+ETME1s9DMG/91pksNvFo7l+Sp
	1VCtEsQ75REar7tKpoji95c+T7zQnXolUxVNDt11hJXHiOc7DE5urVQecY1lKAX9OmagJkjE8mU
	Jg6t9Pme3vCYW568KFEGEDlwvkvhXakg6pmnt0xVkAnhKAybDzD5nyDnQWF1h5dr
X-Received: by 2002:a05:7301:7d01:b0:370:d7fe:6585 with SMTP id 5a478bee46e88-3751e994360mr365715eec.11.1794253713247;
        Mon, 09 Nov 2026 11:48:33 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm530164eec.8.2026.11.09.11.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:48:32 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: Sahaj Chaudhari <sahaj123.sc@gmail.com>,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] gpio: davinci: allocate bank IRQ data before installing handlers
Date: Tue, 10 Nov 2026 01:19:10 +0530
Message-ID: <20261109194910.2282454-3-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
References: <20261109194910.2282454-1-sahaj123.sc@gmail.com>
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

If allocation fails partway through bank setup, previously installed
chained handlers still point at devm-managed data that is released when
probe fails. Allocate the complete bank-data array before installing the
first chained handler so an allocation failure leaves no handlers behind.

This fixes the probe-failure path; it does not change ordinary device
removal.

Fixes: b5cf3fd827d2 ("gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip")
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 drivers/gpio/gpio-davinci.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index caeecfc3df20..751c0e3a9676 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -550,6 +550,13 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * Or, AINTC can handle IRQs for banks of 16 GPIO IRQs, which we
 	 * then chain through our own handler.
 	 */
+	irqdata = devm_kcalloc(dev, DIV_ROUND_UP(ngpio, 16),
+			       sizeof(*irqdata), GFP_KERNEL);
+	if (!irqdata) {
+		irq_domain_remove(chips->irq_domain);
+		return -ENOMEM;
+	}
+
 	for (gpio = 0, bank = 0; gpio < ngpio; bank++, gpio += 16) {
 		/* disabled by default, enabled only as needed
 		 * There are register sets for 32 GPIOs. 2 banks of 16
@@ -564,21 +571,12 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 		 * gpio irqs. Pass the irq bank's corresponding controller to
 		 * the chained irq handler.
 		 */
-		irqdata = devm_kzalloc(&pdev->dev,
-				       sizeof(struct
-					      davinci_gpio_irq_data),
-					      GFP_KERNEL);
-		if (!irqdata) {
-			irq_domain_remove(chips->irq_domain);
-			return -ENOMEM;
-		}
-
-		irqdata->regs = g;
-		irqdata->bank_num = bank;
-		irqdata->chip = chips;
+		irqdata[bank].regs = g;
+		irqdata[bank].bank_num = bank;
+		irqdata[bank].chip = chips;
 
 		irq_set_chained_handler_and_data(chips->irqs[bank],
-						 gpio_irq_handler, irqdata);
+						 gpio_irq_handler, &irqdata[bank]);
 
 		binten |= BIT(bank);
 	}
-- 
2.43.0

