Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB69470EA4;
	Fri,  7 Aug 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107772; cv=none; b=DiD1OrY8ACR47dzMt4osL0Z7NcH1mGv45h6ltFCIsYRDtXAPuk5GgR8Q7J69DOAcjOGQRpSbTbAm2WrKAo1v8mBJ4wg3XvvAyaWJLiXaj34gYR7eb0sfUMj0olxs70E+6Yq2aTm6jCXIcIZ41/oUipfYqhihjJRDYAi4kmmFBl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107772; c=relaxed/simple;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtdJpBJCY+4OxScjbSblWIP4cmOKRbmMBC4TN69JPwqRYSVUAlX6znqzamG3gbByaoBjRqYs6raqHyqY3CW3Wibi29cnFi34mjO8roY55+IMvJ6JrzV0qPBrls+CD3W/+NG3IKOd97LhTR0sYjxn1XbefpfjtVbnI3aGk+JiGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hg8R/Z2y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hg8R/Z2y"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BABF9C32781;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hg8R/Z2y9YIbVCNMOQB1zlU5tlMRusKfOZzNXyVF7CdLMXICJer2zShtV1ouV8Jjn
	 FtwSXA+xZ8fnB/Ma9jxOM2JSQwpUnqis8quXjBMW+1rLFb2R/ngXh7nWBAqsOxwCCr
	 Mfw9prSBmgyvv4luDalITuo4v8YvvBjGPF93UZr7ixuB42qRpQ2hJrz6wytAGv6doS
	 1cPUPjSMUC2cr1OiB36XVMsIpxUoCzXZ9ZgNxyVdaliGkf2T3D4SSJnVlaYO9WAjoz
	 34qhCwvFh/mBmi9wTbvJ55SSeMQ3T0wzFUj4O68IeAe+LV2D3rNI2PQVLCBvMTgRSt
	 3P1jWa8cufxKQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60DAC2A09B;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:46 +0300
Subject: [PATCH v15 11/22] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gmsl2-3_serdes-v15-11-7212e9e5156a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=1267;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zOCbIvONkBm9sImxMI6AYdByC42n/O8SZsebFGXPD4g=;
 b=6Z0lXxtMdxT/cAKS5u1LuWOr348hNWQsJz7NRGtoouQWDfkNyFkKKulnkpTvmAIHdYuKebNAC
 C4KuezHJGOHAmXCFLJdg0BoGcEWxAlwWat72c3384GU1tyHjwyN3KYq
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
2.53.0


