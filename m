Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7543A39C643;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506521; cv=none; b=NQTxRoJJlbDFVBAkwqMJLkaRz62Vzw1BNdYwrN2TmtCwmJTaufSm4dn67A7h4EddBbZQ5RT6DMa1n+0Qlh3Nyd/iTHSxry7d0RT0yhZvfO9YcrxysSapht2qlG2Ewa1s4vHIuknTc4IHolD5ktc1j1/QpkhoG/M837JMBAK0bUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506521; c=relaxed/simple;
	bh=Xn5/p8wZ+o0On/psUllQui3rTHU86ibt8plFhXgBEtw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtTA3j8CwHds+ELSfhZldzU0Ny1yPWQEkjHf0uhGR1BRDoqzUahATIA6dhSWqwN/nJrhalBACXcsav/xwuEHhvpfM573+uCZSdFZGGMgMr3vstogPE78KB9d2R8EnaCWepnGjWT8UENtuNLC+xcTedXAKMlc1WYqSsDSvDVzpdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k91jTdAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k91jTdAv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42752C2BCB2;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506521;
	bh=Xn5/p8wZ+o0On/psUllQui3rTHU86ibt8plFhXgBEtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k91jTdAvTwA7Hd+mnEUWKTmEBtinjiP80DBlQh+tOAksvxulCPNgjkbLOGNbyO5pT
	 M2TQbbwDq/pSFGyfKmhRzDWbk7oyVpajLZEfS6X7mBv3HiPlByMLh0wUzNUelNVS6N
	 8BEUe2NT+ly8ODMIG0yTBJd/B5z5uZVxslQyEcvAnVlv+3zVOvj9RUJlyFFo/3GAqD
	 u3k3MhueqWOfFkLCFJin/iGqbVfFuWjBLGPhvOpLArTeKgCqoJ8Pj6MqDwJnaBgRrf
	 d7Wf3NYBlxABTEIPVs2z05B3YbtPhutB2qlTmEl6Vil8twOjdBXYUTyJKtQS2KvMi0
	 aU0YRhLe8c9Nw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B25F46C7C;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 06 Apr 2026 23:14:41 +0300
Subject: [PATCH v10 02/22] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-gmsl2-3_serdes-v10-2-645560fedca5@analog.com>
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775506518; l=1814;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=qfde6m/Zuq9hlZ5MNFTWYc4DyblJJG2tEqlBoZZrCn8=;
 b=chxkvMdYSg7hLLneO5F1FHCgGGhiUIpMFWsmtsLESPfI0Ah3E4CnRq0IskRB4t5GdlGHVIYp8
 iaGC5MzWl3xDeN2OnwsIhF1Q8u1u7tvQ3YrsgQajBQgtSSlhXPt2J6A
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


