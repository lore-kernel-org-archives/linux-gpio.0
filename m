Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609339;
	b=UW9bKLwmasiASKSfyMoD3lDgG3Do/+7nd19lHH/9QMjqmMdZmlJgTqJYVsl7rFSgX0iW
	 t6JAr5cpEObWAicVaoJZkmCbu6w+R4DrB3ruObIEB+RA9806i5lF8oNmDtvjxLXXJwqXL
	 R1mew2xjUcjupAUJFrwOxUKGZUu2t6QnLQmTtZCN6NXjMkLfGoT3CGg3JUCEdsMkiUPS4
	 y0SQLhe+Euw3I0eBKC9TBG3tTaKKRSdusghfzd0A+MmSRo7m8EoCfFmgVWU0JyNez40xN
	 X1eBNMlo3B3E3KSTcW+XAlqyb5ppXXY8S5Y7JN53BdwKdSWl1TQDHlPf25rBAikNDeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oIs8IJ2YEdT1Eb6xy6JYiLa+da+RDSFUxEzGkoRkONY=;
	b=QzCqSvMsIFDMkoJnQXi6NMjdZSLKoIP65sDEIdxcC0ahnq4RsigOswFgYys+zO1+Cop0
	 r/V8I1hTrUZATBdeQPLkEFtx/tT5J3VpiUWIIa+zpnhnQEpCB+KGP8fpdX2vzQXmg+ROA
	 NXcbK11gD0MZGqyLgi1etQ6BGau7gVWeU9zvHaKyaf+p9x30t0osPMqFVmi0EWauVvI+m
	 BMMFcB4cSvS04aS2m14s1VHpecwqnQ4hPrWLzVcQbUiZHL2UQzzQIl4aheHtFHZdetEzD
	 0Qo2WRUr/v0UJfuA2J1Pw04RQibfIH7zU1KM/o1L0pKdp3RWdMPJZ3pRNQ1VWivxnHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmqEBcjb;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CC606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E93CC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmqEBcjb
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35b2c599f43so2322116eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609338; x=1793214138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oIs8IJ2YEdT1Eb6xy6JYiLa+da+RDSFUxEzGkoRkONY=;
        b=bmqEBcjbYRq/nwgBNIuQ1NSxVaJCbHJaPPo7E/NpvShqwRVpmc9285BRAn++oH2duB
         TomT+DAjfAuokFXxIwL0uUcmf5ZbbnwyksRQZhjSypEmhK4nhDbZy308ls3iJbekD7Zm
         VaPtHdRLilI3QwJJDGYlvGQNGbh1NXNMrOyAEXww8EIGz3EQIVKLid3O86Tnaw3NP9fz
         kYogdEAvoDgCPieibKZpVb9ftz4mkP78fbtfB/Lw1V8GHxXpYiZ12joyE4VNIpKP94GX
         S3Tbuy7apKuQ8yO/NU3lxKCNi/ASAA4QIJ7jRD2UKcXMPVSPUDLygKDQYPQDRnREzjLW
         AMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609338; x=1793214138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIs8IJ2YEdT1Eb6xy6JYiLa+da+RDSFUxEzGkoRkONY=;
        b=u4y1QtWDyZCq3DMycMMa2kqw+5MDCuPJzqYqG7hQz3P8pJo6sAtOY1My2UxKZ7a/wy
         dcE25bOeO52euA1XSRoFwipXs/KwaDcjsvVg8novYBY3pBIhJt8A2Y2X+zBjMcdaTy40
         +W1xGBmC8vZJnGvGYZfb3j1wS/NMPOnT+35w/intPX+oxgCo+L8bFOmd5eMNwWmdxJ7p
         nhx/Pc024JRhcfYMGWZaKI/5+u9mGYxnN/aNBlJNte3H2XoVMR50jMesIwbGMkCfaj9q
         mQCSyN3l4r32tZbiS0uif+lx4BTt+jiQih2XKZfRz9DRvwfRwo7hqAYLdYKNSuCHWxWg
         tQrw==
X-Forwarded-Encrypted: i=1; AKwUvBw6T/N5HbvDAOl7zVERAbXcxiDshz5Iexk9fTZbRqkr26Z1C/lns3sie7EX5B5yDW9nQiPk9ol2ibCA@vger.kernel.org
X-Gm-Message-State: AFq9FYKn6QHhATCOZ+mmhmuFQfCGl9ByX/dUlbRq4PIQpfCGme71YZRD
	yFebKXiyv8ZlBGPjPJDe2BzhN4ngLrzHfEXXvIOSr7qjvdIcfMXYa+IM
X-Gm-Gg: AYBFou2izM64HfBTAfBoEg5GFHUtfhhiXFdKcTge0HLl55CzgJplm57YaR/xhaiP8cm
	6GJniltZDfNrJpi600q93SMBSd47T7+UYggq/kUa6eE/yO8L3Rzwsr0q17dfL+0NqZKOfo8+EFk
	W2A8fI4p+OhefV0SSWFn7TABoxwakEmmkabh/P76H+iZcDWMcALc4v+9is3Hr9E9s4tXSuyDujS
	33+U/BJkJO9td8MLrYrJb5L7jDGeWSATvt8VVctKkH+l0RN9VLUeKgeuNA/gGYpNUF0fravXMm3
	0p0sa22Te9uKRI6K2MmUkVIgX9L62+dtFldS5qfAF4INxtnVwg4MD2ejdV+Ee9Jc9O54coU9sz+
	5Tqu9GPUegRoa+d8kWM59RMR4/tHwO0vheoLRRx7iskU3nQ7TBkKnvoF4AgfKpvVcDSiJccqmFj
	gB6FCeNKnxv4zYyxXs631rqI4wBwmswDSosw8mQO/gUrFQO8rrEXFWxnDZ39O3oJlhzLnGsyJyx
	F/jPBYdgoD3rw0YfOrbG7U3ORxrtHAh0opAoXZFEB8gHuVZSjT5A070inDSBej3cDblXVsAEO2o
	T/NiYwNNbH+fzccLUDdO5bhsj+gIYwAMMxCQ0mBpNCQu
X-Received: by 2002:a05:693c:20ca:20b0:361:7edc:1541 with SMTP id 5a478bee46e88-3674d84d32dmr4343707eec.7.1792609337518;
        Wed, 21 Oct 2026 12:02:17 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:16 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] gpiolib: fix GPIO descriptor leak in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:06 -0700
Message-ID: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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

In gpiod_get_array(), descs->ndescs is used as the loop induction
variable and is only incremented at the end of each iteration. When
krealloc() fails on the first iteration (when index is 0), descs->desc[0]
has already been acquired via gpiod_get_index(), but descs->ndescs is
still 0. Consequently, gpiod_put_array() frees descs without releasing
descs->desc[0], leaking the descriptor.

Fix this by using a dedicated loop induction variable and incrementing
descs->ndescs immediately upon storing the retrieved descriptor.
Additionally, since the fast-path array_info setup only executes for
the first element (index 0), simplify the bitmap_set() calls to start at
bit 0 for count bits instead of calculating offsets from the loop index.

Fixes: bf9346f5d47b ("gpiolib: Identify arrays matching GPIO hardware")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279..21c9cea71c68 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5193,7 +5193,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
-	int count, bitmap_size;
+	int i, count, bitmap_size;
 	unsigned long dflags;
 	size_t descs_size;
 
@@ -5206,21 +5206,21 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
-	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
-		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
+	for (i = 0; i < count; i++) {
+		desc = gpiod_get_index(dev, con_id, i, flags);
 		if (IS_ERR(desc)) {
 			gpiod_put_array(descs);
 			return ERR_CAST(desc);
 		}
 
-		descs->desc[descs->ndescs] = desc;
+		descs->desc[descs->ndescs++] = desc;
 
 		gdev = gpiod_to_gpio_device(desc);
 		/*
 		 * If pin hardware number of array member 0 is also 0, select
 		 * its chip as a candidate for fast bitmap processing path.
 		 */
-		if (descs->ndescs == 0 && gpiod_hwgpio(desc) == 0) {
+		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
@@ -5245,10 +5245,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->desc = descs->desc;
 			array_info->size = count;
 			array_info->gdev = gdev;
-			bitmap_set(array_info->get_mask, descs->ndescs,
-				   count - descs->ndescs);
-			bitmap_set(array_info->set_mask, descs->ndescs,
-				   count - descs->ndescs);
+			bitmap_set(array_info->get_mask, 0, count);
+			bitmap_set(array_info->set_mask, 0, count);
 			descs->info = array_info;
 		}
 
@@ -5258,38 +5256,34 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
 		/* Unmark array members which don't belong to the 'fast' chip */
 		if (array_info->gdev != gdev) {
-			__clear_bit(descs->ndescs, array_info->get_mask);
-			__clear_bit(descs->ndescs, array_info->set_mask);
+			__clear_bit(i, array_info->get_mask);
+			__clear_bit(i, array_info->set_mask);
 		}
 		/*
 		 * Detect array members which belong to the 'fast' chip
 		 * but their pins are not in hardware order.
 		 */
-		else if (gpiod_hwgpio(desc) != descs->ndescs) {
+		else if (gpiod_hwgpio(desc) != i) {
 			/*
 			 * Don't use fast path if all array members processed so
 			 * far belong to the same chip as this one but its pin
 			 * hardware number is different from its array index.
 			 */
-			if (bitmap_full(array_info->get_mask, descs->ndescs)) {
+			if (bitmap_full(array_info->get_mask, i)) {
 				array_info = NULL;
 			} else {
-				__clear_bit(descs->ndescs,
-					    array_info->get_mask);
-				__clear_bit(descs->ndescs,
-					    array_info->set_mask);
+				__clear_bit(i, array_info->get_mask);
+				__clear_bit(i, array_info->set_mask);
 			}
 		} else {
 			dflags = READ_ONCE(desc->flags);
 			/* Exclude open drain or open source from fast output */
 			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
 			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
-				__clear_bit(descs->ndescs,
-					    array_info->set_mask);
+				__clear_bit(i, array_info->set_mask);
 			/* Identify 'fast' pins which require invertion */
 			if (gpiod_is_active_low(desc))
-				__set_bit(descs->ndescs,
-					  array_info->invert_mask);
+				__set_bit(i, array_info->invert_mask);
 		}
 	}
 	if (array_info)
-- 
2.56.0.307.g5fe7bd680c-goog

