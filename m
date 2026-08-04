Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C62843D501;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833434; cv=none; b=SMgbKSOJ60SqXLihANxL503HPiHPnwNB79W7NoslB+LNgKIpgQoS6NlZUUwoF9RzWJ5RSTJzEV9iwnnWVsUPIT9PaxxxEONzCEvCZMs3TE8SBVrnOOK5vaAmejvF7NyFWkhX1x1s7BTXOVVw3tp2p2nIchdLz8zoJts0SWlQChs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833434; c=relaxed/simple;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pyKL6Fl9GX6MjcsepFGZ73ZCjTk5ytgjYPnFe+6ufMf4mPRg0s6QQSCxAwrnoHyDpbiqDrQc8IqHDefFXQmMfDJXJdSTOGuIh5OPnxWhytTu/clT/ueFTBpeqaMXeJWecPZpZnxJZMESKDjTp2DYYU2GBAQ1capNCmhG5e8VQJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KTMaCoIS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KTMaCoIS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4936C2BCF4;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833433;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KTMaCoISX9Se0KZqgQUDc/9I6ZRjt214Cf5N3Sqc8AEWkT5FYxWUt9T5ofpdW/SqP
	 1o8xp/HAztnZ8Y8ZIbXmooBSuBP1K1BXSpDWCv5wW30nCl47j2wwATwWeRZIaXuF+5
	 Ahm6U+tTd2cYsIzCjxLOnJeAoiEbji9Sk780Ojrnz3NUC+hhfqcF43sjB2Vgm359zw
	 w05IZ1nfYo+zRC1IwGHLeKKQ4W+HZE6jVJ2vbHvtjNMaV/X6EoHU4FOCYpGWtvnlg1
	 pduaXRex14qknpakxR20AGdhrOMLKiJYJUgGGlzaol//kl7HHbjIHXUhLgBKb0jti3
	 FNC1jWbUkJy9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19E0C55184;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:49:51 +0300
Subject: [PATCH v14 08/22] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260804-gmsl2-3_serdes-v14-8-763710c884c0@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=998;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=4ZvMQ1EkeJ2w8dRWwF+03VM9oahvM+Q5lLU48mndSLo=;
 b=ELipCTY8rTeHqTa7k3WHzHIzes4fjXfIGFn0rnz5ZtsqVNuTZ5k83HTtnLH77wGh2RiOA5RAJ
 HLO+FH51qCqA5fQZ/DU1+jPyTtMmsofH0wH2dB5mMVudgFgSBzdfj2Z
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


