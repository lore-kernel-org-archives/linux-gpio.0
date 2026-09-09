Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D9B568FD5;
	Wed,  9 Sep 2026 13:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960482; cv=none; b=UhkyCk0T1Npvc6uXReZ2eDxHgohYcV8RIdGexiF5zgNc0x/m52OdQ+VKsSvTHJ3UtdaSjrryC5nMUDydJHrqo+CsG685Tl/eqUwZc8KrGN+Fw2MTo2n3YYrrvv+R0yiq/VQd7+G08uzdj1+gyBBxWrSBOGAKJhErQE0ReIqnj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960482; c=relaxed/simple;
	bh=IVMjQPi6cuXsnNOAOBqZV5+FmGTZcU/k97taVGCOIoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YdqHb0NLVuDSC21/8bvAquNF+xic0SUcAgU1Z+hqi0f9G2vYRpHhpNdP4Xka187/uUJYoSTHzwsiwtmFVwpLIUBRLElkxIXYQ1YNNkSY9R6OL/GHskVStAJnKyGfkEWZ7rYFetT+TxUQJtaf9N+iXa+6g+nPQt1ENEAtFxtnBpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=anErL/SD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="anErL/SD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3187DC2BD04;
	Wed,  9 Sep 2026 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788960482;
	bh=IVMjQPi6cuXsnNOAOBqZV5+FmGTZcU/k97taVGCOIoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=anErL/SDog7nUJgZjixD9QQYMolAT1DghwTWFb42bJNxEv73VxnEu5USpSAxl/LSi
	 MezlmVwTGxQOmcJmYpa5nXmEnvTeZ4Yss8k8BsB9rLXovp3xInmW6tBiQ6t+IMzaQ8
	 MKEM6Rd95hkguShWWiFUSUeXeVNnIcY6wyO8cx5gmKvJ98MgbjwMoI7mm++SMpoWyF
	 HzLqGp9iy8y5hFB1ZVXqwAdU2uy/IlNP9W5uU8+TDQYq6nUuX2IqtJEjjwVFR8xPtX
	 rHRfL7aHIQcaBW3fwMx3SWQHUjHNsuIDjXROKcAAWw9Z2gYSJvjwhOMinWxgqNWX8o
	 JIZhmKkicBd6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCB7C79FBB;
	Wed,  9 Sep 2026 13:28:02 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 09 Sep 2026 16:27:46 +0300
Subject: [PATCH v17 09/22] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-gmsl2-3_serdes-v17-9-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
In-Reply-To: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788960478; l=1289;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=ZSTakNbBz4Qus1NiPPbe76vFnVEQ3NLtF7fl+Vgxvf8=;
 b=3jK+0G83r1ljSloscdC10fjOIXH3JfY64mhtIgCbPLhzQaoeFHSGSYI5C7RXeJYLDS/VbzV3j
 q9qSXOshQkXCyRaLZK5kIscMcGucsdACh45TQbuXs2CeunI+6ZPFIwe
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96724F/MAX96724R are a lower capability variant of the MAX96724 which
only support a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index d2dd72f2e924..161d40acdd28 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -23,12 +23,17 @@ description: |
   MAX96712 can be paired with first-generation 3.12Gbps or 1.5Gbps GMSL1
   serializers or operate up to 3.12Gbps with GMSL2 serializers in GMSL1 mode.
 
+  MAX96724F and MAX96724R only support a fixed rate of 3Gbps in the forward
+  direction.
+
 properties:
   compatible:
     items:
       - enum:
           - maxim,max96712
           - maxim,max96724
+          - maxim,max96724f
+          - maxim,max96724r
 
   reg:
     description: I2C device address

-- 
2.53.0


