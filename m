Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5539340DFAC
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 20:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785357755; cv=none; b=JEMBxkKiis+FbMuYD9xeRmmzEbC59D7dOLO7CZv2BMKM+fweHBJIhaRbPJ+AAV/4Nk43UJerMn1JRhzf+NAH1SYUz2VqQOB+CLOOhD89NnzGAxh56+Tjgq4v8UoOWwYRNQlRATpRiRDnh8VUZYLQq7jviOa6+8a7jRPxqVe7iy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785357755; c=relaxed/simple;
	bh=EH/5yGtoQUcP9BWiVGTIX48zz/7hxzR8/Pfqd/jbUXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=neEL4qWPZe8ZzXofB84z2yvZ4ptjY6TgycBHjv8c+msgwzZeLPr0uDD3seNHYHpQeRtSDuBZEeejm7d1W+6bJT8Axif5Pswvow+xDVQ1RgrT2cvJ9VHMUBTvH9DGbL3i1mamrgSjgke+QaVtcNNAPFGwq7bYMGXx3qBGHg1+5BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p+jkQldX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+jkQldX"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad8076b01so18753815ad.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785357752; x=1785962552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LDPk4YAXxDRctnLBiPu4av/18XYuyaL4nmFU8ElF70o=;
        b=p+jkQldXX+SUb80aJhqMFUdBzfFco7ZZAzbbYiskH0SkdvGV9pQXwlt4RxZAYI0Nis
         baeBDSa4EDqS7RbFyBNWX5SpE2RNk4g8OVZ6SgzabVUfn4G9Rh8QFx2jFIUTcI6qwP0Q
         Ze8c2BUxRd3BBtlSIhwm1eivvagD4b7iNuZhzbxUa9Tqr/DskQgmqbMFfLP1SEHw6Xm6
         VxZ4mw+wOn/pR3VGhCphq1BZWvumcNWpm88VZFXRAAsWdPOk0gtsil//w3Gf4jOGTHhq
         MTXKV9uAb+Bs6DIx3kfK7wXk9OuZUvB7IQLGyvYcgUkA1EQyLnTHmXrab90SepKrbtxz
         Ko+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785357752; x=1785962552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDPk4YAXxDRctnLBiPu4av/18XYuyaL4nmFU8ElF70o=;
        b=T16ErpL9bcxD2BvEkpNzGwvxkvCOp2PO7IqRtmwk+kXdf8Ldc1QIlBKm3DXfJjDL5u
         uggk75VqMNTeCQTNWHoAUVplVyqp1C/1qS7t5AA+ydYbTyFILvAJEh6BP96lp8yO2PqH
         dA8Q0VwG88OuEyhwVepnA24dZZ4Xt7p5KMd8L53OS+aMqN24eIgvxc/B7OKeXlM3n00g
         5WcFOWdMOmUItEZXygyLLNMb1RFkX/kyncQ+KZuug6cCHowmjWs2qMArnW4L17xNZjRh
         jxnX/7xNU445+KZHbHI+iOLYcO6Cqkbunr1gkbOiXYAIJC0fRE/T8Zd4KLXmJLgJ2qJm
         8qRA==
X-Gm-Message-State: AOJu0YwgMQ1RK1Xj809BY0J1HmQFG4sU3XqG7bHi5/ZHWh0uA2yjQRlk
	sj2XIcu897mg8eMB64pMJAF3mUpncDzG3CidqdTIxiEpzsNt9T2MlFa4TiPD/ks3
X-Gm-Gg: AR+sD13TQZP+B05CQJ5bFbNC731U/09CUjOTOvbU+l2ubz250IzWM9t5xEC46mY/sch
	vrhhwIljSuMHXuq+lF3N+gq/rNMoXFfbwMworb+Ps5/ueMWiUo8tmWwQLhoitBHrkH33ji0zWiM
	QIDFxpWtht+GG3yOnqF8qAF9cbZl8GGbpgAepx8lgoKbefvrOiX3EyoMEKSAVU8Kv+evsg7rpMt
	7cSPuy0tH4nfcPoOIhllKJoOLRlvlVL3AjtjMi1YD0TDLhvNj5wBfAsjxxXh4e4U419H0xUUTxX
	NSvZgPNoyUvpIN5fudnhbiF3YGecsAvABcmeDlHiIwtrvyNSXHqiLXjNn1sgGyzlMVLNzQvpqxp
	a7EDDxyhkiOamj/zBqj8fV8U7rs7eECX68+G6ojqkAf2Lp+NgzHMN0cRK+jJr7qsleXxib7yGg1
	foSDQ2zKy9a2GDeOqSdvQW59Bs3zjZZAjkhuZrjtqi/d1tGPUQ4/ZPmjgwMxJ2qV+fo58xXiL2d
	EZOk6l4pDLumLtbwo0hRVhMX4b879uRjmwo6QPbV/SXzsQN5EF0uymhjsIYzpl3wAE+PpFwC2yY
	k40Z2rzZDR84BaFgbiu+dcIFd3nZpXro3FwOvg==
X-Received: by 2002:a17:903:46ce:b0:2c6:d710:3e58 with SMTP id d9443c01a7336-2d0340b1631mr3750225ad.36.1785357752407;
        Wed, 29 Jul 2026 13:42:32 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a6a584sm16174565ad.33.2026.07.29.13.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 13:42:31 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] gpio: merrifield: allow COMPILE_TEST builds
Date: Wed, 29 Jul 2026 13:42:29 -0700
Message-ID: <20260729204229.715826-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Intel Merrifield GPIO driver builds on non-X86 platforms. Allow it to
build with COMPILE_TEST.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: just do COMPILE_TEST
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index f03c05288376..4c02c56f6748 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1854,7 +1854,7 @@ config GPIO_BT8XX
 
 config GPIO_MERRIFIELD
 	tristate "Intel Merrifield GPIO support"
-	depends on X86_INTEL_MID
+	depends on X86_INTEL_MID || COMPILE_TEST
 	select GPIO_TANGIER
 	help
 	  Say Y here to support Intel Merrifield GPIO.
-- 
2.55.0

