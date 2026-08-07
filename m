Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB84A4779A5;
	Fri,  7 Aug 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107772; cv=none; b=HJYTpV0KJ0EX9eM8JTSdmy459VLwadUY5ikUxnFOx9xw3JKFIqLhn1/d1rY5ORj4rFnJYhRmjNn71EiPjslCUPJm38tYe8BEk6e1kmHbqw3h4XAYyapOSzvK/j+FDg2U2qaRpQGlmncAq2ZvOsujDCFmK2DR3usp4wSn3wi89iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107772; c=relaxed/simple;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGPTotIzCMX2oEYRpuqy8leLbAv3cWn0Lg1kGspDPhodDDCRBvJaQFJrVERgBtSaJaMQ9WJuBYWtXBsLrdNN9wQ1nl++fNFqgQP3EBxsPzdKXzY1k4DnNekHcHuqgUhEy7mIXEHSlxZ7d3BAt7bXqhI68c17CCzEOcEoKdpU1E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oA+6j8Ou; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oA+6j8Ou"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74086C2BD01;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oA+6j8OuLaK+0lXdSzIIF93K2eNWhJM5Cqvh6f4+XzvWOSUpJZaWQdvNS4l0Mek0T
	 wy5PDqheBueT8Jnse1jhJ7Ct+YAGpYyyBT3jHvAJz41rlyqBn6rpWuEj2A8/oG5El1
	 2vFcVp6vJKJzzcJwy4C4MtmpEveZ0gksDwRaMbpC9mg/3/+1/nhSncBCInrg8k3DJh
	 ulL4HBzn4Ppmwn7jLHS4y0Z4L9euB3kCsVN60ZPVsPYDi0BfdZVd8YhKJvO5sWMyyV
	 btmUvz3cO3J1npozJiPhFML4bClwJ/7VaVGRDdpC5HAbKPgHs2SWERqfHKIG7NKkMG
	 bcCCctK8DeIvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F48EC5AC7A;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:43 +0300
Subject: [PATCH v15 08/22] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260807-gmsl2-3_serdes-v15-8-7212e9e5156a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=998;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=4ZvMQ1EkeJ2w8dRWwF+03VM9oahvM+Q5lLU48mndSLo=;
 b=klvSqCoLlPq9ZozLZdnFMz444Y1dlQuDiVVd2Y/5U9INNtbY2qzXllgNfYWZAyrB/JHH64das
 dVIkEQbnXd+D95pSzI2+9faoR72M7VMYYyrS+YIxLRFDBbar/86rTr5
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


