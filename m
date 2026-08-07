Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECA2479882;
	Fri,  7 Aug 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107772; cv=none; b=AmhtqEaK44dTr314px8KRNrD6Ot83kobXMwxPLZzmg8B26++dvTkhrGyA4sUTXILkQ4/gIFBe0he9lBtgZ2PRTHWmr02HmxpJ/FMWe8cVMGDWFUh2jvDkwH+ddP0qXi8SIQvVX7NgygDsmbEUkrv2U4TL8WB2Wmy8fG0HdGFAgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107772; c=relaxed/simple;
	bh=8TupqbovUH4f8Ft7S3k5VMJFfXq22X6CyPw4uwxsut8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BHUbK660A1D8tM6x1SoEbR8oq4HoeaMnfB8BcOxDVCAWxI+Xvj0j6FtbQHYcxOy6U2MhQA5zMNfcmP17p12e4fWKcqOCKLWQtjT9jkEBMhdf+ud7ysQpFWTUdsyZ8KUoxYlxWOHmAx3Lv4uXOFwpgCWPHajifLCQsJPaZnba+Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QfimeleB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QfimeleB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33D2BC2BCC7;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=8TupqbovUH4f8Ft7S3k5VMJFfXq22X6CyPw4uwxsut8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QfimeleBzEobanqYlK6tEAMREj5C0bhhLFE3OPP98Yuqz7ef9BDC8PAdg2U4cxfJm
	 7I54SRQi0d1AdcmXffgpsHTWHCDfOUzftCmygLMHviUUGOsbc18ofYpkj4xHgdQbV5
	 A5tEjRLpHbOETvnTHeGMXY+UxhDo6/Kh2NaaPur45qj9H8Vh5XLiL/M/4BuRip7uvv
	 2+9W+GRXI2fMVkA/7UUxd5HDiNTk9VlJSsr6czlihR4pG0ttZX9yjRVn3fncZkeEj1
	 mHoCBF3kcZY26SDyYdkzwPFopka3bnZ9tvsIkFteufQqlAHny4y/98+ZpEv9QF2qUg
	 j4WK/kNWH2duw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D05EC5AC81;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:41 +0300
Subject: [PATCH v15 06/22] dt-bindings: media: i2c: max96712: use pattern
 properties for ports
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-gmsl2-3_serdes-v15-6-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
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
 Andrian Suciu <Adrian.Suciu@analog.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=2057;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=I52ZK89SDidgv9Kh0KUq2eBXwlYMLSWhPo+aSFUbLXE=;
 b=8sNLZSrJthMMbSjnY0Ww2roJzsEpl+rg67qgqqKr8hK+PaeQ1Jj7BOhjPDqA3x1hfSibNLdWG
 VoH4thPslGyCgJTIeer7c8Z2BXKZOoZHpoCG2VEebY9llG6Ieaud2LS
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


