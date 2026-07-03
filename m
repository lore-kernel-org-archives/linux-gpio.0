Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11D3D9550;
	Fri,  3 Jul 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783085444; cv=none; b=f/KccQcZK6RoTcojTaSd9kXNgsdTGtmdskXgdLt2t9qX7CUrMjSroymwYQ52xQcQzD6hnw8792kl2TF5UmpNe1RPfESNl98R8GsEHBW+uUBQEgzxU4SXNT656o55HhahWafrO+3oSVJZlBdUBA/XLqZUXIyV2jpm4WlX0A/ocHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783085444; c=relaxed/simple;
	bh=xh3J/yehN8UC4skZeYunKje2AyGUEPreRelgsF6bPXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CweWd74WoMXmIHzjr4wd+NW+rkCEbvf0pVz+rOziXvXPi7MjFQZyLJlEjYeM1MgkrErRAEjx1VrayKmLokGPj5pTApGxH9NmX+pL8s8Kqdb+Ypvp4w6SFZuQiALjS36u2zUiVCYv5vsP0eVMIzYjS4HRlbVeIqBI7PWqvsGydD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LDOI76AF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LDOI76AF"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77FFA1A0E22;
	Fri,  3 Jul 2026 13:30:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B7F860300;
	Fri,  3 Jul 2026 13:30:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7068104C95A5;
	Fri,  3 Jul 2026 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783085438; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8mtDoFhXswuC/Fb3MOchFMXyQIHaEFUqs3TGvCFW1cY=;
	b=LDOI76AFlU8LB51q4606hVeKtBuHdpjPbYA4HM8+hwKKJ+pIb84ZAZAWxqrmJZsURzW9sM
	1D9v1FEwNrx0tXig0xH0fv/mtOCAHv15gjlyWKbBSAS1uugILd4iIytt9ud0Ppz0RlhH0Z
	n8y0vOv9yCS41vjGQhT9YODDkRXaPhj2GSSjLvgoy1kQoA8Sdk6Y5WA724NXYnrxFhpMqZ
	zezjPS1zV3T0Z6Rje/vZXSRVl1lvFJk9+uYc5GjK5KB3BMFo8n9i2obSdBDTemsSX3hX7X
	L0djfQX6Uv0xPVx45tcdScJr3sBvL9Jd3XcW7NTwIj3w0hUofXaXt2Idm3UNnw==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Fri, 03 Jul 2026 15:30:13 +0200
Subject: [PATCH 05/12] soc: fsl: qe: Use generic_handle_domain_irq()
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qe-pic-gpios-v1-5-6c3e706e27dc@bootlin.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783085423; l=1188;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=xh3J/yehN8UC4skZeYunKje2AyGUEPreRelgsF6bPXs=;
 b=OhDYefl04DqWAR2+1nnrmqIh1RwojaMp4tD/M4EE7ECQE+hjq6Ia5Riajy2pMu5LWydJ8ajp7
 ejWrkDJSIoID+/yejEvNexQ7cx9jpYKrJMiiYSpM6AjN53IhoYh8sz/
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
index 73a77763210d..3bca116fd2f5 100644
--- a/drivers/soc/fsl/qe/qe_ports_ic.c
+++ b/drivers/soc/fsl/qe/qe_ports_ic.c
@@ -75,16 +75,17 @@ static int qepic_get_irq(struct irq_desc *desc)
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

