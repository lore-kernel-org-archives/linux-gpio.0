Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC033A75A1;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213458; cv=none; b=RSv0qjbY2CyI1+JMSs5N1B52P4rOlvu+iJ63+94ZUIgSKzXXrcmTRvAiLFTjVT7bwVmn/AI1RE1QK0SebvkSuGhYNgu4qjQIoatjDVZVhNl54J3rRVurgDX8YMSoPXoaN8YQWtfio6VNc9Y+EDgo16GzgpayRIduiBY8XWtqVOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213458; c=relaxed/simple;
	bh=YsjXeUcn9qhbYLaqF5kqQeAp3Xr+WGO7JYIzMmEbR2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iieTsE/9jHGdF5fTbzMl6Sx1mSBv9AtNH6WRPKRzt/n1nrO0RaVBecY5untdD0csoxtGwF5fGIGgvPkD8LnkJoB3sn+UFC7oTNDWRUpnoGlYULTP6ypP8jhxYsMKp8n17376MVSMHVOPxv80haP55/ylyyIDnosDQV3fapqqVDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AjBnVYIj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AjBnVYIj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92A44C2BCB8;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213457;
	bh=YsjXeUcn9qhbYLaqF5kqQeAp3Xr+WGO7JYIzMmEbR2o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AjBnVYIj1n7ydU7S0hzGZ5ralgkhuuoZRzCJ38JgwSXRiFmGaiuvRzIKqZ2dmeK2N
	 seD+CklrX4/AiEn7L/Qv83d6CkJrd9ovHmJEQkKVYMBecntOC1FoFv3a/Y6alK9XuM
	 KNQ8SlNV3AAMWGvbVxq7VUq8vuuSyh/mR/Doq0rXS+D1C+F70KEIyKBV4YRfAQ7Zbk
	 eizmtvUgCtoQcIAmhmHBhf2B4XcJqnM9zswteTryIJvkMe/6l3mYqrL1kPdT10bwAT
	 HUcU5TkazKc+mDptWtCOvb/GmSN97WurmqOISkVDXh4rUHH3fzDlB1FQGXb3WiiHif
	 +tnAOgKPHCFqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB98FD063C;
	Wed, 11 Mar 2026 07:17:37 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 11 Mar 2026 09:17:22 +0200
Subject: [PATCH v9 10/21] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gmsl2-3_serdes-v9-10-41499f09004f@analog.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: mitrutzceclan@gmail.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Martin Hecht <Martin.Hecht@avnet.eu>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773213453; l=1267;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=7ctH/2Vx+KX20AODScSmND3oP+TtSyOrnfglXDuMGh0=;
 b=tctN5hl3SQUhn6kKcIiBWpQrH5DL2NB+5JcVNjS1LPXzd9M3kt/9phe9MCyoLGGLa/Vb058BM
 fgydEM+kpuiAe1CjLefZHpFDATDE24D27Dx+JoWL4/AzkYovG2ZQmnm
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96714R is a lower capability variant of the MAX96714 which only
supports a fixed rate of 3Gbps in the forward direction.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 3ace50e11921..ec6a91c4a51c 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -22,7 +22,9 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
-  MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+
+  MAX96714F and MAX96714R only support a fixed rate of 3Gbps in the forward
+  direction.
 
 properties:
   compatible:
@@ -31,6 +33,7 @@ properties:
       - items:
           - enum:
               - maxim,max96714
+              - maxim,max96714r
           - const: maxim,max96714f
 
   reg:

-- 
2.51.0


