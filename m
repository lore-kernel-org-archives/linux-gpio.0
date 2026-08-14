Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E1435838E
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 04:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681859; cv=none; b=ecDf7PuEr/S1xD6OBxwD2TiDWVkUrynLoh3Jj2mjhPfzL+pZuRIljIVeOobcnb9nc8C6h620jvl3rtOm+4PcJvrJ0jHuRK8aA1/pKTJiWS/n6mYTzmTfKkUfFCDPrx377rs1aGfgKr3EJM+LiGdioVqK+djorwIiO3ahaSw6Fkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681859; c=relaxed/simple;
	bh=D8Pc9ol6rtShow5B3vuqUm8b9mEdK+Dkduuwp7MAlbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1Pz4dIuUlXJim3OvjKX6V8GGqFIIniTskF8GotNgMy4dEBu8v0rqSXQVxgQnpHQGXd/9TXjTb3vxUSjuqSENIPFP9JfDaQ9y5uPIfWuMcwfVnoGboz4QES2OY77GwSdW4j8ttKbMdhV3EGOBMaXDscWnyktk7v5ZauLq5lNXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+JR3jRT; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+JR3jRT"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso7099505ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 21:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786681858; x=1787286658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZSUbiceyWjnkkEmFCkqbhLOuyqVN9aGa1w4b208Lgs=;
        b=g+JR3jRT/K6Badpr6SwPtUbXRs/9RCpSRtGxtBz6EeP1+Jg15W04Qy5StK4cJNfbGw
         3NVOtFumD9kErn2dlrtPyS0GqvD4jhOkWi3KA/3O/Vq8QZTVWyXIpe1R14hWTQ9+81FE
         xAXEwpK8gdSFl6cgYThgzlKumE9t/0O1oP3uCeePoLtbnIS6tiYESDUUFsU1kTNmvHME
         kMF90rjDFY01/29BcuebHsk8Mz7v2L3ptNAp6djYzUTr2cv++sDqECExm9gXTBL6wrm4
         8op3Ik8EuXjLWK+CLvabh1wg5++KN0p3ZlqHHEkSyEU5E6GoL+vQq+AH9eXhAt3tVpYY
         t4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786681858; x=1787286658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ZSUbiceyWjnkkEmFCkqbhLOuyqVN9aGa1w4b208Lgs=;
        b=lYulnArl1KESGUNkrtVOe68b12RzPBm/fcYGQPtcy+en3zX302ojwwJAQHxIYzXek2
         fzRerBdkOM1p340lbZmwsyI3mYH1RD7tmRGmV4IIyKRzQZ3FOrstIh8HnSn6Yw6hvIej
         7EN5BXo60zm4kAo/jhg2Asd+RGWPfb29EPZ41OJrGL9TdMQHyzNpaTICXRkm45+x/ZZ+
         rIXM4th93IPYMVoKWoP3zmqO7RNN5Fvf69fe6F5u0OUHtenpV2893ExiXWxxcCG3Hs+D
         2P4cvOBgrJspaSG6hjWIfq/UKtIZhAFQQVbh4mvD9DAvG0S2HFNo5csUiX1n+TsDLORg
         5FWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTnPO05bJj5/P8egA3sC3hSmYn+DRQpVb2+MDx7VuWdPy1Zf/rfUeL5EuAxmrOh9CeVPYSmJQPLUTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoDYPboTUYvR4/rpw26gjMfxVrk3ayUGG+rOGK6/PIfA6V8v7
	pV69IPY1OomZNeD8Os7q2HJDRg+bWBNU0waVBPBAgY/ltl9boLztX9DV3EYs9A==
X-Gm-Gg: AR+sD111dLFaKAEhL94JbSJzXALUPLfqgCxsXmH8x2aOarJ/lWFZxcEjYqzbT/Z6Xow
	MMFHs4n2Kmc7mbQiBEuzZV1099uIdtwoxTKxPUnirzLWrvqwapn3hOYrFJdXCZKm6uIp+8KbF9V
	2fX6sXoHpUeJrUhzNKjul6EpHohjelXleNJZajXhohOJXWhy7BK2p48/GbOilh7xTnF+8nISJqI
	GiLanwlVR7MqnHIWTHcgMiiAJoaFyg0PgVymZ32x9OKv/6I360awrA3kDradKueCVHN/bSbBnZZ
	PuFTy5Sp6B3FOz87DWa4BuTRaKH5eYXAIMQg+ZLMk9PgXlsur86LGSqmzdUvE/nqV+lChgoVDke
	+anaAfm340zF56FrbIEZTHcDXGiUsy2fBw8GxBJHEsNGKD6PcVf6AqSSoFKFRgjS1UWWOdGtsqR
	Iv/BP1U1u9qpm21moBulKttWw9FPoRoRIzCVS6ToV4dL2cI1hbLyUDrqu25jwANAL4ux/X/3VYP
	ead+3WgUwvnxnRvLKAxqwPNBBv1WZ1t87Q37og+R4pQOv7V6KEoTRGQvzfpLeFbYb39xZz7CJvr
	m5Cc
X-Received: by 2002:a05:6a20:cc0b:b0:3b7:807b:3cd3 with SMTP id adf61e73a8af0-3cc71cb2dcamr3249428637.23.1786681857808;
        Thu, 13 Aug 2026 21:30:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef6a5aaf4sm1823555a12.13.2026.08.13.21.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:30:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/4] gpio: altera: Handle errors from optional IRQ lookup
Date: Fri, 14 Aug 2026 11:30:28 +0700
Message-ID: <20260814043028.12548-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

Propagate negative errors other than -ENXIO.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpio-altera.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index 532e3360b70e..d22f5be00745 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -220,8 +220,11 @@ static int altera_gpio_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mapped_irq = platform_get_irq_optional(pdev, 0);
-	if (mapped_irq < 0)
+	if (mapped_irq < 0) {
+		if (irq != -ENXIO)
+			return irq;
 		goto skip_irq;
+	}
 
 	if (device_property_read_u32(dev, "altr,interrupt-type", &reg)) {
 		dev_err(&pdev->dev,
-- 
2.43.0

