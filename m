Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763647;
	b=zzCHWmfWHVmSXhtlI46TUjwWoRDPj32DyXTZvOH0+ZDeuSGrjLN4iRd0/t1WGqKRwlHm
	 pS1T9PBvWjRWmIdye4d3rIdEGQE5PUblGuwUCOdArIZTU61vYZn8NoY1euaCuMh5jNSD5
	 ky1BcE1qngnXJ19oOyCPQIvPmIKYIbHBogNVls9tiQMOzDsaUXks4Mkby0hnuJTPgnx5t
	 RYC7RxB2yu9S2leUfQEN6HS4QwOKrDUk2Il/OrifpbTHtEz2TQAJi7QfWawrW9V33zyOk
	 4K5/VK9zajKfkmWWG2TcFtA4Nb/jWJ/ZdxvLSgPWmRSK6gHwwMBZSVsSu/+5dbby5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
	b=Vbyrvq397g6TLNYtQpytx4EY74pvyTnnkDqTHW/F7xGPjsdKVYgGVFoDYwDsnJ6oQp4Z
	 4s3VY5ER9R6ZpP5nPypEUDgXT/Z/tCNg3cckWTgmObrvId8YF2y5EgTUQhW1H7GaDhcfk
	 wC6HWRbmkdSTAhPzkvQdmXGLxlccfcFPCub2BBECI7pXXju5FGYpG54RQZOdFIqCe1edl
	 mXcugJ0J21wpahtu3pHl/LiV4xPlzf/fQPlYOyfgcGZhm7bV0ehogzXyyRxlzM9yP3T/w
	 A631Rj8FOPvltYOworO1bY4TUYmjVycHTTnQCL8UaPbPe0QDZuruhj2LDBOks6WuJqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmtKFQcM;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7BD606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C7BD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jmtKFQcM
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-369f33df08eso413100eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763646; x=1794368446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
        b=jmtKFQcMqhR7+8ByRxv4KpkeHAU8wFtChAxqcmETXIGG6fCSgZeIQpYKDBy/HwrZhl
         jvZRyr97nKok4Rr917WkyuAb/K7SSNJLeypvqfdq9BgVGGgh1vQfXcPVBqngxZzP2nRB
         ko337BKF1bFl8fo8xmCfalNgD+/K3IE5b0kR+Jhq9DAXABCpgz+byiDMA0Vf+yRihcj3
         qtt4UAsp6rVo5zid4/0sz3grYt5ijCdmqgFhpSX8oHR+7zWR7o47j1GgZ6bXLcefHos3
         2wLo24CoCOSRJ+2O6xbCymke/v6TnKBzyQYM94RvcFj47s5fQPa+dKgKAGvoVMde9rVI
         RlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763646; x=1794368446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AwEbeqJ8Td8EMCgoZgZQucXt1j9JNCOh8vE5qiS3mQ=;
        b=qEl90L96D0Eb7L4Mz/DRyXhUcCfwDU6OxnKmzLrIHLNJI9rPZ7PZDivl9F7IBSxUXF
         g/avGvaCQrCPMvtQ4FlnfcUAlqUWFjqNXBe43zPLMqQe8y+vA4BQWx423UH1Qz+YJP2B
         qZHFAfIrp3TqU9DlTLYyWFsVuZa0V/E6n9+ATzD3Pc8rGo79Rh4l2Y5og7BLYNjZ4R/j
         uswtDVisIUXs0FIBPHdcyzg9alOcPSaBpaIDRO8lms245Hz+SWlLIHtbI+qMYs3+8kdT
         tCKUTnNqj0XNTU7E/2qtn0HDS0qoVWH8ptInZCqiMdu5OWeSlk3NsVgGXY+BvC+z1ZYr
         R5dg==
X-Forwarded-Encrypted: i=1; AKwUvBz+VSbtQHd6DAtCd3VBrUctiSwHEb7CPIVlmtVeI5HDk5L+usTQeqEAxp1Tjg0rfLjrFVoQU23fTwZW@vger.kernel.org
X-Gm-Message-State: APuU4Z+TA811M9fqMMeNeUZaA68q1yow2e8uolylDE6MbqpgG6Ef+QEm
	mRXxKJR9KmMwrhPXAXnfK1I9OOzWpVVBh/o2VC3+MT1EqLZJH10mgphL
X-Gm-Gg: AYBFou39eNePBU9BYPUEewiqaXU1LOPvWrahvf3N0Jeae3qtOOPDB27jmPa7rLBCnG3
	K6QyTLzuNNDJ9eS3RKrNY1Y19nJbUbAB+n8YeKJiIcXcRPNyN6BuDTvivokWcubOiZVAldIxoaT
	/PH2okxNaJ1YglkKyi2kLgvbgAh0S9Kcmu9NwpiopFHryXRx+imQlgy4M78HEil9DjLAReHZh3y
	30umBjVRVBInvyJMkM52gvDT95cjxGZ9440Zdan8sbd4GDr9KRQs/lXHDJiTyDDZ2SB9bbS0ixE
	emdvV357MBJRC3rMwEbiJ/UbL5VJOrSCb8iPcKMUnHWbvQgzJdWcRaa+C6MopHcqawDeqtKR70c
	ow9SINm5IpMHg+rBP1g55qIK24kWbAHxv0Ig0YfZSXQGUw3xVnop/PWCRr1f/Up/gtnYdCopuyX
	TitYHSY684FOuo/FktkQ1l2hc2OS7cohPVJmoyQicjFmGCnSFFZ9xMsUQqMwtCTwFo8wACpbsHy
	0qcU4SjA4WdDmqwl8BnHvg4+a4iYxBFkilVq83aT/XhqOf4P8FXltSmeza/U9sjVxnw3xqAR0HK
	bUPZiscri4GXZT77M/B3IvVX+Sl+jGILOn5jMo0U8Rvp0EMeU687KRvukZFvwi0AyNrB04q/hs7
	WzBrGr/mZ5gTsp+xj
X-Received: by 2002:a05:7301:710d:b0:36c:9a3f:988b with SMTP id 5a478bee46e88-36c9a3f9915mr3497734eec.18.1793763646272;
        Tue, 03 Nov 2026 19:40:46 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:45 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:29 -0800
Subject: [PATCH v2 1/7] gpiolib: fix GPIO descriptor leak in
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
Message-Id: <20261103-b4-gpiolib-free-v2-1-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

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
index fbdeda2f2787..f33033dd9473 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5230,7 +5230,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
-	int count, bitmap_size;
+	int i, count, bitmap_size;
 	unsigned long dflags;
 	size_t descs_size;
 
@@ -5243,21 +5243,21 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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
2.56.0.385.gac671c819a-goog

