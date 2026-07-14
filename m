Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A503EFFD7
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013940; cv=none; b=gTnwEt2RcF1gST5uo2TPul54oKoGWlja7tvhY3XdSWdTgBNdM4EjuPM94FCCJlkH+b+9ymYrxPFw7eF8Y5PxpWrmkI2QjpaR+JMQgIGbNhyJOpt5Siou7oO5194EQFDhY02CdAFkT/Mzx5VBYc+lAInVaA2SloAgxct24BQySoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013940; c=relaxed/simple;
	bh=pjHW7pyDQ4JEIlbUWB07hiJX/g0Y55VniXF+f73xk6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sTLO7QnR+2Qz01dTMI89aI21NVRaeM0fzHckjbc1s2RVYs7K3xw9SsUQpxm5ZsZ7Nhxta8b4icEG3tyB2qP/V+zRM2+gN8acXW7J9wMuoFXZxGw0f4auj2yo5zvqyRthPHnZKtWckxThqn0X64/ARZu8BzIgSkvBuFZMBJs66NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JVwQI0U5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JVwQI0U5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493f2e39e81so15694795e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013937; x=1784618737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tQuEWsCiWaG4AgDHABsWBe4T6yvitv8nY29ehlGtKhs=;
        b=JVwQI0U5LUpbdNRWURTVrtAZjpM/Ymk95oH8w1f6/2PMQYD5UrssP53rM4O8TyWKno
         LHIlFzfO8PKd89llWBvgoOrxxOtLzJRj3HpaAXSq+i0sN83j7lXI0jLmxv+vXBfNIJJe
         qN5wsO2LuKRaOFOdraBDVDVcYt3QdODZ/kdV7skgQS2cAETFEEfEW/fRaUZc6TKApsxy
         JZSn6wY6bBAoAA/QWg9q2Kzlu6aNx5zS2n+8HodOGpLMbZ4WVSLkRd8KTQkPpWktpY6O
         B/h1ocHq6rk2Aj5ionQjfyzHMF5x2Qjws/TW/PtqPjUWl+//55YrcbBwBfYxcqFVlLAP
         xIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013937; x=1784618737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQuEWsCiWaG4AgDHABsWBe4T6yvitv8nY29ehlGtKhs=;
        b=resQVDFo2rmTMf7jizzxfISTJYGIzY0RBt/FrUYI7s5bttG+DidxjKdWmysipMGTXD
         5wqCVXEPbvfufs3gDWWgt5Cm5pbA/Cl5I9chqZaxBftrwEy0igqQa7tUgj70KFSj2fBV
         ASaUuqpyfflRGAaF5QaIKVshIAQ3TbBkrYkAycYU1+IGANHoX+IhabZwHKO+plzjrkqa
         tkqVZPVx8MRX7K6uUa84fxssi+e5Vvs6YY5Uod2MFrbBnudwU8eaVZSrEfUYgmL7L4y4
         bP2UBz1ZcM1GxlSOD7mOvW9w4POxIpNs7h35vIOXh4GEn7yj7T9oWIMgYVyDf11LSZ1u
         8V+A==
X-Gm-Message-State: AOJu0Ywvphng2jAU7htKTGsQPg4rGP4Ii4thxnRCjIvB9kEhc+L2PVzL
	hRSGoTru81jRx2GjwWx4zjxY28poWGCMyFNOV56uUs5pM6pczBCZ42Kcrt1cl/GmTuk=
X-Gm-Gg: AfdE7cl2NQYGKzGlqt7wAIuCWRQMDQjHWrdoYmGG+sgqCuZ5DknImwnT/NkeZ8RVteZ
	19xLoliUfBWH11q86p3MJ7ifB7n9+HZVUGGHQv3oCoJGt3S9RzkZITBqX/T+G9buOjDjvH1LsZB
	UIjV8gdPEKnJxydx2k6xskvQOecsa9UpVocuhr+I3RkDkBiRwaZ3Lvo/yb86mB2fx5UvP0xF8dt
	oxKS3gR0FfCe6Y0BOgBibPJn6BLyrupxlKgnhH4WEp1xqyiROhzXlH9EMyq5KT6YhgMVeat9GOb
	/BnwK5ShJIkHgsO2o0oX1P3IpiV8JjG9rIEoLA3m0KiV3jNfCHvpmNUIs+JfihNJJLjZJlQ8MJW
	tBcTblD0iBoo3OFOS4GNqiV7vhhnxJAXwtmEUZLkx1oRd3JWS+FOls3UGEzyupdOK/h1onzMDli
	JGtBuzo8no/HnJT/IuuX6GNUNXW5cZqcrGSszfTYUV3FWSbbHhHIeO8SgyaxcygAJ/3KioA8Fcu
	I7W
X-Received: by 2002:a05:600c:4585:b0:492:4e1c:120 with SMTP id 5b1f17b1804b1-493f883260dmr126952875e9.32.1784013937223;
        Tue, 14 Jul 2026 00:25:37 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f9402sm59110045e9.13.2026.07.14.00.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:36 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 14/20] gpio: pcf857x: Use named initializers for of_device_id array
Date: Tue, 14 Jul 2026 09:24:15 +0200
Message-ID:  <3d23c5e19dba1f86c05f3c7f49f5e93963d461d0.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pjHW7pyDQ4JEIlbUWB07hiJX/g0Y55VniXF+f73xk6U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQ/Uja/qAzOXNem/3XfKMpoQBSnuv5zy2deX 7pnFN0xEvuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkPwAKCRCPgPtYfRL+ TjzwCACu8DYJB692H05EK4q9ZTLMvnqyIk58nEFcV1oYf6NhBuXwcHdeBH0znVI0OgDVLShL8wO y8Kg8m5NBDJOJZxvoH7Hsa8OyI8HVnbqA4FNZ6QJI4nud5B8N+0AK82O93l5gEWSv4c6NnkLGrT OhryX+ycuf/GFp7iU80L9Et+bahKMypYOrMnEqT08Hn2v9hZ9lQQzlzP2TvkofTX9n5vAQbt8mu k/4bw3+nlYZmf0+S8Cn5Djb8bAkjrBpNbTmpYQMxAyn9DqXYoC8OITbFJGwjh1Uo3Wd8cYIYtUO m2rguG6HSxutUaZeo81clRdvKLJZXuBejd3bom1tDIYCEGq+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
of_device_id that replaces .data by an anonymous union.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pcf857x.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 4196916c4f94..d6f0b571223c 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -37,19 +37,19 @@ static const struct i2c_device_id pcf857x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);
 
 static const struct of_device_id pcf857x_of_table[] = {
-	{ .compatible = "nxp,pcf8574", (void *)8 },
-	{ .compatible = "nxp,pcf8574a", (void *)8 },
-	{ .compatible = "nxp,pca8574", (void *)8 },
-	{ .compatible = "nxp,pca9670", (void *)8 },
-	{ .compatible = "nxp,pca9672", (void *)8 },
-	{ .compatible = "nxp,pca9674", (void *)8 },
-	{ .compatible = "nxp,pcf8575", (void *)16 },
-	{ .compatible = "nxp,pca8575", (void *)16 },
-	{ .compatible = "nxp,pca9671", (void *)16 },
-	{ .compatible = "nxp,pca9673", (void *)16 },
-	{ .compatible = "nxp,pca9675", (void *)16 },
-	{ .compatible = "maxim,max7328", (void *)8 },
-	{ .compatible = "maxim,max7329", (void *)8 },
+	{ .compatible = "nxp,pcf8574", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8574a", .data = (void *)8 },
+	{ .compatible = "nxp,pca8574", .data = (void *)8 },
+	{ .compatible = "nxp,pca9670", .data = (void *)8 },
+	{ .compatible = "nxp,pca9672", .data = (void *)8 },
+	{ .compatible = "nxp,pca9674", .data = (void *)8 },
+	{ .compatible = "nxp,pcf8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca8575", .data = (void *)16 },
+	{ .compatible = "nxp,pca9671", .data = (void *)16 },
+	{ .compatible = "nxp,pca9673", .data = (void *)16 },
+	{ .compatible = "nxp,pca9675", .data = (void *)16 },
+	{ .compatible = "maxim,max7328", .data = (void *)8 },
+	{ .compatible = "maxim,max7329", .data = (void *)8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf857x_of_table);
-- 
2.55.0.11.g153666a7d9bb

