Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C143347A0BE;
	Fri,  7 Aug 2026 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107772; cv=none; b=H47mLodgKwVlWPsp1u79H/brYeDjic1QAWs3t/KtCjCFGhj7VW8LvSPMuy0MgCJw9IIgNGh6yAbLHojYMfggUV0Q0L5F9uizQ6POX21c7hYu7To6CJEOFAA1K4fAldZQdjz4U3DxjgZj04I2JI/aAPV80dUrrCVqusLXEipA+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107772; c=relaxed/simple;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRIxZPHF/Aiv6pMGSFZaobwaAuhmPucLanp5jl5bQg8+eX4O3NUtinQNrTwzIK4LCxuNNW0Ip4Iyr9ZwfYF67/fqoQgoYNzr2bNfgY81zTBhAhbzzBS44gyqzpNDW60wINcS27WJp7gNpJ2dOEGBdS28FC+Nd6Vx3tUdcyTnybY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnHSu8Vo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnHSu8Vo"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AF25C4AF0B;
	Fri,  7 Aug 2026 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107768;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JnHSu8Voi3N9DDH+zzX2uu0PFfbuFl/uoBw/nwlbPEliwtuc9cOjZkyiiwlY82oww
	 o4Ekjm/jM2rvxfB0CvO3T2xJnP2/Sroyslj77twiDdgd/QbgwfjEXZMZOiWAdoZLI+
	 rxAoDJYOxInlkxO0mwECjD9l1/gwr8AwdPYjTzB05vaH0Zt/nl+y2QDK2VaQD02Z42
	 4M8e2z+SkXfmnKplI+Imqh+cNrjYLTXTuIlx0vC/VQDivt03XQkyhU+efRbVtvi4BV
	 jtQsffL5YL8qrU4i55i+fmTM+arUHY22zZZhDABN9kaRALBs1sTpKNKnXmM+dCw9FN
	 cTqe2o6tvkEWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E4EC2A09B;
	Fri,  7 Aug 2026 13:02:48 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:54 +0300
Subject: [PATCH v15 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gmsl2-3_serdes-v15-19-7212e9e5156a@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=IfExQ18ty+dvACC1gRns4FHhE9fCrRU0GJtT5kLCDBc=;
 b=vkf5popiislGyi3aACg23lW/OfCDL+inJyDhvgNypmzxaD9SEpXdl49NXJXMrR4men3wLT087
 ga31vrq/fXVD8NiyYa6AXwYN32A1qh+L8Yk5F3iPdLK+l7e+1bUhVNU
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..e0bdfffd9c52 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1420,7 +1420,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.53.0


