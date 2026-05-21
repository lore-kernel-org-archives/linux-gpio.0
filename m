Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438A13D88E9;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367461; cv=none; b=AvTfPbRF1Yy5tbRwAs6JAAzUzBsudbDqDzfg3gQ+wsTONAS1DSzP8dlMt39rMrDS39zWYKE94nKqZzRiMGObpCwxtAqDAs8ZxlljlB2nDjRWzqh/+O7e1vTjtFmmoxMddeMsRFIo1FmzLRax0PLd/pz7ZYNHixHDtolCTMtjZXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367461; c=relaxed/simple;
	bh=IVMjQPi6cuXsnNOAOBqZV5+FmGTZcU/k97taVGCOIoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JARtMIB0IemP7LkcEH1veYtRUvuzbiRC4SP+WdGgsw948MpRBgAbXtSVTZ5ONbFR4AtXoQgR546q0bzafrPx8eEIE2LHMMYxUQyt458nfnFPhFIxH7n+FjAZCe5vDZnmQvt+xghQUR9bav9S7YbpU5uk5fwiFY482/dqw2ubeoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gc5q8KUi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gc5q8KUi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26900C2BCF6;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779367461;
	bh=IVMjQPi6cuXsnNOAOBqZV5+FmGTZcU/k97taVGCOIoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gc5q8KUidgNfb3Y84vrqySNxsZwZzjtNsuAzlUSsrGYRFFnuGOAm2033NFo61BWm8
	 9VMfjIhxV+vikvVrRSPCXCiPI6XeSVwfFJnaWqbEK91T/zhkrxjfLptKkfYPR0zykM
	 Ni1dcqRaazLDY8Q3ZXmuKY4StKBIe0INcZ7tBeHF+DquFAwdZDem/81N6fB/Uonlah
	 HPSE5S+Atd71jUj8eZ5B6yYWaHucvJnfz8S2ThObi6+WMLZTExrgNVxuxebOlBEmSP
	 wnAQWBvwj45Rtc7traH2HkuKdJkFbPeT5tXnTga6eRmiqtvnNoKxPr5ZwpA1aQsEiO
	 mJ4FKyVymR5XQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B5D5CD4F5E;
	Thu, 21 May 2026 12:44:21 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 21 May 2026 15:44:15 +0300
Subject: [PATCH v12 09/22] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260521-gmsl2-3_serdes-v12-9-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
In-Reply-To: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779367457; l=1289;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=ZSTakNbBz4Qus1NiPPbe76vFnVEQ3NLtF7fl+Vgxvf8=;
 b=65Y2bwVcYsk/XbzbG6NETHs/hT2yrZaOyPlOwFUQzh9Jkf0lWj+AtZpQKYyPMDe2Ivs/GSxVp
 OhilUJ/gbqpB9SNYZi/RpiyCV+uF45aSdiPKh47oFdLHXPu7cfDAV50
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


