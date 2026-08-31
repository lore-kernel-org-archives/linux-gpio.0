Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF64241F5D8;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182500; cv=none; b=m0JAUbqI3vkEr7Vge+lOfd4stg5j6QF9d5gkPFPaY2RDKffSqsdVIzLiNBOlT2eugg85R/mlcQ3Z3uR3G/2jjaMWWI35MXnqnK5942TsUJNSFAjSDpguAFeA0VcoLcc1ZMFkiAlEmH2Nfx8BNn+hJ+qUcMcVKx+VA8FI3iWacy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182500; c=relaxed/simple;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Awy7Lw4WTHbqttxc3XGNoVXycpfQqlF2ZmwfU9uEn3nY8o1EZxyGwapCMoUSKcTY9yVh0OrIK48Z7mM1ddqXZkftBy0xglMuRaYs7apLey2Htq07BPg5We9QAGBGg8z8v8Xe8PC4vd74RpQK0YsTVBeqKzRzWkoIkN/78Re41Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGuq7kyr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGuq7kyr"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2AC8C2BCFB;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788182499;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=oGuq7kyrb8g6aLNNi8Zf6rgKfNt01oKplAyZbFuQZaUfZgWo3a3c/uuQ0QI26/vPd
	 lYpx8QbmLKFw7N/B81z9EXR59w5WV94kyZiVDDMVCihVNZ4YKNCIdP1MdjYqUmKM0I
	 SV70MZlkjZgGi8HNo3V4DFxU/4v1UjPrN7/Z5Nqn/zvoX8fclnL+TCyG5gjXsRp/YD
	 IIMdVQAmmETe3uOjtJiEp1wQNkYsfLm7NC3Y5FvqUK/nLauCSBLNfqMkI5igFxwTdH
	 rnFwC1vHtPeudpPBHH3ddh0Wv/peWicqPeMf9BQ58QjiM4tzVajEpwYvRxyatmVf9Z
	 DLX4TkfJX8xeQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1064C624CF;
	Mon, 31 Aug 2026 13:21:39 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Mon, 31 Aug 2026 16:21:37 +0300
Subject: [PATCH v16 18/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-gmsl2-3_serdes-v16-18-4fa6e08bb514@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788182495; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=IfExQ18ty+dvACC1gRns4FHhE9fCrRU0GJtT5kLCDBc=;
 b=GHpOr6kPBHNUTd2dgmu2tlJ8NjeTuLfrzBIQeLbKONT65CJhjwFZxsN7YUVjixJdNXZF6QipZ
 KzsUNjrOUm8DQ1YiEYZ0P2uklG/dXDBLF+W4/yHfmFfu9xPRDyGfyp0
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


