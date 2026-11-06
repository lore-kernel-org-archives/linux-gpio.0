Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946634;
	b=K5DosUYKqsd08kjzhRyyaMAdkNMSTyQbQQfKz2zN1NExBMSs/BKTrHNkCK5ORxa/dU5P
	 NKUUHkMWUZqKHZC9tyGcpQAqOsep+RjMHGOzQTnnfRW9wsGff3EcZqWTO8Yc7uAQvDtGa
	 EdFry85LV2dWFPy5pUI6QoT+f59is3HCGGqIZ/E+Xf0GVCGB7SyIsFcoehYB47yhoOEg+
	 vU5X3NKMPfOr717FDPjx8owsNlSeQOwSAX9aDXsqGKUUa+8GsfkdqJ+ZDlU9gn1FFLlqD
	 xZSnO+KvDONA2DNXLgEUjo4G3M3R1LAckEitXXQ2fJUKgfBDIov3Iperrf330HFLusQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
	b=kVlb0GpefqBWSi3lkJVgLoYxFRpH8QTUROPg5rwMUFxv6iv0J8oFvGEb9id3rFu8byQh
	 FuDrGGVhYQAsiExxNy6NufAyswZlaP4egoOowYWEOv3dWyI42xpg/5QZUiFDeFGTal403
	 QoNePe9D6jxEYMojBTnx/l7TgfGTUjqU3LjTnIsCtMWlR16e1UATHCQy17c/6E5CjQcFP
	 kN+1aUemh0soDqcFEz91ImP1/NnD8NkwwDJOnGiL2/DM6Yp2PXP3qIQlJ9Is3Gi+kCeTk
	 it/IUlVduccSvOc5WA8a1Q4zyPoO72AdDosuemSaddhaKygg8u6AzMc9G2j6ojhvjGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpPglMrF;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE62606D807
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE62606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lpPglMrF
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so619123c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946633; x=1794551433; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
        b=lpPglMrFwQrh/cxploueyvasslTQaPe5VM7tB9qKSi/4NB1k5DNhcgZ/vA/Ovd2kzz
         0jnSLlUY1HqEF1FnWMyhFCkubYnDjbencVUs3OtFcdKqbGY/fNMdCiqDaj1PdTEll1LX
         zccY7cSBvfmoft5viGaFwDB3SL/yoTTz2rbMndCR6e2AIJFE/57+bdqcD8fosom0lnqT
         v58/84k83txQEMGoaa5icOHJuk7dxxDsP9D9i0G7alx74tJgFnBcz3HuTrTN9q3JiwlZ
         WHPncjIt40U87EzAbSV8MgHQKTe14fZMKy6vd5WJqr/nVj8C8u959gsACSQFDFb6BN9y
         I9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946633; x=1794551433;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6negu4g2u2IxC+5ZOLgXTbMy2ctpc/qXDhxbFXJ/Xtg=;
        b=tFvgtTqjk+9XVAOKN6j9GpXpNZk36jIRdjrDmoBEJNXmh+ABn5+3PJVyQeUyYiOORx
         bDHMr5GdQ7k9fOlBUe11q9mqFT7htJLCpsWG2lXKve5KYTK5LfvBVIh2L/rOaEVCPcRX
         Re/gQBkIJA1yS+6llGpxkuUm/v2eeLyBYG4giGqYgsSIP/AULDBcqnt+TVSvJwfyvonw
         ccp3KPfLCsLn1omkKBwyRs/uFdFp8GkU97Nqn8XmMNPsTGo8uZTc4FA5rk6Vr0j3RCRV
         Xi6fIacBrSL3fmp+6JkxPcXyohdLiIQIoZzTuG0hBwpmJ+45KhMVGOdsQU7mULVrWFRO
         6G+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzowRTfvfwx5aTO49Nu4nkKsVON101vj5bwwbpiYHC4E/9Eu73u5D1Ns57hhEGYbLhW9y4OwiIr1F0A@vger.kernel.org
X-Gm-Message-State: APuU4Z9FYwoicvtYk4iiXU9q0/InwN7ykbq78cQEUqHhLEUbxN2DSnsD
	kKc3Yi4Qa8iy88Zt4qbo166cA2gdl/pFfhMTv5YDK0k+YLrcOzeaGvrD
X-Gm-Gg: AYBFou1RLezB3jMFWexFqLZuMB2xDh2sxy/5b3n5O6gHGg0d87G0wrt/X2mg0QXY1qz
	gF1FPVITZcaQPphJyHyp/3CLK28DogvAzsD7k4Cif9OY/7SMkxpksem8eq8LvwiGSi8Mq2IRZHQ
	0p05FunNRMwyTAOcKG9KW/ImfOxAq2IBA+2ojFikVt4ZVii+QY7JH/5ygKHElHF8F+xteqi3U15
	wuWd7reefFpIPJyreY4WGfbvJ2NNnYQTp1I5dEX2BN1ht7Jc/ncjsD03PA/EO7e0kyAwBG3nOP4
	GV2X7pb8asBZvCbWTxLHxGpFbUZxlQpJz6FiZGi0vsR2yPogG+Rts1Kga+gYgDpC5nZMZZzkRKG
	c9XZfzuyzDi3vOpnYASgU2r0h+u7JOLN8oUiiSRCVjFXDTd3TUsMlLNGQ5bJIorF7LNNISTCO7b
	z8ylWecP1IwIUzu+/P6a/fVBUIRtND1pMdPipdS8Cth3TLG51gUTv+hpTOwLGsv/6atMVppksrk
	g6qtmO/yb4d0cs3CHY2x5CbjhlHjVFRnFvWhwILMK75XKWfWpfMbgBpRx2O9jvC5GKvX2xunLZk
	hqzMzpKxQ7nXkzHTS7XvrYR/bhRqJqoMvBBtRHmdHwO04oL1bPPrGjLElg0rcCBZYJ6sxNSXUwa
	CDwHF6KzrMG5Cht4zQOPkiBzA/mXKVrfHQaDCAg==
X-Received: by 2002:a05:7022:4585:b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1b25d392837mr2519116c88.37.1793946633211;
        Thu, 05 Nov 2026 22:30:33 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:32 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:22 -0800
Subject: [PATCH v3 8/8] gpiolib: use %*pb format specifier when printing
 array masks
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
Message-Id: <20261105-b4-gpiolib-free-v3-8-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

In gpiod_get_array(), the dev_dbg() statement prints get_mask, set_mask,
and invert_mask using %lx after dereferencing them as raw unsigned long
pointers. This truncates masks wider than BITS_PER_LONG to their first
word and relies on the raw unsigned long pointer representation of
bitmaps.

Switch to the %*pb format specifier, passing the mask size and pointer
for each mask.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 83edb89a364a..079b5a715eaa 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5362,10 +5362,11 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 	}
 	if (descs->info)
 		dev_dbg(dev,
-			"GPIO array info: chip=%s, size=%d, get_mask=%lx, set_mask=%lx, invert_mask=%lx\n",
+			"GPIO array info: chip=%s, size=%d, get_mask=%*pb, set_mask=%*pb, invert_mask=%*pb\n",
 			descs->info->gdev->label, descs->info->size,
-			*descs->info->get_mask, *descs->info->set_mask,
-			*descs->info->invert_mask);
+			descs->info->size, descs->info->get_mask,
+			descs->info->size, descs->info->set_mask,
+			descs->info->size, descs->info->invert_mask);
 	return_ptr(descs);
 }
 EXPORT_SYMBOL_GPL(gpiod_get_array);

-- 
2.56.0.506.g506a7eabc5-goog

