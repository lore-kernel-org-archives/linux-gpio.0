Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A844718D0;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=uZkgtFnT5FYl5Ew2+W0Fg9U6/o4MgscDZJYEEIs5nZEBLegab6iGw2LAvKmfPH1obME3iQV4DPfUQsj7Twzc8oVKnRZZ1NlaGuXqNZT18/aM7+xtgsrwvALnY1jqcdRuTCLBePewL0gNUCTDHQgzOmc4Wtdhg3M/6Flb9anim1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=VrWfsW6CjpQfvmN0zpYVVCQqhqmgmSoGOWEyw+Ndxts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WsWn2PBIDpY7q7EfWd+DdoDAnfgXrASFiQSTUq7938AWklGmmHGmEmwjRTwXt3hWy3Q7RcfT/pXIuq0Gv/MGlPp53Lwm9S/DQs7CjBFEeX9EWehNqIku9HPrYUFFLBSoWHqumx8spp3xzmBNwTjZCbS/nSJyhtV1iHV5DTNDVGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LaJfl/De; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LaJfl/De"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56EABC4AF53;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=VrWfsW6CjpQfvmN0zpYVVCQqhqmgmSoGOWEyw+Ndxts=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LaJfl/DeDDKeJp3v1ojavPkN9j5AAwxWr5we79clepFZpVV4EmaV6xbYBEL20Muqt
	 uT/iNY8zXk49MHxL442d/N55wGLn6drsQl7gvw62jLrtRmzR0q8n39JJr5axbkjcof
	 60nvM0Z48KN92X6mLivaE6zHWEU/9TWEkxX6m2wU6vexqKInAsIxBcqtoDy0Dl9mL/
	 0WEIcGGcfSgRqd5Qc+dLKc5DOTiiqkD7Etli6oMy7jiZpfPytJOvUnnlBQVhYiEev/
	 f+OAXwL0VVeXnLt3C/tK4X5F90pKq7T7qgiFNNpr2Kpq9OZWtGGtgI2qeiVz7WVxBw
	 mxm3+jjMJCr1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4310BCA5FB3;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:42 +0300
Subject: [PATCH v18 08/23] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260930-gmsl2-3_serdes-v18-8-43117818f499@analog.com>
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
 Cosmin Tanislav <demonsingur@gmail.com>, Martin Hecht <mhecht73@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=1044;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=p9KjT6ikJkH8J/D1ap0cHBnQIHGqhwXx31a5tBGD8+I=;
 b=SUWszkAXLNOFD3noO/dxGm/XLvku8l3CR+T6Mk3b+PSKztm+k5tWQBBwUU7XwacWyurXeSDzm
 4JIuTEN1DBFDX/HCApNMt9OyYk/brSpabNaekylXbwc8ZQVe01+ADET
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Martin Hecht <mhecht73@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index abacc3c874a9..d2dd72f2e924 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -95,6 +95,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg

-- 
2.53.0


