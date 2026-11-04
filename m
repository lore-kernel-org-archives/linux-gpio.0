Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763649;
	b=vLFMHcBrheh5nFMaCuI6pt6xGFNSk+i3+GRoiW2W95A+4guae4wnC7i+3JUzYpby5kJK
	 UTd51cs9X6aOdcDEWeuewgt1/4WcOAKO/hVFWxV1kJ+QUOQmmCIEyFSfhwvIrAAq5+MWb
	 BkAtYN+KdIwZ+h/8+i9ttDgIfbyM6G0p2ZczM2ARU3KvkeEmW325MN01mNWYA0GMsjzQO
	 EUUxm16v2MfJ0qWioJ7JQotQ0wnIXM5ZDiMvV+eWeHxfnEhGCZjloQ+zxvyFAEcRPYx46
	 TI05qWJ2KV41wUSRyhiVpoKiS0vp7ilo597Fq3dax8rsOtpctCRrC6tCd+DPIkoglHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
	b=PrCMUtfzzZ+pHnnIM8yuouiOKW4IiP7amcMnBcwyXNd34tm99GLQ2aVCRs4KgXzX4iaL
	 xBNSUVjyJRBftsKXbwBnUS/i4/dauj/+qgqXyzBp0xdPirvR6CruUtzty2GW/fnE1b6WL
	 ZWWRGSysouyouloiQwwesvEjPjWLWUHv14YO9q3+bG20X2fW3eByZFACuV+E4spTjNQ0A
	 8ZOV5zS6kmTSvDwGZYOWPMxLCQvTJ7RMb0/D9/2Z1k6fU7Y8fzKZAMhmpsWQ/dKclZ5lm
	 IFK5HX+YdKTdYdwQSS1Z9eeQSZ5lrda9BNl6cfmLrd0wjS7UXDWQWoyYuTLggY/r9jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iavYT29u;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBA606A330
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9EBA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iavYT29u
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so599705c88.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763648; x=1794368448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
        b=iavYT29uzsoPP0/Qa5Ukk8Xty01Iq4dM0YF4RbSc+L62N2M1s6wNoX0sqcmxQBpqw9
         8oFssKM5EuQq3CEg44XDpGxsneR9GGNf/aCVuMmGU64w1sfzqZieVr2SKBXiGoNnmGJZ
         mkwvsnutxRN5cWNYxGwRJrQR6zjT4jY6TyB9FiT5L8UNm7WxJgCuvBI+IhIBeo+xUg+4
         DaizG9PwskK6E432BjctkjNdubblcBjypkjIEV6TCUjhmrD0cWSpzNzFHCOFilBhfUJW
         +eY1Xl3Ebs2S0fBytxJd1b6u4K+lJ13+RNrlEyoL4F1SfL2knfKjTJW9zoITfF66gegn
         W7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763648; x=1794368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tiQ6Fa/Vn2QTQoifHh6BKk70IvD8frJIBqHoc+DS4Nw=;
        b=pM3pya4h8zw5I1NUyT2IIau5mfVNPD7Db8z2HAgAyzri+5NZQLxj0vEzISkWKrodt5
         j6xf7YD7aTSOmsaY2sSoIlBu5vEMZxozKSCaW1jBLSXOj8haclxg51B35UnIGLYr+Pp+
         uvljNShQuBKKTNAW8bY9DxSTxZAXmSAMNV7i6c0lgpl6ZOVPxcYkOg0Ru67x57bzTptv
         PlL4WUtyppaE3NKr7NvQcefPnBKcHnFW12O/PT7HGvEg313gwou1/dP0KKjXhcWGDVKq
         uctASB1yxRedzPFY/Zk+GciY6tsYl27gt3IWCAx+A3lDCzERf1yE+k8EIIReXIm5s7oy
         Qfkg==
X-Forwarded-Encrypted: i=1; AKwUvBxb0JbLhHBdkx1qA4x9t4py53XchT/IS8U3fad2vL+o2COJxp8n53/7ThW1C58kkP5QlaSrd/LFtcsS@vger.kernel.org
X-Gm-Message-State: APuU4Z9bT5PIK30pileCtQNdh+gMyafmrFmAfeEm7qqrkGPVkcrIGs4N
	+LbsCit3UgWhtMekVMGB7UyM8OCnNKbmBdwmqr1YxqprUnlPM4Ag0sI+
X-Gm-Gg: AYBFou06G62G+nAjMio1s95g8kslD+MeI82iTg+mpMSgmy5cyfiNC9PfrDRRKMt1LQi
	2qiTawDnnqJ4OO4d0cBrDNNWbpQNZ6K2CcLLDyWiY21RGv0SwqaHXGm0WmdD4vlw7j1IryIBUd9
	4nGxXIzaIHNriuVfnK4iNt4dECMrn3xpcVz6ij0qRSr3l1GPKFd5GqSr5BQM/YHec4G5q0CBjmq
	BEqyuWncYhhOXF9uy8NS1Dfj8Ur41CypIwnDoM+L70d4H7803Aa5OMqu7oqiytAyv0+DTCi8lu8
	Ip8R4FKAiO8aSLzuBo4Fm0IkZUkPIyEyInGodShdiRDl5OfU4uVmN08kutCXYANqlQrbf2FuPJU
	hnpwFuIxLHmQqdHDCrLuESceXPiHUl9Amw3pWnZbVWI9il4k6iBEKYCs0tT3s9GsddbsD2qdZmR
	AmNEULUdyc/iwDYgzlgY6lCEuSzeIHGtYNK6/TM87Psyu7Zsg8svYGDbUD7l9AhY7o9kAoCViT8
	oWWCOreBNd56PvOP9dAN5GGQ2WdtuFyh4X25Odpp0OeKRUzqEpd6mEQAAswSzKI01N9gY0iY2da
	mtB7Ees7scHVDhO4l/o66GfC0ZAqMolXZSIECZtBM+wAaXwIIPAVltIWBmWXCshhhqkfS4jUkF7
	JPMKwHNQNzeku+GXE
X-Received: by 2002:a05:7022:ea51:b0:144:c112:5f24 with SMTP id a92af1059eb24-1ac5b028d82mr22099032c88.25.1793763647565;
        Tue, 03 Nov 2026 19:40:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:30 -0800
Subject: [PATCH v2 2/7] gpiolib: fix fast-path cancellation in
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
Message-Id: <20261103-b4-gpiolib-free-v2-2-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

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
index f33033dd9473..9a850f5c1917 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -5307,6 +5307,7 @@ struct gpio_descs *__must_check gpiod_get_array(struct device *dev,
 			 * hardware number is different from its array index.
 			 */
 			if (bitmap_full(array_info->get_mask, i)) {
+				descs->info = NULL;
 				array_info = NULL;
 			} else {
 				__clear_bit(i, array_info->get_mask);

-- 
2.56.0.385.gac671c819a-goog

