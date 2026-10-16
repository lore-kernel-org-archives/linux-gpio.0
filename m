Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0DD3B8BDA
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 10:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148155; cv=none; b=K+r2F94nY97hrAZ81d2datihHUI5MGuTj1Pe6QEAk7roxCK+Y+K30kP6h5C4Xl2buP4Jw+LJMba5nPw98+AawoRszVv6ZpE3QXqrXh8fs8k225UZ/DDXbyrP2IBrrqZuomFNKh54RnceQked7ci4/ts6c9Bb4JGZ3aqNs6T7rJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148155; c=relaxed/simple;
	bh=FWSRLNO9cLDgEi6X8otQID0ZFjodlP6sP+D8agqsO9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rO31Xdhum/XdesxzW6FfxI2EDWUPPoB7CW2ULRQCyKaGiRjlpoRKVQMbL0/NJj8psl5lji3gKq8IDf0ETJ/lFwf+s1Ki1Ln6Gi3zkuccyk+hQ3eCm2H5djmyCzbK7W8X29cZi6pXmxvcDHkyM0dbVjOlZdkth4B2j1Gq6syVp7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnJHEKUf; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnJHEKUf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e5fb79ce82so36310425ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 03:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792148149; x=1792752949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XYdvtinzHSsPD6Yut28fcPN5KBQq/zxQDLq78k29Xn4=;
        b=cnJHEKUf3NLASYNSPAhSw3R6oskK1/k+Mn9fvrFPqOHmGn1lRIb9si7JQtNXvbXQdQ
         ngA2G/KZg2w/5f3Gf1SiP/7bXIiAow9mUgoPiK21jLTdpuaBK3kiBXjHRd6QgTQgk7KC
         lXVSzo5TV6bj5dx4btyBAt4rkyLAt5TBhbTbBHR+r5Y28to8Tmo/cnUr8JzvsgfwoDMc
         DAMxN6PNf0AfmY+N8Epe6bI6kjUA9I1rRppIjOwwIWqq4zNQ2gTAhvta+RmfQOOk8tzm
         2HW0sTmnKTuBG8C9W6siTY8cvxUmtNmF+yAHvMlGQPBKYsZjT6hAFSEG5Vr7+rSN3xI3
         j0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792148149; x=1792752949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XYdvtinzHSsPD6Yut28fcPN5KBQq/zxQDLq78k29Xn4=;
        b=Jz8nYj5wt3XMOmF4iwkk59HIllEeyztCLjfHUDB9dbjNYhaB0VqmI6vpOR0JslQ00Y
         OKUByyMIYWvTsaEj7BvacQ2KJ5SS9x/11UrQVcaZmyXorcacE7/bfRuKHUvOWi+Ib1z1
         PMLijte48zzu7dXoKVSS+zl6DN8uMoWPJHZH6boCH3ZyUtI66jaN9UnXs+t/dlbB8Pql
         7kNXFn3ldhQerqotKqvO8mW+uTf27bAo6kSeY1ztLJo1dC3SkwYMjNe1bMnJgsLIs3ax
         79BXlvRXVdGlpu5z4UTGSaXxDFYJr1wbTz+lzBtForAMQUPMsTPEGRKsHvQBIZiVymX1
         5IMQ==
X-Gm-Message-State: AFq9FYLjQy+YxTDm4+2JO4kTIZxu1dYyH9kDdrSbmow1HCzs6U/yLMZd
	gU4x1+qmdmZ/aznFl65afl5lZg0fc0ULpW4N/S5qDkYTBTpHxv+vjDz8
X-Gm-Gg: AYBFou01CKtXO33HCP4acKOmG/3H8Q15MjlRIe+QNJc+6avQFzI+dPueeBAlQfWyisR
	wpvpwHahhmXubT315YA+N5IXeQOMpX69OnOaXUwsRpsVmitvbmCLMFoRRPN/na5H+mbrkZ8dHt1
	mGk6hz24zz8f2STldwSAKFvAlgYTTguTBYxeKqoBSZPa/YA3BtYEW8sPYX9A/nOdamT6wuD5pJM
	981KqZs3Ozw+AGrkHQRDlGlKKcYmWXj0QNZy2YKi462RHl9yYNY1iu32GcfgHebfNJOltU/e/wJ
	DaoJifQr33WrbMWeqVAnzYjtjxQphXa7V8fAvMBp0pdmxuxBCBFVqiNHa4ugczyUdrZTqnRj9YT
	K70piPAOjKZqnrT/YJPxdHoCh/z1cAz4O7ckMs5pL/Cmn/PkiITOXeVOBY1arhHEAEvkM8AtlSm
	LXf9uvE/rvpu3ZvjcearKZyNLNE+a8naXvRrXTslK7A12Wj8UxhYYH8YCQSLNr+KkJBYflF566X
	OQowlCjixC/ofpnqC16VUir6g94kus=
X-Received: by 2002:a17:90b:390c:b0:3ac:9669:846e with SMTP id 98e67ed59e1d1-3ac9669876dmr5201494a91.27.1792148149185;
        Fri, 16 Oct 2026 03:55:49 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc980a548sm1554333a91.0.2026.10.16.03.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:55:48 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aambrozewicz@nvidia.com,
	Kent Gibson <warthog618@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path
Date: Fri, 16 Oct 2026 18:54:42 +0800
Message-ID: <20261016105442.109836-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drive-by review by Sashiko reports that, where the line has not been
configured as an output, gpiod_set_array_value_complex() can return
without freeing potentially alloced bitmaps, thus leaking memory.

Cleanup the bitmaps before returning.

Fixes: 92ac7de3175e ("gpiolib: don't allow setting values on input lines")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-gpio/sashiko-outbox-168233@kernel.org/
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---

Based on for-current as it requires the previous patch.

Moved the ret init to the top just to make sure it is always initialised.

Not completely comfortable with the goto jumping out of the loop, so
would be quite happy to rework that if it doesn't work for you.

Cheers,
Kent.

 drivers/gpio/gpiolib.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279..334a917e3202 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3842,7 +3842,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				  unsigned long *value_bitmap)
 {
 	struct gpio_chip *gc;
-	int i = 0, ret;
+	int i = 0, ret = 0;
 
 	/*
 	 * Validate array_info against desc_array and its size.
@@ -3920,8 +3920,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 			int hwgpio = gpiod_hwgpio(desc);
 			int value = test_bit(i, value_bitmap);
 
-			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
-				return -EPERM;
+			if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags))) {
+				ret = -EPERM;
+				goto cleanup_bitmap;
+			}
 
 			/*
 			 * Pins applicable for fast input but not for
@@ -3954,10 +3956,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		ret = 0;
 		if (count != 0)
 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
 
+cleanup_bitmap:
 		if (mask != fastpath_mask)
 			bitmap_free(mask);
 		if (bits != fastpath_bits)

base-commit: 205cccd06e545694754e1bf8d626ea96e742cd8a
-- 
2.56.0

