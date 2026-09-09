Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5C56B85D;
	Wed,  9 Sep 2026 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788960483; cv=none; b=aNVffWcYY3tIcjMAmG4liP9EyFnY3rYYEUAV9kNJTwEHY9tX5O3bAiPClZIbOXME0x5/miMZiLl/fbSSd1HM/Ap0ojdvs3hjzpszFnmhL9/UGTqB46cc+REFh72l5GRMiM4eX9pHkd0VTqALkY/4sUPUw7t/wsVY5vZcPSfr0Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788960483; c=relaxed/simple;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IZ7vaxHW5iLP8ga7ckP7sIJ61fSRu8ilynFoY3JDObn2gqHd9WdZK8g+QKhDZm2DWFUJpymAAy9+HihlxtYOszd4EFdoCscvnvvDd4jubULWkVorxlhzUrK7uPIF77en5SDq69sPii8ByEKz37uvGkP1dJfIpdwwTYPyeJab51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLZKMpDD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLZKMpDD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 635A8C2BCFD;
	Wed,  9 Sep 2026 13:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788960483;
	bh=C9rnPRKRR8AyimaRUcbmAJLI/wbdKMwleszCFVss9Yc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PLZKMpDDLZPxeeqFlLpPsJqY0fAV71nNFzKNXO/XHNw5aO/LAfOst6qRUNwkmxILo
	 QFLVxUYsAAQx3iHsq+5nACoxDgLZJMo3nJnXbbWu5IQMb3yT/APJnoZcaSEZhKav8k
	 kzMqHP1/FOus33P16EEETQwjxA8xZndcxcxqaVWvL0B/j9b7sWuAidyWy5njALfW7Q
	 i6gPW2BE2GAx/8P6hdl7qA3HnEsEWJhhzRdz6ETJJNTARVEkVdXbNtV6TMgA3m627b
	 QtTmvu0kEEjv3TrM/snQx7loEs5pP7aYDyqVdBL4g/yMN8PmBtckk+TasqV3Atrknz
	 ffNS6OSpXJ+yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FD7C79FBF;
	Wed,  9 Sep 2026 13:28:03 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 09 Sep 2026 16:27:55 +0300
Subject: [PATCH v17 18/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-gmsl2-3_serdes-v17-18-002499e534e8@analog.com>
References: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
In-Reply-To: <20260909-gmsl2-3_serdes-v17-0-002499e534e8@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788960478; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=IfExQ18ty+dvACC1gRns4FHhE9fCrRU0GJtT5kLCDBc=;
 b=YHPsBBio23SAUIAId9Ul1YGp9BW1TK8C4K17qBKzcQNDtuqXwvb+yd2UO0rHEoq7InOXCs0EY
 8qMecQxlLmaAqgKd050RMAmFHqXhBRoh8U+cFppfQecIPgHq+4gPB1m
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


