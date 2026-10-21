Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609340;
	b=eBOpiAnkfNIde3kOUirjIIRCiHvGJzg7LT+lyhHE7rSZDE/AUjsnpPJkvcVZk3+hrF3/
	 wSMxrBzTQWWuNYiJe8Q4ybpsHxnhr0wDnsnHqaNNaa4KnsHzn86CeG3e5mfVVxMEVKh9n
	 MuTBx4F1p5OhYY70z7snqwifSEeOzaXHg+8XJq474MbdMIzIByp9LLg2NPEoy/R17gyvQ
	 mr3G4yt+xLYXmcXOsIN1WqTzZQJju0eOjUqW8QbeZ6gvgI1YULd7aVYafLoso8CeXfwv4
	 HNA5dKqVuSmJpbpq86vnvXI7FsI5x1aHUjdM3WlJfzoXl3sFK89WQXlh8R0kPdLS6Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
	b=mWZ+saCi9U3MMAdZJXOcGpSMPamCQjvVoJkF8LuZM/UOmFxER520w8vnR+PCZE02wTlt
	 LVHtUhsL5aPmUOjwDV9vHOohzyfNoP024w8+K/PqAAdBkvjxUFl6aJ/jnLTkzhSEdzeuP
	 me3JpZB++8kcRYtPRGVPjyfBJpnm4F3IftWsyEByKg0SjsDgkXr7X+IzlZBxqjt4wEn2+
	 t8jCXuasaSuaZuY5QjWQMshqhC1Z8Hb0mfAvx9bQo1FZXuVVMe+3hmuw0s9ckB5vuHmfR
	 ya8LYX18hSadP9Iy7pn3RZV6CoQw2ujswMTG6MxNtzB8LiytpvNKAovCodAQ7XzBo6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=neUQSqME;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B888606A327
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B888606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=neUQSqME
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36661f953e4so2037560eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609340; x=1793214140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
        b=neUQSqMEncysnP1DEjJKWKDDqp8UaR3Ojoo072jz8wzpDvU1NMJDoEokIWctqnLu68
         fFuwfaKWg09Z4MrxtqQhxNCgJpqMSoamVnDHXQr9mbdd2is9k7lDH3dlx2M7Ebfl0YsY
         E7WKIiBCFG1NFlJA7qnekG+YRZ/ylsNY6NcLxXFfSSAN6WI3RimB7CFPBDLDutcuRNME
         cb044b9pbFkAaEU7qyePmCzSOkCused/dSXY86edLoV+lu7bSkLQdPF6W6K0aYm6w2bY
         ux19wje0MxZm73ih+rQA/MN+RHxxj4snNNfkrY75zEBFfPl0lC5L+yyQwP+0L0jKeT66
         CBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609340; x=1793214140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vt73uT3Bmf6mr9x/h/RM+J+bhPhlELsIoqUJLcGw4sk=;
        b=rJ3Wyv+aALiap0G7nmzOjZgC7aA7e69wNs9JcwURat+KmvqbKR/vHNaAuEAL9i/bBV
         yUAHySMOfJFPQnYnEiLKOCvTJRBB0v781zFdnYDWMB9Ri7a1TC/3gQ9SyhNMIRjfg+Db
         b7EWk8nAPbHQtZaP8Fc1cW3VQH8DIx4h/gfK2F6/U3QGIxajrUrlx1xdvPe8NiUAceXO
         H6zBjlF2WioH6+712mAVjzGM9T0kvITv8MR3auZnKvWH2AqkF+nzhcfboSXEVRackt/H
         MLfQecYbGZeVmj7OHbBPG70OaeyYpuf9INfvcjMobXZ8TUwSwv/i37dduYuvPwDjVjWo
         s5+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzTl5ufUvjA9dQIMOIRPUl2K4JmpwETuEiDdjRWSYM/CiuzbGpXQ0wgwTupDkY1cJHEJ15wF0P/aeF3@vger.kernel.org
X-Gm-Message-State: AFq9FYKlPN1FxRju4NdJCcxFxiMEdj8o5/7uD0ba8JEafYcuX1Ofg/QP
	F+n8UHgLg3FQN461o3LyViuWrCXUmU07hfjS7K7KvPO5xH5PaRgBuxjo
X-Gm-Gg: AYBFou00lnn92rwzQzoHtoRsuLArttnmPtx5YW43WrofrXRuUgCQWKxGhQQArTSISpA
	hYCVeLju7eM1XZ0yD7dZOZgODzFoTF5ZzUrSRaEqOWD4ABH7LIVahe8zpkVFrfr6NkNJ2xKGVpT
	AOL+XQMKwcvWqk4o4j58lTYjmyWMUqWaK2KNld0ftl7edYiRrbYdZD4bpQogrRTJOdP5vfnvrmV
	gtOeMYeRNCkXV0/Le2INT6nwcaHkTetn4RMojzem9OOgKSS3/aQ0AyyHCdtHiVQ7nthcddU/WAh
	/hft8WkEmRNAr32VFqCZF6xmoCmzDUuxRY7yT0tQsyTBwncsCwnpyQ8awJHiYJo7kWP0nDBWjmY
	nS/G8QJQeHeP7Rdob3W+dUvxLnkGG2vomgoulgiBjWBA+TmqS5Qv6Hjl0JY5fqs3a094k5B08GX
	6UNbtezzKKq5Cc7NasGoex1kwh0SvZmDoMivp+njdcTqWnQ6duka3q4sASY2rA4aIlfMNSQ/2ZR
	th97J8GnegzVI4F4Ac1YfpVCHH4nFMzD6LWDAZ/bC+gN8wiLT+8+SLAEaEN5GDlJbOrjZQj/QoM
	laXEbBj5kz9X+iYE0TN2oDA84g9t0gip+O6XWxyT0//7RhTxmhGqOCcYBfRuZVmUPw==
X-Received: by 2002:a05:693c:8641:10b0:351:68e8:4646 with SMTP id 5a478bee46e88-3674f11647cmr4384980eec.37.1792609339106;
        Wed, 21 Oct 2026 12:02:19 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] gpiolib: fix fast-path cancellation in gpiod_get_array()
Date: Wed, 21 Oct 2026 12:02:07 -0700
Message-ID: <20261021190212.2237804-2-dmitry.torokhov@gmail.com>
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

In gpiod_get_array(), when a pin on the same chip is not in hardware
order and the preceding pins form a contiguous block, the fast path is
cancelled by setting array_info to NULL. However, descs->info was
already populated with the array_info pointer during the first
iteration, leaving descs->info pointing to the aborted array_info.
Consequently, subsequent array operations still use the fast path with
remaining bits set in the masks and wrong hardware pin numbers.

Clear descs->info alongside array_info when cancelling the fast path so
callers do not erroneously use the aborted array_info.

Fixes: c4c958aa64f3 ("gpiolib: Fix array members of same chip processed separately")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 21c9cea71c68..144a63e6692c 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5270,6 +5270,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			 * hardware number is different from its array index.
 			 */
 			if (bitmap_full(array_info->get_mask, i)) {
+				descs->info = NULL;
 				array_info = NULL;
 			} else {
 				__clear_bit(i, array_info->get_mask);
-- 
2.56.0.307.g5fe7bd680c-goog

