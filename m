Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FEE3BFE3E;
	Wed,  8 Jul 2026 10:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505765; cv=none; b=CnooBFK/3HnOFWphUAMFc1RPzOVvxNCtS6j8pIIcAmmXns0NnYKQ1ZDkL/taqGclj7eDNH8xC1vNe+IN5ooCcRCK8N7k8gqf3zlR6WrvGbb3F6ScM8nVTD4lZta544egK5CLqjzLA+1VhvWTPJ3K7fG32hMIwdgppxa8KH4b3qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505765; c=relaxed/simple;
	bh=r3vHDvUHA4dsL1TckJnFW5O/nSaMdIgcvEIKqUzCiFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CIGlfa3E1fK4gKckZvzZ044mSjLqGcCG89Nt3dA5zWT67DcXMfg8MW9/6bsUy1hS86qT89MHv+aL24AFA+rR6X41mUtlH3p7SmbvyyD3RSLN7FYnm9ekJ4Tyh41v0qvYzZjGwqdyQtzwa5TgdYjpv6JcZaEnnpAPYlXIRYG1TDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DSEs8fMD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DSEs8fMD"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A1554E40CF7;
	Wed,  8 Jul 2026 10:16:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C490460337;
	Wed,  8 Jul 2026 10:16:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EC20211BC3441;
	Wed,  8 Jul 2026 12:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783505761; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QVQjk372EQ/aOAJi0x59NYkNGigxMXbij6zxAURUnhQ=;
	b=DSEs8fMDeP/WWEwk61m/T0e2qmm05KRT/+q28FATN+T+VD72LPiZllhnFvh/Hw7THfdTne
	N8qV6xtalmc7fdkli0jgAQJ6vcnr2R2ccsJNEZSmAOksCpBrcoaldsxV+Xn2ta2V24f4HF
	LcULpT+XNrPsc3YNuKuFRG2Bn6Hh5HZ9j7J1kSSjPLUSafW2piDsdhBqbMzx/YGIbEHGEj
	u4Svt65rNegyALp8PfWf/w4poWF+cjBFHtFUpd3u9h9UCO5+S7mkbWoLUAEjIMagxHZ3SS
	KxCnkLXaVNbzkHxXFkNJZYEgre+S1M/642bIGdOuNTWBeczmxr0sbrqapY1UBA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 08 Jul 2026 12:15:19 +0200
Subject: [PATCH v2 06/10] soc: fsl: qe: Iterate over all pending interrupts
 in cascade handler
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-qe-pic-gpios-v2-6-1972044cfbd1@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783505738; l=1700;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=r3vHDvUHA4dsL1TckJnFW5O/nSaMdIgcvEIKqUzCiFU=;
 b=ABpT7RMI/xBzLmktdMmKXMO8zvzIO82law6Twa+KbFNhxcTIjcjZuEkcgCDCJ8oAn/2GgsYMV
 MGbI0UFWhEeDmThOPn8z2KSed9MI3EtbSACz1kkITb0/AbrbQPX6PH5
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

Instead of only servicing a single interrupt, the chained handler can
handle all IRQs that have their bit set in the event register.
This avoid multiple parent IRQ handler being serviced if more than one
interrupt are pending on the QE PIC.

Remove unused code.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index c8fff45e353c..bc8b68e5d1a9 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2025 Christophe Leroy CS GROUP France (christophe.leroy@csgroup.eu)
  */
 
+#include <linux/bitops.h>
 #include <linux/irq.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
@@ -70,25 +71,17 @@ static struct irq_chip qepic = {
 	.irq_set_type = qepic_set_type,
 };
 
-static int qepic_get_irq(struct irq_desc *desc)
-{
-	struct qepic_data *data = irq_desc_get_handler_data(desc);
-	u32 event = ioread32be(data->reg + CEPIER);
-
-	if (!event)
-		return -1;
-
-	return 32 - ffs(event);
-}
-
 static void qepic_cascade(struct irq_desc *desc)
 {
 	struct qepic_data *data = irq_desc_get_handler_data(desc);
 	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long event, bit;
 
 	chained_irq_enter(chip, desc);
 
-	generic_handle_domain_irq(data->host, qepic_get_irq(desc));
+	event = ioread32be(data->reg + CEPIER);
+	for_each_set_bit(bit, &event, 32)
+		generic_handle_domain_irq(data->host, 31 - bit);
 
 	chained_irq_exit(chip, desc);
 }

-- 
2.55.0

