Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA74A3090CC
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773971628; cv=none; b=hOWAi9SPYLjJWP3IaFn0zN43ayqiUAuYqHqas982goNnPzKHqUBs5DT7AOk2frK6wDVZJ1XvnEjnAyuWMhnzKa/TCQaFWylC6e9IoUetmlQ5neVYgTYG0T6uzzc90qUAiptVKxqmQoJMq2a9RLvkuuQZYQOdzJwzNsgNHTw5oDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773971628; c=relaxed/simple;
	bh=4fWULOXJ2FCFWhJy9fLghj7NWISrjfvLRkcXm4+1KYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQMvJ3cXUzlmMaGnqDoVndOCxsO/+fSw1Io77ibO4pfSDNALgJwLltjyuoTJfKeCg2Z3Xwai7UpEv4QcnSDWOjwHIOm823IC0UaaY0hCtCVIz7IqUfwD4ipdV24S9nWCVHi1705hwfMD1Rl32fwF+OstahlFaoXQGZttTgEDL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+BPSY59; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+BPSY59"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79a60975dc5so17318757b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773971622; x=1774576422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OzPny3OBUeeBpt9cG0P/e54tGjxk7eLdlTFpb0o1yU8=;
        b=P+BPSY59yYPSyPq7sqg90l8NH6u/mYi/BUS0qGLxWLMeAbjlwhTOrXowdqNHREDt3y
         HSbEfG0zzinbWAsIVBQe1+tIPSznIGKGM9Ou7QzB7BhG4ujw9bH/83so+aJvBIzkAKrh
         wBrFPTwWd15g/QRCQWFlMjqAB/gU313rE1GbTLtV4p7xseKFkfrm88USvGnJ0PI5w1M0
         moQ1zKMmUDOEHJYAN1n1Oyy8BB1qxQtiGbAl9GV2Nl89knAy5l4li6xO6hzBu3RYJ7Vc
         7oAG8SCFgcaVeOpUkePhtnjJz1ILPVyhOOg7CxPGNzE/6JXP3g6BbarurjN5tDjuWaFM
         DifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773971622; x=1774576422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzPny3OBUeeBpt9cG0P/e54tGjxk7eLdlTFpb0o1yU8=;
        b=R0FNKjpidoWc4ii5ddDspG5ejvOkvO0UfCrubbZbU1/HFNDSjy/rBjnPyl85+KX5sC
         Pw5XbwKV1+CajtQRkGpQeadFCNn5kLV3o7ppKmN4GcPFld0R6CjJgxYDO7/29Fhh9C8s
         0scrB6+e+OK9jmeRbDOUXnZ05pP5YP/I7Q6UCg5jnnnT3FF5jtNPiEZmCYJaGgIJVDA6
         wzlGOYCk02wUekR6p8hOdKAtr1IFcqbGxsVqdYsDEGLkxBxw+ib1rx0xd6jETjC7mIgY
         dFLKWVuTDWh1DM28/3Yn1klizQdLOuHgP4TZj+XUIX5nr6HXVSnVUVXfkDezaNi/6y2w
         2HUw==
X-Gm-Message-State: AOJu0YzaSTWBEZxmRXcK1bwqo1vAcKdvhIPcd06aEoaOOvZsDD/71Xu0
	ucVe6ZFF+xY0MkXr5kJq0ci/fiMj0j8qpzt+nW8GBsfiShnn8rlosacwiuDNkDCt
X-Gm-Gg: ATEYQzw1Rax0uw4drFG9z0ytR8vC8bn2WrXN1iZ3FdguYoP4eODR8cbMHjy4yMHuDBv
	xpcuvpgz4VHB6NUS4rexhHKZ69KnXNrS7tE2qAcVqJz/lR5iiHIYHUl6tX4yJLlwXY3veK1w3nK
	bGahTlQryTn1C9pyXIX4dTZ8pCVrnvWk51312yn/itHqAlVdvUEj8DwNB/mNs8ztY7VlGg+zKZf
	ifW0NwZt7ZHBpofNFLd+ShbPsXFL5hM754x5ioKFEpvH9kS8U9I+dKkiryDyqcslQuEmlxXIZKi
	y2qjgXrvdcLrWetpzX5TntlhUMrlshuLyqPL6SwPHvLj2+S0zVlP2Z+OFnWT75NN5jIjdKofESr
	q+LnplOHpMNOLcOv2b6CKuMLVq+afOsrR6E7uWVUe7ZjId0CujCcm8m2BBmXfTtGlC8OTbWcFNM
	4Emv/X0qQYw3Sd+wdKO1qyF7q24KE41CVaw9OuGFX8AxE+V3gk3TBo5a8=
X-Received: by 2002:a05:690c:d83:b0:79a:38a2:d8cf with SMTP id 00721157ae682-79a90aea249mr15668467b3.17.1773971622283;
        Thu, 19 Mar 2026 18:53:42 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d::8bd])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90214024sm8378917b3.0.2026.03.19.18.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 18:53:41 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/MStar/Sigmastar Armv7 SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCHv2] gpio: msc313: remove kcalloc
Date: Thu, 19 Mar 2026 18:53:23 -0700
Message-ID: <20260320015323.36383-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member to combine kzalloc and kcalloc.

Add an extra counting member to support __counted_by.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add __counted_by.
 drivers/gpio/gpio-msc313.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index 7345afdc78de..2accf3446cd9 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -483,7 +483,8 @@ MSC313_GPIO_CHIPDATA(ssd20xd);
 struct msc313_gpio {
 	void __iomem *base;
 	const struct msc313_gpio_data *gpio_data;
-	u8 *saved;
+	int nr_saved;
+	u8 saved[] __counted_by(nr_saved);
 };

 static int msc313_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
@@ -631,16 +632,13 @@ static int msc313_gpio_probe(struct platform_device *pdev)
 	if (!parent_domain)
 		return -ENODEV;

-	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
+	gpio = devm_kzalloc(dev, struct_size(gpio, saved, match_data->num), GFP_KERNEL);
 	if (!gpio)
 		return -ENOMEM;

+	gpio->nr_saved = match_data->num;
 	gpio->gpio_data = match_data;

-	gpio->saved = devm_kcalloc(dev, gpio->gpio_data->num, sizeof(*gpio->saved), GFP_KERNEL);
-	if (!gpio->saved)
-		return -ENOMEM;
-
 	gpio->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(gpio->base))
 		return PTR_ERR(gpio->base);
--
2.53.0

