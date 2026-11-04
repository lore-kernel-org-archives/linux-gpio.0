Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763653;
	b=FNtAMQhJvZuxKBWHaCCB1EVfwf8uQQ11W3+mnlyHzFDbt18gcXai0IeaK1mYj4gKLj/F
	 0x2oUKhMVvTzu1xNOJC3hG5k4NJRYPRhOWZvCu0RurAuHoABtRhTQa8jVTuKL3NfQDeMt
	 Koyd06E+Ij38RIH8PlOyqOb3FOYrnrEDmRs95KiY9c7+jvd+GxW4Hl9FEFS3XfGu2KC8P
	 DQEb2en3MbRvh+AqOtuOPGn7QRx7fCHb+GWujtRSIV8C6ixGCeTDswAXCP+hGLpjvmfkk
	 bVg/73eWij6jX0zoOe119nMI31e1gpBsX1IMrAEDLEBMkko532sPShAWngLq++FXhqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
	b=y0luKJpwRGlJ1SKyglAQKOJhv9i3aGqNMvxQAP/UJ2ZwNxYKZrNEgjWJ/TRt3cu12ohb
	 8v0JkrLRlYFhAdc4fyKBsCP5X6wXbYJLKg/jZprRLQDCHgx57/HYyKb3p8iYsSIHlS4t+
	 gEgbI9SDw3S+1KbhXfXXzHeJyDGMD7PU2e2TGl6YEI1aGxqszMJ8hC8XVLwAV/eXFisio
	 DfcJwoYIeSBYK5vISFhPQ6y/y6P4Jwyb0lMtC8x9cFne6vP+nd4/RnlQS4J4hqQfquiVG
	 l9ZR+v5s8Lh9KtXhVrMfVBTAxH5iHlcTpvqnmJzEscjsjp2SdnH9PapQIsspHnrzSKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRTG2D+e;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0B606D808
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D0B606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRTG2D+e
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso368118eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763652; x=1794368452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
        b=zRTG2D+e6HjDCf0hdhUKwZKB4rMkJ04x7DJffeBFhBwxNvXO5UP/rfSVCLCQLJ1Q1+
         ErKN9Y7cr3ZDOUYayP3m61YMspLT3giXM1/3WTzB9GugZgFSpGjaODODIbJGYFhTNkfK
         m3s6f7+SLES4xw1yAIOvGqhbDBf2oQr/luqng9cCYxqBZsQquEcw52pHAMPDdiv3/1MM
         afe3Sx08dVOLBA5cJRrSc7g0m3WP88HoCL2Z6Lyf5WoE8FZOIIakbGCW0BefaXpAlfvr
         nFCYXzh4BheaJRo8HgtKFfK0mY8JM53WYQmBLfylLxc3ont3KYFzh6h2TnfakNcVScWD
         RRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763652; x=1794368452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qke+FbrllhHZRMLGso7ptbO8mk09bQQl8SyRTlFyWsc=;
        b=Q1TMgZL38u4xVlhUp0l7khM4WHaX6zK8dPeRvPafHFCBh5mTuDjBE8cS5CKVWa+tap
         SX+UV/QrvpEpPY5411oIoYMfAHE8gQ1+dxwT1im2LFKixvHi5klYZ5S7xlHFCsB6GWTi
         lZ+XlnTpALFNmtFBefrXi1n26mMC8+xf7yW3oJxPFvwJfm4ytHK0XwK72DpQ3y4Bt6bo
         4JQ1RwlsKdfLD0kC8RgVJowCDKVhReREm9Gem1EJjfrUhDesXkqpk/PQove/hQQeXq4Q
         yNlv7Lx0Km9hou14VblkUDDmn6dqYSUZshLgsbycJudE5Uevg1YiFHtuc23q/h+dTHKk
         wbAA==
X-Forwarded-Encrypted: i=1; AKwUvBz3KaYsRVGehpxtRz26sakYYg8UyO2tPF6TF9XTs6InpLm30hkLqfDqk2S7k3j1l4wEkkAb3O55Av6a@vger.kernel.org
X-Gm-Message-State: APuU4Z+jXxMDIv3mE/7nDRTcnQduNMWMJaLQ+rilMtkcRu340d0E0My7
	98nmi3coT7+9JOIEEpQfu3pqeeSnJ/DA0eZI5hy9w/a8r++fI0NINHhi
X-Gm-Gg: AYBFou2QD8fwJPWosqtHHv6K++gOT5ZUCHwxsZkmeT7Ikh9NMHgGXsDdjing6s71imm
	GmrlUrC7wcJwTvv6YD1BFfYYqzSH/5AuDevtt2uffTSWDvdbJJMLN1Hhu2jz6G4LGDPijBa8XW/
	m6UHNjGDTfuMBuPgfqKUyi7imqhPI4N1jvO5n5Z+yFCmV7kFE6bunne7B3Ss3q+hN7MgG6l3asb
	kmDhY/JV7o/t4glxF+FvS1cwepJ/Tfs7UX0UUFxNb32ETmGRkCAwug9YNGsb/TOE8Bm7y4ufQYK
	sllts3wx5czuOWWUowhCGhXmcIU8NW1y7lnmGX2KsCAL9J0D2ebp6D40pecw/AZXNp2+81fP8zC
	BvweecMUAez1LRom4gNcUjVKjEY5rpbDrontZn2AqZGevrZP6lrBNTVWM5fdCgJ9ZxhQnIjws9d
	2Ksgp+tevsA5kgKLA5qRppB4ATC11XdNYouHh9RcgJnmStWycHFrUZNVVZ67t9y0PTCZ0nXNbtp
	W4L0N+EXfLXh6AYcoRQ7taPQ59ZPNpKhM9Nkvvf0GhuaMqwyPCjRZev43/bhSv8N8/DO3dWsRGc
	0L6yHxkOW5KOqSLbglXCcvrbmMnxz5K2i+kdeLYS8ZQ1lqxXWqhCqOWv7sIv/0hEziibE8Sm70X
	ZvXV8+VcRFpeMzYqQfrAin9KX6nY2TESLDBsSxIo=
X-Received: by 2002:a05:7300:ff42:b0:369:f231:4707 with SMTP id 5a478bee46e88-36a42225abdmr22968121eec.5.1793763652145;
        Tue, 03 Nov 2026 19:40:52 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:51 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:33 -0800
Subject: [PATCH v2 5/7] gpiolib: use __free(gpiod_put_array) in
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
Message-Id: <20261103-b4-gpiolib-free-v2-5-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9a850f5c1917..e71f8865559f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5227,28 +5227,24 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 						enum gpiod_flags flags)
 {
 	struct gpio_desc *desc;
-	struct gpio_descs *descs;
 	struct gpio_device *gdev;
 	struct gpio_array *array_info = NULL;
 	int i, count, bitmap_size;
 	unsigned long dflags;
-	size_t descs_size;
 
 	count = gpiod_count(dev, con_id);
 	if (count < 0)
 		return ERR_PTR(count);
 
-	descs_size = struct_size(descs, desc, count);
-	descs = kzalloc(descs_size, GFP_KERNEL);
+	struct gpio_descs *descs __free(gpiod_put_array) =
+		kzalloc_flex(*descs, desc, count);
 	if (!descs)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < count; i++) {
 		desc = gpiod_get_index(dev, con_id, i, flags);
-		if (IS_ERR(desc)) {
-			gpiod_put_array(descs);
+		if (IS_ERR(desc))
 			return ERR_CAST(desc);
-		}
 
 		descs->desc[descs->ndescs++] = desc;
 
@@ -5259,6 +5255,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
+			size_t descs_size = struct_size(descs, desc, count);
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
 						    gdev->ngpio : count);
@@ -5266,10 +5263,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5330,7 +5325,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 

-- 
2.56.0.385.gac671c819a-goog

