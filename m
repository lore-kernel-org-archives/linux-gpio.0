Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376E83947B5
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 10:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505762; cv=none; b=jhjnQ26gqqIzuTU6fb+H4dzVXStQHx89iRAne1zVFH0aIOdJCKssmQ+/v9TsiNvnUokgAfhk7k9z4ALA1eXCqDO3r6FsiHUIlZXKW4hmHvhySLfFx0mE4C64IKKBdDaIyV3q3oSFDRXXISociQQRgJOgUyhsB4DtgTx8Mh9wk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505762; c=relaxed/simple;
	bh=xbFRoxhXaEBH4Z6kI+nDJgr3V2xJJCGk5mX9z2OeP7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rLHfBNxRBNzMzCfZSN2iilgNfLRBgykm/hCHtdLl4y/CljDQQ613O85dX+5NATrClt2rM9HuxhqvPkiisc04g231Ti8B0vvXp8rmIK6h9lgMvo3XDBO+fxuNDJbf1tlqce7JvuyrNu6goYOTFJdHywhLZXkRF5e+l077Vlhnqy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uc7p0jaN; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uc7p0jaN"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CD5BEC8F448;
	Wed,  8 Jul 2026 10:16:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8DC260337;
	Wed,  8 Jul 2026 10:15:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C98A011BC3422;
	Wed,  8 Jul 2026 12:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505758; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ef6n7iAZaYmW5RfDmOVxwgE3Bkk2FUJ5t2gDf9cNlS8=;
	b=uc7p0jaN1tBDRfMkZFYORtAT4IttYYgrTg7xpUsZZKoYIXaziU2iGmMFvnSQPOLkPHjUyw
	298u50wwdKRaWJrYPzoIJk5/kahNc20YmaNESxACtEu0UIgfohrC0xFFiLOcoWqtzzebBN
	ojsgDYGYZRe2fu5BsqdYA5mPrR7VhdD3t24OwAMGWKYIQ1ua7uhCKlNWe7A426DTAiaRcu
	Nw5xBJUR8ZVwJEQ0NcMeO36UndP6GnClRYJB757H570zlrGbopVz6hRSClnAR3ye0tqBZd
	RHuy0PAy8zUdeIExr256zYiyarOFaJkipSXcuGv6eBcU2eKUdH36KmYxnt5wCQ==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:18 +0200
Subject: [PATCH v2 05/10] soc: fsl: qe: Use generic_handle_domain_irq()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-5-1972044cfbd1@bootlin.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
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
 Herve Codina <herve.codina@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1188;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=xbFRoxhXaEBH4Z6kI+nDJgr3V2xJJCGk5mX9z2OeP7M=;
 b=KOg49Ld9mc1j9DuvOxFnlANkXiq6UTbCePbNYkfANdBAfH1b1YhRpaqE+ndIEl0Nek+gHkpO/
 zsqnFBfn0nMB7RU6OQ9QQw/kDGp22n0VVork7kea44xzld2Nta9Vwsc
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Replace the irq_find_mapping() + generic_handle_irq() pattern with
generic_handle_domain_irq(), which handles the IRQ domain lookup
internally. This is less error-prone and more idiomatic.

Remove the now-unused irq_find_mapping() call from qepic_get_irq().

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index c3768c82a58c..c8fff45e353c 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -78,16 +78,17 @@ static int qepic_get_irq(struct irq_desc *desc)
 	if (!event)
 		return -1;
 
-	return irq_find_mapping(data->host, 32 - ffs(event));
+	return 32 - ffs(event);
 }
 
 static void qepic_cascade(struct irq_desc *desc)
 {
+	struct qepic_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
-	generic_handle_irq(qepic_get_irq(desc));
+	generic_handle_domain_irq(data->host, qepic_get_irq(desc));
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0

