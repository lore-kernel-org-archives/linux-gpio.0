Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7845072618
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 04:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784347998; cv=none; b=YvaRnb0jyZlbLgEn8mSD3xrM3UokDn3uDlAnuD5n39F0Qsspb5Z9F3p1NvIgTaJZU4+SfEKkMXzRrkL0Ndim0CBzWCMk6zAXxYbOz0eyw909GMrbo3zKFZixvo3/hqEmRYy5VDfam0BIqnI3gNnB46fqV+gSU5YZc3nPEj9InoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784347998; c=relaxed/simple;
	bh=MC9KWCjI1wYGVlZjY3iIMWxNDAt3kQ7XBydCe/Xfntg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZUBTVj6GRUbtSHCnE+FurUcwbf5aqnBObMbML8dVnquq1Xr7l//ZbhI/1YNKzybswDH8/kzF7AaLWn6hUypWOjxOv/zIkB3wNJd6uBXuFUxUEnuQC6xTqBq4cACWXYVcbD8phiWxozMBiGjfVpDk6xlPMMaWOH7XD5F0FWkFlcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POZFcUBw; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POZFcUBw"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3811f512167so8550901a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784347997; x=1784952797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EH999ndhg913Kud6OrFl6piOT8BZkICTa+wndpo2jfE=;
        b=POZFcUBwaMnfSou5K88CmkbNxnFW1e0+oruTtGzoWvfb6nkdLGCNXFCgSAEr2vClzU
         9fWk8E5LosChH7UVDkf8elFPXgUao4deZg7EbZdKXk252ZU4v3uXC9S//KQFXHZDMysN
         K3O4t0xCQZoxOy/A9H16EXIo4B7pOSwJceDWEIaFkUi2Dsjvo50iPz4zLJePxLFpCroa
         WVBAUPCX+cQ7trX3N/GYsMsk705ycm5FA7++QbQmTbDraR6tDt5oOqytvj1x8OL35S4Y
         ZFBBPHQtyXAeEr2U192k6GDkLgDKSH5mP45gpuK2I8DW0peKDC5zMdErT2K+RzTMXkwN
         aIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784347997; x=1784952797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EH999ndhg913Kud6OrFl6piOT8BZkICTa+wndpo2jfE=;
        b=q9lyQBfFVkqN8YxrOCmAs+7X5n2r7MhLqxgyp8/JNL2lboFf6S1+af41+OAp2c/1im
         Cq8GUemKxY2QVOAO4umR2jCf3ScqvZUi/1uYasYjYk44dBbHAp4tKSMQmidGpoayUMD/
         gcMeL7m9lbLx8JHt1v1suQUG+Wg16Oi+ZwEUounIEQYvcR0+uY+NIhwMeshbhne9sPtj
         jGywKwp4dB64qd2LeHd1cLLYORJ/hXtQk83TWc/g6pA3XlPM0/411+psT7//vfJb+d4t
         CM5NFt0xrUuXrp0X4hMNFv8Sc3eQCPVLmwpAtRQti1FlwXR7ot9YdvPNu9PY0d2sKR2K
         fLQg==
X-Gm-Message-State: AOJu0YyD7cykI8Qrg2O9Km4wglYUd+079JzHdt1U17Hy6F0N+IdHcEmG
	koNJ3gHTCjA/tSUqhb2sDCMiWnXE6nYNs7dco5XNXvgI3OeYRK9IQCML
X-Gm-Gg: AfdE7cmdMmI6mxJxX6rqcku707lmFe3rRkVbOTLHyjrcfxbN8VqllgF7QJz7xcXGKJa
	bgOPjP+NZXlDMiuZtObE8Qnt35cpA32BEkvRDdbXphnJ05a3Nib7GWAKi0oL4lvNPf/Nu29gEbX
	X51T1T92ul3IQ4ilkarrli+TQWHneY3Lg2DRLP7+QrTWMZSTOy41fuM92z/hDNoAEXafniIkCa+
	A5bk6EBGbJyyprjcR2jxk6XY1PuUkZUyVleeJZ3z2NhhQJmkmnA86M2QfaodelkwtoqXgxQKOTU
	H3FJqd1WOXU3mKi77/BVjW6ag08L1RdylaJMp8wzB2WkOBvTt6GaZajykRw42vqxPWLHhNrl0YY
	dxD63a1tItdn5H9RrSGuL8Ypik8P0xnjG6C2nwdsfH3NJuTNz3eOUUU9LW+FkzvPnpwcVWkDi2K
	MyWJl3TEQc0+3HQtuokokrX68grOxs2PwZSo0lHBvqPtVHy4v2K2g2O+dG5mzfe92WnA==
X-Received: by 2002:a17:90b:28d0:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38e4b3da54fmr5969767a91.2.1784347996656;
        Fri, 17 Jul 2026 21:13:16 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm11052109eec.17.2026.07.17.21.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:13:15 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
Date: Fri, 17 Jul 2026 21:13:05 -0700
Message-ID: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entire of_find_mt2701_gpio() function as well as its entry in the
of_find_gpio_quirks table are already conditional on
IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448). Remove the redundant inner
check.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 940b566946ce..fc77cf6b306a 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -629,9 +629,6 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 	struct gpio_desc *desc;
 	const char *legacy_id;
 
-	if (!IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448))
-		return ERR_PTR(-ENOENT);
-
 	if (!of_device_is_compatible(np, "mediatek,mt2701-cs42448-machine"))
 		return ERR_PTR(-ENOENT);
 
-- 
2.55.0.229.g6434b31f56-goog

