Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD768384CDE;
	Wed,  1 Jul 2026 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925030; cv=none; b=YIhLtNLksoOF3S3waQJ33HvZHNzeceC7DtVoP6zykuXVUoHmtnWs7wXLxsuozikSUkdHMylR6YxbmLWbvCiorjWS/T73lDmPyaoUSo2awZ58uO90SVgRj2Lr4Fw0Zx03CpTms4Rm0sr40mxDdajAXjv2Wa0Ct4/nSv394xruVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925030; c=relaxed/simple;
	bh=6o4fDyhL7t/t4eKdNEMd2rEBBEx6ZGkhlu3TCQNGSio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9x5aEc4wdaMi3Ttxo3XcoKt3awWbY8sUSnyn4YFsOVeihgOkJqfRwPi21EoiHSHh0Z5hebdso593dTQ7rCtdNtcZvuMSwPoYUildg0+j3FWEyiDvYXp39dxaUgoxSTE1OEke92kPoDh21iuecc9xywI8F++DLZkwvkG8cEIMtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=int3NKhg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="int3NKhg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8A925C4FECD;
	Wed,  1 Jul 2026 16:57:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 852AC5FD9D;
	Wed,  1 Jul 2026 16:57:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5BAB104C948E;
	Wed,  1 Jul 2026 18:57:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0XjqYUV6uWOO/CR3IsfQubms5Qr7YsKpk3FucyopeU=;
	b=int3NKhg7SLAN8ZzlX+3Ualoffw+mXJvJgs8ByUX4Y5GG+8c3errKU+GrG/8yIZ42JkHc+
	yRz0T9LYqR46hIRad8KaaUOwDZr0kLYpN3lOF36iWZwGREZbyhxj2zu7pj1VQZVUycUrfv
	shaLBkjF3TaUhFbpspWM5bv33geNWiEEUozbB9tashUxRgqnljFSpQpUjBEuHpqGVFMuTv
	vTOuehDsG8CK0jzSCXQMA47Qu8qOrs0Cg49hAmvRvH0fA6bfWZZDC09nePKVXeo1xB7/C1
	5ZBxNEUcD3L2O6mjI2sBFF0KrVCBbfJcNb2ySATGpoRzkpIpqhrLn9gAlGBlFQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:02 +0200
Subject: [PATCH 5/5] gpio: nomadik: drop "chip registered" log on probe
 success
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-5-644d10316cef@bootlin.com>
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Successful driver probing should be silent. Drop unconditional
dev_info() call that is done at nmk_gpio_probe() exit.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 1ee46f59d708..244331f468cc 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -712,8 +712,6 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, nmk_chip);
 
-	dev_info(dev, "chip registered\n");
-
 	return 0;
 }
 

-- 
2.55.0

