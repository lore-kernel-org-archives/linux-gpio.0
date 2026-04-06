Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CCD3A1685;
	Mon,  6 Apr 2026 20:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506522; cv=none; b=C/1hq1KCAk5O87EVz3BfMXmWsRFW0c1hjSB2jDGKlKjEOPyO7CC0sMRJ0RylszIhW2rhQef+esghQjTTYlK6KaHFXHArN3cIm/u2JAI6t6CRz20v9DwkzNaLj6p2j4pA2iUPsDpTPPs+wBZYWjcCRJvdCKnET8ulegwROH6Vj5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506522; c=relaxed/simple;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SsNUHyhTMqC2P1CUbgnEAER5HlbOyfrZOfQPiEMa3x6OWvZeD3oW3tsUhJ7haQZ1V5lixM6HGfQTrH//xrmqhPwfgEHj1GEQFuFCLzQKW82Jttj3ijTHTFzdckSFoPcBL8sXrfeS4829ySnnIutuXJ9EFoTrRHL7rk49J/a8wFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agZd9ZgI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agZd9ZgI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BBB09C2BCB4;
	Mon,  6 Apr 2026 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506522;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=agZd9ZgIRv67PtStDZ+Sadfukhod+w0wMV3xQrpdOdvMnaMje2sgVAoOdMXnKC48L
	 mF6OjNBUgyejyXAPPK9SiR97G7Q+ZVfrm98+tBrbnwBWsPperxljn5eZc2jxL8QrxC
	 SSDDQW6ac3QXv1XhirEhCTvoyvoJSE0wy1Nu9VZxGDUXKnnvSWUt5dk+eQ0gu1iXvP
	 Xz6++7FKZr5wJ2yeWcnIM/qNqqk5XBfKvRSbYUhK8H+dyrVOIndgwPWSDt1cwDZC5n
	 d+ci1n6nlABpu7NrjWfS84Bsi4m6tAeh+zryljdHPni4TGpeT2LEak5Zx0W1Xa15rD
	 sArXSN6syUazw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30FDFB5164;
	Mon,  6 Apr 2026 20:15:22 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 06 Apr 2026 23:14:58 +0300
Subject: [PATCH v10 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260406-gmsl2-3_serdes-v10-19-645560fedca5@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775506518; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=uFFBSdBZnvpPu6qZGSqZLWXhF45z99ke82/PAfeR72Q=;
 b=TrDyRm++UUeoBNcDgkvoog6KGY4uelu4iVHB1OVgM8pQeAlFBC1AA5/Hs/cUJYsn5LabxkE+z
 Nzzx3xo8yshDzDYt2T8lfe5RqII4BvE6WeHlxxh8UQjZcuXEzYSn9Zg
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


