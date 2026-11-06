Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946625;
	b=P+xJDsjzNY8e4ReffEktxlfFnokzJqkRE8lsTyRXZ2KJcYC8rJ8b2HFy5o3gHh4CpQlh
	 +Bbx/diAF+ZDJ1l+BS4aBk68BeCrzT2DbmIrtJmFOS4fLpiBG5SGcORTFx3Y4fBkNjiVB
	 Je+RG+imSlDK12adIwelrnjW2kOKbOGGwjUKTqvZjfBkVo+tQXMBXfNXEBv9TCu1grxJC
	 2S8UluD+Mu8g95qlYeWE1oaRf1cUjMpsIlnxsEP9y6TZdvyznepvTAOnKJBQ01M+OKRv+
	 oYdOssr4zQOf85ZwJ5QUC3PT+bSMjMv2mMe697R6EdvdC+fipjgUPo4MdbbFwiaqQWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
	b=GARfKID3btOg9IvcvDhsnjY5FK60ENetMIICoVQVOWGM4c8zydvgvh7gRgG6v+lBfNyj
	 NMJCPVt9U0q6up0sijZ55jwduob1r5hzrsQKUVVj2HqR4vOjD4eADj89yQfy/JhuoCqdX
	 4tNvkPPCw8HjNycRaq4G82bBO3L3JMqg/lw7yaMZBKB+/rb5tyiO2BRa9+PRD8awF4RNY
	 g/DOivKoCCFeKydPUHFZ6L+y5DrN1d5J1X0mq7yZxo6ZPihhBgDT+MtoK6wGGnW9yhMZU
	 +DTMYpgbIXMc9pCy8PTiBjHDv5DMj/VJICTWL+kWylGZFnz47WhuiUS1nZ5ENyY3Hxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xb+GN8kz;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F2606A32D
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B4F2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xb+GN8kz
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a8cc11ac42so325062c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946624; x=1794551424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
        b=Xb+GN8kzMCS0E6UynPJF3KUB9tPTBZuiv/zt1uXCM+Pj/61GboNjy3I6BlkGFSQ83O
         yzOx8N9YY3nw7yGweAnRn3MoCFSgMzbxie0usBTZA3GT9LCJcgNgrygFPoZ86+16yt99
         VLnAHSHoyTg+vu59RlEQlwCrPo6v2VFQBTHTPxPs70kNTo0oqDxcaW0tcRvJLpRHjYlv
         j98ekeWqtbqhgYq2U03HtwXzm12GUvwU0aoUTDCSoEI3Y98gPtwApdTwfCKyzuKkJVFr
         IH7BjrWy5BdPpI7/8Tf9sgpS2htpj7KNpQTYrtrsFFc77VyXs3WyLG8jiRDzNUCQBOLe
         7Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946624; x=1794551424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Ku8/6VaW3K/wjjrFY6r/mW/cVKo9k/p+ByDBfymbSQ=;
        b=EHLIxH8EWEv0BmBNKaiTNiukGYZwr6ZbIkTrNYe4izAHxNVaMN0qx+rS1Wdgn8Qmnc
         pKPcCIz0HQOpSOuoZbxyO5qYb24SjL6rZS+tdvs8nRLoJF1u6rNlQbW3AFsUPWr0zCFm
         5zjnC0BCQrsY1bw0UUoBp+GdklckA1oUX5h6wxZc5XU6+iwjj4sVzhWlCruvsm1mMcdz
         CiA7YyPzqedKj/SUHHF2/K2Oyuk/fPOkdzUj2ZW3CP5i55yx086DwodUnUeIeuUuqioi
         qiQsHueHonhot+azKL1esY/b+p63vnAOOQtRG3Q9aWdmOUGoRtGEB+ttznoNtB+qMjhz
         l1lg==
X-Forwarded-Encrypted: i=1; AKwUvBwwY9ZoPqUrLFcwTv1N66Zbt2n5jwlgCtkW2b2T2GtYdMBgk5L6yZUPZf9fwXEvDAzGrSB8gnypYchy@vger.kernel.org
X-Gm-Message-State: APuU4Z8EYPCFpC8nVFPSgMditFoWZ+fONkZI6DH2W/QAOOScXCnGh2Zm
	KPmdsGxmiCIctClOhAcsXHpyzJXCILwOewWOu9OiduDxiZ+rmyvKZLqo
X-Gm-Gg: AYBFou2OlWG5HBtuKL6ZoD/BAPb25CeAX9Sxz8/VhY7O6uO/BrO0G8SPL1q+ZHwzkVa
	TSrzDjj+GgB0acoSYQOWmTWuGeArp9oFybx7Ombh3t3m2JLxWcz+kX3Glh9VQecBZYMCcpqsy2+
	ufh+If5VcAM/7dqdnUaLpDkQRb/12tsgqlxiRt+jiTyznJIMTIJWxdMuKteLOzTlyu2dwvZQOPk
	Mdy/9oWlF1NYiuSJsN1Rgeq3ZKwLHu+OiV4fMRRQ289Uwhv+jaIHKV6ry/6jSQS0+2NyB9ZT7ae
	aTp6l4c4hO74038H0UItS9BWt+/1t/mjZvWSpim8GW8t2LY1WTDNXt8VVJbMTdVEZvDV0H193yb
	N2qvoLX5OWGZBTZLFwiv3+aKoAoZB5Nfpakki/oeJU0SnDI33ud00ChcrBAypDsK0DujXvEDRXs
	6UTzcv1ckWI5OcCDL6BmQKRoH8BTCB5+94mF7J/+TZU+zJ0VHo6q2/l/5sCEmUalQbZvQYcDdPq
	UjYS/Hlz5o7RzQgTtLZVi9seWWbnkh2iVTi9N+IUUH/q8iTS/TbyV7K5StPbg5eSFdZ1qsBFvoW
	mUHDh6+llm0tCWyFOe/d11KVZmf2qOojxUjpxvgJn+sHvtmpITxq1XwBLy0rAA5bcVgLIOi0dqp
	hH8wFLo7pOCiY0YkROoSP7sQEWwoekoe0yc+sL2g=
X-Received: by 2002:a05:701b:2916:b0:198:b1e:90d9 with SMTP id a92af1059eb24-1b25d315409mr1601587c88.10.1793946624411;
        Thu, 05 Nov 2026 22:30:24 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:16 -0800
Subject: [PATCH v3 2/8] gpiolib: fix fast-path cancellation in
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
Message-Id: <20261105-b4-gpiolib-free-v3-2-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a5a519c0f001..e095aaef0a09 100644
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
2.56.0.506.g506a7eabc5-goog

