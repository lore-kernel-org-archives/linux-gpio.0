Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792482883;
	b=c6IOur9nteCzn9SjySCd3dyKsxBM8LhsChSRz1masuKpv/JcemlImddiKglfNmvorVXe
	 NEzLsnfCcan0bkMNwUG38KI+O8tECPLHYrGbTgeXiDt0z3igkiNepHnBwbNK6kjh/b/2m
	 yIMwR0H6yYxwpb4WvOEjfh9pSuRMTfwlYCrwTohvRIIbfL/ZugzSkpcou0HMY/RNEjkKr
	 sk3f41J40sEobYMuLagtlGjlxofQ2cbrCtG9RJkdKmLpIcaDYe5DzKWRADsJuJLY+6cEJ
	 tVijYL6cO06H7aMFBlbznsZrR7LA/VSOpqTlHg09RXq4PCzpWvIY/L9obkbDZaqj1Xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482883;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+9bppeE8velp4r7TYfB4R+T7jkf9GEKD/elPcysNhDs=;
	b=gEBxMNGywowYipJyCZZCqNE4mJy459rkF1Qb1KROyqgB+W+GhANBLV1x9zet24R4mzCq
	 ShG5DpRq3eVsFXYp/yBMHB4j23BagocM498GyexVzhD2Q5hmH6Xqh7Udto1hz5EsylYuc
	 +7L8ZSwjqTvg2YGoc84aJAgAiPfOy2mfW2scEGnEkYx4XMcDKM1D4CeS3v1pgLNpjQp5S
	 vLCmUSvep4Di+tvoMEoR9oWfHIfR+kj064JsdgrdQ1hMvInw57LvDSKbyHcGTIPic5kW1
	 ioF7S4jFB/iFMMOWvp3vZjDDI12ZZd4CRZibebSCOAJL8POh9u6VSbIEawLEg8U2yqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+2aypBE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40971606A331;
	Tue, 20 Oct 2026 07:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q+2aypBE
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792482883;
	b=CVtYUKioicAkJ2/HC2yn+F7PikQ/mgm4n+i00CPoT96SdjRK8U8eDpx9OH0Cx4tep1QT
	 f5KBpheX+heMRXsp5pEpm+uei1ktpwiaZwcWT/oyBIzdLenQiSPBh5BLZrsv/E0AGQVg2
	 uRSCDSIwbCP0J6yUlU5qQqAE+gSh1mHcCM9Kut7QeO42rhj+5OVajkoU0nNt27/mrE2o8
	 KihmUSzrOU5f0T3oKzkPzLl7TsTw44PbpvJCrbwSAxzaUwlOEbUvBSbi5RlBGdCR0YOaz
	 QRiVl21nbpdrdsa+Fa0bqPXOV61M8KrNCTMqMxK5MSHXSJfRZ+fTKN17LDrM9AbvuyQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792482883;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+9bppeE8velp4r7TYfB4R+T7jkf9GEKD/elPcysNhDs=;
	b=dluX8ox7w+YZCQBtCDCgOb8ZpoYKyz5bNQEBlhD0VKC36dZXE3Ls+ALPHH3UuONfRtpk
	 nlKm8JKLyze/M3pFIEwN2Uj6syyK2EePKl6q7nSfqIrG34G3TjyUdE2WCcyGkXx+ibedC
	 7Km9hVB/PkpZM5GnWJi8TFqvqBg3gxo4JJQT3WO2xbnCMk4dipQEZNIXSP3Gk1AXgy2kZ
	 jHyb8xtsYKoRsQjnFp37GwmqR59oJJvUKwyAEU8OHkcbsT8X0nTiGooSRhMty4yUXPiqX
	 G/uwDKLCQT+cX72gdJT4XO2BDcQiPICNhZn0egBF7s67mL+MT5RgWPsWfi4KmlvlGng==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 425931F000CA;
	Tue, 20 Oct 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792482883;
	bh=+9bppeE8velp4r7TYfB4R+T7jkf9GEKD/elPcysNhDs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q+2aypBEDGIYVhiM8vTczMNV+nlVdRrizcOosNzYJ1Wupvrk+zQre0aht9iz+M0K8
	 hlnd2tm9EvqIGCQRVfHZniz3go8s45aygLl4PgfLDFWX3iaQI+fLOArcgKDLaOen4Z
	 U7j43XvkEec8IAWmqj/ioK0hGIoWTWYcy29B2w0wGPb8YI+sj9DaU+NUUPT4J5S/ND
	 G4AEbSx33isDUzTZvRKwLS+qxaQEp5298dZxTw114JSJxj8x79RrBxwfd9Js8jqUtV
	 Ce2cYTV+Qt2Z5OG+NLPXFiyCn8TtlZQSyd+u2UXlLK+8AU0Zc64j40xyERPxexr7Eh
	 11xrG8ZhV19kg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 982F34309C;
	Tue, 20 Oct 2026 07:54:40 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 20 Oct 2026 15:54:10 +0800
Subject: [PATCH v11 6/9] gpio: pl061: use cleanup helpers for locks
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
Message-Id: <20261020-cv75-gpio-v11-6-e058bae19571@ambarella.com>
References: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
In-Reply-To: <20261020-cv75-gpio-v11-0-e058bae19571@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792482878; l=3499;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=1G4BMcykwvIzqw27B8ealjSHLPEf9bBWjKn0LIjGG44=;
 b=zkrGaRRC3DG5j+IVaO4lzI3ctqwFDB0onb1atk/oRGYG7jyP8NTLKw4WLdwsYLMLnT1dsu4yr
 a3kdGObYHOVAQ7tLG78JT26SF1U/36eHGmxcTIr8NE6QX9XPKGGG/UN
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Convert raw_spinlock critical sections to guard()() from cleanup.h.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 1937941745f4..bbf457a12851 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -10,6 +10,7 @@
  */
 #include <linux/amba/bus.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
@@ -105,11 +106,10 @@ static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
 static int pl061_direction_input(struct gpio_chip *gc, unsigned offset)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
+
 	regmap_clear_bits(pl061->regmap, GPIODIR, BIT(offset));
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -118,10 +118,10 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 		int value)
 {
 	struct pl061 *pl061 = gpiochip_get_data(gc);
-	unsigned long flags;
 	unsigned int mask = BIT(offset);
 
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
+
 	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
 			   BIT(offset), value);
 	regmap_set_bits(pl061->regmap, GPIODIR, mask);
@@ -132,7 +132,6 @@ static int pl061_direction_output(struct gpio_chip *gc, unsigned offset,
 	 */
 	regmap_assign_bits(pl061->regmap, BIT(offset + PL061_DATA_OFFSET),
 			   BIT(offset), value);
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
 
 	return 0;
 }
@@ -163,7 +162,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	unsigned int gpioiev = 0;
 	unsigned int gpioibe = 0;
 	unsigned int gpiois = 0;
-	unsigned long flags;
 
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
@@ -176,8 +174,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		return -EINVAL;
 	}
 
-
-	raw_spin_lock_irqsave(&pl061->lock, flags);
+	guard(raw_spinlock_irqsave)(&pl061->lock);
 
 	regmap_read(pl061->regmap, GPIOIEV, &gpioiev);
 	regmap_read(pl061->regmap, GPIOIS, &gpiois);
@@ -237,8 +234,6 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	regmap_write(pl061->regmap, GPIOIBE, gpioibe);
 	regmap_write(pl061->regmap, GPIOIEV, gpioiev);
 
-	raw_spin_unlock_irqrestore(&pl061->lock, flags);
-
 	return 0;
 }
 
@@ -267,9 +262,8 @@ static void pl061_irq_mask(struct irq_data *d)
 	struct pl061 *pl061 = gpiochip_get_data(gc);
 	u8 mask = BIT(irqd_to_hwirq(d) % PL061_GPIO_NR);
 
-	raw_spin_lock(&pl061->lock);
-	regmap_clear_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
+	scoped_guard(raw_spinlock, &pl061->lock)
+		regmap_clear_bits(pl061->regmap, GPIOIE, mask);
 
 	gpiochip_disable_irq(gc, d->hwirq);
 }
@@ -282,9 +276,8 @@ static void pl061_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(gc, d->hwirq);
 
-	raw_spin_lock(&pl061->lock);
-	regmap_set_bits(pl061->regmap, GPIOIE, mask);
-	raw_spin_unlock(&pl061->lock);
+	scoped_guard(raw_spinlock, &pl061->lock)
+		regmap_set_bits(pl061->regmap, GPIOIE, mask);
 }
 
 /**

-- 
2.34.1


