Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13616419FD4;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182499; cv=none; b=izLSl1Ze0ArKRB+7kgwxixr+5eLK5MCnWy+8HnnFP/6qFHwEvXRmdYrXxJkLdORlI2paMnno+Sgdke1/kcAjAk/5hkq5RIibQjy4RtjbyvC4uGFSISYDr7fIy2Aessv8lRmQ7qHP0G0m8HRKD8GQ8l7nTQcrR9UNApLES8p+S8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182499; c=relaxed/simple;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y3WPcDCQmfFcPPUxXi4R8d7CVuFuAGFDPXgMpnJ4/cAhnzuN5v+V+SQL0shfYlVDR0Hb7MYpv0Xf/4UDa4zuvvCaKbS3QqCMsWq1cdKupEjtmtoRSA/bKTFD11Tcn3jJnfuizTQgAWp/+UwKGowM3S5nvZS1saLA8SpvaOo6T7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzIdqECp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzIdqECp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E76E1C32782;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182499;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fzIdqECpF8ZT3ypNyKnWO4rTfjy1YR+SSTDqBJ/FveZzbTxaE2yrcTwQE+mTzOvAg
	 sddbqjKz//RJdcV4FgWqV9S+pJA6g5MpBYJ5YCCaNtpscrxcR7EU+h350g8Ecv0ZyE
	 PS4dhKPWpE7hgDQYQSn5GXn/0SU2eXSwB9tdTK1BcC7oivUGM+9IBz7E9npBN5Kgdf
	 O37sjfiXjjGvGEbTFpsctW9sT64aKA34CctXqpxgSOF3pRDds5zBSLRON5EKpziptD
	 /qOKmDn2AfUUYnhhduRwvo+yMpQGUmMBax7Uphe9j0fopl/Ku/c/nn1HyoZzylYmki
	 P2l1TwafUtnWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5458C624C6;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:26 +0300
Subject: [PATCH v16 07/22] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gmsl2-3_serdes-v16-7-4fa6e08bb514@analog.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
In-Reply-To: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
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
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=1871;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Wtq87WP6HuN2ExCP/a1ucfnQWkLmzlzMjUynofXhUVc=;
 b=45tu91SFMTKnPqcMnioHNruBt0iHzqIZvvEbu2RCttNgBVeir1G1GxB8RNIHjQsEbUKNWATdN
 SkwzdKMYJvvAAmlh8OGKJYQD+8jgNu9wno6J40mNjQ27JnOlu7q4oXD
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96712 and MAX96724 have more than one GMSL2 link, and each link is
capable of connecting to a separate serializer. If these serializers
have the same CFG pins configuration, they will also have the same I2C
address, causing conflicts unless the deserializer changes the address
of the connected serializers.

The MAX96712 and MAX96724 support changing the I2C address of the
connected serializers.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96712.yaml         | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 583bbd60157c..abacc3c874a9 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -36,6 +36,30 @@ properties:
 
   enable-gpios: true
 
+  i2c-alias-pool:
+    maxItems: 4
+
+  i2c-atr:
+    type: object
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      '^i2c@[0-3]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 3
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -78,6 +102,13 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.53.0


