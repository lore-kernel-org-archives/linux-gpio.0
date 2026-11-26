Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682561;
	b=oU2yPcQBFbrBd8xAzt79NE3ZQU2eOj4zIdqqMvYNlTtUqL54UQGMv/zfsheJMqHL6sFQ
	 kLawclg+/AC63qy1s1xDnde7yUIB13+FnyxA2Q9kStSRX0OOBK5MmVkQZuIXlcrFmX62P
	 0cwpOvqlCHSnvkHBXxQad3N6vfjUQe9H8Jck5LEjPXevYUOKTi22hEXO/0PWRgfeHwWB4
	 78Biql8pGsJ78kuB+kFOfpA01Q16o/7bYitpEeph10/0/otkrUtFm2awQnX63detuSf++
	 jvk6Fcu3CoTMYsIYnLm5BjD/A3SMQtohXI6xvWpfEJM/yf8DB+BYCQRfUuOYkBjrd9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682561;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References;
	bh=eSC/IavhEKD/jocr6HtDgEw6LyL8PtYnkl9GbB/wsAs=;
	b=uGFH26jyGcouFmEL/La6HU1GLoJarzNfGSIMraiMaDYS0eBBYVdBVgFUTriaIMlzuI+K
	 CxhNQKQo/z9VZgXbzw0acwueK4336RhDo2dhHso6QEAwWgYETShpF/ScAlPPq2mJUS+6T
	 J1Y1MqGq6lT7TFZTRCAl+fCyqEzGgoCw5JRWkeLS80gXym/sHrwMQB3AMRpaC23P1yAYR
	 dQrDwSL86Z6tqvrLuSzgNMfPGlvMdRcXRyhK6aH4xOYL7ftTk+bCjVJXMIXWWyxR7lvrP
	 xVcjWRwzGs6HToVdKWpM2nO49dewwUtzc4ezRh+x6izdNVmYtgL1hyVeOdZt3Rz1JDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUfTPtnW;
	arc=none smtp.remote-ip=91.218.175.182
Received: from mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371EB606A323
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 08:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 371EB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iUfTPtnW
X-Envelope-To: linux-gpio@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jL4HqBe3D5kj1fDFSZf+Q/Cum3V75XKW6K6TrEyTK9U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795682559; v=1; x=1796287359;
 b=iUfTPtnW+okBmmqntm243suPPzQq/WoUtNL7jipiBsFi1PBU3vQHEGkXE9bi89m6hpMLYmNC
 WCZirrQ2TNGRsPzdEr+pNwH8DF4gMYB1YU5GYtSmrdn5zs8Ohm6LtOfc3yvg2yt/vb4SOuhUbao
 lfq5RKZi3KZAH71fHGEzpftI=
X-Envelope-To: linux-gpio@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 48aaf3807e1c1ad9;
	Thu, 26 Nov 2026 08:42:39 +0000
X-Mizu-Trace-ID: 48aaf3807e1c1ad9
X-Migadu-Flow: FLOW_OUT
From: Zqiang <qiang.zhang@linux.dev>
To: linusw@kernel.org,
	brgl@kernel.org,
	paulmck@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qiang.zhang@linux.dev
Subject: [PATCH] gpiolib: Use srcu_dereference() in gpiod_get_label()
Date: Thu, 26 Nov 2026 16:42:33 +0800
Message-Id: <20261126084233.17381-2-qiang.zhang@linux.dev>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20261126084233.17381-1-qiang.zhang@linux.dev>
References: <20261126084233.17381-1-qiang.zhang@linux.dev>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

The srcu_dereference_check() already evaluates 'srcu_read_lock_held(ssp)'
internally, so passing srcu_read_lock_held() as the extra condition is
redundant. all callers of gpiod_get_label() hold the desc_srcu read lock,
so replace it with srcu_dereference(), which provides identical lockdep
coverage.

No functional changes.

Signed-off-by: Zqiang <qiang.zhang@linux.dev>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5dd4d142cf52..47ce89bfb578 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -124,8 +124,7 @@ const char *gpiod_get_label(struct gpio_desc *desc)
 
 	flags = READ_ONCE(desc->flags);
 
-	label = srcu_dereference_check(desc->label, &desc->gdev->desc_srcu,
-				srcu_read_lock_held(&desc->gdev->desc_srcu));
+	label = srcu_dereference(desc->label, &desc->gdev->desc_srcu);
 
 	if (test_bit(GPIOD_FLAG_USED_AS_IRQ, &flags))
 		return label ? label->str : "interrupt";
-- 
2.17.1

