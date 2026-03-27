Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DF784039;
	Fri, 27 Mar 2026 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611024; cv=none; b=L6vLIXPYsJJ8pPdNkUwblcp4P5P/jqHgt9Ljr2mgMAHFPeN9X5Gi1BZKm357XxuhoR8tmW8ekZcPzLBRSJ7SLTVR/EalebRBhEEEnWfJnX99+8d+bnJAayqYhQlxHz8pXeYurh4IvLoDvlNhgnYUCkawnermcArhfOBDbyKO0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611024; c=relaxed/simple;
	bh=g52Al9YWCGtwUmdi2nk9qV8gQKZV5m7STqJ7l17xicE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BPL0ORmprrXi2Fscw/HiQz9gqKdrXub1yBRZApF/FKu9xmQ1IIx3u+dDAEOQj569RWeXdipSpcIzZqA0C4Kdbu5j/KIjngsIZSSKpWm/u5z1WcrfOqyLvml9eqX30OB0qqgVxhQ8uYfCSkBIDuur2RbtKxLtix+RHj653RDonkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hLG0PUl2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hLG0PUl2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0A77359D;
	Fri, 27 Mar 2026 04:30:14 -0700 (PDT)
Received: from e142021.cambridge.arm.com (e142021.arm.com [10.1.36.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114463F915;
	Fri, 27 Mar 2026 04:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774611020; bh=g52Al9YWCGtwUmdi2nk9qV8gQKZV5m7STqJ7l17xicE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hLG0PUl2wPr3QJUujLbGVwlya+RVrjtmTqqcNnDXLcXt30X1wQVX0yKYOkkstTCZX
	 vwF1cEDYsEMnzcvFLgDsxIM7SzneSBWO4CColqroxIRWEpizSTNCZ4LxWB7T32eoLG
	 E9Fb++Pl4Pkz0kcGitc0RHJdDQTRLOBHt2hZ6NYk=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ banks number
Date: Fri, 27 Mar 2026 11:30:05 +0000
Message-ID: <20260327113006.3135663-3-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327113006.3135663-1-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
instance, but it skips the first bank (PortA), so their index goes from
1 to 10. The same is actually true for the IRQ banks: there are registers
for 11 banks, though the first bank is not implemented (RAZ/WI).
In contrast to previous SoCs, the count of the IRQ banks starts with this
first unimplemented bank, so we need to provide an interrupt for it.
And indeed the A523 user manual lists an interrupt number for PortA, so we
need to increase the maximum number of interrupts per pin controller to 11,
to be able to assign the correct interrupt number for each bank.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
index 154e03da8ce9..f87b8274cc37 100644
--- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
@@ -34,7 +34,7 @@ properties:
 
   interrupts:
     minItems: 2
-    maxItems: 10
+    maxItems: 11
     description:
       One interrupt per external interrupt bank supported on the
       controller, sorted by bank number ascending order.
@@ -61,7 +61,7 @@ properties:
       bank found in the controller
     $ref: /schemas/types.yaml#/definitions/uint32-array
     minItems: 2
-    maxItems: 10
+    maxItems: 11
 
 patternProperties:
   # It's pretty scary, but the basic idea is that:
@@ -130,8 +130,8 @@ allOf:
     then:
       properties:
         interrupts:
-          minItems: 10
-          maxItems: 10
+          minItems: 11
+          maxItems: 11
 
   - if:
       properties:
-- 
2.43.0

