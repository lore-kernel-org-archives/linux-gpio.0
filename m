Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3593A7F7E;
	Wed, 11 Mar 2026 07:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773213458; cv=none; b=tuuqDUm1ym+pBLnCDY7sJvb/bbFqRtGg4eveEswiAW79ZXC9Ar75+rArIWwS6Ug08hFWOSTI0KtJTAxRcv1BsvaT3ZsQLM5IHkRh74KRtJDjR4ZhFu+g69JfjrtQnkbbviWb6UkLlRYZFqwavUhNiO1FQfWmc0sOuHN0tDxPSKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773213458; c=relaxed/simple;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIWiTmAbdRhU4UCINgMP65J8wp2e+fdMQJ64GiiCBxZlFTuoksAL7CgwcZHe/bgG9NLgAEmwmtms5VS/YWEWK8qDHe1GaWbfyyMMcQroaalo+snaKlzFjCbXvF67FwC12s/wsyeH7b9gBd3yOECaRyazdb5ttqyTZ/bXsTENfYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEMS8E1M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEMS8E1M"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3933EC2BC86;
	Wed, 11 Mar 2026 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773213458;
	bh=oDOoD2PFJhsWK1U4+tLNzTMSsOIi6lAvsLbY677e5ck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GEMS8E1MbNyTiC8pvsTp0gQbTOUsDSkvbR/0jfju90Qb8PzwdM0/Hejf6a5TBF9NU
	 1g9nql3vM4Fr3za2y+iyfMyxVlNwSFvuf558t36ZAx+fHOHbObqDFVS5P3MT9ytZ1x
	 P9iho+YExAD5HzC3ubb3x3qnm/yNrbi+vLaOFg1zHAXwcVgsOgdcvwnRjq5uG4IY8x
	 c45AR32aL11R4qf8Ft3un6tFGTPofTwDr3OWk5o2bsa/aXT3HqdiI0DajO+AClQnpk
	 TYI//YAE+2ui2Kl0nUgb71sDj8P76iWSLjKsTjiad/sWRgCOunJlI9ivWlOE4XHTsR
	 +3AQtQf/cSADw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30106FD0648;
	Wed, 11 Mar 2026 07:17:38 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 11 Mar 2026 09:17:30 +0200
Subject: [PATCH v9 18/21] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-gmsl2-3_serdes-v9-18-41499f09004f@analog.com>
References: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
In-Reply-To: <20260311-gmsl2-3_serdes-v9-0-41499f09004f@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773213453; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=uFFBSdBZnvpPu6qZGSqZLWXhF45z99ke82/PAfeR72Q=;
 b=xL1+U48B54XtXiNhr7e7SuCMAkPI5j8lzWifiIkv10cKK40yr9MC3mZ8ogy+OxnqrY1WBudo7
 2NJcxudTBYuALEdJA2cq+c4zTv7brO1xIuAbGzOPGwc2wsYptWdv4R2
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


