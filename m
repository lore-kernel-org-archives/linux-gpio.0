Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=42.62.85.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792748587;
	b=N3PgXKe06RyzTwjqVxXluSHSVPspgGzabG28CzN6n2eb4JtF+NOUPjnseT6qSvzVOkpS
	 jCw+9KZkTQYC9VCFFgOsd3jtR8aKryfHFRvq40nDP6wp74SPa3s8tNLVLjMyQbEGHUSoO
	 1Buf5A1wR81MHkRH6BgbNhz7dZMvF9Ov8hnGKyu5r0v6sYbj2mQFgw14vCAfiLMUzkTpZ
	 KfuDgHzZBPnyf9WAN57t+vu/6K/kN457gCBAjKT2c2KIlivcYDrva+CDZwHi1s8EENM27
	 F6OcmcxPOV2zR1rfAXDu7CGlc9QH88ODYHnJMANhpfJq6EVqDiuGKoBEFFBKEBEyx0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792748587;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL:
	 DKIM-Signature;
	bh=3IjSd+a9H4jFcjM2a0lEqok2InQT0jkJORR5/Vp2fuc=;
	b=xJa2vHnj37avvOg/sw0FhPd4ufsUr4nmFziyZSy7gC9W8kALX2Oso0EBo+sZslyOEtnS
	 YQVP49CuvD3Ziy93VLRTbcp73h+ObwpeVZYlC4BkmMT0wphUMBEXdjj7UasbbrC8NI2ZR
	 V59Z4mZJyj1Y2g0ZznX6+jDx79+eZ2wOOqm7YDVum+twwlIJ8YQf7w3cOi0kC7w+4fbZa
	 7w4O1+wwrfyVhujBlKmZNZJdBXBsEvgA0lEndEbmhGfmTNpi0PrIRzyKXopHSfacD3qVi
	 evl/TOawKXz9htOHnnTddmwxjYQKNImi+LWUrkmG9KAxdl+KFx9qaRl2WSj6cRJS/Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=horizon.auto;
	spf=pass smtp.mailfrom=horizon.auto;
	dkim=pass header.d=horizon.auto header.i=@horizon.auto header.a=rsa-sha256 header.s=auto header.b=Kw7xj8AI;
	arc=none smtp.remote-ip=42.62.85.75
Received: from spam01.horizon.auto (spam01.horizon.auto [42.62.85.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F0C606A32A;
	Fri, 23 Oct 2026 09:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3F0C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=horizon.auto
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=horizon.auto
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=horizon.auto header.i=@horizon.auto header.a=rsa-sha256 header.s=auto header.b=Kw7xj8AI
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 69N9gUtJ024070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Fri, 23 Oct 2026 17:42:32 +0800 (+08)
	(envelope-from guohao01.zhang@horizon.auto)
Received: from horizon.auto (10.9.0.252) by exchange003.hobot.cc (10.69.1.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Fri, 23 Oct 2026
 17:42:31 +0800
From: Guohao Zhang <guohao01.zhang@horizon.auto>
To: Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin
	<fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz
 Golaszewski <brgl@bgdev.pl>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 2/2] gpio: dwapb: support native hardware both-edge detection
Date: Fri, 23 Oct 2026 17:42:20 +0800
Message-ID: <20261023094220.2989225-3-guohao01.zhang@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
References: <20261023094220.2989225-1-guohao01.zhang@horizon.auto>
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
Content-Type: text/plain
X-ClientProxiedBy: exchange001.hobot.cc (10.9.15.110) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam01.horizon.auto 69N9gUtJ024070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1792748565;
	bh=3IjSd+a9H4jFcjM2a0lEqok2InQT0jkJORR5/Vp2fuc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kw7xj8AIBGsU5EMxFfpPpUMFI0D5HRMIzxnipxIDBfx3bKYqHOue2XAPJpRWQFAaB
	 o52xFuKg5U7vdWcsDG+agN1hu5TUJSeYY6Y2SWF/ZLAvFO5PCrCbhy9NMgonDa6xDk
	 x5Y3bKUdstRkiUW0W9+OT/pLTP5l62Ya1arUqGXvUm7T2fA2Bgm8OBvV9hAQY1b6XG
	 0qd8ri5ZzUtsvtB068Q//PpkEPA87U286vZTI9EKPzPiBWCQQ7UMt9CJwJiCHWpQqZ
	 BAOIHy7gKu4m6qzXEY155Y5rp9N/J95mkUxs9JZRsFp9fy6LBCU55ALy/pzDB2gibX
	 ZSg6H2FdqZaww==

The DW APB GPIO IP can be synthesized with the GPIO_INT_BOTH_EDGE
feature, which provides the GPIO_INT_BOTHEDGE register (offset 0x68).
When present, the controller latches both the rising and the falling
edge of a line in hardware, so a single register bit selects
IRQ_TYPE_EDGE_BOTH.

The driver currently implements IRQ_TYPE_EDGE_BOTH purely in software:
dwapb_irq_set_type() selects one edge through GPIO_INT_POLARITY and
dwapb_toggle_trigger() flips the polarity from the interrupt handler
after each event. Besides the extra register access per interrupt, this
leaves a window in which an edge arriving while the handler is running
is not detected, because the polarity still reflects the previous edge.

Use the hardware register when the IP instance provides it, and keep the
existing software toggle for instances without the feature.

The feature is per-IP-instance, not per-SoC, so it is described in the
device tree: "snps,native-both-edge" marks a controller that integrates
GPIO_INT_BOTH_EDGE. The flag gates every access to the register, so it is
never touched on controllers without the feature; the DT property is
added by a preceding dt-bindings patch.

In a high-rate edge test on a Horizon Robotics J6P board, the software
polarity-toggle implementation lost about 2% of the interrupts, while
the native both-edge mode lost none. With the flag off, the generated
code is unchanged and does not access offset 0x68.

Signed-off-by: Guohao Zhang <guohao01.zhang@horizon.auto>
---
 drivers/gpio/gpio-dwapb.c | 49 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index aa7c08e..2b38cc0 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -42,6 +42,12 @@
 #define GPIO_EXT_PORTB		0x54
 #define GPIO_EXT_PORTC		0x58
 #define GPIO_EXT_PORTD		0x5c
+/*
+ * Native hardware both-edge control register. Only present when the DW APB
+ * GPIO IP instance was synthesized with the GPIO_INT_BOTH_EDGE feature; the
+ * offset does not change between the V1 and V2 register layouts.
+ */
+#define GPIO_INT_BOTHEDGE	0x68
 
 #define DWAPB_DRIVER_NAME	"gpio-dwapb"
 #define DWAPB_MAX_PORTS		4
@@ -63,6 +69,8 @@
 
 #define DWAPB_NR_CLOCKS		2
 
+#define DWAPB_FLAG_NATIVE_BOTHEDGE	BIT(1)
+
 struct dwapb_gpio;
 
 struct dwapb_port_property {
@@ -87,6 +95,7 @@ struct dwapb_context {
 	u32 int_mask;
 	u32 int_type;
 	u32 int_pol;
+	u32 int_bothedge;
 	u32 int_deb;
 	u32 wake_en;
 };
@@ -178,6 +187,11 @@ static struct dwapb_gpio_port *dwapb_offs_to_port(struct dwapb_gpio *gpio, unsig
 	return NULL;
 }
 
+static inline bool dwapb_native_both_edge(struct dwapb_gpio *gpio)
+{
+	return !!(gpio->flags & DWAPB_FLAG_NATIVE_BOTHEDGE);
+}
+
 static void dwapb_toggle_trigger(struct dwapb_gpio *gpio, unsigned int offs)
 {
 	struct dwapb_gpio_port *port = dwapb_offs_to_port(gpio, offs);
@@ -229,7 +243,12 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 
 		generic_handle_irq(gpio_irq);
 
-		if ((irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
+		/*
+		 * In native both-edge mode the hardware latches both edges on
+		 * its own; toggling the polarity here would defeat that.
+		 */
+		if (!dwapb_native_both_edge(gpio) &&
+		    (irq_type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH)
 			dwapb_toggle_trigger(gpio, hwirq);
 	}
 
@@ -333,17 +352,31 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct dwapb_gpio *gpio = to_dwapb_gpio(gc);
 	irq_hw_number_t bit = irqd_to_hwirq(d);
-	unsigned long level, polarity;
+	unsigned long level, polarity, bothedge;
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
 	level = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
 	polarity = dwapb_read(gpio, GPIO_INT_POLARITY);
 
+	/*
+	 * GPIO_INT_BOTHEDGE only exists on IP instances that were synthesized
+	 * with the feature, so it must not be touched otherwise. Clear it
+	 * unconditionally first: it must not remain set when the line is
+	 * reconfigured to a non-both-edge type.
+	 */
+	bothedge = 0;
+	if (dwapb_native_both_edge(gpio))
+		bothedge = dwapb_read(gpio, GPIO_INT_BOTHEDGE);
+	bothedge &= ~BIT(bit);
+
 	switch (type) {
 	case IRQ_TYPE_EDGE_BOTH:
 		level |= BIT(bit);
-		dwapb_toggle_trigger(gpio, bit);
+		if (dwapb_native_both_edge(gpio))
+			bothedge |= BIT(bit);
+		else
+			dwapb_toggle_trigger(gpio, bit);
 		break;
 	case IRQ_TYPE_EDGE_RISING:
 		level |= BIT(bit);
@@ -371,6 +404,8 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	dwapb_write(gpio, GPIO_INTTYPE_LEVEL, level);
 	if (type != IRQ_TYPE_EDGE_BOTH)
 		dwapb_write(gpio, GPIO_INT_POLARITY, polarity);
+	if (dwapb_native_both_edge(gpio))
+		dwapb_write(gpio, GPIO_INT_BOTHEDGE, bothedge);
 
 	return 0;
 }
@@ -761,6 +796,8 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 		return err;
 
 	gpio->flags = (uintptr_t)device_get_match_data(dev);
+	if (device_property_read_bool(dev, "snps,native-both-edge"))
+		gpio->flags |= DWAPB_FLAG_NATIVE_BOTHEDGE;
 
 	for (i = 0; i < gpio->nr_ports; i++) {
 		err = dwapb_gpio_add_port(gpio, &pdata->properties[i], i);
@@ -802,6 +839,9 @@ static int dwapb_gpio_suspend(struct device *dev)
 				ctx->int_en = dwapb_read(gpio, GPIO_INTEN);
 				ctx->int_pol = dwapb_read(gpio, GPIO_INT_POLARITY);
 				ctx->int_type = dwapb_read(gpio, GPIO_INTTYPE_LEVEL);
+				if (dwapb_native_both_edge(gpio))
+					ctx->int_bothedge =
+						dwapb_read(gpio, GPIO_INT_BOTHEDGE);
 				ctx->int_deb = dwapb_read(gpio, GPIO_PORTA_DEBOUNCE);
 			}
 		}
@@ -884,6 +924,9 @@ static int dwapb_gpio_resume(struct device *dev)
 		if (idx == 0) {
 			dwapb_write(gpio, GPIO_INTTYPE_LEVEL, ctx->int_type);
 			dwapb_write(gpio, GPIO_INT_POLARITY, ctx->int_pol);
+			if (dwapb_native_both_edge(gpio))
+				dwapb_write(gpio, GPIO_INT_BOTHEDGE,
+					    ctx->int_bothedge);
 			dwapb_write(gpio, GPIO_PORTA_DEBOUNCE, ctx->int_deb);
 			dwapb_write(gpio, GPIO_INTEN, ctx->int_en);
 			dwapb_write(gpio, GPIO_INTMASK, ctx->int_mask);
-- 
2.34.1

