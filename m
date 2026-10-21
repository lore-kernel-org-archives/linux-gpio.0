Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792609356;
	b=lh52a3veHnzbbT3Io5zJAvhh+fxle6Px2gJo9Ty1DaPMuMzC1YqxVVoTfWi9/9odv3ib
	 9fYBpDXpAyr1XKlE5xKhk3wb6tBB/luKtHJ6qIexSUGhmnOcd6F75hBKPLGb/OkiGsoJO
	 krYWnu7mh/DdseST3tuoH1b22u2BbTSZwHW1nOlZ8X5bb8lwgs1aeETJhZA5N5K6PMWVT
	 GGRMz66bbssCU8KYhE8tX9NxnjAauCYFSUjk00usFCBLEU2AM5umguU7nEazkYAZtI4J1
	 eINzTp+NRd93Eoun8ecsDjEY1S/LyTfxhNgcmKilJPy5OF7rHjGxqesiQpTFGU/JUOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
	b=hayHRfBjIS+mLpuyXZmkbMc9vGnz5y6CrcyGPtaReH9RLNdjp1mLvCHuICvdE2GlJEtO
	 WTCWE8aQBJ7E6Tsv0ypCIpQzONVcFayy2HFiBXgtvs+6+8polN0n27e6os1zNGlZYn4Ux
	 I2FPSxl3FF40ctW6D4wmOoGGeXWE5x1aarVup8pUl2pCh+HCL+Tc/hlkR8a885li6AoIM
	 PD44gcPb0RidlN8nm/ay923rIfwK/zrd4aWYrLYyV9rT2lNELQ4u0zqhvmIIa6JDAfI8+
	 tx1rpasEu+RcMPmvUgXFrG5oXQ/e0CpbiSmZ7OVGi8NaEa5y2NVtAfF7z26FKsG1vTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMNNZ2uN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C37606A33B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 19:02:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C37606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMNNZ2uN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso982588eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 12:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792609341; x=1793214141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
        b=CMNNZ2uNtC+Gcc4n0JALRHHUVZD3P89j9YksfcLSjctQ1+nP6KuYPhv//xRv7dZ315
         RcMF8R7fy/dwk+5lA6PxfKai/tYq9L46uG9LME/VE34TEvt8r5iijZ2HZwd6oqqg8Vag
         kAvTzStbeZn0Cx1DxBCv0dFgJEXkZf7OUw/ctU4RT/rT/4DU7jYO4s0vrM22FFS0umm8
         Fi55Ba8yPAe5d5dsZiAX5EN7HQTo5NW0XlZA4oXs6syD92B9+6n8sGw50fA1Q7DEmX91
         ozQ8jXXaMXzfJNzLclC5EdeImvaiFqk2GJTsf640baUhtd4iu7J9DN9zNkw9K++hZpyA
         8KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609341; x=1793214141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RkMBOzHZaqfkrvZVoORPFrG7aLfMnVNocm8UgOzB2rE=;
        b=Y900/pTLFTY5XrhXuaY904DviQ28buStM+hLsl0QUfy/j4xB8ch8YUcmU1xo8raTT9
         32Y161cji7bidt0ZBdFUI4FAQxfPAStVufoX3LnhmLjNXnizbe0pWydRJT0tr9oZCuja
         HSLj/smQkD2eC9+pUHk0eYDUuWSTBWLCBzfql+fxmhLvDv29zqYlGDMymJf92+dyI1du
         9EpbCh7RdDvVAR/JN0XQJLVTla5lfGBZI3ZxszP9HHbmEQEY52F2YJvcRsdoJktcKisp
         St4ddLIM+vyLnD3HnwkeBVkQK5nP+97FVgIvh/lvvuPZzCVw+yDs47wt/EaCNbbTUy6b
         XNiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxq2+EfWEBPKgqvABsdoao9wLEPAMhvehS2ni5WMAiNIQ0gBRPTnGcphiXjaopDBaS1VWywgzA4+AAA@vger.kernel.org
X-Gm-Message-State: AFq9FYK2S126CN4Ju815TwgjnbgbH77IJP7zmrUzpt8RoXe2hzpQvN4m
	BHSw21U5GnpjlRbYi+1iOihMgLmt+czgZp5FWZOx0lqY/fXiQSg+pM0X
X-Gm-Gg: AYBFou3unxYGYPfh4dm3L3/a4dZNV4JPq0a9JiAC8ly+m+guqk4HqynOUP9uCGDRrxS
	k2BOREPILAqf+Tk5inInZ9EFKAkhqfb+8DYnUoJCUYYup09LHTYcTe+pCJ+xZTbfFtx2N32B2iM
	aIgYfLju+7C9KrLXYGXzhd/AtS3TdBJpU6H3ECkpd0NwV5H7Ctov20q/ynb5Cvp1nq7glajIg7X
	1pMrFlRGTCXIQF/ST2vFjdM5iDKoHI0lPLiSsg8K7SKVRcM975122iuz1vYqnnR57sS5WdfO9ce
	17uO+WAm4joxcstKegJMjLNB2DQf0o+yergGUa20laCQwcriLAP/BJnR2UzFaSzKPjo6hNOkVIj
	MLyThJvQu+uz4U/bH3VjHo0G4P7TmgojIdRFVss/D9J1toE7mHAOv81Gk/xN2bqoFNy5HOdsiQc
	TUTrRWjZcQ2VW9RHwk8mRl73g9LRn29dvkLp8UYDhcv7PLcOshd4rjjlMGoNULSUkb8iPNx46o4
	v/kQI/9r4GxDmjIRsQzB7nGcrBgbT2ExuGVutyMUTA1XkRnpCN0yLrYKBX2zGlSALZa+jtaN7hI
	bi8CxQILxaR45jrJVN6e+eftwoN/v+KA45UCxKovOWMijkT5/FcvVTPwzfEGDREWqw==
X-Received: by 2002:a05:7300:b099:b0:367:414a:c8db with SMTP id 5a478bee46e88-3674eb303a7mr4103709eec.14.1792609340730;
        Wed, 21 Oct 2026 12:02:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:1761:399a:3c8c:31ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e153519sm9500604eec.3.2026.10.21.12.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:02:19 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] gpiolib: add support for scope-based management of GPIO descriptors
Date: Wed, 21 Oct 2026 12:02:08 -0700
Message-ID: <20261021190212.2237804-3-dmitry.torokhov@gmail.com>
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

Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
scope-based cleanup of individual GPIO descriptors and descriptor
arrays. Place these definitions after the CONFIG_GPIOLIB check so that
they are available regardless of whether CONFIG_GPIOLIB is enabled.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..ee183a97575c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -578,6 +579,9 @@ gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 
 #endif /* CONFIG_GPIOLIB */
 
+DEFINE_FREE(gpiod_put, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiod_put(_T))
+DEFINE_FREE(gpiod_put_array, struct gpio_descs *, if (!IS_ERR_OR_NULL(_T)) gpiod_put_array(_T))
+
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
-- 
2.56.0.307.g5fe7bd680c-goog

