Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976441A55B;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182499; cv=none; b=VhntFFimiAJGzCaBKeKvu8PlIfhi4vRNA/u0wxcEuBOAYrRApj0LgtYbGjz8iVa+jIx3W367pgeNawoKSbrbDW+nDJAC12QJS0zIVNBFoNqb1ugJj3Zrt4IFPzET9gUec3TFk5SGY0BUiE5V6q0vNCFuLQBU/sb8VlM/p1iqnac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182499; c=relaxed/simple;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUDmxi6H6gngsbA3Klxk6Zn+BRpnM5k2tO/T8tGyZvKMFjoBVQ90rBZUk++0hkihsult/RYjv335EqIYv+hXdjPdM0pvI2/l6a+nDcK6KwtKd4xGe8KsH1Q29fKV+P2b6iCsAr6hGrnaKrOZcLCdHekx0INa/K4tHxoNR9ihaCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I18ELUFh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I18ELUFh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03CCFC2BCFA;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182499;
	bh=uqnWPcYuomOdK+CZnQbIn/W5p1Thhpmu4YbDCuYmLeQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I18ELUFhrS0R6qdfbi+dZn7gJeDWmOGK9Twh9Sd8tWLZHISFNP6AbBOWE1s6fKN2f
	 hK99nG6XidkHGg8jqTcdrZJa2L1Pb7UYrKo/QTkjJQxOoHnyIadZWF71651723D3Uh
	 n0y7RCMlRzSIShLZdK8BGlpEEnanKZUw1CcdyG3WkeWu23ufSSKt53Uk6ef2aywlgN
	 PrcFcBJOGWL4d/89l5qoFhMqQD5Uw7zFCHHu7y4dqpfRpjx+KsdH735nwUq+ai4Pi9
	 6PE1WPU8TzpCDWal8a1iobSXH2BYjuFiJhxsuU97s/1kzCspDQcehif064FyX6SFa8
	 RFO/iNfGL2zAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A1C624A4;
	Mon, 31 Aug 2026 13:21:38 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:27 +0300
Subject: [PATCH v16 08/22] dt-bindings: media: i2c: max96712: add support
 for POC supplies
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260831-gmsl2-3_serdes-v16-8-4fa6e08bb514@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=998;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=4ZvMQ1EkeJ2w8dRWwF+03VM9oahvM+Q5lLU48mndSLo=;
 b=tVN7Yw/FF1kUStgXH6bB5JVC4UCh0oEtRgBjjBRM0B+NDNQ3Voc1oMLHoS9XcW/H4VEvnkboH
 wq6csz+wDt3BluuuOMBYt0f0IESct2lIptzGev9ipzO4pVwdw1ihWhD
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


