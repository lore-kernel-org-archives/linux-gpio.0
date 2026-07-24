Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CF336B905
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870311; cv=none; b=E8GvHdWZ6dyPYwJC2xhqTjXhIx9NO9dGdQ6rpPiMFsGeS5VzjhfE3bEa/lGmAyxwewklvqG4HBedOY3nFbz+VKWkxhB2yG6Y553ngHUg/XRwBke7MAb7OiHTodEMJnvHfOAmiqAvCg6uHvhHlu32fdsbEgFFdYats/H7130ziLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870311; c=relaxed/simple;
	bh=WHue5wGOkCDwhBMi07H7XlqVHFBmhWW4MmE/EUVGV0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+KIuMLBfmHKVRHnwB5iNQLrx3TbwVKsxx2/nRlQTmb5eSNKJKNahtyZlTNF/LRR9qW+JR+aDs6sbmLdGqHWRv+siRJWNOauqkgdBDkdFB3+6rIBntecVL26mayYsOa/UAvHNC0drOWJC0dbFW9G7Rsr+j4u38/BtmdxzXgrQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7rT2Q3X; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7rT2Q3X"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cedda2ce6fso478925ad.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 22:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784870310; x=1785475110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hnz6QUIIWKwdYBgmR95nkq+vZcc3tNj5C5yNYHh5TBc=;
        b=s7rT2Q3X6V/TzD76lnuQlm71bvxf8UTKx3W9QFgB8CgvOOx9Z/mIim4ghJHi1X6z3Y
         h1PJ8Onty2tCblO6Ix/C4zNYuox/1NSIW6aGfi8C1P/bEaFyuxv6uCLKUNW/qJdzv2/e
         Y/iXw22Np5gRXPslXwfU1t0ctXvO8+YD1J1GuIW3NdrvKghVgAG1aSuwCDu8aVqMmElk
         tTuwy+RBaAdM7geCYI0OWtaY1FL9z6+tGaMKVbTMsCauObwbkueKM4HJGwejlPGOLgI8
         +PaljcHtZ13ThiYWfYbtKfgwMfOs1lDJMTu0lWrDN1EZeP+oqrKGe0ZxB6GoBxPD6Mhg
         UTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870310; x=1785475110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hnz6QUIIWKwdYBgmR95nkq+vZcc3tNj5C5yNYHh5TBc=;
        b=kNOlvgzFaxywRAycXw9b9vauMthoFk987HFWDzzBNmPwdlG9JSGXLDr8cL9fssYnZa
         wbHgPqVTKLwMOHDhkCDwODFHkXn7eSTSHG+3Z9aTYANcEbSW7yNnPY4fseEt04XgJSUz
         jVKV6tIfE0+vzigGknI/L2BS039VePKb7ZaK1qUf1LwBZua5RAN5uRjVwTuhRrTDG/4A
         ytQECBj5XN79k51dPvL5kOFRF9MXE0Y6EFb9xXSOCOCcctv6S3VSNjb5FOViBI/X7gre
         JAzNp8B2kEiJ7ZdcqFakGg1sb5WFTrhp98K77x6DcaMrcuzuh3tJjCqaYfbACrK0S3cz
         ZYMQ==
X-Gm-Message-State: AOJu0YxLxeJKqGWkpC6BrHp3673J+tozdiYA0CA6MbUIX+ApBdQwK6zW
	djn524AXxhU1su8XymZPi6zK9CkALlhHc1OEABZ2Zm/yR/YG4vTPeKig
X-Gm-Gg: AR+sD13AWFIS1IHdfnh+xSuyxmTUz60GHFew8rkP6RDFQ6nGqmqBa320FCi7YmPmaFn
	OvYmxVTpa1ZWna3WxUr57HUsDaLZcHd6fjSCukz5meNJggq6GR4F0d5Q+5Nxt2KWZHTcx1zoARB
	L7U/wstCVycJ127t5GQAIpRKcc0jwYthsCd/f3KkP5xXt8Y/Gwh6Vy5yg1HOUZvbrrYtUhOlL+t
	K/fbho0tZvjjgeWvrxrzntLb+oAXZosGXO3U9j2jegreZPtarUrjdHpRTHWZaC43NU7Umu+w4Od
	6CwfL1vr470oX3jyq+hkhTXxCsL6jC7qBxAUBMuyM0rUvntT7ANCj6FVTTUygEBod85/se8LRQc
	SRre6v4e9yKh4CajhLJ5lk9yZ/iNWaCt9DU9bjfk0bnZGmyapiwpIMCDOfUYymCMSLiH9oiR4O7
	q0yRiR8U+xI1KQclmAi0yRjKgvf529RRmO9gZNUxUgowxBvYkeox8MtV6DR4qz+dgg
X-Received: by 2002:a05:6a21:e8b:b0:3bf:6011:53b with SMTP id adf61e73a8af0-3c44b18c993mr6727417637.38.1784870309556;
        Thu, 23 Jul 2026 22:18:29 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm19974430c88.10.2026.07.23.22.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 22:18:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
Date: Thu, 23 Jul 2026 22:18:20 -0700
Message-ID: <20260724051822.3545532-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
References: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy property name specifying external mute GPIO of TWL4030 audio
coded is "ti,hs_extmute_gpio". To allow converting the driver to gpiod
API that requires names ending with "-gpios" suffix, add a quirk to
gpiolib.

Note that we a custom conversion routine is used as compatible check is
needed on the parent node, and name of the node ("codec") is also
validated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: fixed ti,twl4030-audio compatible (Bartosz)

 drivers/gpio/gpiolib-of.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f4ea7ca27296..128402431607 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -676,6 +676,35 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+static struct gpio_desc *of_find_twl4030_gpio(struct device_node *np,
+					      const char *con_id,
+					      unsigned int idx,
+					      enum of_gpio_flags *of_flags)
+{
+	const char *legacy_id = "ti,hs_extmute_gpio";
+	struct gpio_desc *desc;
+
+	if (!con_id || strcmp(con_id, "ti,hs_extmute"))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_node_name_eq(np, "codec"))
+		return ERR_PTR(-ENOENT);
+
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+	if (!parent)
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(parent, "ti,twl4030-audio"))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+	return desc;
+}
+#endif
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
@@ -688,6 +717,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #endif
 #if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+	of_find_twl4030_gpio,
 #endif
 	NULL
 };
-- 
2.55.0.229.g6434b31f56-goog

