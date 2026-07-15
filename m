Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9049E495501
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134581; cv=none; b=OT8uoFaa4V3ZzZh7l+9iZKqXQRzl+b5firX7zgolat9EWNFV+8nsXWRWF3+cvaYh6tu794B2+fJiC81B8Aw/diKh6voam+JxCOa6TA50X+7DffuSw0DP/JawjabEafFDrGUt+eWIWT2YJbi7MZbBh80JO+6XobTDj6D9Z45f3Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134581; c=relaxed/simple;
	bh=kujYGNt7XvMhEZd6iktrLMCpUgQvKZNVtEThnF4x/hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uss7US7brwy3r/LFxdV0qobsgjjejTHRwyOKf5lO4P2zfcyHcKOc4l8SNSBmpoNVmaEb8NLX8VzAV0wMVoE5jHMr5G8UUqJZWK7MtIXShQgxmKCBFF4O6QxMMAV00z0uxAL5uhjFK5So17482JTwnw+WQgyQ6jZPGH/+wSX6/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BBovHnIO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BBovHnIO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493f25d47dcso12753095e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134577; x=1784739377; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6nhkLV0gTH4BitTfM5YVgSjZiXIp7iQInfmkb6/Vsto=;
        b=BBovHnIOaYyMZqArXYBpWfQ6421KAGawlmi5615Bbiiqpca9/eWHU0egStwX7aG96t
         fpRnWlybcn0PcsTlNJS128suxYY8YMAmgGvJuwYde5nFaZxUgvoTt1sSGRiaagOj4G9k
         4//3auozMxU0AU6cBonbrTstBqQhW4KVaaBvNzZZzYPO1Hqq51HuPuwMXJUJSloIhVVx
         RW79bggUHlj3xGNhlSME9+MgHdSyydKszX8Tkpl5530yzeDhAUgFU/5rJmppKEPt1MSa
         mp1iHFHpGrxxr8s8RTKN/Bp5P0dDPOHQrfw2zIR6zpEjGmZzo7xFy9fn9LZ7C8Flbo9n
         RB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134577; x=1784739377;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6nhkLV0gTH4BitTfM5YVgSjZiXIp7iQInfmkb6/Vsto=;
        b=oiNUe1/iUSVb9l3gkVI2maYlNXHaqvvDZCDhFwE6OKCrebE/XOGLwIsXjtpbJvaVXh
         OD2J5bdgI4r52tpH9g0fcLpB40KpJS5tnt3CQuhdIfiJY2Ed7LX0LoeM7HokFFJ8jgPV
         XDDLxDPN21eqZKlTnmAruNvbOKKE35vuoUd3CjZrqvNOsTNUiD7RceWierUIVQ+LAg1a
         RIXcBvJdubOpma9OuTixZACuibSjuz3PMsxxPwOfxRYOPA9/3xw8qiy7OSLMwKM0J1W2
         EiSZBtINgEu4N1pBkifktlY0vgb+e2Hk95ZjAxrGGLR81jLBIpOoGN/Qfo64+JqXVrEC
         GV7g==
X-Gm-Message-State: AOJu0YwJgTylEKztdjLfyYnsI0qb6W2SuiOQcV/3VVkC5Oj/fn7VLAe1
	zBH6BeZhQhsvqoSAWcAWxrOUUDNXrGQflJWqyyHc6Vpz3KPEt57vAwsRcMuRWW18M8E=
X-Gm-Gg: AfdE7ck4DUdPkPRZsuyE7ksn6el4K4dwUwq7zkOEhpGk0+n6rfGtgbQNTYOGWik6btP
	d87AqENcv01AFiFqpn7VU0nseCkDm7vaDexs73l7nqxoeV7udicZy/UoezSADoG/BSQ50s7NlMC
	stw4BJkt+HAcZnm87ta0zrsqlWOTg8Jb7ZecSxeQW+nzKEX7YkL9Bleb8bXycBteVNaAEBMB+4s
	XaN0WyKwBj2pGp19uALViEpvINyuNJblfbodUEaWSL5A8pEJnLB9gQg2dhSVJV88049WAuzU/Kn
	EFBqjRoX0SXUQLMuuHMqpDwUV69Tq6W3n7YOfXobnb2KUZ4m7s1eTGuZtTu7ARISvIfM2meO7FT
	HA8m3aNxVu6A28mP2TK8EJ0M958bsKXePesCSJ0AIJ2lYwSkSjbRkitGulbulBC+JIsZp7/VhBa
	SN+hP7hBJOC+VTS3QtCZE624IIFQQutp38GPh5pyIIqE1BwS/I6hTESSRfbikKXdpZTVuBWYJzl
	Cs=
X-Received: by 2002:a05:600d:8444:20b0:492:6447:7a7f with SMTP id 5b1f17b1804b1-493f87d8909mr154292995e9.6.1784134577618;
        Wed, 15 Jul 2026 09:56:17 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a32a2casm236568995e9.12.2026.07.15.09.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:17 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/21] gpio: pl061: Use empty initializer for amba_id terminator
Date: Wed, 15 Jul 2026 18:55:16 +0200
Message-ID:  <e408d455206dbbaa4d37981e2a110199e62e4111.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=904; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=kujYGNt7XvMhEZd6iktrLMCpUgQvKZNVtEThnF4x/hw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7uEDHHSR9avEBGs/bseloHrK8b/hr16zw+eA aPhmGcHfPyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7hAAKCRCPgPtYfRL+ TrHJB/9d2NOLim7v1k5NDvaYoYi7ESIBg7tRRfYhrd78cCS3pYYJpk5kKbsYMMgn6EKLOSvmEJK 60vQ5RfVJFlC0LTINB7/zYwp2OrmnrNept/BWRFVSlYa88vOA1N5AWiTlUgyKjvsJXSJGWWgejZ 6Os8OAhFoIMNUBb7riIHXa9sFrJ9IEFZ7/JrbfoAhqOsYLgoVZk1uxgubj1A94gMXOzfH1mYo3w dh0dUqkHPPoNHYIYR8oy18pv+Vn6UwtB5OBXxahNan2bZuUQW+lWvV+awqgYuc/Hn1MTmWmGYgf 46fYQPvfu78Dx+b8Nf+KQDK06s/pIU7GSE7RoW1GulAgf+G0
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..0f4c64f43ac4 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -413,7 +413,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.55.0.11.g153666a7d9bb

