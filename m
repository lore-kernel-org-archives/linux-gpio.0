Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946624;
	b=G7GqgKegdx2d3sOHnjEuRLkY/io6pSWTMoFXU6LcYrG0yDcV2iEn5GJy2c31usVWL/DV
	 eZT63ombVGxVrYNxbZJFGXB37DmwAP02EWIwaPFAOn+xF+X7P629JxGdZkFZ2vZUBppzW
	 g5OaGWSJIx0bu2bnbSVvpXp7Ik6GV/0Hi50b3xHviFf1ImUjc9iM8qmAyVm66QSAuc/SO
	 I2JX8+dLYR3DWBHhOQDYqm7XfZfazEGvdTvc+l/WLlHoh7ixnjtsvy+dZ0+o86DGgIYKb
	 UUQepQZtM4Wmg7bc7U2udz9wwCyJdSqxPX6H0XrtKfcYzARzuFbPOyzlkyphmuIcUTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
	b=R0X7wWx8kFK+D23xSU+tVP6pd1RflbF+bSuQrpMrjNYhzrNpb86Tp0nTfCyj/Pr9QxME
	 Bt6/sLHj3jfXKnzecHDIxJI/ZeUvJBMaafmskl6S2RxoCeuw3P9OIdodwAHB1C5s4b7by
	 k19g4mcv4y9MFMXsO0XQo+cJtKsgc74RdLfWMkLU9An8Iw3U1Dm/ra1RZLDhDLe9o1Hto
	 rGNEg2swAk7yBa0IQ9XoH8vBD+5Dnclp2L4hRNoHMJMxX/6jHKEjn+VxjGlVF5XlgtOCy
	 Kd3GIyplbfyGAfik/Ubfppze4tndj5VZVC+My4tQ+VizDQ8Vuv8WDBcozKHD8qrJnhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hJd6yvb4;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EE4606A33D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EE4606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hJd6yvb4
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a8cc11ac42so325056c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946623; x=1794551423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
        b=hJd6yvb4hRo/WJyrkBKJKSkoDqgflTlI6EiD9S8W550Wuk6BDRWiS/W/lhHkwLoQY+
         UDcFoCxSgGC8siCG7g08Qb8aRFmqT/njhkpqAXqvdOouCFC5ZwhPLs6peUKbs1BWwfrk
         9qzSHabU24vOaZwqMraYrUwwaNQ4FaGQcTsQgyqIwhCLx770uZORVuiqiuzwjVEQnfY9
         bg10QkkvQ5f+80dHjI54Ei3hcrtbifrgK4gPuoovWCQfWwgiPT1fLy12dQZPvKV4h5+r
         w7Lm6P0lg1Qe93J2dhymcd71+/iOqLmFLPaRPZmpv3PmV3VIdDLPVfNmnrnZxXdETNWM
         uy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946623; x=1794551423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltQsLZdMZWEcjwAeQN/PxZnJlGa1DsMvXSbqsTkFAPk=;
        b=ffpjS4zUVDCKmKkHWZIiTt/2IqKY34ls4dk4aA5bWskgbjoxvFKAtbSSL7j1iw2Gj9
         /2UEWA5iinR+JHOoX7Z7xBNbxNjccIrplZNgL3pOKxneRcw1uhE/c9MnQ/XhiqL8KNfM
         bHFkg5aapeGBH5/afwYYGGA/42MQzo3fzYIHZIvs819XSzxGzaHDvyiWXcpi/2UgV/4D
         uo+E/Kl3VSGSAzjql1VIcoN7XEdtv0OAw9zq5Y7ft7ZWqQugecHPsc9wuz+/dDwqiS+B
         pgVAFxqTvlA2GiDPQOsIePOIdFxm6AvpHJqzYDYS6KLyMmKzeoi2XSpHtITUujKUhay6
         q00w==
X-Forwarded-Encrypted: i=1; AKwUvByv4RddBEZg6N7G8ARNYquVo2P6zoneN5wWYvsujkTXk1JLPwXXv8KrhnxJwiwO7cQ4fKnbAhciw1aF@vger.kernel.org
X-Gm-Message-State: APuU4Z8GW5oNe8s/QD04qnxzwkHM79cQND0uXyJ/Z1yZHTdHyTFeK11K
	KXZBY7Nu6fQGBWCudVs8NPdgZ2h0S2VjM3Bz2wkPfUINppJU7JkIgrKq
X-Gm-Gg: AYBFou0nF/xQ1tIHQRBF/0J/nILld2FPQ0kIrAWskz9xY96/UALxl8ve6JHyQvK4Ugf
	PEHppO8bG2PYG7lcxcGgutTi14cNBkh93aMF3/eftjh+PXJFtVHx3wKkEAEamhjyLVi/cV/k8ld
	ARlj1Oc5szQA4MMrlc8k+fPeK/3al+kY9NzZ6EBSPCytGTYoB0DXlJi7Zd40PQPtx36Ona8Xxj0
	xGiyd1+x8+YTt8wFOVTeuXjogMM7dQhftD+ynOpY5j7bNmc/lEemur1trzfpeaN9OqeF+JUovs4
	JCsnRFYbPhDj4itFLQ+ttM+EbzV02B6SitLIqsj5o/MZbk/qUngxFsxZ7z6WzXJE+M812Q22t8p
	6EFuKbWJLjLV2XCT7mWdPy9RNBSm0oyt1MBwzmYwQMWjO/X8nCj+v11zyHG0XHWmdJqWj2Gi6oY
	2agLCc982DtPpryn4Bz5fiQTQeF+Wj/H37gitohbF+pZWZ+7/HZPWE4N8yXPpY5kebqXOvDZLR5
	QIsopZr2ogKPgFIjXccNkzo6yO5/P5WXWTJ0A/boRNI2HVWsNIjUgh1t3xwsSdRwwQKIHqSsm/M
	FKlgPy6wd5av85fv+5An8Lf6P15nBAw1m7B30JxY1dQ3nm289GaZwNTpY4cU2f9acqgDlO42aeU
	0WG/OuM+gb06KP2OW
X-Received: by 2002:a05:7022:f51c:b0:1b2:43b3:a90c with SMTP id a92af1059eb24-1b25d3153femr1665693c88.9.1793946623063;
        Thu, 05 Nov 2026 22:30:23 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:22 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:15 -0800
Subject: [PATCH v3 1/8] gpiolib: fix GPIO descriptor leak in
 gpiod_get_array()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-gpiolib-free-v3-1-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), descs->ndescs is used as the loop induction
variable and is only incremented at the end of each iteration. When
krealloc() fails on the first iteration (when index is 0),
descs->desc[0] has already been acquired via gpiod_get_index(), but
descs->ndescs is still 0. Consequently, gpiod_put_array() frees descs
without releasing descs->desc[0], leaking the descriptor.

Fix this by using a dedicated loop induction variable and incrementing
descs->ndescs immediately upon storing the retrieved descriptor.
Additionally, since the fast-path array_info setup only executes for the
first element (index 0), simplify the bitmap_set() calls to start at bit
0 for count bits instead of calculating offsets from the loop index.

Fixes: bf9346f5d47b ("gpiolib: Identify arrays matching GPIO hardware")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 34 ++++++++++++++--------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2787..a5a519c0f001 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5243,21 +5243,21 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
-	for (descs->ndescs = 0; descs->ndescs < count; descs->ndescs++) {
-		desc = gpiod_get_index(dev, con_id, descs->ndescs, flags);
+	for (int i = 0; i < count; i++) {
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
@@ -5282,10 +5282,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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
 
@@ -5295,38 +5293,34 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 
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
2.56.0.506.g506a7eabc5-goog

