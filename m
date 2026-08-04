Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2058E43CE71;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833434; cv=none; b=A2sJBhJRy1tpwW6ya1QXsi8TdlDOJcP1oDOQpAcAYVq1lvqyZD1axooOhRBFOT8wdNMoYrgHMHGRTtrcMZeTFTZNPz1fZtUpFYAhHZ2nqD1EPjdtCxI29Kv8CeFtWF7hrA1d+sUFkocGflWznot9u1C0+tApVAvwSfJ3HqSHWks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833434; c=relaxed/simple;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dIKlhcPELBa4Z8lJTeC1ci16udisBSGylH2exZXYQDQpK2fEIV3/vZYgVIqvqLw6slQk2+buOrViHIqAXBuIPQvoyNCi2ex4uNDoaJzAMusmcvm7UTSyNXq56+il6agXrqswygmYdA6kHJcUDUFRJXDwqc8v6DqX613wArIbfYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZTK5Si+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZTK5Si+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03532C2BCFB;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833434;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VZTK5Si+56c9Tt1RCaMckxAsS0G5tRVz0qMF2Ow+nG3q1FRSp23+f9e6hd9mX02G6
	 bB17GjZRiBF4o/LHcrdFp+46di15F5qjAaCQbsugoPh9MthnizThkPDbzoZZzIj/RA
	 s7CfaC+BIh/l4/FSTPSckCy5XKsxP73J+/yPc0dmXCjQmLck6Duc5MGJdOQxx3Ly+X
	 5o7zv4vFYK0SqzqpphGjEecx7YcykdKXqLfpfXZt17WD/9WRz3jsVkghpgeEWzuFTD
	 9j+HVb9Z//HHUdhIca8pXm42vhO8u0zmJ90p4cXzaGadyX9nK2lI6jFkQMDleP1PTs
	 NwjTM0hWBoCFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E545AC55ABA;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:49:54 +0300
Subject: [PATCH v14 11/22] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-gmsl2-3_serdes-v14-11-763710c884c0@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=1267;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zOCbIvONkBm9sImxMI6AYdByC42n/O8SZsebFGXPD4g=;
 b=iYklAQbdqoP4TKAhj9F9azprOts6lKjuEIH/gu3AMJi1hdn5p+K1y1lvr2uL4LKHZ2REch7PC
 axtVWyVnBeQDVBCKs0VESAn96sFU1m3jnA/2pENtDLv7rlofi5sX7lH
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


