Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7914E3ED0;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=EtJYCKI295fjYDyToTyip+abTZSurfpws5pJMWOlLvfKmZxoHfZXJFngXfh/x2ewpBPECU+P0MmCe0vCKKs77wZC0ghlEOkyY6L1DWV1751hQDHpFbxTNUYAm7bkD6Tp98G8pJ0tzZzk8vsuQxiSBhqNdm/YilsDnYdDQ8AKR1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=gPQ+PRuexMb6ktXazMToadmhFmEo2i45TrXvKycWEmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Izv1cb+vdhuzyfFZJjBrOut+FPi4PjlrOmg93bgJxr3yD1B9bImEU2fBsy2urGlVq0oHc50DvLsjbijVZUXbSg/5FnYYBY+GpEaU48C832KuvFioIGEU2aKq/tzXxGmxNxIN8qlIyfG+5qmvWBylQeWyRNVFj0KJrD1RZ92W6LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRACTutq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRACTutq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85F93C2BCF6;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=gPQ+PRuexMb6ktXazMToadmhFmEo2i45TrXvKycWEmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VRACTutq2xraZ5jG85WCvYy3tD9QuRYJCAEYycCboR0pCW6481TNbGQWnkFiMvH0Z
	 wZSXgR2EjIKw/QwnaO1CakSi/rszlZYyy54SRvT+Nn3RB4Xl5Tg8k543OylTIKW5xK
	 n8DY3uKYyl8BUK4rY9ibW5SVrIJEcsdqFk4798Xlm1KTX7mfO3taWt7xHRJISyLFw+
	 +tVi2xR+4Evdd0zerGSgL+SN3SGMzxrtL6RUvfIbvSWm4MEGxb4kHxUyLMmA7DyW0c
	 b4NWtrlwET0qw3k22oy4oBu08XzwibK/Wyak9CRkXNh22Ib3vh5ce94KYE8nVZV6KK
	 3AcpbEIBivwlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DD5CA5FAD;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:45 +0300
Subject: [PATCH v18 11/23] dt-bindings: media: i2c: max96714: add support
 for MAX96714R
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-11-43117818f499@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=1313;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=khss6mvGYvbkpkf3Q8qKMNyh22EWZUkOn2aoSY55PKc=;
 b=xanvGn/1AORFUH2hom2D9Y3Uv+A4OfQ3sYkVdvktYEUi3aMFxso3v90NnkhgmGV2WM8yKpd+m
 pKVKYpvrVJUCagVkfQVMUsxQjQb04InOy9pW7vBa4KTPaC/qmlNItKG
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
Tested-by: Martin Hecht <mhecht73@gmail.com>
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


