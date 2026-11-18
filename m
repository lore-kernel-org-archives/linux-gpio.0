Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794987756;
	b=s48Eyi7dt1xpy7ijNYz2u02rPDtPTKD0nUdCUWOVtynTD+Q8NUZccRr9V1u87xqGu07O
	 Th9FLX5qLgfFdFPe9M7Cw4FcCgJhIhjpo9/vZsCcnAkOhIud78wPk8YAY80uqokgP4FBR
	 lfD1hg8YfOMrSZ4Wp1oQ8rn+9Je1mqvBKtxX9rojamMK0ctV4QQFag2fYW51g+XrPYQN0
	 xDbrsFSOrLXBMCzrD/Zeb8Uajgap56tbFxQ01KyEQyBQYYOWso+oi/PTCIAqKuB2kjNCx
	 qMHndbUukD4q9g9Uncs/rkbLBVzB0Hc7GFtX2G5fvNkctwpZeMPQTqOlJoH6+zY3khg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987756;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	b=yU2pvBfTQCHrgbe9bRH2Xjd/1wQpWOZm0xhx2hyIV7a1aXZ8Os7eJggbRSNjkcrEMcmD
	 1bClpEUA5PkJTR2Bp2PnxcJoGHtIBQkG2ez4fVAd9ZZQW/WcR2LtTcWiCw5JBmxdCsOty
	 N8EV19rtIofzxc3scqgHRivND60n3MibNHIP3Orm/IP8kEb8WKN1YMM5VqJ524sFaW6Do
	 Oo5SMIULhQtkAxy3in4Cbp0mLrZ0H22EGjzSou/77Wjiq5NcpeoFZ5Xsw+S0P8N+W+T/w
	 Wxf1ET41PFv7T+x0yfuhG8UN301sHNYdxNNK0sV7ts8btQ9t8uk5uZJoOcxRpKB1VKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZ1819ef;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3DA606A31C;
	Wed, 18 Nov 2026 07:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OZ1819ef
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794987756;
	b=Fu3C9UnjqORe/zckZ7hPKBqS5CWmRUcR03JpWIjrHIm5RWN6eGD758gacf9JAQSPF1OD
	 xK5uKpEyIsKuemC8hCrD2EIChKa4pgYa3GZXUzN2YeyqjKplR7+l91q3EKXNgK1Z/zYeX
	 0gTQJ/cSll+NLZLQGGEXZOIEJgLqVh1+YYeQiOrjgaObIbBT0AczqdgKjq71rR9o40I1/
	 i3433vAmZUzpVInePlcDNAYiv8scH2TQc2mHb8wDffddMJWQWtxR2pVOsKvIQnh9y1v3q
	 IJRnrKgBDdYAry8j0S3MKMZTtU1+zguzqOwZeUGhfQuZm+IBwP7ryzubulhKfMLQJDw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794987756;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	b=ZglUrch474e1tBLxCLLeTYogA/WZk3mpZPjTY2vYWFw2mrLPtSV8Q2BjIKjVeYPfvTYZ
	 cbgHYSw12yHDjQgDwyxdcxajMBPp6tVdBN0ef4G47v2XRQHE/2PKr09k87m+kUTv/tvlK
	 z+xuaZF7PooLTz6PUI0SnvgFF18PXq+XuZ3tYXoe84j20a/x79cJXLJrKcdzl/YEZYbGs
	 7G9WOKvZ3e/omNWiM3kc4N3cMbr+CcJWsVbWQGHobORXZ4zdKtkOH9TRl8PLTtdh8RqXy
	 OC+aQhCt28tKw3wvzfSUoS3ului8Eo0lyIPX4AG8k+0ypB/cvHAjKtr5DhDFBgvX8Kg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 368121F000C7;
	Wed, 18 Nov 2026 07:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794987756;
	bh=mQHo+Pq1IJv6wRo06t/mpmrPiKGrNMyrY0EUw4RM8cA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OZ1819efaeDwfKmuxLDdKb8x237u5Rb4AMY0uC0TB8AmqlZHI9JPdCpHaYi45NMxK
	 f14HbiCVtBPAmNzSkLTJeY8UrxuyKCORfRiMA9aSfKGfmNSvXo2Tr/WE+15XhKYB40
	 /mtCJVaNCT/MLIKHBn1BeraClRh5KX+qmAYwN+3dsQ9hLsiJP5MnylWiEjg8++riP4
	 kBo1pG5QpvXeWZWWZo7XEVtJRO+rI9pkuF3bZUZET26QR4JkG0VEQUiqKydRxLpl7k
	 8dV3shhtCcRi8upQ1+nF9AcVWq57CpRknxIV+JakB0GOssuk3G+NDP9kyrEQcJCkcb
	 yVQXaDZtVLtXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B678E4AC5E;
	Wed, 18 Nov 2026 07:42:34 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Wed, 18 Nov 2026 15:42:20 +0800
Subject: [PATCH v15 03/14] gpio: regmap: remove gpiochip before tearing
 down irqchip
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com>
References: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
In-Reply-To: <20261118-cv75-gpio-v15-0-e3c563673fe1@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987752; l=1280;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=hUOMd6dzhgSqIYRo/goV9ScP4Xfisuex5VCHYS0+NCE=;
 b=ZTkbud2UT2raGti6+P+i9GkGQBAmdj0pQGxfo1LAwbBal6FN+2i4crttlJefKBBPa+jf7EzHE
 EDqLjos4nMZB7OqOJrDRyHFs9fPstKFbTv7yYZql1QYkYCcjNwpYH9J
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

gpiochip_remove() calls acpi_gpiochip_free_interrupts() and
gpiod_free_irqs(). Both still need the irq domain.
regmap_del_irq_chip() removes that domain, so remove the
gpiochip first.

Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-regmap.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 0a44deae3d01..1bfdb00dad95 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -445,12 +445,19 @@ EXPORT_SYMBOL_GPL(gpio_regmap_register);
  */
 void gpio_regmap_unregister(struct gpio_regmap *gpio)
 {
+	/*
+	 * gpiochip_remove() runs acpi_gpiochip_free_interrupts() and
+	 * gpiod_free_irqs(). Both still need the irq domain.
+	 * regmap_del_irq_chip() removes that domain, so remove the
+	 * gpiochip first.
+	 */
+	gpiochip_remove(&gpio->gpio_chip);
+
 #ifdef CONFIG_REGMAP_IRQ
 	if (gpio->irq_chip_data)
 		regmap_del_irq_chip(gpio->regmap_irq_line, gpio->irq_chip_data);
 #endif
 
-	gpiochip_remove(&gpio->gpio_chip);
 	bitmap_free(gpio->fixed_direction_output);
 	bitmap_free(gpio->fixed_direction_mask);
 	kfree(gpio);

-- 
2.34.1


