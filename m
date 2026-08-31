Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5192441A902;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182499; cv=none; b=EodWDcUkDnOmwbFt5nK3AN2+Wu6yIuc8ZL5yVqsSPeZuDhehoCM0l1q1QVOK59M0fCnZUZbwibLAuHkNIBq0M4XqzSOL7AN5hK6d3n2qlQLLUDGB6aEtkqxUr/xBXCD7K9KDCEZJuIJv+YkOU2lfe1ogpbWhCvaImkiScDZKtig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182499; c=relaxed/simple;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rV/iR2N0BclP8K5XJ6PorcKl2HNWqFwmDohRb14KBw3ycOmnTBlwLRG3MfxNWZet+h5O2YdPLnLmy+G1AoYBBs9VO2Bv85rcrtwUK5AZNmcZQnhqalIdfraaFU7y/Fjze9ZTDzrvUVWsgdtTvF8X6wO7HwDhneJP4xYdqlM21cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e77kn687; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e77kn687"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32E87C32786;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182499;
	bh=P5T0QdiUtUUc3yfg+4YRcekBidFP3FtN9qvlxhJwdCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=e77kn687WtzE7CjcQnirWWxQnHcZ+5A1kDuCmav1KV4JBzEyTyHcKTlD5UdaGAtM5
	 N/cDEdW+kB/Oimhp343GTZ1hnA4K8m+WTdE2zORrp7LKzfhJYFCs6Wviahtm+yWnxB
	 kwWJQCYmBUxKqSRXjQjsl/LFM4x3UyM5TVl0eRCoimYr/XykQfxPkujdeGgsYplQVG
	 +6g4/kQgBQ5VmugIfjpJEALQWu7TVXRIZvdMxYXHbyMoP7NUcMs8yEWdBJyeSfVMQF
	 rln6ZeWNGxSK5WL8eJv81dZ9T8N8AsQRWy3Ub7OPNwYzcZEF4snxH0j7Y2tTLFwWI1
	 SlUBD7EGIp++Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21874C624C6;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:30 +0300
Subject: [PATCH v16 11/22] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gmsl2-3_serdes-v16-11-4fa6e08bb514@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=1267;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=zOCbIvONkBm9sImxMI6AYdByC42n/O8SZsebFGXPD4g=;
 b=TBxpwhgdlkSJyNfpuyEORT7VnQ5JMnqiUUJp3xEEnhH/bjhk3hN+/rjvrRufTMh/RrHzeCzeB
 T2kzUQUTERJBDUmxNhdsj8U95qI0xwxS2r8RI/1ik96I353vu6Wx3RU
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


