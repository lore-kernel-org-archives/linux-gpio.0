Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB48569F17;
	Wed,  9 Sep 2026 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960482; cv=none; b=Jp48nyP/jH2ydbagwqxJykXyiDrSiJGz98SP3cDbs4KlixJMxhCOBvjLFhlCz5qHabXU4G6XnayB68JeKB2PxJVNLySC7eWZplLAu/b2N9LFwRd9ETnHU6Zmn0MPAMzHt8bz73jR50sFQtrxUvhTBqObT2oBqQYxaMoaRpszRuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960482; c=relaxed/simple;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YvHdFC2c3buvd9qnmcrgbPhERkgKefjXwAdwIWNEFX36KZnbS2gBtLKXqLL6eyGvlJqjxO2ra81Jeu4yceknLkcPxBDvcSBfEwdiJxr72GtxTEe6H93NTJ16NhZJAEKk6DIwCSxXXoW0TDJJuu40DwMzmM2Qpoq2Y89WJwfRf6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9y408eu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9y408eu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA7DEC2BCFD;
	Wed,  9 Sep 2026 13:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788960482;
	bh=oRQbdno+uMhuHFTbdmanYF8cim3BHh4wpJplXog8vQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F9y408euW2P3aXRkf3lMbMLL2Vblwi8IwVMpO0MXRcCVWZT4H+CWBRJqH9j6yZt0s
	 zNsTBwmSz2dbQQtl37Uy/nBIthFl77tsqf/EZotAtemsNiCAF2KH9NZDKDywqG+N/r
	 jQtY9BtTLgt0HZbc/cPrTJIGLwreZhVuFFRaACtrK43OtxcO5EmuvU+HMkDlnYx3Mn
	 jMJPdu3uEW0Y04EFHdw0YgllxTTGQjqAojKbsuA1U31tMiW1GFsyOSC1ZYqIObwruS
	 35M4HVRNcVqDODtRT96sVSY8ex7p1wcg/OjDHOm+ndU5WYulRYM0l2shs1jDQZ3fUH
	 Om+eMhI5R/xnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D635CC79FB7;
	Wed,  9 Sep 2026 13:28:01 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 09 Sep 2026 16:27:44 +0300
Subject: [PATCH v17 07/22] dt-bindings: media: i2c: max96712: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-gmsl2-3_serdes-v17-7-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
In-Reply-To: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788960478; l=1871;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Wtq87WP6HuN2ExCP/a1ucfnQWkLmzlzMjUynofXhUVc=;
 b=WkDTs23A71Bcxg02E2nm4DKg/qtFkfdbXaZhgbB1zjovb1UWx0JSi6nTcoEkkddsluWVuFOVQ
 cWvPFRrMF0RDW9G6WyHaLs4R8NjFkcIMvdkZg/uK94gp3zDWkmpMhKJ
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


