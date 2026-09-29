Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406454F93BD;
	Tue, 29 Sep 2026 22:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721716; cv=none; b=Gm35i7OgDLMth/tZWcpZEP9eyF1nfZU+nY+YZGeBfHlPtvIUNgfH4FNObBoWQD8SQgWV1x6BxBviB0QVhx5JOuGWCyWHdkhHXPf54pIPMVMdQ06ZTeFWZegx6lFSFJYeQuUb7ZakuAlR1vgo+6Cwt5GAlY8bVQbu2FJoDoIKUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721716; c=relaxed/simple;
	bh=L9aOwueKJposto3S/j8xlNbLbegdNeGFxmetEHzNNlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQC44zG0LCZnfOlhaYfmRFK+7mO8QvMfXHOXOIjMERqtF1JRyINbg8FTHeFVYytxoL99GKMTpH3j9OlzFCrcXnrXcaseUv35U0R4r33Q6txkbXHGamd7xNIphRZvAjUGppYCBs1SHuuf0Vgk0o47pVA30PSnY3E+5AEwhI1xUlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+kSaqML; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+kSaqML"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2454BC4AF17;
	Tue, 29 Sep 2026 22:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721716;
	bh=L9aOwueKJposto3S/j8xlNbLbegdNeGFxmetEHzNNlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s+kSaqMLPnSWEZ/VVd3y1yyRI7fbCXnwV6ZpqH/t+6Z4VcE3mk/z2cRSeDrIFEL55
	 7rA93EuXRMHRBm1tGFG0GsdexSSVXwpSlvIl9jjpVfpRGOK/cEpYz64TPm6pl3DuSO
	 68HLsZYFduhKuim9V+BdZn++6bNUTcc0rnLGB4NpaZRgslWGXG8XMY2g8Ncq6K4jb+
	 WduuLX43MwfNeMpSHl6QzE3E7Ae4z8lesMdHKCIJnt3lfZSTtpNrX6tME10pu4IhdP
	 b93t6d2xfcrzR0wkZYaJIGVI3x00jB2u22oI8Hw76Nes0qW5h/BopMw2e2s/a+NXo2
	 wgUKuTQ0F5LOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BDACA5FB8;
	Tue, 29 Sep 2026 22:41:56 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:53 +0300
Subject: [PATCH v18 19/23] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-19-43117818f499@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=768;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=6kF9N6JYFi89MKQhl55Nfc9RzA6S9OqRF64bwl2FDJ8=;
 b=XJExdEPZdX5cohi12HHKc0v37Hu85fLKNFFB4BVLXGgw2v2XBocegvRRnebgrZuDiG/iaJFOk
 znPVL50UmPMC4HqXuVw/uUheBEgotG7vP85OfbTbeReGc3jvr0jv1A7
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
Tested-by: Martin Hecht <mhecht73@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..cbcbc0ba1e24 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1433,7 +1433,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.53.0


