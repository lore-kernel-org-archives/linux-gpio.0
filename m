Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3BD48166B;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780582444; cv=none; b=etZM0p3i3h4ZB3CV6HNCkJ0zPCnNh5R7pK0qNeRcMJYbJisDl/lrEMVL5GrG9lOAXSSgdzpwL9865yCmVdSthlYXGHfVEk9sWVf4WN8enEF+yTT7iOvpJxKcdxHLWLSTORoJcAj6xrFKmUzsPzU/BVdzc3WXtWn+xeL4oKCj8PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780582444; c=relaxed/simple;
	bh=m/Lw3D9Sn7b/iEdL6eTGT3K2tR/KZoA6l9gCS1mqNBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmKyB2ECV6CF1mcwtF4k2cSn63JC4ocptEIGAi1fx4CJ8vJJXTwkei22/OWqfOi1K7A4sIi0OGZYjV5Pz53NJLHgcejs4QbtVvoc3toMXZR4cFLf/4QdiSOf1E0oI+dk5oM+h5PY5NhPAOyIcR3WPbeH3lYQCQOLsdLQBAMd6yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uA+1b37N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uA+1b37N"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81BC9C2BCF5;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780582443;
	bh=m/Lw3D9Sn7b/iEdL6eTGT3K2tR/KZoA6l9gCS1mqNBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uA+1b37NQSmArtACLB2NbG399sY551NDvZPqU+G5d24GwYMzoT1TZvYjGKmYjTBar
	 A5nwm0CveDwTbK5FO6cERlkJpprDwPyoflWJj2rWgLX0Wbzoo2PtR+xMgn5y83uPnW
	 zfB6t/AjBoIs9019bOkIdqAQFjcfOfMaDO3yMQt4ziCr+aWwpcalgEpBI752KKa+xd
	 hlH+NjeD0YNqTWcUw+Jp8ql86kitCp3qA8Dp2iAJU3+fe0Z0yJjNMk78gXR6jSGCkk
	 /lTHrUSa9h7FNmjda0Br2t+AN808zjBqWFLOjgfxnAl/TzjRpNWzTaALx8Q7XdRtj+
	 Amyqv6wzQ7J5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7700FCD6E6D;
	Thu,  4 Jun 2026 14:14:03 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 04 Jun 2026 17:13:49 +0300
Subject: [PATCH v13 02/22] dt-bindings: media: i2c: max96717: add support
 for I2C ATR
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-gmsl2-3_serdes-v13-2-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
In-Reply-To: <20260604-gmsl2-3_serdes-v13-0-9d8a4919983b@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780582440; l=1814;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=OiYJqgg6XnogVXqu3cCeY60g1Qzx0eB+PgiVHCOJen4=;
 b=b/8iO1IKwIbm4AvBCUVd+sxz3X81kSbSKscEm+RoTqDmaAd00gbZcstxyREnV89JWUyBuW1/W
 Lw4A/5IUgT9AwSeq9T4i7Gu7nIfyRF40ITR3Ze6xoT9qZzl0GTAbaog
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
2.53.0


