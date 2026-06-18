Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1552F7EFE
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781798211; cv=none; b=e18hl7w0sJxZpLVKZ1crU6sD0y+1tr0mZOzoHlxE/rshd7Vx/hKtZ5gd82iWu94R8hCUwKstW/olzsy3uJnsFM3SbcMmyaIqUs5K2jufTGQmxdMicygZt5wEf37sDhDETwxa0mBHh8hWgrpavpmSBtRh6cEJRaN8fTOPsf5pc24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781798211; c=relaxed/simple;
	bh=P28ezZVYMvfIau2euu1qtHJ1eSQBvPNccqcyn7EHJTw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RF2i4ZVUdlrXt1RH9v1kziwOF4AjaySuSL69smhQKJSqlohXI3Nj9yomjgOYmfIKsOlgG5S1ecKcjthVJ6UqDd03Ulg1OYkUmDHxCXYKoL+8d7g38RXIX1PFehMZVksiTCz8iVXAwm0wcircvcBP104uGMoZaBGHH1qsqDKZTLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n83UNEMU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n83UNEMU"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ad4b60f6d5so1101491e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 08:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781798208; x=1782403008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRKB/ijumXlY2XhAEKbg1fofBw2NAC+eofR+KYbiF5Y=;
        b=n83UNEMUVRyJumLdmqu/48x4PWaPSLBm9nJWOrfYxuKoEsUFCacYhulLuKnwRcIJYX
         wgXU25MMbwe3IPwpWIRzLcHKavrH316f8FNI5LKf4EBNx/dMGkhlKe45WMj9vcm+keay
         D7mIuH1yjIBYAz9iD73SeCwwxaJFKr/yl89a5/s06X/fNeMCn9pvUukS82X9vCvo7LNp
         E31grCLlwQQayLjWRZa8b7Qgph/iVeb85t0QuAYVU14obvPb5xmOz2myMnRYy5CaVauB
         u9gB6nnC5P2LXD9nrha2Tm5o4lqXngbSOprAoq8EJT5+OcmZb1iXN4+3fqtcnN7V6ZuW
         Gnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781798208; x=1782403008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GRKB/ijumXlY2XhAEKbg1fofBw2NAC+eofR+KYbiF5Y=;
        b=X7qOd4y3ig77WmbOjzVOCPvNF9XcuXO4J/Mi1q8uM0y4GMVDIZhsfpRneukAa4rhfR
         fVODRh0GT5mIrShxBsG+L7Mw+VmmPzOqiormsYPn2BsZd2eo/rgpLh0wg5hky0kSgkG0
         Xqum5l6sDhkiTkwINRKuzeWNob0vZWqXbr7OfcjNSgGptYquk175lRoi0fiepvzDnErT
         aWQrkV556PprghxXXKCBNGtv42lfAJwHdNk/Iwxrhcln9Fb1mE4lXUoaLnTd6EyYlz+j
         nsLrGOlK1EjTrb8Cp4eUSoD2PMWaNrgXHkR6blQrbBbZGVryvxF9peuC+hQYCML5Fbby
         CF5A==
X-Gm-Message-State: AOJu0YyR3Am2iIaBLCPf9pfsfWe5DD45NbGJlfIn9CQtNprB1+3xR178
	E4xveFNg7TYGXPZr/F3v+XmL7i9jFeaxjtPaF6CtuNQyjWKoHCUFWztNlxB/cSrH
X-Gm-Gg: AfdE7clV+sz7AUVRgc61Hi5jlWD2TVHk0A8zwLk59pyOapsUXgrpW2gbikuWysZ154D
	Z6cbIdOZmzYLb1EJ+uCrzN3GvkiwnfdDDPu6b0mBhGjLwpqQRH+5bqh4TFScN5UFHMpRvbRTSz3
	U8PV7LFfKbcgjQV+Y/FAMD7r6LbvtdYVhXfA7rCzZHCMjeeGBeeq2ERYagzZykgPQDSCGE0Ljtr
	o7Dnv94v9JhfF3mbGERCBK/Hv0PIRKw0Af87hhdpmmZuTTpOqWJXB22xXCsqO4A+Wgly52RmELe
	HygBXLs6CSEewZlPDcMuyALCb/9VqU64peaeGi08QnJyK8uF0vwi+XgpsVhQ3mIo6RgQGcKBnqY
	G0qjiMH2RjpTPn5LmaKsDBdhJ1hJksm5QtjyAP6StoS1AgELbVPaK2Y2l+gxWpCe4cKIXFZzqp4
	BocBpWicQ64hOHinrKv6SZgXwcl9V22MFoJZNvkT35QOdl5LvPn8zlyVS+rJHAqWaSYoxExWZfn
	hN0SIc3Eos=
X-Received: by 2002:a05:6512:628e:b0:5aa:6931:cced with SMTP id 2adb3069b0e04-5ad562fd27emr42130e87.39.1781798208001;
        Thu, 18 Jun 2026 08:56:48 -0700 (PDT)
Received: from g.localdomain (95-25-158-125.broadband.corbina.ru. [95.25.158.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad56375f38sm13217e87.17.2026.06.18.08.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 08:56:46 -0700 (PDT)
From: Igor Putko <igorpetindev@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Putko <igorpetindev@gmail.com>
Subject: [PATCH 2/3] gpio: tb10x: use unsigned int instead of bare unsigned
Date: Thu, 18 Jun 2026 18:56:25 +0300
Message-Id: <20260618155626.18751-3-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618155626.18751-2-igorpetindev@gmail.com>
References: <20260618155626.18751-1-igorpetindev@gmail.com>
 <20260618155626.18751-2-igorpetindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl warning by using 'unsigned int' instead of
the bare use of 'unsigned' for the offset parameter in
tb10x_gpio_to_irq().

Signed-off-by: Igor Putko <igorpetindev@gmail.com>
---
 drivers/gpio/gpio-tb10x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tb10x.c b/drivers/gpio/gpio-tb10x.c
index 705bfd80a8d0..d30524dbc841 100644
--- a/drivers/gpio/gpio-tb10x.c
+++ b/drivers/gpio/gpio-tb10x.c
@@ -51,7 +51,7 @@ static inline u32 tb10x_reg_read(struct tb10x_gpio *gpio, unsigned int offs)
 	return ioread32(gpio->base + offs);
 }
 
-static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned offset)
+static int tb10x_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tb10x_gpio *tb10x_gpio = gpiochip_get_data(chip);
 
-- 
2.34.1

