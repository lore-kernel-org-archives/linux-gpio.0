Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F14D3E49F9;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=kBE4/cuEaBww0sA1LgdNCrtfrQc9RbloyNPrljTU1eJZXIL4kLjM3VCy+Z3ujXTO8hAB05Qk5NO3CFpyo/myi4NKoFr9HanGc9Re/pOp69GSkS5ibaY9ru/q0qCtthtnCHxSddnvu9C1xgPJMQAaQsQeN8vq3uZdh5CPNE/Boik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=bbdlEKxfVmMIogrYFozji+iEag4Dcqczl+se77xpFRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZdrOixRbl+9XIFczabTn5DHARZftvz8LZ4T/4iWdV8Xdgvh8j8YKDL1scG3hMI9LsPHu2yVVGRTY1+5LgqXYa2B0gkzgAaAuwa29ErIgOcNeTciF9SBWaD652xrY99cuEon7N3AWqfwMdEHJ2FDLoaYRHsNWe7Q1Tc1LiC2+Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UM53WAKa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UM53WAKa"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F8AAC4AF15;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=bbdlEKxfVmMIogrYFozji+iEag4Dcqczl+se77xpFRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UM53WAKawD6CHfN54J5p4lwh88NpGKu2UAfqNCLkS3OU/MtfJ1OE7cS5dSWbfEkCi
	 fUQKDfeKfRM30DoFZ8tBT2wsUcrmCH24iMb7aORS9Ym29/I6Lm820K35a+vNjZGFbb
	 9Jvy+XDcyhFjf9eSJ4nttEU9yyq/AQFSPKYSteDMkiDoh1vsv/aEaiqQ7slGA++qYT
	 Pw/M22GYWZ9fPFmWRAV9uaz0zrLNQHBv4OspjH7Fsd7lal90IE64b6dDuHUXk6EEme
	 1G2cOZ5NCvKseYBp1AnoH8v+zl7ZJaNLLZibaqThBMMy/78KucmTFK9Y6CT1/sZXme
	 HO3iFcm4vpesg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01EE4CA5FB5;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:38 +0300
Subject: [PATCH v18 04/23] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-4-43117818f499@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=1261;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=TbNeadpqqVmm085aoBPl4Xj9EAKiacWXhSoOjkOycxA=;
 b=AW4KMLV3KFghOEwJBNZjjuRc2WlcSk0x2TuOoAHKiABjjJDifcqgPg+1P1g2aq222mU3xU3z1
 vFW8eSWM4EDAAVMiDy0laViKf+rUONXVPYQg7w5a0PmWziblQN+SyBv
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
Tested-by: Martin Hecht <mhecht73@gmail.com>
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


