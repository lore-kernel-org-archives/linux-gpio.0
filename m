Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609344;
	b=d4JdVj+XQVtIMotHjnut6t56bXjzlnhr2TFZtni3MUP1e+1RN7uqR8DwaaigXXZwT2qW
	 NR7YZHF+flPb/tTJn85A5IVQY9nnhSCDuQOTOc5C0GxVAK8Ob1s2BnaXUQ7hq85EHUpl/
	 LmdR4jnxMsg+wC5ikaK0+DujTyZsnIuS5ZJ7FTRZh2a0xOpWzQJ9HxtqdxAthJeZ7IS/G
	 MGJImqMgmfAcuQadMVZdY226DbZ6uTkEoVWTmyFJrvs2HrM7ajbk1Ze133U5r2vdJBK2M
	 PgE0SKbv94rY0pQthrwVjFhE0yUvWuNQ8WhexFYxZ/T3ex9Q+SwymzS96SYp7yfWlyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
	b=es77AVaHimdsTlP3O2wCHoxL37cJcYDAz5z9BShYzHvyQ6r/t9rKqdvIkRBG7eVOGAKr
	 I2EibOQAhMggnUXS7X+mt6HqmSw94pV2+2T+kDvb1JDuS6Q4MeRbAecJGuZUNiXDkmdEa
	 SupBfDOAgx4lVBnMNDG01YGXfcyC7RIJBZUpbqL7i7SDWGSdxHRSExcnJJ4HGmk4HpccE
	 pO/veye9cV2NkduhW12AnjZeKUOQmSfvv8R5tzW6BHuY2R4glgPC5OHqzPk2M0EB/9qBk
	 jgsUIHFRyfwD+I/3sggvLICubmCGiqCNOrfKQSOx+GadWvNgXPMfKl052TKOFOYspHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zu74huN8;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83A7606A331
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B83A7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Zu74huN8
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso982674eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609343; x=1793214143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
        b=Zu74huN8bqxKTdK9qjC7qTPI6UWRWOaL/1U6Pj08XnIPoyPuUHp9NWCCGPBWgmp/jp
         JWLNodk19/YQpQKXsS9NFQ6IhesYH+O5rRXmPPQTFm0fYz+LlV0fF7SsFGe9gZOv0B4G
         sNSWYySUFCOQwiylgiH59NOOftWsROqBcdlnKPrRxE1b5OR08/LNTplXemHYqNmczu0J
         ULlqRNlvI/63y7GvIpb3OOpnPQxLWDl/1Sbu+KYnSyJjRAJcJQr3sZ/h/uS4+vThcAgn
         x6i8CT2+HdXFvHuH5Udgwa+8+eslm0xu7KX4SIXb0gmC30Pn1jaTTUNngYbpp8hdRQXG
         snog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609343; x=1793214143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqC+X0njTqocUmZn8EaZ4aReZGBfMVey0Ex3TVDmvMw=;
        b=s3XdqN02Wl5yAaslGIK1XhsiYoWE09heJj8EHzFQtlMNmz00e1PWqYnlKhZ3DuSigy
         oH+2JkEn0VsJhowdpZP8yCBSpymhyBHLdqhRCr7+L8Y+sz3ltDZTxkGE7wXbFybVPoQg
         AsKEeXW9BzXJcWeWzqWnMFWUuhiyeYiBe0+oukLvTf/CFvGJn2rKYY0BKY2HWBMX6qFL
         YXbiVk5kZC6iE33fJvzxMWcpKA7OHub7icN2lwad2qO6d0giIepjzpqw2K8hWRXPBqG3
         C9n/DW8o0+UM0llT7CoixzMwwJYrhTxHmW/uhj0oVlRSgfGo48hJX0QgDJNxEMx+GUri
         rzSA==
X-Forwarded-Encrypted: i=1; AKwUvByo8LZpWy1dgiAuE/geUbLv05vY43K4UlwcZX45vIUyz5KBskNwtBHMRHVnwANeW+gzs4RhgTUx9vpC@vger.kernel.org
X-Gm-Message-State: AFq9FYJSxGZik1xYhbVrCgNgya8dH6AhxD7a03rPCRRkTlPzOKwQl3Tl
	XJMB4SWNRDodpKWvddUm9SKokeYzBG6dcIC7NMe3/mYdQLn34SgPHQ6P
X-Gm-Gg: AYBFou2ZE8gXeOctZB0ykWFFKAo0sXYaiqjSo7XDk+5/nITgSMIVd6NZmIpdu2TF3fT
	TnOaoDNuOQi5RZcTKzdwptk3p8SpzgxNEZXaDPgAuGAXQz+iTslc5PrB4TkT7w55aRdHIoEXd/d
	ecoXUEY/TzuV5dLa3Gk7ZLsiA5vJ4FMDyoEcbF7WZ3xUhmOX7CYB59k0zuPZ03Mt/8Esjh6PAZS
	O9tUSQjYrm/B/Q/OqldM7ZjjYz3CBENo9oSw86bWd6AMabiMt/Gxy0ugJfAclOg70GKcr1ZET27
	2iv5anuCzz8WIFFEVvkiEbVuvkd/mgkW8mBtn1rrhwuQTzPgxTzOCwcQdbD0vv/Ss90cHd6aq71
	8oH7MZdZ+5uwkCl5tkw2k5j0IzUtEMZlZmJ9Zb01f1RBCRgNjlR/vOaj598xqqYX7vAdRA2grFf
	xTYmQ/Z5RPNMRz5BudJviDGValOug5d+HxGRNZm+QPz4oVvcx+8x585j0DIffnrJ2qe7phoWrqd
	KrjDVnWvovIUzn/UgWNOkrDFF+NADxndMBO0w9zxZmMnJHug6oltaL2yEZ02+6naYflmUbCv2Wy
	rG36DnhYd37QbNtM4ioHQUESpEItLBLtFdiAxYR/wVli
X-Received: by 2002:a05:693c:88cb:20b0:368:74ca:1c5 with SMTP id 5a478bee46e88-36874ca066dmr935998eec.37.1792609342466;
        Wed, 21 Oct 2026 12:02:22 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:21 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:09 -0700
Message-ID: <20261021190212.2237804-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
References: <20261021190212.2237804-1-dmitry.torokhov@gmail.com>
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

Switch to using __free(gpiod_put_array) scope-based cleanup facility
in gpiod_get_array(), simplifying error unwinding and eliminating manual
gpiod_put_array() calls.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 144a63e6692c..79f3be30ace1 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5190,28 +5190,24 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
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
 
@@ -5222,6 +5218,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 		 */
 		if (i == 0 && gpiod_hwgpio(desc) == 0) {
 			struct gpio_descs *array;
+			size_t descs_size = struct_size(descs, desc, count);
 
 			bitmap_size = BITS_TO_LONGS(gdev->ngpio > count ?
 						    gdev->ngpio : count);
@@ -5229,10 +5226,8 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array = krealloc(descs, descs_size +
 					 struct_size(array_info, invert_mask, 3 * bitmap_size),
 					 GFP_KERNEL | __GFP_ZERO);
-			if (!array) {
-				gpiod_put_array(descs);
+			if (!array)
 				return ERR_PTR(-ENOMEM);
-			}
 
 			descs = array;
 
@@ -5293,7 +5288,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			array_info->gdev->label, array_info->size,
 			*array_info->get_mask, *array_info->set_mask,
 			*array_info->invert_mask);
-	return descs;
+	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);
 
-- 
2.56.0.307.g5fe7bd680c-goog

