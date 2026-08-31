Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE4641A4E7;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182499; cv=none; b=p/cIEteUCo1eSifeQ+WfVUA1gaCK8XZqGACV/KfLQdTNLc3JtHUN3BiWseTB9LajlHmMl2hRAQO+NmmOU8SvqUoVfQ+P4rqDc/KdVQOl6S0MArlFcOU9RFACMsSEz0t2mr44ENt43TKW3gu4TuKdiE2KvLzsNaLoDzRsNbout7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182499; c=relaxed/simple;
	bh=I3h9hQGlU1YMsgX1RxSoZMy52SHT8/nvyrAeviXhdnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njf6h8yeUu/ZL2PLMFllCpoFWPdozIQOfqedvfUeqoXklU0DwG3nguZ33cI99vYRyXXP2Rzc6EafUt3bhXx4Hc3/Q+CF1DJscThorUGuL98+VFYW4HKptkhsB3E9agBoFHtaYzFXbKiP6kdnVo6C7SX/Hq6cS/qvH8OwsO4GoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFhE59Dt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFhE59Dt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDA6BC2BD05;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182498;
	bh=I3h9hQGlU1YMsgX1RxSoZMy52SHT8/nvyrAeviXhdnA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dFhE59Dtg7e+IP1ga4hc/d5Kbaoy6ljIBtanJyvJLgvAlJctXSUlr+A1nEuZoTIva
	 G66AdzYDGoMMUkUiuzC4s0HdVDbnbrrvn2xtP7EjBR2KUBuHQmSWeUGuChWZ4P9s8Z
	 dGb59FHKAq9GvOWwyFZQrrVDJUpHEuKcqw0CaQkxMSYMK+XWaJPFXAVftGe2kXwF1T
	 NFwq+ItRPOQs5KlNjd9/pmxQbAVDrB0hDoTtBIoqciUYAp/VTXMM8x8A32SP7KoNkJ
	 XtT16VZzK64B7HjgTHVC03pGIg525kLB1cbIAs7tw9TTbsS53EsWZmIGSCWADyGm/w
	 W7yzNdIjaEMXw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F4B4C624CC;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:23 +0300
Subject: [PATCH v16 04/22] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gmsl2-3_serdes-v16-4-4fa6e08bb514@analog.com>
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
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=1215;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=8hWuoYop1wDIFmyFO5TmTVYZuV9B9OvV8bCi4HWxDJk=;
 b=n1EGBo9Njuw+NVkjIfRT6bQc1F6IIa9ec+OsAJcsgrxmcBK9ZnaOQmGK6ky2J1jh7UlnylV06
 Dm69ybdq/oGBOAAsB9CDj+ZMvbVFFkMsZbDoi4ZPpuhGt3INlGm4B/e
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
index d73a98085b7f..2159fd85a9bf 100644
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


