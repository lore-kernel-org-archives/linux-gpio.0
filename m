Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037B474258;
	Fri,  7 Aug 2026 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107770; cv=none; b=gEzAXkpWIcrCELOjbxDFK1P7GNo01rHI1g2+sRBAGWRZ9NhfSt2SWBb04FHONBe76+LSSV5wEOTcvjIAVgq/AWk8t+RyhQ+d7QOQEbBVgE/AivfWyUUIwrHX7cOIs/xCcgz2JII3RN5yvPYoQQHxUC2wKf2Rp87BBYhd3gSs6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107770; c=relaxed/simple;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kk46ipGr0PljtV1OAzcXP+sa7KbKQWDrhFVHTzHqbTKKJq100hr1lyKORxogUQ4fopQ0aW4+vznhMy+/Cdp6tmrdMFqkwaxtWXORttkK4Uz9dRSV3QiuxrHrI0biVg19mGYk4R1KCAlMnzMtz/I1GqutxU0xm5ODh3JPAmoBvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rfhg77wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rfhg77wo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E97F9C2BCFB;
	Fri,  7 Aug 2026 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rfhg77wo3CJFfADztJyLDWMFd3FTaDdy/6el8f4jpnKmdkbwh+XNjmv7YfNbEVsjf
	 RiXR8VuMdpAyzYSQHRCySZB7TN//Y+tZ/9WqhCsyTePq3U4l5+YcQ5Pbi1pR/i24yi
	 wI5cc8/l22kJOeP9J5P3Gep/ctOoPikl28G91YgyVoYFcBA+nVVhdi7SLR4YBBcPPB
	 cRcWMBu5a32c6UBNQ7awWWDvlVB1qFXtAtLLX/nfvYflkHBarEcqx+uZpGRQsSOMkb
	 RQyKAMi0xskxM2z8qWSkMtjWveflBjkw8f3eh+fprN61wSbu24BvN4OPXb0iBFIto3
	 5sfBqKZC6K+AA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17C6C2A09B;
	Fri,  7 Aug 2026 13:02:46 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:39 +0300
Subject: [PATCH v15 04/22] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gmsl2-3_serdes-v15-4-7212e9e5156a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=1215;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=vJv87PlKhZ/JJOLIT/BDLODjizDSGOosxrrf6SXpE7Q=;
 b=L7J5BAMVHe8GPMwOepkt4vfHVn/3b16rmRCfiyYvky+ArV3SKm5eu5W1cTb2+7tY7CVs99G/s
 LQ6jnqWzO4qDLZuhSagu9uIHI0IaqAeKVNJbolKTQNmVI0brPBCQLxG
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX9295A is an older variant of the MAX96717 which does not support
tunnel mode.

Document the compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index d507cad18edc..bbb38b3de7df 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -24,12 +24,17 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96717F only supports a fixed rate of 3Gbps in the forward direction.
 
+  MAX9295A only supports pixel mode.
+
 properties:
   compatible:
     oneOf:
-      - const: maxim,max96717f
+      - enum:
+          - maxim,max9295a
+          - maxim,max96717f
       - items:
           - enum:
               - maxim,max96717

-- 
2.53.0


