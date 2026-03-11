Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7137D3A7586;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213457; cv=none; b=DUvlkg1M4GYCgJCJUmm69N/H8DKkKSKvhPREik/BoGUDqoyTLakOMoAXD7i3qUMUsAwfdpNIfJ+ZvGiPr5iHt92aKS6d0cYwZkNzfxLSr1RBFGqOn51bfHd0Wqce5xRoJCpTz8zkdnE8aZsBNlSc6dVqTwNcH5u1M/t6X/zBCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213457; c=relaxed/simple;
	bh=Xn5/p8wZ+o0On/psUllQui3rTHU86ibt8plFhXgBEtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8qh2Whfe1Et6zlmRblByyes6Kw7ENCV9ZBZ/F9cCt9Q6/eE3x/I/jQ8LEQI3Nb8/rXQ4bFy2r6vl7QdMFfQxCrobarX9dqIBPs6f9sE/wMrP9KDfUFDK7UzTjZtszHcgHAEf1SgtOtjZ2ZISoLzxt01YKvmca7iumM25aVDlXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHTlNsnh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHTlNsnh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCB84C2BCB0;
	Wed, 11 Mar 2026 07:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213456;
	bh=Xn5/p8wZ+o0On/psUllQui3rTHU86ibt8plFhXgBEtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sHTlNsnhVYhAQgsf83WoBRc6N8RftC1IM5BFodxenDaCqE6dShINlOHyy5+mEIrxJ
	 Gpl1JsX5PpDC+ZnZ2MHKKqkNLaGTYaO9jLfXXpMqgAv/a+KTiGFgmyK68uwiEPpko7
	 6z+VK/kfrJPrxVXZIPz+KC8ESM+gTIvre69z2kpjN9ywyOkoN+dxJ6b3T4wr//Un5U
	 ZK73vVZmUSc8fpdqrAo25i9qhseJGQszPcgOFt8dT58XH42ubJ5TX47G/L7AVB4S/0
	 Xs4K3SS9XEDDvlciVCF7GzF0LTMpprgPxSEPvRuC+Mv6GVOW8ZIvY1OGvPfxwvcOV8
	 hKdUEiU9xik5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE484FD0640;
	Wed, 11 Mar 2026 07:17:36 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 11 Mar 2026 09:17:14 +0200
Subject: [PATCH v9 02/21] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gmsl2-3_serdes-v9-2-41499f09004f@analog.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773213453; l=1814;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=qfde6m/Zuq9hlZ5MNFTWYc4DyblJJG2tEqlBoZZrCn8=;
 b=Jls7fNKHiLFZRWlfRF2Jkk7lFGJw+Rm7NVwEZsb8BZf60INekriVf9yVDeNG2/99I/hgfYuNF
 bvU07pd/aSOCcopNTHFqxW1fmr7+hepgpYGMtY0s6ELzoY4ZnH6nbL5
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96717 is capable of address translation for the connected I2C slaves.

Add support for I2C ATR while keeping I2C gate for compatibility to
support this usecase.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/media/i2c/maxim,max96717.yaml         | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d1e8ba6e368e..976f6dd2c164 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -91,6 +91,30 @@ properties:
       incoming GMSL2 link. Therefore, it supports an i2c-gate
       subnode to configure a sensor.
 
+  i2c-alias-pool:
+    maxItems: 2
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
+      '^i2c@[01]$':
+        $ref: /schemas/i2c/i2c-controller.yaml#
+        unevaluatedProperties: false
+        properties:
+          reg:
+            items:
+              minimum: 0
+              maximum: 1
+
 required:
   - compatible
   - reg
@@ -98,6 +122,21 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+
+  - anyOf:
+      - oneOf:
+          - required: [i2c-atr]
+          - required: [i2c-gate]
+
+      - not:
+          required: [i2c-atr, i2c-gate]
+
+dependentRequired:
+  i2c-atr: [i2c-alias-pool]
+  i2c-alias-pool: [i2c-atr]
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0


