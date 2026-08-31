Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4049841A55F;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182499; cv=none; b=O9MEjatYXWc/XrQ3I/3WQuFC5AKOJj8jNiNyJwmAz5im3gXyLVgASkJGrXUawQ64rEDc6Yn5OfN7CkRxopMY1emwDCPMZnmeICK4RMmw6zYsQKC+XhQWeglGehbN9jgjXZqvoMPgOEJRdmieYcdwkQvmwNjMN4gR2ugHJ25byZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182499; c=relaxed/simple;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvtlZyJsZ/YVLIEWy5QRHA5ZNgr1cI9GwaAoY5C34GivblOANbcEVSwQTxfIF6/PFhozXCr6jhpf4Dixo+0s3TPOD4PRpCbKZkHXtduj2vAuM82umecI/p77/rvr4O12TRFI23wMyOxab43xOnEA9UsW0QD3Fk0ORQGyH7ZRj+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kyJyO70A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kyJyO70A"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 239FFC4AF09;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182499;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kyJyO70Aqg3REfvY5fuLz3NxjCJCNve+hJ/QwGA9tDlCx4abUMiQzC5Ce/heIBgbl
	 refSWYmD4xOfBFdnWTpCvluty90mVpj+CWziKi3feESlqV8/9mt6YiSYPod94kS8dY
	 VG9aVU+yY5DeLdYZX2Pz2MG8YfzZes0u4nRLgh6cYCZlUCemoWgoAAMvWuI9ffPKZN
	 UTPUlAm9lOIM/v6joBVlfIJBnE8SMfDdQXF8FZ/o74ZP0krZ9pKQDOBTCm6WriD5JR
	 IERtNL5BY5Y2ArlW8HrhUM5/Bf571qhdHlSuR41p71n2nlQwDf729Swk3Wxq7aqrrU
	 2GMFzz2mzUuIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D37C624CC;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:29 +0300
Subject: [PATCH v16 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gmsl2-3_serdes-v16-10-4fa6e08bb514@analog.com>
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
 Vivekananda Dayananda <vivekana@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=1210;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zHQWciR44LLL2n9JRuufsEezIBfNdUsq5fR2eFezGHc=;
 b=jr87Bh5DYzeurM7uVqdc90D4kZgj9q6VU3vwLEThUbkaSZ5kP9cGum6DT6ftS2sPuDBX+aXum
 bl3KRVSfD1FAh6YgzGWxdHnSWoBxQKUceRYWl1SzZqy/SkkW3dQUykE
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


