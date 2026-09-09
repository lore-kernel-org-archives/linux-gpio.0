Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9943304BB2
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920047; cv=none; b=dmvn2bvzXYJu1nMJxFDZG5VXVf+xR10/vmAxr8uKXygn40HT8P74bgemxlFb0EIvt7h2+blwTgbVpNXHGVyGHnaOibIKggmANZE/b2BRH+s1C7RHQCgmWDndTaxyH4EZCo8m5KS9kOLExDaGhiHnC74luiL4StHC65hEHoSY05M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920047; c=relaxed/simple;
	bh=m3POdAYh+mlEmDdff4ZZ6pDy0lC5ZXqDrvuuGHOK83M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n038l5hBNy8Lo4qdguhcxU549iLQ+3Q4W/6GPfamK+ODhk27Hq9hfbBTzWH4NtTAblDb4JFTz293633Wg0z/MDSk2so30JxhazSAZm6HT/qwRmAFN2nQb9D6dJ5a4tnUBAOMRSwwzYNjb8wDwtxMnQAjQud27CSM56iwlvtJACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Aapf9qZ7; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=vID8yXT2; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Aapf9qZ7";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="vID8yXT2"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hfkrW2J6bzKrsl;
	Wed, 09 Sep 2026 04:14:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788920043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fl4J+oA6fWHnNlEvIkKv04kGMl+twpvrxO9i1/n9iBA=;
	b=Aapf9qZ7m4koabxophodom8T8UBEvmDMYXU3hs+/wofqPIhCGw0EVFqnSKaneliS1QXltT
	6lAt0U73e1cTqyT55G4JmLg4PMueSwXaVvmyA6E+6ikBeDabqryH6ULGdQhCN5R/e8H4vS
	g/Q+x3IKIKaEQcluZH3Kx72BK+WIBT1NZ5SlkmEleWXG7OlJNf5AK/aVnXnFwYyLa2X0TW
	jX7z3v9wUuf1yri3f6j3xQAwSzQa4tuPlK0oEKeptNrEQO/WW62Bzlo4vIFlQbteiznmzr
	Xu9efVOlIY6T7+ipkLSB5EoBwC4p94F7SEumT6PBfsCFCrrxnJK/NmXn6I+i2A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788920042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fl4J+oA6fWHnNlEvIkKv04kGMl+twpvrxO9i1/n9iBA=;
	b=vID8yXT26ZmYUehRSgssjFNqNDGid1fv+Vpg1NsA23xKjcko/bmkiDvByb8mIptB1WyU5x
	i3t8wp6YRSl/5N2Xhdrr5kVKSTzPM/CC7i8ANGWcwPMFwxr5cHhNgQscdNW/g9kt+CzCik
	yxcoKymzCtdUQqsx1upmDz56gQDHzaidNHh52fil2sj9bTeuqlNjTS8hc88QaM4DTTZA03
	X3IQdRsUy6HBgrv/l5Bi9KKxWgcm8a1vAR1QzV/Zn9RJlX/9+Y/acHbgv3y3JcxrKqLopv
	KVZ3kEsdWGdVlMuktiQ/AKtrGrFfMwvummmKwUaCb2PNZH2yEd9H3kUTNmWNLQ==
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
Date: Wed,  9 Sep 2026 04:13:11 +0200
Message-ID: <20260909021354.135899-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3585d77096695f46286
X-MBO-RS-META: sg9qq7z3h9mb1c6fabudugd7xad4ax5d

Document support for the GPIO controller blocks in the
Renesas R-Car X5H (R8A78000) SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
V2: - Add AB from Conor
    - Add RB from Geert
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

