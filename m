Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7A3D88F5;
	Mon, 11 May 2026 12:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778502405; cv=none; b=DYP+VHRzgyCVQ0uY+kKrBwG/XE2yut3qA3OtbYptpZ9J9+zCzGvYgk12gJB+SgAEHwX4XwX6odwA/fkkBwYl5Fx73JJCR4Gao9ovXrSws3QMW0B0mRpo24wmvrQ3lyZkaM51GA9CyjyA926tJ7aoWUYPZmdvlWoYQDkpNPevw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778502405; c=relaxed/simple;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aZHXUv5NgrdMKbmC7bq8qrCcgiavjICsqNeCgIYIE86UdFt9iz+RLNdDJjUTbxC51jZ2BvYCB64eikf2qhPrdhHONoqtLg61HvzYMnRq5m7U0bzNZ/q4uWyaAPYq8kXaebI0Hb5+n/aNkDgpgh2tgN6cUR3Y+bENRliGz4ZPKRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gDH+SOZz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gDH+SOZz"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70C9FC2BCC9;
	Mon, 11 May 2026 12:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778502405;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gDH+SOZzKJmAWWTzxpr3syszho+aUbQEg3V/3s5PeK+I6vrSAWYNZ9JoEjCcnPEB2
	 J5Td42p98BYcqtP6cZ21EBPJMd93ZLe4DsXWeBFj4bbhrUENuFNoXGMeo1FuGK/CtP
	 D3vNNWN7yih622ag3nTCu97E/McRduY+/tQh68aZeWHjAgXYTRIEN4uVfzFO3BbAUn
	 D8CACl7ZLQtNygwyVhJ8A1shdp6ZTT/EOKL09fWjwrKHN+rBotygzOgiAvNnaozvKE
	 mAAuJF057AxwJjfLPFoJYuURjYJs1D20o/145zmSYuByHfkOrRud4cyi+Y7iZ69AwA
	 Mes/0BkHkqSnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686FACD4842;
	Mon, 11 May 2026 12:26:45 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 11 May 2026 15:26:42 +0300
Subject: [PATCH v11 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-gmsl2-3_serdes-v11-19-fc163073c16b@analog.com>
References: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
In-Reply-To: <20260511-gmsl2-3_serdes-v11-0-fc163073c16b@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778502401; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=uFFBSdBZnvpPu6qZGSqZLWXhF45z99ke82/PAfeR72Q=;
 b=TNtsfW2n6hwQIHa4QQePN9QO8vQAFtMrVeolEiKxzt5RDKVWjNYpwcFPwulSHdjF9++XqWuPH
 WCroM/h0PYlC2VNKxcHwge0k74upAHVz2L7/lRa4JQbnjWedSUZfIFF
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
index da34bdc1a7f0..893d78b138ea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1321,7 +1321,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.51.0


