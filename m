Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763660;
	b=ikf2evWCWbdKMoptdtOMdQOR6mphK0N20k98AicASdYmbMG4lKU2bHuTyDrbK1sbYW2Z
	 WvViylUn5Iyevt7O/5ieptIbnM+USHlY/CGxCRAO/KDT0JEuu+Nc1HhRrBfJHWLhnK4KB
	 ZpLeGkIB74GY5aoLZU0d/m8S8tYzdoQdqP0sK+y/wy74Z+LoCDtRmc+iJlScfj/ZXsCEY
	 XFg65QSv/OWoyTqXfJ+hVXNHQCsa04PKaqMUfF8iHoZqwI7ar+p5tdEf5WsO4Bqxp+YyF
	 jJ3OklNiMfavCa9QRsNoKXrOncFJGUiOMeyuLjOfkF/+IPXqaD+TTd/B6dLR2YaXdTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
	b=dXhoedLWIgYWCknE/EfjAfkM7l06DyYnp/ydSE1z7e4pIyWYiuwYPhlq6yAPX4aL/alF
	 BsDOYa9pQdp0UGHNs9bhvrwykxNu8ec4KxJOhmKepaupWrHCsVZW7qOrctiDETOVaf7zg
	 wq4yjeqUlqXAPiS4n8o+OTS6e8ofjYLdAw+D570CL8OsvMN2tAaHgifZKq1qbUerECiYJ
	 ZHphF14uJzaitdbOnjcuHeHMOfZLRMA/SAm3He57wx7iwVN/B/P3xONumsIvEOVdMDyNx
	 2FZPceRMcnUvOdCxZAgkPMCUxKoQ9Sc/jVDSMMuHi6Y8R9KH2HZB9PAYBceRN5ZJZfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3FJJQU5;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60543606A33E
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60543606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v3FJJQU5
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33fb4680717so381329eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763653; x=1794368453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
        b=v3FJJQU5B3HOul6qVKr1lZnixNysYsFhjn6b1Mm5K82x3Wg7WGHGzWTI7bbH8gPbBe
         uByAO6C0Eih8kgFHkQCgnTE4hubfv7G7ZJ7nB6qXwjuzQNcqdtx4gm2aMR3FmV0VlBTP
         DaevsketutjwS/P6OfEdY7NPKBNo4WlcwqWgEOL40oaaCNnW2Jpj7xWA+/FRbQQXrH5f
         jm/2yiWKKTcIR2CNIRZ8PF+9GEOjBHRsFAAG13G2pWSqEwzffpnQ18de+VBTuAZAuK+H
         iroB9GioSIBan18TWxw3nEH8EkiVF2CBzOxGuPpBt2USKrpXUxMFgx+d/P9CfG8U7h4J
         w3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763653; x=1794368453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8QlC1QEeCheFbapANdihrMvwXWuObWUXDkh3+6fKV6A=;
        b=yVBvHabSjUuAgwt9uFKalxdTMTYtQF4XTQG1nnmcI7C49qGo5E3VZh+n+uuzbnjlZ2
         tu8O+Dic4XiryUR9wYHPoB681lPwxKXQBlodaABShaQwPQjJOksstGUiUatIb7tqVBas
         bjlJ7HOsTJXQOncit6okXY7Euez2Y5uoFT09zZ1Aau/O/dni3xophE6Oth9UCioVqmIf
         23mV7PomCYivqm1QVOZfCJlNuCKKPsk/FbPC4DneGFPycjGSETGXynID2XOpSAVUuwZP
         9FRNeBtQlXcwvaSgIcmtRPuYE3f8OAIdtwApVuxEHaegJKLyZU11U7uwJYKO4Y13DCeL
         8l2w==
X-Forwarded-Encrypted: i=1; AKwUvBz9pAT0/NQ8l035KcIPsw/uGuZm8WNzaLfmBfpDBPXHLsbd24oL5pf3/a7MnXKlxjtfE3Xs2F7LdIvg@vger.kernel.org
X-Gm-Message-State: APuU4Z8BhUvnMlqbVCcclX7+173klZrZrYpWS0jbvv/wtqyk3UUJUNgI
	Q5rvk8fe4MtIbnSuQMobCtteDs9r4WhsuotEaoH5cDw5q7suVPpIJOBs
X-Gm-Gg: AYBFou36Se/UAwP1fubDHUcC2ja9UPlfrtSEb+fDBCaTKsc2coue/F8ii3frv4oB0RP
	0c8CLSMrwmmLfp1poQWB49iuU0YHMfSrZ9tS+V6bDe0HbLEuIs4fEGe1BEfIzihxDTMVMu1Bi4O
	5HgRUERZtImaDOlSNIVpE1j6LE5lAmPB/P/OgHVHPh7GoX39guLq5/ng7ZHSoVbOLPCVZbwih+U
	M+qg5vPcGfcWXtU3NMtHZe0wrwmswlDQjBd72OAQH1yAyxMPw7EHxRUVaKQfGNv3ljm8QNtCmle
	wat+szV2AOYv2tZJxEVu2HzTSPYEEAmv7WXfRHrVRUz4ifZm1UwCpTXHDlDKmSok24ew5euGoLJ
	QCdEwTfpoNtXBJv2qF0KvgV21NYH+n+BlVguMOGAUhAgVK82ScQUzkvv1TvDOAqMEojjzUN3/eN
	S1gJiaimEfrpYHd3oWlwd5vv+O85hYn3w8fq/TjckxQ/3LPlqbDruZTR71WUVPFdzUPHaFLOs4k
	XzQBqNTmSIqAm0cjBOCNu6TqJTa5rfbGhrZhFbISC02lGxLd2CXsYL/3+6HEoZHDJfluK/edTPR
	QMNQDb43ofO2VvDNCky0qLeDysRfafNboPDfeJr4OUlt2VHGDF14gUk0VHfYZh//g7N1BKpkh3T
	mKIkFUHj3Wyac0bsM0XhOJzPVO+bLO+NTFHaiaQ==
X-Received: by 2002:a05:7301:6199:10b0:36c:a281:1bc with SMTP id 5a478bee46e88-36ca2810b86mr2081507eec.16.1793763653482;
        Tue, 03 Nov 2026 19:40:53 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:52 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:34 -0800
Subject: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
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
Message-Id: <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Instead of allocating descs before the loop and reallocating it via
krealloc() when candidate hardware array matching is detected on the
first iteration, defer allocation of descs until the first descriptor
is retrieved.

Factor descriptor allocation and fast-path validation into helper
functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
the loop, acquire the descriptor using __free(gpiod_put), allocate
descs once on the first iteration, check fast-path candidate
suitability, and transfer descriptor ownership using no_free_ptr().

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 181 ++++++++++++++++++++++++++-----------------------
 1 file changed, 98 insertions(+), 83 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e71f8865559f..cf311c1a707c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5208,6 +5208,91 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
 		gpiochip_free_own_desc(desc);
 }
 
+static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc *first_desc)
+{
+	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
+	struct gpio_array *array_info;
+	struct gpio_descs *descs;
+	size_t descs_size, alloc_size;
+	unsigned int bitmap_size;
+
+	/*
+	 * If pin hardware number of array member 0 is also 0, select
+	 * its chip as a candidate for fast bitmap processing path.
+	 */
+	if (gpiod_hwgpio(first_desc) != 0)
+		return kzalloc_flex(*descs, desc, count);
+
+	descs_size = struct_size(descs, desc, count);
+	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
+	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
+
+	descs = kzalloc(alloc_size, GFP_KERNEL);
+	if (!descs)
+		return NULL;
+
+	array_info = (void *)descs + descs_size;
+	array_info->get_mask = array_info->invert_mask + bitmap_size;
+	array_info->set_mask = array_info->get_mask + bitmap_size;
+
+	array_info->desc = descs->desc;
+	array_info->size = count;
+	array_info->gdev = gdev;
+	bitmap_set(array_info->get_mask, 0, count);
+	bitmap_set(array_info->set_mask, 0, count);
+	descs->info = array_info;
+
+	return descs;
+}
+
+static void gpio_descs_check_fastpath(struct gpio_descs *descs,
+				      struct gpio_desc *desc)
+{
+	unsigned int idx = descs->ndescs;
+	struct gpio_array *array_info;
+	unsigned long dflags;
+
+	array_info = descs->info;
+	if (!array_info)
+		return;
+
+	/* Unmark array members which don't belong to the 'fast' chip */
+	if (array_info->gdev != gpiod_to_gpio_device(desc)) {
+		__clear_bit(idx, array_info->get_mask);
+		__clear_bit(idx, array_info->set_mask);
+		return;
+	}
+
+	/*
+	 * Detect array members which belong to the 'fast' chip
+	 * but their pins are not in hardware order.
+	 */
+	if (gpiod_hwgpio(desc) != idx) {
+		/*
+		 * Don't use fast path if all array members processed so
+		 * far belong to the same chip as this one but its pin
+		 * hardware number is different from its array index.
+		 */
+		if (bitmap_full(array_info->get_mask, idx)) {
+			descs->info = NULL;
+		} else {
+			__clear_bit(idx, array_info->get_mask);
+			__clear_bit(idx, array_info->set_mask);
+		}
+		return;
+	}
+
+	dflags = READ_ONCE(desc->flags);
+	/* Exclude open drain or open source from fast output */
+	if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
+	    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
+		__clear_bit(idx, array_info->set_mask);
+
+	/* Identify 'fast' pins which require invertion */
+	if (gpiod_is_active_low(desc))
+		__set_bit(idx, array_info->invert_mask);
+}
+
 /**
  * gpiod_get_array - obtain multiple GPIOs from a multi-index GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
@@ -5226,105 +5311,35 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						const char *con_id,
 						enum gpiod_flags flags)
 {
-	struct gpio_desc *desc;
-	struct gpio_device *gdev;
-	struct gpio_array *array_info = NULL;
-	int i, count, bitmap_size;
-	unsigned long dflags;
+	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
+	int i, count;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	struct gpio_descs *descs __free(gpiod_put_array) =
-		kzalloc_flex(*descs, desc, count);
-	if (!descs)
-		return ERR_PTR(-ENOMEM);
-
 	for (i = 0; i < count; i++) {
-		desc = gpiod_get_index(dev, con_id, i, flags);
+		struct gpio_desc *desc __free(gpiod_put) =
+			gpiod_get_index(dev, con_id, i, flags);
 		if (IS_ERR(desc))
 			return ERR_CAST(desc);
 
-		descs->desc[descs->ndescs++] = desc;
-
-		gdev = gpiod_to_gpio_device(desc);
-		/*
-		 * If pin hardware number of array member 0 is also 0, select
-		 * its chip as a candidate for fast bitmap processing path.
-		 */
-		if (i == 0 && gpiod_hwgpio(desc) == 0) {
-			struct gpio_descs *array;
-			size_t descs_size = struct_size(descs, desc, count);
-
-			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
-						    gdev->ngpio : count);
-
-			array = krealloc(descs, descs_size +
-					 struct_size(array_info, invert_mask, 3 * bitmap_size),
-					 GFP_KERNEL | __GFP_ZERO);
-			if (!array)
+		if (i == 0) {
+			descs = gpio_descs_alloc(count, desc);
+			if (!descs)
 				return ERR_PTR(-ENOMEM);
-
-			descs = array;
-
-			array_info = (void *)descs + descs_size;
-			array_info->get_mask = array_info->invert_mask +
-						  bitmap_size;
-			array_info->set_mask = array_info->get_mask +
-						  bitmap_size;
-
-			array_info->desc = descs->desc;
-			array_info->size = count;
-			array_info->gdev = gdev;
-			bitmap_set(array_info->get_mask, 0, count);
-			bitmap_set(array_info->set_mask, 0, count);
-			descs->info = array_info;
 		}
 
-		/* If there is no cache for fast bitmap processing path, continue */
-		if (!array_info)
-			continue;
+		gpio_descs_check_fastpath(descs, desc);
 
-		/* Unmark array members which don't belong to the 'fast' chip */
-		if (array_info->gdev != gdev) {
-			__clear_bit(i, array_info->get_mask);
-			__clear_bit(i, array_info->set_mask);
-		}
-		/*
-		 * Detect array members which belong to the 'fast' chip
-		 * but their pins are not in hardware order.
-		 */
-		else if (gpiod_hwgpio(desc) != i) {
-			/*
-			 * Don't use fast path if all array members processed so
-			 * far belong to the same chip as this one but its pin
-			 * hardware number is different from its array index.
-			 */
-			if (bitmap_full(array_info->get_mask, i)) {
-				descs->info = NULL;
-				array_info = NULL;
-			} else {
-				__clear_bit(i, array_info->get_mask);
-				__clear_bit(i, array_info->set_mask);
-			}
-		} else {
-			dflags = READ_ONCE(desc->flags);
-			/* Exclude open drain or open source from fast output */
-			if (test_bit(GPIOD_FLAG_OPEN_DRAIN, &dflags) ||
-			    test_bit(GPIOD_FLAG_OPEN_SOURCE, &dflags))
-				__clear_bit(i, array_info->set_mask);
-			/* Identify 'fast' pins which require invertion */
-			if (gpiod_is_active_low(desc))
-				__set_bit(i, array_info->invert_mask);
-		}
+		descs->desc[descs->ndescs++] = no_free_ptr(desc);
 	}
-	if (array_info)
+	if (descs->info)
 		dev_dbg(dev,
 			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
-			array_info->gdev->label, array_info->size,
-			*array_info->get_mask, *array_info->set_mask,
-			*array_info->invert_mask);
+			descs->info->gdev->label, descs->info->size,
+			*descs->info->get_mask, *descs->info->set_mask,
+			*descs->info->invert_mask);
 	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);

-- 
2.56.0.385.gac671c819a-goog

