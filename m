Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA68E3976A2;
	Mon, 23 Mar 2026 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263730; cv=none; b=NkQ1yovAn/jBS9iWOgmOslhRIpUnPoi6BYPZSLir1nOiyHXW5g6K+Axt1yTSYbA0Va8XBlxvDppraYGEhxOS9CJTuPaddDL52kvtzirznNzUEnEmxR3TjQSupRPemF8ygFqEoYcEGH6NaUtyZDq2DdphD9/DOb6xnUQUnrp+g6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263730; c=relaxed/simple;
	bh=g52Al9YWCGtwUmdi2nk9qV8gQKZV5m7STqJ7l17xicE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CHhpU7hv8XmWP7ihZ0m2ZChjFUjw4E1WkqNzPkL7cbHHjM6AzamFCT6Fy+/+PU/IuisDAc1RRVInXh7Tp9wQpfDkN4m8HXeGH1gwKSTujDGw2erqPtLY3Mgcss+IT9K5mNmWJzqoU3jZMPgPbfpy/F8WE+jQBLvlUiJfsVUuAFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 665FF1692;
	Mon, 23 Mar 2026 04:02:02 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C37453F73B;
	Mon, 23 Mar 2026 04:02:05 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Michal Piekos <michal.piekos@mmpsystems.pl>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: pinctrl: sun55i-a523: increase IRQ bank number
Date: Mon, 23 Mar 2026 12:01:49 +0100
Message-ID: <20260323110151.2352832-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323110151.2352832-1-andre.przywara@arm.com>
References: <20260323110151.2352832-1-andre.przywara@arm.com>
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

