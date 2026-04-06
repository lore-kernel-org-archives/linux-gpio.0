Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64CD39DBE8;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506521; cv=none; b=DJmQTdzlr0Oo4XTDBW4zvG/rfXt+VSrb/UdGMIxpBxt3hlzGwlmPkIZhOSFYNLhJMQ7XWMF+H5VSKBj/34Xm9O0JVtscPCDH8m+VW00iDgsuvGnzsdR18DPqrjhUNtTEhMyvV956aGFjFb1TjLg2c6L1D43fMb230F799Va4/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506521; c=relaxed/simple;
	bh=Naw/eq3duVjNCge473NEbRgpjB3MiSzNqdh3TZ55RKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YivVC8mZV8UHSBerHkvaeCM9Ad8UCeaD7I6wu/k2NNA/yrlD2oSsXNhl+7aeXrCnoi5G2DGZjxtrqfcKsBy4xcSZ0Xhz+6Y4mnsJCMpCjecAutb57hJKhQBRAwS1CQIl2Fq0ofLYQ6GYkJjan3ad3iTvAjq0ST3csQSF6hYax+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBTVg8HE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBTVg8HE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB7DAC4CEF7;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506521;
	bh=Naw/eq3duVjNCge473NEbRgpjB3MiSzNqdh3TZ55RKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EBTVg8HEosdWEo2gVmTUHrMc51NjnlkyF9qzSL6t1dTozxCtgjnb1v6SsfuuZqqcy
	 +9hwPTTZMVQwETyqVsNnd7ZZFiv0kFTWAW9zHKmIORwUGBS0l5aNCLA5nwHjoc1Ygo
	 vtDsOpxZWmQ8GZ5UJ2bQUTLa+g/hhK6MVuvG0ahfD+whb4H26ZRHuLLdQcn4u9BCB6
	 M1u9SNn44Sg9olyjiXK8jOZO2SjvMpDSU+h/GA7R5zT61+tlHHwlMWAmdrAHDcXaAb
	 A6tbsjCSuD2M6jUYy1WZSzWQLdZ9ZkJ9yI+Qqbsqu/qJaQPPUJPxiqLbRw0a45YyAz
	 Beu2yqSteYZhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B233EF46C7F;
	Mon,  6 Apr 2026 20:15:21 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 06 Apr 2026 23:14:48 +0300
Subject: [PATCH v10 09/22] dt-bindings: media: i2c: max96712: add support
 for MAX96724F/R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260406-gmsl2-3_serdes-v10-9-645560fedca5@analog.com>
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775506518; l=1289;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=X7Z5jo9cVDCZvZQWGTLLa9EvhT59pgE3U0xPNb18WHI=;
 b=U2uRxNHM+A9wpM/8Tze11IisyAIcUMc1s8ATsp8102Kw9nJXxEDhyf33qw2hM77ADRvQusNFk
 5bi5D0CvQ8vCMSaOSZOABkTpNulPbJ46fmQjpAj1gkhD3CnDbJuVkDU
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
2.51.0


