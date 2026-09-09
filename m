Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E9582B9E
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 16:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788971792; cv=none; b=H8JdfbM6nbMaVD7TUCT+pzuR4qDG+pt7pYhlOZdLOmPnPRlRo2VJKTC9IzRbaMqQoq/yqKaDHChlvy2Cuhmfv2aHGaVRIj2FbmOYjmfHAj9AG0uenvj2RSXCyZbeD8MuBgAp7LXaRGOr5ZjtR4BcGV+CyFa+aCR+OcrxzsHdB2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788971792; c=relaxed/simple;
	bh=nxJMyW2KES9jvdUVk7ZisUZkd9/MeO6bf3swemaGG+c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DOP6lkSCG1/lovJej4nX1mzddf1ANQ08ftzHYSH0F7GxQgFeOv7KbaVqpiy+RpUdnmtPIPBUM6vVb264JfyChjOvZSjyBPlhvu/wNJES1SJtv/AfqXvPkuuP3BAcVw9k//3F3kxnfyF+GqrfwBi0MkpJM33WyvDVOm3jyU9seM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mR7DfNNo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UNmNcYFc; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mR7DfNNo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UNmNcYFc"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hg5zc0CWHzMlKR;
	Wed, 09 Sep 2026 18:36:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788971788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w3TBALJHvonHQbpy/cSR8YWjNR9E1xU+golve+iyG4M=;
	b=mR7DfNNo5gJjTo0TC6ziyciBqzK4hC39loo+eursvvl3IthZmoNomsRQ7dPCpE/CXDpfZj
	FLgNtKC86n4JQSxDIl7MQwZrorYkTvOvRGBDNdBfLoa76gRpBaf0q8jNaXQ5fEjD78Cv8O
	3XruthGKzFGegBdLGn4tZogvVjlYlEXPyfJClkXYnaX2gXKMedDap1TzIACt/qLm67M6EB
	xxYYvd32wdLnnUFXDeLYcxoYBXJo7wYplOkUOGCT1b6fza4UKe4Q3wtdeNRg0bKmG4MhXN
	0xxxRg0MkuCQW2TYTywngnF7rwMd9l+OD8rECWAYINEDz83aLWX9Ssx1oPhrIw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788971786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w3TBALJHvonHQbpy/cSR8YWjNR9E1xU+golve+iyG4M=;
	b=UNmNcYFc8y25Dn3p4DzbjP0qTgi9vtNnHIoA4pI3Gj0RqmSyEJPYkRenRgK+4J4qAUsuZd
	3r1oD+T7lbhRIL9kx0bQ1CIB+KK6fFvmjCZgUvs7A2lDNwfaThE5nvnfr3bIMLHEu+cO6n
	s0D9jK/2ApRvmSNOQeX1IGqjvQyXaAifux5v8LV4LQ5fv1V6fKNAxDQTn88gC7+S4iFe7G
	EHwoXr23nBBXMGxFDDqfYB2VHovDIGT1ldpB0nXUU3zQLxL5cw0EJI8JvK/mTNVCkO6mNj
	dwC63z3xKvhru5n3hIGDdHsbEVlZ+YE6FqL4OwhkHiyAbLStraEg+iiZkSXYKw==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Wed,  9 Sep 2026 18:35:04 +0200
Message-ID: <20260909163621.96288-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nfpaizrk4y8bd1ir9s57ug14awbb1rjf
X-MBO-RS-ID: 02ca7bb08d74792a1f7

Document support for the GPIO controller blocks in the
Renesas R-Car X5H (R8A78000) SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
V2: - Add AB from Conor
    - Add RB from Geert
V3: No change
---
 .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index d32e103a64aac..95f5175c7a9da 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -56,6 +56,11 @@ properties:
               - renesas,gpio-r8a779h0     # R-Car V4M
           - const: renesas,rcar-gen4-gpio # R-Car Gen4
 
+      - items:
+          - enum:
+              - renesas,gpio-r8a78000     # R-Car X5H
+          - const: renesas,rcar-gen5-gpio # R-Car Gen5
+
   reg:
     maxItems: 1
 
-- 
2.53.0

