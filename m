Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFB947AF5D;
	Fri,  7 Aug 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107773; cv=none; b=GQ1d0kOqe1Vn+WpOOBangealtA5zdwSx6Qlk4CtL1bl2vEhI6NqdY1Sb1hLTAT/hXKiKQSoA7P+gH0GVW7bZyFryVkPrwxMK4GHtubheM0V0zLaAqgHKXlNp0ky+q5WwhrhQOcJ7M+Xjh5/qCbqv95DO2JtWKipsC0X34zzy464=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107773; c=relaxed/simple;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bBKphoT0PLwCnyLKSpBae8KWddgMEQ/i3A1pFjHjLZTXqU4wwKZrTXsUMoSJOki3WIAkHHnFxyAe0+3yowV0IInddOCnamKXC8z9ETmz7xjF90dcUAackTqPVAjJpkRWMqUzpKGNLVYdhNFBq/NlKHnxKC0KvJQ04BeAYBNeRpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POnfQTMe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POnfQTMe"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1E2DC2BD04;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=Dtu/uLQC/VBH/ebsINFo2Ugv0zQarsUez6ULS9EDjKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=POnfQTMeN1c0T/o8tRTrc5JpzjVVUftPWZvvU/j+exf3DFMDEfn+ZCZ3mzJwKSgyx
	 u5pZ+ldfe6GHlXO6EX5aHg6PHxnmZ85dBwGB/K02Hu1A/tfz160tYFxQM2Ur4BfY9S
	 U+WRQzSPb89Xc7G/Rtow9a3RPXfe+K7tRSaoUc3o/mxy2TC9ilRq3z7nQyhK3uuyLt
	 zpxSc//cbngJNMb0OQ3PCNhMzsY7kOmwRrzIUGbkVmDMTVoKaS2fTCa9TfT4EYwlDx
	 0GdMqMSqR79fLRVBOYc+xPt9kzCDtYVFBz5gaMM0VE8tZBTj70Oydr+/QRFXAxmO78
	 Axa4nEy+v82cw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2F8C5AC7A;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:45 +0300
Subject: [PATCH v15 10/22] dt-bindings: media: i2c: max96712: add
 control-channel-port property
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gmsl2-3_serdes-v15-10-7212e9e5156a@analog.com>
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
 Vivekananda Dayananda <vivekana@amd.com>, 
 Dumitru Ceclan <dumitru.ceclan@analog.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=1210;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zHQWciR44LLL2n9JRuufsEezIBfNdUsq5fR2eFezGHc=;
 b=7SvQD38N50GbKWM9wi6JGnKekq7wE8cymiMLGmQPlC2TOpBRcegto3tcefcOSIbY8oT7oguY0
 UOICGrHo2q9BeLK1s72z6oTt/et4fdPiDaZTP/JI8wRV/hlHGe/svUF
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


