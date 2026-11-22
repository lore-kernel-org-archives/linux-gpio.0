Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795322307;
	b=UFMMz9ils+VssL+XO6XWhFG7PdHX/PCsvBKsudeNqPT8N6GrTLVUYAlDtDRLvklWGAT4
	 uwb9joxcNiWjazJPArKVNEtrHsBZQQeOVp0awL6LfMguYKVSp/1icbMxeI0CUV/1zjzjt
	 LaoS2awsu4rlMExeMc4Ljv3UrxebQmGsEuJqqxbkB3K6L9B/u3EcBnhTZTJPE9WxQUrZL
	 RjApZ464qdWBgmG2YElWk/DQiK5HpQFsYOCXHbKV/8AB0A8tu6d4jOP7yULW/WUPYeqdq
	 hBGzly3RQJkP/yMAJcM6ucAcuoGNE8Gi5rGVpoAKq9slFSSUioKa4kSUO/CkQwEmwBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:
	 X-Google-Nh-Sender:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
	b=bQ1LQdsgSxdestGVvFZWwapz6EmLcLY/9R3D3AjVMIS9NVWz3UnXipBiDEgfDcn71ZBS
	 VoJaO1ioktmYOkcqaFi7OIyeQO7ZGzt0ys1ctL7vvbqgrUiVi5/am7ptsnk43hV5VX+p7
	 AdQ7+mVkiXd6KhtJyxItpmSw6BSU51f+ZyV+AiWsaLEI5YtG/1vbqAr+NDIkT9iUADwQj
	 lm2D2QUh57sW75G1S92lbAX4fOPLtcsa1OiATdQyIgJsXQNz0Fv3TwVzB1GV/K9Jgveww
	 guA5AwGf/8gpyqQOkCve/GrSXVh8EsXoVxCZJ1dKhEXJqZewxM/QmjOtqW0XO2DZAhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3WGWLXR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.179
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75320606A320
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 04:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75320606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3WGWLXR
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5eab93a9862so561199e0c.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 20:38:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795322305; cv=none;
        d=google.com; s=arc-20260327;
        b=sgOVWEICb1muX5t7FlLRjif9YY/f0+M8KqgtNMVgWJbjp2G/SSbFvUsYGhHc0AR4BI
         4CpeL8QRsd0xvLLVPrp+iEVrJw2oOGiLtu481D8JWEuF5bzK0lo1T5FU+Hj+SiyDe7FW
         ZE2ibOl/+kfUzihrtLIuaMfU12gy3Quvbj+Qqex9SesTbV08ZcDhePhKYuYd1fdirphy
         hsjKYRDHzRnhSIO5rDwR4bAaSa/+U+PI03UYbBVzsk+U1jk13nisXrF1yjVpQ3sRqHk4
         P+dpt5762bPjF7+IHKjh5zMXDNoZyJPHW/u6nwNMer/jjp+TWFbRCriqmA0JDNvH8NTR
         vepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        fh=nSW4S2VnYpuXEmyvWQOd9g5J9lrriI1FvZwvhVYRLD0=;
        b=U7+TfJudhiOTxFAoufFWsJyW55OEOJkrQLzNSwhivpCuvOVj3GO+ErNre378AHjhlg
         GbZU9D+GXadix2H58k5H5lw/zDsFTlAuOUcZ+k0zxUlfup3HFjxH3t9dnO0ZVKsh2gy1
         xD/L0SyVw0+lbRUQr/6KYxIcKXJ6H19kn4Io06h1xi5MzgxpppxrsZYkXvI1QJiF/dMT
         U9Pghekanplo+gTmwn4CkaNel9bBovP3UBHICPGqo4UbOYVSWSQGLqQIwUHFrsrasu6D
         kx722egkS35F/F0pRJ/ir59ir4L/vKwKdbCpYWIbRa+nG7e5jwJiehPQ0YLrJb8cQLii
         EOag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795322305; x=1795927105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        b=D3WGWLXRlb760u99BuvqKLPSmSyTIARrbZF2AnPulMDc9J7iW8xNYnHaIlX/PHllu6
         y8iPHWf8RZ6iIHxPmxIgFAoCfVNnEkP1QddXcGgEZ9TFVwbyQflwOsAUkcUbXAQBKvg3
         /9RMMc0ki5bv5GFaQEe7mAchPFOK+W4iiExF6/i9584KCL5Vi2FdmH8LVAkFFFd7htBw
         6lnGS/FUof+4crx0/2f36UKFRGh/uv7sSXye2DIyAcrTwxBih00FKHyJ29vhCD0+hH7c
         /KhgmIdSEUNIeWxl6LxzKMav+2qjb3e6PsIwReC7VX9txEAWZFyDct15BIbCTxuyjfqy
         3Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795322305; x=1795927105;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=023v28V5wcnpfgQGfpZFbStdhGeqXZxy5B60FlHCQzg=;
        b=OnLBw+0/tclygtKH3lfURUGA0ifgINbztdo3qeuJUAtq52tc3UN8LGxODStO+YV8gv
         tshZ4hSsAgguZSBEFxgkC/vXpb5gMBYV1SOYZNR5zIwtzwINGaBoJTJCNj+oYoMMxbyZ
         g7PGzBo1CJs9R1ugbc281s6gB5GiEdei6ObKO3a/sJKG+vQKMvJrs7M+NJJpLIEqn2fJ
         ZIwEcMRZIp9kWSc4XVrHR2v+Ir+jK0Ukf5AiAvpO86glD3c0kg8+rUpkXgjbLWlp3Sz2
         f9+Iuq4P1cV9O6gVJM8TWAOAVXKNCtcXY0SgyJqC64zhpKcSMgG5ryHLtF/tdA8/plEe
         6O1w==
X-Gm-Message-State: APuU4Z9pbAPQjy+Nknv+pAPxmFjVQngjL5V5vqFaz7a23yBhY1mFaP9o
	ShK7iLHye1udr0YSa8yXL2rxTMYlicrxmFGzZ5TfPJ64sLoVYLUYy7Y7MVhwrUZvSbjYXQ83nQ3
	gVq/meWCJ6p1MfsvqLNQz+TDZl4TtHcY=
X-Gm-Gg: AZFdTZdYA86biuoXKbl++Agx6KRcgS9rvTcco9JCk4X2cwjUpCXrSdb6ZOwzQGZPzZZ
	dcTCIsN3gwFfkwYrxo+/ixSJIQnNlW3Lpztn7Osrrkt/H2FEAU+hdweaQMVbWA5LuN5EsN7nd1g
	DWuFK5ATikrpAwBJJRG/EcklQZ8DPQRhP2lCAbYJlYe/TjyMa0qFwGLHjTxv3VVmwmGW3B4LVp8
	X+dHveCyZgA02mVLf9W9N4PUfhxpBhDs/tsyevTz0jK67QKakwI6GMDLiYYFeTKAHgsUeIidEhz
	BHJvP/gl0wbiULbNy7tigv2OkJC+JCW9VCIlNrSRv0E8MWrNmytnV2VQlufFR9tJS5yS+8gCgcv
	t3p7vRsDNlo0M9wJ37+82xV68lrKW8/JBiw==
X-Received: by 2002:a05:6122:1d06:b0:5ea:9218:eac1 with SMTP id
 71dfb90a1353d-5ee8af5443bmr3374820e0c.20.1795322305326; Sat, 21 Nov 2026
 20:38:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 20:38:24 -0800
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: pocj8ur4in@gmail.com
X-Google-Nh-Sender: AW_J_Uod95KM47pkpq-dZFuzVGlMdaYzEwbdtw_hT0a3ExWtQmsJIzWV8HpMK38V-VnO2ShHlEhKieQ_nKjAXXWCOwO5Le1W_nee80AGIi94LVccqEvLoGb5INkDeYCtMkkHnCo2_tvXOv7C0pndYQUZI2ReqJqkyXY6ReibcrOR2u7kxj8FZ7gZbXSJqWYsZzqWHd7UossTc3AwBbzYaQYjHUlSRHWdIPJdtNBYvbptZTmCoG3GblMVpXqnyTbTUa3VYw
Date: Sat, 21 Nov 2026 20:38:24 -0800
X-Gm-Features: Aa3M54pMiP2epFZY2GI-9wGf9Xn1gzxs1peuSoAwj8hTZNZgeW7w3bjKuaXMoIQ
Message-ID: <nh-fc54eb6a-a671-409c-bf5d-51ad5828438e@google.com>
Subject: [PATCH] gpio: avoid undersized array bitmap in get fastpath
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The array get fast path passes the caller's value bitmap directly to
get_multiple(). The bitmap is sized for the requested array, but
providers such as gpio-sim process it for the entire chip. With a
128-line chip and a one-line array on a 64-bit kernel, gpio-sim's
bitmap_replace() reads and writes two words when the caller has
allocated only one. The second word is accessed even though its mask
is zero.

Use the existing per-chip path when the chip needs more bitmap words
than the caller provides. That path uses a chip-sized temporary bitmap
and copies only the requested values back.

Fixes: b17566a6b08b ("gpiolib: Implement fast processing path in get/set array")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
With an arm64 QEMU/KVM KASAN kernel, a gpio-virtuser read of the first
line of a 128-line gpio-sim chip reported an 8-byte out-of-bounds read
and write in __bitmap_replace() before this change. The changed kernel
completed the same read without a KASAN report. A 64-line control case
completed without a KASAN report on both kernels. No physical GPIO chip
was tested.

 drivers/gpio/gpiolib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279b..29c34c46433b0 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3512,6 +3512,7 @@ int gpiod_get_array_value_complex(bool raw, bool
can_sleep,
 	 */
 	if (array_info && array_info->desc == desc_array &&
 	    array_size <= array_info->size &&
+	    BITS_TO_LONGS(array_info->gdev->ngpio) <= BITS_TO_LONGS(array_size) &&
 	    (void *)array_info == desc_array + array_info->size) {
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
--
2.55.0
