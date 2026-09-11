Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8DC3C3443
	for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2026 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166496; cv=none; b=Yowh6zymou8pDcLLVqb3hDbAK6HWJW7nA6vuOsMPCjFpQF6LHTk3ZY8J+RXSVRASKGI8217s3QSntBxfXBOOdHbkeBguZXe/xRrvbjWRsuoZDK8n5FqXeTzHZkrcV7zanb4esqYwpS8eqAoKI+UYNiVzzFmSKQMafe9GeXCEwmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166496; c=relaxed/simple;
	bh=MhLJ5BvVjWRN8oLtBAd2Xlvavj+XwtyxmKBO8k6WGAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fLcKUwEaRPJScBwYs54e3ywD4NLPvpf3/bpIS0NJ+wkk8EAtaswwQLMpeq8tzOT/ArHhvx9cg+o0TSl29SxCNSUmBe8Znramy0ANo4EhoXFr9MfcEPyziDRnlQNb1xhDUenyiuUu5riIZlnqOpEYKDUdWsilhXAITUUcVwpRIeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ETtNeXYo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ETtNeXYo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso3527325e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 11 Sep 2026 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789166493; x=1789771293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YyeJ0s48GLoI7gQyBPAOVK15je9obJPZW7Mi5shyPSI=;
        b=ETtNeXYo9B8GmfQ2WUv0qHO6juNtSGhadadtw5QGxYvMnQdrHW3HiioxkaISqlyNy/
         DIpMKaTYkq7KXGxHbddMOUmYu7L9r0wxHaeUEQkP09EhTuTvMyQ95uDo902xkrvESWMz
         1CZgIGygpXBFPq/9cHTum4IQRTgDRd6u4jjAeovdcaSQ4MqabOH/Y5Oro1rZ7KO6chhS
         I7E+o3UF2kWAUmjfhGyhktkp3homUtRHt5QGRDb5FSbAY9rvc5Iw6RWns6V3Q2QVxUGx
         MN8PTokg4V+nH/2L8bzu45DvslgfNCUY9wUMb2crLdxsGqHge/U4DG4zkQ90x7V27Xv5
         UH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789166493; x=1789771293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YyeJ0s48GLoI7gQyBPAOVK15je9obJPZW7Mi5shyPSI=;
        b=ZWwwcR/E6gMeyNv2nAE+wGNbxPOgmHvyX4+iZs7uDow/XIyIp5B3gH0QqtU65wCN3M
         tXk+18RBqMStB99zN8dWxu81StIMr41ryBoa0wyJ+XwXH18X4iDfHAyXftSr7pTTOm5e
         BiRO7ldGGIiZpADp6EQFEOgZiaUfln7PmZ9J0Id6vUufYv9nDPoeIQQIZuiUGSEJ0qcI
         ABvioJMZejSqmjXf/RuIf45bCX6ipAujJqxPEHzJotTtxY4g4jX+GZt9RNvgBsgLnUAU
         hfCAN8Cm0mGfj34QTG9TwjyZ2YN192yMsP1xootBfweOqyOP+h7/I9BYuyeOY6uxKQPX
         laTg==
X-Forwarded-Encrypted: i=1; AKwUvByxd56YMHlVEPe2ko2rBGEpOxRW0mK+Q3O2jwjIbEG6JJWVEJrtYkEKqjAnCZi4G4vM8m6+RTF2dJih@vger.kernel.org
X-Gm-Message-State: AFuF++nSZ7eURBr13kz22TkAXhZjW+rmzgzU3Q9qyB2L7vc1Rqy1N+uG
	rqymS+ROD9OP6f/+G45tAbwKBdXanfiAjavX073AyYUer7YIu/YiGCT6jPAiMx6N
X-Gm-Gg: AYBFou3iKZxu1IFPyCevxx1om8546Pws3WPw3DYIDtlZkV+altq9ujTqz5VVNrLzx7X
	Mc3MZmugHkupRciCjpNNUnd0weoSM0283x/ABYGdecw7M00wPNwwzm8iS5mVKojlVjxSbyrf/Zm
	G+11WAI1TcGVY3qaz7PHkmrNfQ/94BG05bC3Iq3Ulj3d6QP0ZtJJ/DapLC4zSElHcZqEE0oH2AL
	wqwN/zRP/I07CfvuJwUAoVsjFwn0UxXy436AFyTUmH94X4a3FNok2PXpVLwk3WDiWr3fytMAJly
	Av7LZAbDNNhfQaBPiaSwUwlfIUcqQWXBk48qn/nh8kKDg33Sqd3LW9097xElWf4hNnpS2QdNzT8
	6d0L7xsHiMIEEFuo2MNfIsAOlb8UnYQpQI2OLcYbIC3LpnTxVRuvSgV0Gz/pKkevvuXHGpzhor5
	IW0TBdSvP16mZqlL2s8XJZA8k8B1kYrAJhBvd4bXZgX2SVyRddRglZRM3rsYLj9ee9fxyiaGSO1
	aHWAXxmVtSvnqumHVMGIXWyfCV1fpCiVl3nv2/Bi5EoLjlj11OM9ZF3RavidUNVj+eqHy6caSee
	EX/jaKn6vWDcfEYs5y4DPNGUmyBa+VTTdzpv
X-Received: by 2002:a05:600c:c4aa:b0:49c:fa21:e73c with SMTP id 5b1f17b1804b1-49e619c051amr71747235e9.18.1789166492619;
        Fri, 11 Sep 2026 15:41:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm145664735e9.4.2026.09.11.15.41.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:41:31 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kent Gibson <warthog618@gmail.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: uapi: Fix gpio_v2_line_info_changed reference in kernel-doc
Date: Sat, 12 Sep 2026 00:40:10 +0200
Message-Id: <20260911224010.10393-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpio_v2_line_changed_type comment names the containing struct as
gpio_v2_line_changed. This was a typo in the original GPIO uAPI v2
documentation; the struct containing event_type is named
gpio_v2_line_info_changed.

Use the correct struct name.

Fixes: b53911aa872d ("gpio: uapi: define uAPI v2")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df72cc3f35b0619f3c3c95798009c5a..7e77bb6bfaeddb72d33e98a0171925f1cae686f4 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -232,7 +232,7 @@ struct gpio_v2_line_info {
 };
 
 /**
- * enum gpio_v2_line_changed_type - &struct gpio_v2_line_changed.event_type
+ * enum gpio_v2_line_changed_type - &struct gpio_v2_line_info_changed.event_type
  * values
  * @GPIO_V2_LINE_CHANGED_REQUESTED: line has been requested
  * @GPIO_V2_LINE_CHANGED_RELEASED: line has been released
-- 
2.39.5 (Apple Git-154)

