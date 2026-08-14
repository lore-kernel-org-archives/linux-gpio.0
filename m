Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887A83546C9;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786688766; cv=none; b=H8Rbn+hNrMk9vYPodNx/5fv62V1E0oEQ/1hUfkpaUa/LSEp2y3ISXqxZ1TTqDQeqTcTa0umxFIO1YE1hiJxbjwOTJvcE4gRSqHvflNFypKtqkyKozg2mGGTqf0J51FZkB8ujMTyG+WDveM6yJK/nhibl7K01fzil1gvSy8MNJGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786688766; c=relaxed/simple;
	bh=jEcPzTS2r9CRkRuHf/bP0CLeDxdimN8/GXo8Hz0PSGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCo5Kx3TsbMWU5qim2NkCvZEJi07A2uR+XqIgmq5718fnfTy4vDlIhYAPetbse+eerY3vIgtomkv3NyZ6tQMbf3uBG2UF4ms5mbr/OCBA+j1rQHVwkY7SkXfZ2otDRG0HBKXWcrfp5L4P/7rJOHOPHjvSPzRDwujsU2r1sTCotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cluIIJKX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cluIIJKX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D865C2BCF7;
	Fri, 14 Aug 2026 06:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786688766;
	bh=jEcPzTS2r9CRkRuHf/bP0CLeDxdimN8/GXo8Hz0PSGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cluIIJKXuqBHZ52WdgHTuM7n2Y6Q10Fdb/oPdUxiAD/FDMi2lX0ibkR++omcjK1Dw
	 6c8t/rtEUoBHy4WtbuqyBOTIsNH99sverFbOtSyeJXqkkf8FExz0n9DJeBkT7E+am3
	 h5o1EyimxGqRJJUlyrs2tLlo707xsJxD4kQT50ZoxJYOk5hX9FERv7bydwT6BPSYBY
	 aeqWrEIin2psXYWaahYqxxw34DYvW5IKqjRVxIGfMKXJB7GkvfGOvGVJMwgFjRbFSf
	 eoXpFmEJhsi12tXJGGInuF+O3M3gB4XOmII283fEr1NOJflpMmtyA7AncyIsvxxOG+
	 vt9kUnXZJA/iQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00242C5CFDB;
	Fri, 14 Aug 2026 06:26:05 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Fri, 14 Aug 2026 14:25:42 +0800
Subject: [PATCH v4 2/4] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-cv75-v4-b-v4-2-ef2e83ec0eac@ambarella.com>
References: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
In-Reply-To: <20260814-cv75-v4-b-v4-0-ef2e83ec0eac@ambarella.com>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786688764; l=1941;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=Pngr7p+U3E/qWLbm7iUMOUjiAHv8IZUzMpz2/ZKNyVk=;
 b=9gDEX+Je0r5Q2wLy6qzP4LRjhNA9Jm5Y17qdFenFRkBmS6C5TEkdv4mfj5//eQwNfdo1gNbZe
 AnDzcY4Zc+QAdoBtRImv+Xgcd58ndHF2UNlNVE1ZGjknMdPprU8pm+l
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com

From: Long Zhao <longzhao@ambarella.com>

Document the Ambarella CV75 GPIO bank compatible and the synthetic
arm,primecell-periphid used with the PL061 binding.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../devicetree/bindings/gpio/pl061-gpio.yaml       | 35 +++++++++++++++++++---
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
index 4d970e55104b..414f8d4a3976 100644
--- a/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/pl061-gpio.yaml
@@ -15,7 +15,9 @@ select:
   properties:
     compatible:
       contains:
-        const: arm,pl061
+        enum:
+          - arm,pl061
+          - ambarella,cv75-gpio
   required:
     - compatible
 
@@ -24,9 +26,20 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    items:
-      - const: arm,pl061
-      - const: arm,primecell
+    oneOf:
+      - items:
+          - const: arm,pl061
+          - const: arm,primecell
+      - items:
+          - const: ambarella,cv75-gpio
+          - const: arm,primecell
+
+  arm,primecell-periphid:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Value to override the hardware PrimeCell peripheral ID. Ambarella
+      variants use a synthetic ID retaining the PL061 part number because
+      the hardware has no discoverable ID or assigned designer ID.
 
   reg:
     maxItems: 1
@@ -57,6 +70,20 @@ properties:
     minItems: 1
     maxItems: 8
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ambarella,cv75-gpio
+    then:
+      properties:
+        arm,primecell-periphid:
+          const: 0x00000061
+      required:
+        - arm,primecell-periphid
+        - gpio-ranges
+
 required:
   - compatible
   - reg

-- 
2.34.1


