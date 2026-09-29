Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84564DA52E;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=R3pDqywyBpID7b9SY8TBcr8gIKQpgjCaTW8jg7ZfhWzQ3rXzY/1T3aGcv3vADQVx9cQxYcA3Exwhp4XIAJBe2Qt0Sn5DKcC0PIZUIFEQrvgbp30oqgIbPtLwG4OAtGm7/MyRYyN+ai+7gzaQdAp3NGnKznvqqY/Q2prxFFuXfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=ilmIfB7Sm4pxIHWCIOKE3lzGxrZgJE5PgFYm4cxUfnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hAIYys4ujSCSnH7jMTR2DthF7+82D6zOj1sS5/VW1Z6QJogseXS7qFbqQGsjQ3PHE13G5jqHb2Do5iFtocHmT0M0P2j7+5bYInmiCK4zG/8XgFEJulms4zPNdym4vfsl84RtOkG1w58/NT5w5/Yd5ZZh1FjWJ/06mit1Tp+BlG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PsnR61+m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PsnR61+m"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7574DC4AF0B;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=ilmIfB7Sm4pxIHWCIOKE3lzGxrZgJE5PgFYm4cxUfnE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PsnR61+mTVgxWUQvj41tQKG3anky3kE4JGfweMXg2X7OZevjj9dBFAYjKPpffZPrU
	 k/64NnptPqnC5tRC9dVAyaINX5nOvAIGWI+CzQWiautTj+m3Ux7TzCNUbsPGf51b2Z
	 ZoP1gaAg9XW2tEUV4FgZuaB7T10hM4ZDf6TafmF5W0qiOT8MhGIpGJ1GOXhT932Ka6
	 JqlZVpYDOrTQYr9581WCwdF7eDRZus7lwMfMF+8kZl+fr0BYxz5j1TQSIYNJ7au2I2
	 nyCM21X0cZF5iEqC5J69lejF/5mYCMMYebvsJj4CGIvGG5o+DW15EAMx8Ha3owE7lD
	 N3ofEqhBnqF4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62608CA5FA5;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:44 +0300
Subject: [PATCH v18 10/23] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-10-43117818f499@analog.com>
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
 Vivekananda Dayananda <vivekana@amd.com>, Martin Hecht <mhecht73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=1256;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=5YZsYgjvEsQx9dVoKJEbOSbnIutNllMjL7dikk1Vmqk=;
 b=nF7E51wpvwOZA92qZFaJIv+yqXPepXz/+StRda0R0S91DksJI5ai8b4JPGt1uxRqTlmZyFKt0
 QFKzSnl5MoADp/jlI90cmIHwuRxirja0+nVuk3Cpox8iZTrnj8oH7x5
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
Tested-by: Martin Hecht <mhecht73@gmail.com>
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


