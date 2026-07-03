Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96F63DA7DD;
	Fri,  3 Jul 2026 13:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085456; cv=none; b=u9gJzcmavaUDfEsHn/HMoh5tMS3SYEAjUlOAkhEQhVb+V/9iZWy7UroTg8BdU86bDZ0Vdias6x3s4gGHLlFvz9u8JUKH8MgSCnKWX+w/ML5CAwjNaHWQTzSKHAS1G7XFfuF2XaQgnU5Shbm8+OMeZ1gFFFSQIlbFJnDh7FZF5mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085456; c=relaxed/simple;
	bh=lV6ixfVQUU+h5OFc6ks1zgWp1h40IUo5QKv+Bi6rpy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gfZl+xefdHiAMwQr4LcLjnSYDO0epryaNitRLcp4c5n7RvnLZpr5UTNK/Z6xB9DcLp9TcSzJxQ0i1kk/cNURXZvuWXdl+vrOgmpwbb2lMDZ3Bm+7EVjib2V4nIJwXJjH64n0mZb8jAdiDZXL5NJd9uEccRghKTcq9HdSegKwGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TPFDubIO; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TPFDubIO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 01BD11A0E2D;
	Fri,  3 Jul 2026 13:30:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB6FA60300;
	Fri,  3 Jul 2026 13:30:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2806104C95AB;
	Fri,  3 Jul 2026 15:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085448; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DYiPuRvE6Nwnxm1ayjjfGRCixDjRGX9XFfBMaqcehNo=;
	b=TPFDubIOOd12n77ZxYKru+sNA7xfghnI7Q5u0bwp4fAQxtAEOXWdCwOjBuUJ6H/lVmev8p
	At01ZX3W66RGbqXG6frB42AukdRbTiqgf9Ne3YC5tw1lFV81K1EcbqbimuX1VgsLsFsJWn
	RgL3pNdq/GHpFeAJ7uzls9MGOI5yNN76s/TXzF09XOf0LcnI4uvnQqgvmkfrEwZXtNhtng
	F9iI2hXF9H/6d6dtDGHA1MZRs9g1pnlYftrTHfaN8Tm4mLwIG1GTtftPFd6+jRiN/ninp7
	+/TeZllHOaEtIknkmkI0euNQrkn31XiYid5PZ4uVeX2/UaR7O6aPY0+apyckgA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:19 +0200
Subject: [PATCH 11/12] soc: fsl: qe: Remove useless struct member
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-11-6c3e706e27dc@bootlin.com>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
In-Reply-To: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
To: Qiang Zhao <qiang.zhao@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1530;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=lV6ixfVQUU+h5OFc6ks1zgWp1h40IUo5QKv+Bi6rpy4=;
 b=GTd53N1L6mieV9LlVEep06QMzjN/ESane6rFL5nBaGQzPhkH7cvOjjXeGy3noJBEpv8mlEyJD
 09JzWIAKFqZATFJ0g3rY981zqaR5bWzMCKPO8dxQ09la/CBBR6EG1Kf
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The reg member from the struct qepic_data is no longer needed, since it
is now embedded in reg_base of struct irq_chip_generic. Remove it.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 1bf2af087b78..6cf23a721ff3 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -17,7 +17,6 @@
 #define CEPICR		0x14
 
 struct qepic_data {
-	void __iomem *reg;
 	int parent_irq;
 	struct irq_domain *domain;
 	struct irq_chip_generic *gc;
@@ -144,15 +143,16 @@ static int qepic_probe(struct platform_device *pdev)
 	};
 	struct device *dev = &pdev->dev;
 	struct qepic_data *data;
+	void __iomem *reg;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 	d_info.host_data = data;
 
-	data->reg = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->reg))
-		return PTR_ERR(data->reg);
+	reg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(reg))
+		return PTR_ERR(reg);
 
 	data->parent_irq = platform_get_irq(pdev, 0);
 	if (data->parent_irq < 0)
@@ -165,7 +165,7 @@ static int qepic_probe(struct platform_device *pdev)
 	data->gc = irq_get_domain_generic_chip(data->domain, 0);
 	if (!data->gc)
 		return -ENODEV;
-	data->gc->reg_base = data->reg;
+	data->gc->reg_base = reg;
 
 	return 0;
 }

-- 
2.55.0

