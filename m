Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00243D516;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833434; cv=none; b=Abknb70v5n2ltdWHZDGILkOZFKYt5D8vlrfxns8uI036/H3iJSjLWw+G969a1HaT6gLu9+gURcCyC2EAv+wg1Ax7GeRqOmwJOg6BWhR/IsfJaR2nSOMBcb2KLB43VueaO5qnzxg0PrSDH4SFKjnXGlvYLSWGNGV/a0R20yTU/1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833434; c=relaxed/simple;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=knuwnnK/dF9Wi52SF0xEKFBwH6HieQRiqbAnAfxJvj79C0mMjMhF5R9hjANhi+qheA8sHmKScp+/J/bTylRWHxC9MlqOX7bTlsTGsIQgXOB1WbbLW2BHMB90zBgV/MPES3tFEiYWG4zeWU6aaVEdnBOPR7tBHy9K5jnVPy/dL/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9Q8aR1o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9Q8aR1o"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2F5FC2BD05;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833433;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d9Q8aR1oBiOPXVxH0qF5UpiaRCRrlaUQJ86VQcJymgkGsZdQNEx3/dv7ChKCsKutZ
	 EsqYSrVYV3rf/31gKMZUWnjFC9cWd4bqy2E+BNQbVB+3cIAttdlT3amzO2lzV1n4Wl
	 peyolS7NY6uhQOHubI2dpMFkpdxU28uwknI67jm0ahnbVUq1JpTSAyn9QypnqSfTQr
	 bQZFU8pIPHp+cE4uRmq7hyXj9BrUrrGO0SfCG2PRvFv2fu4IStSMMr+aTYBCwW2beZ
	 ShSydaTpK4FA8dZO2orMeo/AuErG7dlIjZ8a68sctE9PZ4OCJnbhIAm8rlEVVg/Shy
	 aCuqq+JyhnE3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D092EC55184;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:49:53 +0300
Subject: [PATCH v14 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-gmsl2-3_serdes-v14-10-763710c884c0@analog.com>
References: <20260804-gmsl2-3_serdes-v14-0-763710c884c0@analog.com>
In-Reply-To: <20260804-gmsl2-3_serdes-v14-0-763710c884c0@analog.com>
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
 Vivekananda Dayananda <vivekana@amd.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=1210;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zHQWciR44LLL2n9JRuufsEezIBfNdUsq5fR2eFezGHc=;
 b=JVYhaLCC7VJh8CuG+Gh9lha1FWZE51cGaxuWoo3SnlfYnUHFpF79LXwA4ghCIUKg5w3C9+ulD
 2DMqyv90Ze9DubBJtw11TZJ/qccq5fP/Jndp/FByD8l+PqEsIM7lRdX
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Dumitru Ceclan <dumitru.ceclan@analog.com>

Add maxim,control-channel-port property to allow platforms choose which
control-channel port MAX96724 exposes to the upstream I2C host.

Suggested-by: Vivekananda Dayananda <vivekana@amd.com>
Signed-off-by: Dumitru Ceclan <dumitru.ceclan@analog.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 161d40acdd28..ab1dcd8ff8e7 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -41,6 +41,15 @@ properties:
 
   enable-gpios: true
 
+  maxim,control-channel-port:
+    description:
+      Selects which deserializer control-channel port is connected to the
+      upstream I2C segment when the device resets. 0 selects port 0, 1 selects
+      port 1. Defaults to 0 when omitted.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    default: 0
+
   i2c-alias-pool:
     maxItems: 4
 

-- 
2.53.0


