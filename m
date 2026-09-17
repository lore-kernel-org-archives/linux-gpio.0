Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C60378D6B;
	Thu, 17 Sep 2026 03:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617295; cv=none; b=By5Q/9FuXMZ3W34TuNWCMGWEp2szllMWC3YovCIXRU+Q/s4puuiNaSyVYrppL6TN3TjiIvIQZzZqytpKLGZ5Pd82hQTB0sBYupsK6BCpk0gUHnwMviMS+icJLnTXjDOrYljGETb/+smjQrOVVjumOoN1wdwN3Ooc2jUlEvcmlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617295; c=relaxed/simple;
	bh=FnFprfLaNcz/hLEv5jHQiI96OeVZkEklWvIhYMDiwok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DRHfS3P4GEDw4HGgVMwYclCM5XLjQb5EvmTgTryFWTHpFjxXd7hJ3Ha2F09kFuHOgsM5vlm5cyEvliKMqytDzgQy1gIBVYDlxUzhmR1r7krVehTHUS5506DZfpMh01LxNOwnbnIdfxQ52EMxCpwNfBeLZRQKJAUtBj4j6ixAacE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jhnSr6kS; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FLVt3cPt; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jhnSr6kS";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FLVt3cPt"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hlhj62pCHzMlGf;
	Thu, 17 Sep 2026 05:54:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789617290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=59dI4WGegvNV2Yxa9dtBKybVTOTl1mQ2TPpo9rdnORs=;
	b=jhnSr6kSi/r0JOXMS13ck72S7T2YE0tG1awQM2euK3DXbfdNV9ZIA2VwrCbqjcqXOMM619
	iBVEWGApdI+nxdyc22bpN4ALY6O+CcHseZGUii4aPxZH5rhVd3gvtZTXBdvZ//8/zlKisA
	77lDlX9o8qqlmi1DYkF1EO7U9YPdIoDTt1p0f4QY1s5AcbkhggfToJY5vJpPJoVMDpLmy4
	mqjqsJhwctEZyIrW3n5A5NjvBM8aU0JcLSOpodIrLhZ40KWEaTarqKmTGD0O2Lzx5ofel8
	sF0MMyUimUstxYfEVpm/aZgXImIZkjYMUQ6VAPYFyCAorUYCZK0rt1BeczHCGg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789617288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=59dI4WGegvNV2Yxa9dtBKybVTOTl1mQ2TPpo9rdnORs=;
	b=FLVt3cPtXtwbvE7jJmI2hbRrm44rSSZZgxPmIaJv5fiSVzdO99GBSPlGXonzBmZSToAq0h
	8ZOjGJe3seWBJ5R/VUnICoPpMsvMTxAtFdJ5iC1RDGe2TpKfTny9qIu6z3cz9XOt7P7rmZ
	2mgHCJVSkSTRSlJ9ipaLuYMqwFflOt5lbaMFKaLm5DXIjznGw6YbHw2C72acplxvMKJoq8
	pczPCdoydTLadSywr2yQ7c7s8976UjrzdIIVnTRB0i4jAugkk8i17AMEJ6qnR/vlovcMNJ
	V/cBA94ABpMuJs5xxFHgMhltlaQJWq4lmf6pqo5FXLZt8wkDuPIjx/mvN6iptQ==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Thu, 17 Sep 2026 05:54:16 +0200
Message-ID: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ier1wx6n9c4u1ommgchwuy8ox7oz1741
X-MBO-RS-ID: 90b8ea45c3d7f42b50b

Document support for the GPIO controller blocks in the
Renesas R-Car X5H (R8A78000) SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Conor
    - Add RB from Geert
V3: No change
V4: Rebase on current next-20260916
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

