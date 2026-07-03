Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C573D9DB1
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085451; cv=none; b=hAT3onPNl7J8LjSOVTPEwolDh6qRlui+kj9+lEu1EYr4tGBMc44L+1xQ+G4DMyeZ/xc7FLdT772nF2jiY3kQVI0VSrVw9ZDXHrRqRUGNbShtd3xAR5F+vUA3z/Ko+/gjyA+IvVnHiMqC5/40zSnpNmlq9BUSeKVo3wslqsUaR7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085451; c=relaxed/simple;
	bh=GK/kK8XvyJnCOp6vz8jBjn9EMBNybdfgy5x95pP3Kus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hOqgpTBVb9mgQEfEJV9XYlmVlArbYOrusrdfbF6sopbsDygwk3sJCGf63KahrlYysMmb8YKiFv2ZSmzOs4Mpz4sgsMk0B7QmNoe2rl4KMl/dHy6A9+NzkrFMjeCZiCIItAvpU6vbGOpjqh1jdXAN4CbYBHn8sZs3LrE0hBx191Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cLU/0VDl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cLU/0VDl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E82404E40C6E;
	Fri,  3 Jul 2026 13:30:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B600760300;
	Fri,  3 Jul 2026 13:30:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 507CD104C95A6;
	Fri,  3 Jul 2026 15:30:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085441; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PicZCkwsklXN0ONboTGqm4ynP8f37fEnTaMMPeq9K/A=;
	b=cLU/0VDlQmsFHLwP9z53WZpW1FIHFoSql5sKKxv1wOwEqpskQjm7bjmc23mfY7vqTU3zZl
	ZYfBnxigCeZO7V0sPkF6/yVqeiA/pSrE3irTBBnFGCI8tOFxQMytKsBt2z9BBJL7Ifc3oJ
	RjWKL+9fCNRvF3lRnqW13uBZKMtGx+J16R9JSzDskJUoy56HXjNuINffWi8jvbsOxbAnFm
	7rgLt/yGuAuTZjJY4y/IVpYAScqo6F0HQAfMyHpUms8ih4OxrdNJ0l0IZVMvXMy+dkqsEL
	r1/LOrPIauOOhEfCDu7v/orZ/V2udBbctPYtian33WQVPqa6BzNoz53+uzH1DA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:15 +0200
Subject: [PATCH 07/12] soc: fsl: qe: Handle spurious interrupts
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-7-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=865;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=GK/kK8XvyJnCOp6vz8jBjn9EMBNybdfgy5x95pP3Kus=;
 b=VDBcjajqYHWq3dKjYVCVZd0ZABbny6CisoyUEYgZT1kOEyitshUxNq4S0WMOz6TD8veyDwpI3
 d45jQJ9sQDnAUaiA3GwthcRzuBb4+L9lBtxm0OOz+ITlgpCReL9kh0S
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

When no interrupt bits are set in the event register, call
handle_bad_irq() to account for the spurious interrupt before
exiting the cascade handler.

Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/soc/fsl/qe/qe_ports_ic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_ports_ic.c b/drivers/soc/fsl/qe/qe_ports_ic.c
index 27b62f4e3afb..c8b73b0aa233 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -77,9 +77,15 @@ static void qepic_cascade(struct irq_desc *desc)
 	chained_irq_enter(chip, desc);
 
 	event = in_be32(data->reg + CEPIER);
+	if (!event) {
+		handle_bad_irq(desc);
+		goto out;
+	}
+
 	for_each_set_bit(bit, &event, 32)
 		generic_handle_domain_irq(data->host, 32 - bit);
 
+out:
 	chained_irq_exit(chip, desc);
 }
 

-- 
2.55.0

