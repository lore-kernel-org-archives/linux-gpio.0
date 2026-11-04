Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822200;
	b=k5Tg3q0pcYNFdGH2r2jZpksvI+GIdaYzcLyGjJZh4f5d6x9XgiLHfe3O8EICib2sGXEJ
	 bVENvt7q4bPHxQdvQ50cmoxPvggdp1bvs4Hp44Ff63VB27xP2Q1YMshezYzmFkJU7dg6M
	 osHgDVS4PmznOXbkqyuexzbkEpA2CHCXQf76IiXFEfTgpDuwudEGed6+crGUjz1JGskAZ
	 3vIairezt0DmXV2v6E2zhV1WQ4NnPfr0hG1nlnosh/Bp8KWEDOuYITSbbv15YqZIP94Dq
	 URQ70D7q7Bt4uZIPD+HJ87rlxjqJStUakKa25arHZ8uXwUK8n+g2ljrWGqEdJ+VAlKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
	b=GKNA/2P0X+1UGiXpIwJLA68lJqlHcxvaK/KfPd8r/nUUs5V20+iZHQ7ZIZ/YXjomQcHm
	 kX22aeA1wK99tbTH5k4vfuMUs85fNg6La+8J6qrClDSZcHJb2svuB5XvE0MyQcsi7PJ/t
	 gecMJ6+z39M6QZNL8CxZeeSGjATRfDytHhWvqg4XrKFOFDYECaw9DeZyl/BtKXyKHF3Dc
	 QokAKGEcmg9e37H+NcQGcVgbdKlbXOpVNNWnnoWmK9kqud1MmFCfsdlnXtVVGfNKRxbyN
	 +PiPfTy4QcAoQbk1d9qzL0OeOZ0OoYDVPQ3nwlJ3uYxnSKpTUJaAd6UWghAK1UMqGyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=is.s.u-tokyo.ac.jp;
	spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp;
	dkim=pass header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=U6zV6xcw;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF326609D0B9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 19:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF326609D0B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.ecc.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=is.s.u-tokyo.ac.jp header.i=@is.s.u-tokyo.ac.jp header.a=rsa-sha256 header.s=google header.b=U6zV6xcw
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36cad25b8b0so1652227eec.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 11:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=is.s.u-tokyo.ac.jp; s=google; t=1793822199; x=1794426999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
        b=U6zV6xcwHj+Ax1U+kmYYDq1jY6NvN5hhUkbJvszowRriybXgXLwACwvbvkPqlDfu2b
         8GC9h+JirXzYbhj0gNfFxBPLgAgwOYxHYEHQv4Apns+QEoiHcGE9wYDoEQXe9SQRdqfZ
         3xbQWrcltPSc1dgqb2q9JPCZVJXWfu1Lz20ZZtzxDidI57lisI2a7rVlQriDzRoWlsG0
         xDp0AgA2/UZy481hsx+WW2GSTWAQe/l27LSoVypdKpy0mJHesnQOlR+9/WhtPuNcWN0m
         0uSz78X20X57tMIazycsN8widOYGBeRTYvGKbqe3W5KVjW8sfHY6UnAld+tBJchOWNcq
         PjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822199; x=1794426999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kpL4kjKXO5+zpcv/2EB9Ui2OiV7DWWpQ4VPKolISpI=;
        b=iRR+AwHBaxw3ZK78lg0tx72OXTFwFfNw4UbFKIcAHzCdnD4BhtSB9ctc4VSzVyVNOu
         JFkPXRAsATgNq0KOQYptJ0MMtzcfzT1VROoEVP+/TE4va7HhJLXIVsfGLcMTB7HB9r5C
         Q4YvPdxoHkNrPM5ENfDNBU1HkjWkJb1ouSFrE7ydym+ToLAyFIlGoGFpeTabHD6vkfJG
         N3hwp48D/xq+lbzTr66u0KlJDA7CCw+RSQXd4yTe8hkbY0Cyz1q8+FNsFNuVg34/udy5
         Hbw74becvV8UsfWrLjA2yYCdgssDNf0Lt3SzMJwMFHDIc4KSM5uVrU/YaZILosrIOSJ8
         uXMQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1kS2fzS/AGPh1Ibx6DTRsu5WoHe3SsRyzE07finNKMBMK0gU+nbjJXo24TRrJo6Ral8Xv1JNSiAn0@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZwJq28ANgtXiBbfFnebjXXJDtj+5Y5SYcFDGM/13DxcYeR5He
	6sQfNUW0BrJEc1rrXBIaqpLZk9JwJuh3vMsVT1di39iBAP5AcBvdcoKdi/dLqzIlig==
X-Gm-Gg: AYBFou2D9HY8rDDZVR/U/NIFVkHNGgHz0rgXdvzULFiS+tQ8m3DezW5PFbceE/HkrS0
	PKwwiQs1QInEU2yoIe7ZnSCtianuEjb8taGjU4nc66KGDRZMdKi8dFWONludFssH6lH+2UYTJlk
	FCIYZU8nYtaqSExkTSxMDFpy/l7s0GrLRLC7IJf1+l2hQbS0+aZrIejvd3EwMmh32K6CNKjM/aY
	n4uH66Qw1uHVVlbskE4c5TDrgG7wp2ubbEjeBTjQK6UI92FBpboV0HlkgZxGC8sxeFD9ieEeORq
	NmlX1cOmYNpN0qTQDUDqWIiR9bL6mmkqTH+DQ4UlWLv3hnBbg6HsmSCGHI96oBvHy9AJF/sIAAm
	J5rbSwN3g66LCgKWKVgYims78u6yoOkmvP4wkPiBk9XhUSwWl2YsDb4/MLAlBs85ImVgdV9LfQm
	p02Tznukca1xrpXrMYcV45JfRNr9z6Ei6SCEoeFr5cGitakbUEHVnMJ7z23gX8ojST/G6ZSQKMO
	fs34jMLgFJlrLFkM77bIWK4+i51LN4E+EBL/Q8cO1ZrlNaEPjI3ROnTamW7ymcNDURIyw9TdxXK
	/sgHqDpoqkFktWbTvFcW7szSaZo1TRPTct5mOw==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr10067389eec.25.1793822198657;
        Wed, 04 Nov 2026 11:56:38 -0800 (PST)
Received: from wang0.localdomain ([133.11.33.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38f53a6sm8941712eec.15.2026.11.04.11.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:56:38 -0800 (PST)
From: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] gpio: virtio: compute the line names size in a size_t
Date: Thu,  5 Nov 2026 04:56:32 +0900
Message-ID: <20261104195632.1702765-2-lian@is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
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

virtio_gpio_get_names() computes the size of the GET_LINE_NAMES response
as sizeof(*res) + gpio_names_size in an int, where gpio_names_size is a
u32 from the config space. A gpio_names_size of 0xffffffff makes the
size 0, devm_kzalloc() returns ZERO_SIZE_PTR, and reading the status
byte of the response through it oopses:

  Oops: general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: 0010:_virtio_gpio_req+0x2b8/0x550
  Call Trace:
   virtio_gpio_probe+0xc2a/0xfc0
   virtio_dev_probe+0xa7a/0xc50

Compute the size with struct_size() into a size_t.

This patch is assisted by Claude Opus 5.5.

Fixes: 3a29355a22c0 ("gpio: Add virtio-gpio driver")
Cc: stable@vger.kernel.org
Signed-off-by: Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
---
 drivers/gpio/gpio-virtio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 32326d91f33d6..fb7b40eff37dd 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -494,12 +494,13 @@ static const char **virtio_gpio_get_names(struct virtio_gpio *vgpio,
 	struct device *dev = &vgpio->vdev->dev;
 	u8 *gpio_names, *str;
 	const char **names;
-	int i, ret, len;
+	size_t len;
+	int i, ret;
 
 	if (!gpio_names_size)
 		return NULL;
 
-	len = sizeof(*res) + gpio_names_size;
+	len = struct_size(res, value, gpio_names_size);
 	res = devm_kzalloc(dev, len, GFP_KERNEL);
 	if (!res)
 		return NULL;
-- 
2.56.0

