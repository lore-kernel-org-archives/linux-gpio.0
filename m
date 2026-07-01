Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BDA3803F1
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 16:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925029; cv=none; b=N25KD0SwztO9ig/c0FuXrwz4HEMoicfblYpdmeKW0KHmFVhEo8cWb942Ej8C0/2pqwy8x3W1dI4K9cbGraZntJ77WnotSUVpHUsnGP+KGDmH8PXPCotESaQokHcnwQBfxqm9dnxCaO1stbAr0tVAOqEDL6C040CHlsp/sMIh+Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925029; c=relaxed/simple;
	bh=T6zTvLHUfv0YrCeCqtgrOJKLVr87FO6auql0RaSwsF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G9awFEddz4n4ofd+mzMbv6SATHDSbzEyjQ+z5/KYA26JhKzpYu8kVC9lLvCGt0b+FpnqWOdpOgKsMgk26H35F6oRZF/D9qvXpJeoq0pfjkdctLPtOaXFCkIgeK5q2ajJRONuSuuA8Pla18I/pJzhuCYrISPG5NGZmh9y2K+1xQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cSuZuf8G; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cSuZuf8G"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 452E74E40BFB;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19A3D5FD9D;
	Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86291104C968B;
	Wed,  1 Jul 2026 18:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K2wIb61d/vbPBh3LQKJdX0mxih1u5j8yQcVxqysPPzU=;
	b=cSuZuf8GDIuNhZ6U5aARBc6UsrU538PsigMWIn47bQOi3xRZ4rhckFNXxD9iuPK0qjHWde
	EBbHuVASC58WZVkYEtEfx2e6M+WjcvGanFpAzlgUp5Bc9lQAoo71C8vxDhuuO7yaKjOAN/
	MERhxkvZ/lPKSCf3BkuUr22TNulcwMElLPcD2R1yphq7bRrrGXCcqtZx55dpXgvwLvUYMj
	Pn3KzcNrX5g63O6RK+liQSID2F+ytFPTo/X28/VldBh+9OYAxpxJq0Bw29154jiYbXMiS5
	kWAckrB3aoNvunrvi//33soqtcQlp0Zh1dB0cPWQ2bk7NLBlcSkxKPclHsNZqw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:57:00 +0200
Subject: [PATCH 3/5] gpio: nomadik: drop duplicate probe error line
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-3-644d10316cef@bootlin.com>
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

Now that all error codepaths in nmk_gpio_populate_chip() log an error,
drop dev_err() call that is made on nmk_gpio_populate_chip() failure.

Current boot log:

[    0.544230] nomadik-gpio 1400000.gpio: failed getting reset control: -EPROBE_DEFER
[    0.544274] nomadik-gpio 1400000.gpio: could not populate nmk chip struct

The second line is always redundant (or is logged when we shouldn't log,
like ioremap or alloc failures).

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index 4a7db282bad8..eba095eeb3d6 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -651,10 +651,8 @@ static int nmk_gpio_probe(struct platform_device *pdev)
 	int ret;
 
 	nmk_chip = nmk_gpio_populate_chip(dev_fwnode(dev), pdev);
-	if (IS_ERR(nmk_chip)) {
-		dev_err(dev, "could not populate nmk chip struct\n");
+	if (IS_ERR(nmk_chip))
 		return PTR_ERR(nmk_chip);
-	}
 
 	supports_sleepmode =
 		device_property_read_bool(dev, "st,supports-sleepmode");

-- 
2.55.0

