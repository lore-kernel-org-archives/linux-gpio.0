Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B20F47CC87;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=uKBOub+5BudoZ7XnmhHpllvtrTZzcDrM64EtAll1WB/m0w/+vfRNZRPDBl6QSG1eCU8BdQUkjWZCkUVgNE0t4TvSQl4LXtSH9rpPQAuKdGuWEcoNJAUVMM4gEJvji3d73iLpnT3mSXPxPQsRPXYfH3jCJHyB2mfbaGz/tNmxHyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=Lj8trtWQfaFBHXdt0QqGJtFpFf56yIwo4fW2wTI2b7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aGOnsm8AIX0fLiYL/O9Rp2bcDRYTGSAU/BxUKOWkDxLfKJ/26qGsT5GpzBVQY2v250MXnCyWZSIsxQ99IylTS/76HjD6GPEo64mNgMGlR1okI1yy93XoC9kMP0gICdE2CAG1K0wxWKmTmbcxPNAy2jGycnw/rYxmXaDh0zHKrSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkJhn/Mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkJhn/Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36577C4AF19;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=Lj8trtWQfaFBHXdt0QqGJtFpFf56yIwo4fW2wTI2b7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NkJhn/MiQHFSb5iiGBM4K5XbVvirLc2GDhWHlcseCrm/EzJHL9Z3ilkFJPmLODcBi
	 ZCwoPkKc9CdHM9bjoj4McI6EV13oJcCR6mbLUPJhJwsuf/Gg8cM0A3EYM5UhBWxjgP
	 Q0l9cJWAOu19J0HiBQP/Bq4OGxb+IrHxO4ZPAteLSO8Hr9vUgoxF3y6OHWIWlmUldU
	 6FP7p4YTKOYam4VrdzFb55TLGPHFWof1L1ijoc3YxO6jgfW95Si/m8JqVlZ254l7CC
	 vBQLWaZIMFUbjAav1uj8CYKB87oYE/KHIo70z2g24bp3bJ65MFfcvsXreVF8w5SxbG
	 94YaLrHMKT42A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24566CA5FA7;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:40 +0300
Subject: [PATCH v18 06/23] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260930-gmsl2-3_serdes-v18-6-43117818f499@analog.com>
References: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
In-Reply-To: <20260930-gmsl2-3_serdes-v18-0-43117818f499@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>, mitrutzceclan@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Andrian Suciu <Adrian.Suciu@analog.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>, Martin Hecht <mhecht73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=2103;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=m0o3H8TQMy5eBukVge3aDky1f03UCMkFBStUWV3bDPc=;
 b=9Pi4aRjCbFjYWz5jTOjc0+A0p/1vMnDkHfmzi1vGOEytlIoUArOPat938s85fDmfj7cBtrOX6
 9pyFopUvwIuBQ9MvQmKq0OH4b6F6RDjSVp8NR3yKt0A3OqRHsvqXWln
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The MAX96712 and MAX96724 support up to 4 separate PHYs, depending on
the selected PHY configuration. Use patternProperties to document this.

The input ports are all the same, use patternProperties for them.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Martin Hecht <mhecht73@gmail.com>
---
 .../bindings/media/i2c/maxim,max96712.yaml         | 29 ++++++++--------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 26f85151afbd..583bbd60157c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -39,27 +39,15 @@ properties:
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-    properties:
-      port@0:
+    patternProperties:
+      '^port@[0-3]$':
         $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 0
+        description: GMSL Input ports 0-3
 
-      port@1:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 1
-
-      port@2:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 2
-
-      port@3:
-        $ref: /schemas/graph.yaml#/properties/port
-        description: GMSL Input 3
-
-      port@4:
+      '^port@[4-7]$':
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
-        description: CSI-2 Output
+        description: CSI-2 Output port 0-3
 
         properties:
           endpoint:
@@ -77,8 +65,11 @@ properties:
               - data-lanes
               - bus-type
 
-    required:
-      - port@4
+    anyOf:
+      - required: [port@4]
+      - required: [port@5]
+      - required: [port@6]
+      - required: [port@7]
 
 required:
   - compatible

-- 
2.53.0


