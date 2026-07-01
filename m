Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A19537A496
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 16:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782925028; cv=none; b=i2fMXGExQDQkugCJuN1smNbB25dMCZo4WFczrcTJIALMTJ3XS4jk0H/U+kvIF3n6Rxtls/WmUvHezDRevm8KF62HYDvm4XPZTSt0z2lo0YOVqA4F8gekVanKzeaIHnNHPHfjY1Ro/nFq4YX5A0bFheSV7PDRPfGS7+Vl/+Bs0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782925028; c=relaxed/simple;
	bh=6gQ1BlSGrxCeoHcpACwzOZA+dlnJVoiznhFYevrNs1w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RnSI0AA/aHVfNJccpTevibk7wn57nn/9Iur/cY4uY8Gix/UqPPmhLC5FRX7qn0E6B9px8YpkIAFlgKhbCDmRBKlyRTePUCcgcN4433QIY0o7G1+/06NZRG6eixTLyrHtW+NxA8Jyy76j+zJC2H3AuLqZG1dfC+Mab0sss7DwDk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HftNtOmz; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HftNtOmz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 10E68C4FECD;
	Wed,  1 Jul 2026 16:57:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 073D95FD9D;
	Wed,  1 Jul 2026 16:57:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3985F104C968C;
	Wed,  1 Jul 2026 18:57:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782925024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=R6cCDMcE1p/9I6+WmIV0DfGkYZtlEQgIJeATtpeJyo4=;
	b=HftNtOmzyhbBMGZvqUlgvKY9D97TOBHEPHo6yBJcbOimL8Dxe3tDhdRVNtywYK2uxesgso
	ofOzOoc8SB9XrcQCjyJlo/klPk2pfpB5B8qmO1zGT1qKBAVZkBFPn2W5CTIhyrNr40Z2Pi
	cVDP9Eu5QyXm8SlKmqIic8HJpgvPMX4A8m6fzQArYrOS46aPv85N/wSMsw1v68k7kj67Bm
	YAp46+7HnUReIX+s0eLxT54Lzp2LDQ/vdbhAIhon0jiB4AUpSZ87eZyUPOhd7ONxG60Zbg
	DqKJAtICVbl2GT/bcCol/m3kb3GLu0vfYn37YkR2dH5VtsK8YhYrk4nZ4+NO+A==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 01 Jul 2026 18:56:59 +0200
Subject: [PATCH 2/5] gpio: nomadik: add missing dev_err() call on chip
 populate failure
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
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

All error paths of nmk_gpio_populate_chip() lead to logging errors but
this one (ignoring the alloc or ioremap failures that must not log).

Add the single missing dev_err() call.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/gpio/gpio-nomadik.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-nomadik.c b/drivers/gpio/gpio-nomadik.c
index f25f251f4757..4a7db282bad8 100644
--- a/drivers/gpio/gpio-nomadik.c
+++ b/drivers/gpio/gpio-nomadik.c
@@ -578,6 +578,7 @@ struct nmk_gpio_chip *nmk_gpio_populate_chip(struct fwnode_handle *fwnode,
 	clk = clk_get_optional(gpio_dev, NULL);
 	if (IS_ERR(clk)) {
 		ret = PTR_ERR(clk);
+		dev_err(dev, "failed getting clock: %d\n", ret);
 		goto err_put_pdev;
 	}
 	clk_prepare(clk);

-- 
2.55.0

