Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9082843B6E8;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833433; cv=none; b=BvdSFvH2/auhr9dugZE/ZGPzAD3PI8b2lIvM2Am94K9YmyVM8kmgaMFJ0mi8z02+2pFfbvTOR+u99sX+PV1iRT5qZWnDySfBN9JEeDJ2xayaMHpY0ghblA+Z5ouhQGEAobGvERD723E+06JwC6LCDBEgKSpmEyLJzqGVNrKLp/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833433; c=relaxed/simple;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDd8TblQ7Qfvx2un80U1Iu5e71gZT/SskvYyO7Uny7onB4MciDbKK0pTVSxT6u13Bhjb0knexbhA2S2xJ8t9sQwzH7Bu8j4mv7baUJdpL6Oo4+w7AKH8ES4QdFlLwmgOVxrnGYMJfSQMkCZQVQiRqKsXzT9tB/EQMNHOSqvnPzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGWJH5Bc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGWJH5Bc"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D753C2BD00;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833433;
	bh=0LRurGs30izWp59o8FPmIaT+p/OC5LyJScZ6dv8wqHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gGWJH5BcI3vBG6JnMANA4hDjeB3+0CydEtPEmWVOQWHgfR6A85VKkoZhkCuMK8byU
	 YedkWSdFrWrlI15M+YJLZeNqdymyAg+UzsQ5Iah1nqSu2rzNnp/8f0cctGGaeuWZ6W
	 qeXUSaFjYz/z4AZGo/Y+UEH7cpqvLwhw/3xBG0eyxDpwqEWjW3w3ykilkoYmZNbH48
	 drOPKUtcb3n3GSiosnpiFxwd0ri6vDxprZ8TWBGN4HyCjqYMKmlUhYa6Psk6Mcwuj1
	 N8BB5oVGJmr6mZI6RQwusR9SOqwVW7FtDjZPDgZRITjzYOIsuhWmYU97Rz/f3rYqGH
	 SKIjaaNlaRBcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B029C55184;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:49:47 +0300
Subject: [PATCH v14 04/22] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-gmsl2-3_serdes-v14-4-763710c884c0@analog.com>
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
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=1215;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=vJv87PlKhZ/JJOLIT/BDLODjizDSGOosxrrf6SXpE7Q=;
 b=i4CNBAYdnJ6+n1pwpgpkGpgKodQlL6OZhtkCFFNeD0QBL3GpHRTv71Q24Ku4KPd8rQf6GA89H
 bHr9norxQ2yB/ttnTdyK0DGtPf61yKI+bg5l2bJkUtLu/9M0mrc1UaF
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


