Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6003546E7
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786681857; cv=none; b=sSI8s0etuc/Fto1NybD+GnB0jcQ7QMZOINpwXjbnu4bUdUrenZzFrDqoR273gKVhpQHjUCv+LpSkK63sd9QFUUdYtr6KVxrKOpykg7UQU1KdO1k9k4VryoFwea8cx96Xh6dKnlBclCEhq59Und7rVkgBj8MAkU2S1lMrkC3skM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786681857; c=relaxed/simple;
	bh=y9XFS4NaNGUMren8wDCd+BHfdSEf1tM8QcjUH10x7EA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkKXxuvc3vJj2o/Rq81tULSqqGgPgPoUu1UkQdR2l1ieEYD6CLnxIKrLsBEMPycTH7qStPE4x2C9viyflghHCrYqw+fK7/BpZjk/y3NYlgEobCdJ/wMINP9kDPZ54yQVK0gEbZVWIHndOdvSMiD8cwEbFHo8lRKObCsLORGJguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMnVnn8m; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMnVnn8m"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedf318752so340387a12.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 21:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786681855; x=1787286655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RagY/Mr1zGEfiHDwG38AgHDvQ7OX6yJl8b7whn+Ewqg=;
        b=DMnVnn8mbPoI2l3VpHgKhWYmIIhp7RWm8QhGdJIYNNG10gtqk4Xxr94tjK/D1EtCNT
         uPFvY8mO7Ffnt3dIcbkmsWqwQdqddTF6dax9UAkKiV7mTIgYPHfDk+WvT3uiq83pw4so
         kX3x+ocRDY5zr95Y+roJ1HxvqNMmWpB4DPR7Wflhj2xiwbYE5JMlpwpAj0KsWK8qNWA1
         WMsLlQlbhMsmXJzgwS3JAQA8qHOQI0VXT6taiwK5z0FFt+W2niRjLfzigjp+8po8aSFb
         cGIZo09uDi0C/2eGgnKzyB9Dcrj17Aly3Ah7nmR8Ne8iP8skv2zHxAACePcfGeY3DDmO
         DLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786681855; x=1787286655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RagY/Mr1zGEfiHDwG38AgHDvQ7OX6yJl8b7whn+Ewqg=;
        b=eRn5SY7HQ5zuh0r/BpUSgZK791XI0wZOPT4cAR05dRlaaTTReIc3/XBnthA9EF7QBE
         SZZNCkAhoZAuhQqP07u6uaMsrXNvqs8DwBNs18UyOXRRodOlf8D+wBZBFsbYUvZajBei
         20V0wi2dGzKdfPYUqRrAk/k1YbQd/0sezvk9r+tycvZbUac0lJAvOuQHNn4aRJgzuoWR
         M08bVJ0fw736JPGdHfhQ7DrU62fGbtBnGNkdwp8ZcKmuVNkkEGRzExkRi8gnXBsJLZWc
         FXzzt2ngyg2iAwZaUm5FBWC8Ma3YhN/vm3OQxRMMQcDOcFnR3W+45ZRwjXqVPoodMI6m
         7Ukg==
X-Forwarded-Encrypted: i=1; AHgh+RoVTv8TFK0OhaMRqassy43ukJSLVlSvEREInpSbSnXdV6NITA+XeyltiAfcux1hxLYFv097e59uZaCE@vger.kernel.org
X-Gm-Message-State: AOJu0YyRFvUXhTEqO4JQrimalqMuThkKSgJq9PqxR6KEAG7S+pvTMxgp
	OfmjHHC+6UDZis9r2a7jCFFI/rjtTdp2wDDBgbback0X+ywsE79gKPAy
X-Gm-Gg: AR+sD11MoR2fFxwbhc53BAP1gydeuYnN7v1icLcAF7HtkABLt5e/fiTSU1IFhJNbCIN
	zH1eKYM1SoKrsv8EjrtNCf/1ZgPydHsgkrf4ZqMrdzF8Xs2HvZqf4zkqaZu2A3rem32ztcTMYIi
	7kW1IARyV0K2d7cm7Gd7o8VpETjeggA71MNN+gp5aeWJ4hlV1KnlmXOSjzLi4a2tTFWR8woFuXm
	IbDnCFs3h1c3FFgADViy1aGPuBA+yA5r2vHN7X4TkawtjcbtrdT4HUCCgmR/BanCCbLP/xOWlYt
	QADY3NdgaacD/4XsZTuEBlQEWg9eg7ClC3RQRSae6fbO0RGx96lUAqB5HVMsJS4wQxerqbfCxuQ
	POwStw+TUPVuye4Q+daulSZoaV6by1VgJudbG4hBDe/6HzIB117DciHZVrlhsB9KfJvwcYHbLRj
	zduEikt7HHPlUuTbHJCdrZmMKU1BukE7rJUqkG/7AsVthQ5GGfB2GnEkKxGNqaPw53j95O/BAWF
	8yhOsA/dk0WmBvFrS+cVQSGkRcKiIfti1um4pd8QCBmuTInjpeyeYKZSwodLBkt9+5lbnESCiL9
	UopQ
X-Received: by 2002:a05:6a21:6e8e:b0:3c2:dcdd:a85a with SMTP id adf61e73a8af0-3cc71a8a583mr3620847637.13.1786681855341;
        Thu, 13 Aug 2026 21:30:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef6a5aaf4sm1823555a12.13.2026.08.13.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 21:30:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Adrian Ng <adrianhoyin.ng@altera.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] gpio: mlxbf2: Handle errors from optional IRQ lookup
Date: Fri, 14 Aug 2026 11:30:27 +0700
Message-ID: <20260814043028.12548-3-phucduc.bui@gmail.com>
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
 drivers/gpio/gpio-mlxbf2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index 4e2f3381d82b..4e5c5d196a50 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -394,7 +394,9 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	gc->owner = THIS_MODULE;
 
 	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
+	if (irq < 0 && irq != -ENXIO)
+		return irq;
+	if (irq > 0) {
 		girq = &gs->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mlxbf2_gpio_irq_chip);
 		girq->handler = handle_simple_irq;
-- 
2.43.0

