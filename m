Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF0441621;
	Tue,  4 Aug 2026 08:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833435; cv=none; b=CACTQpmUlFNmhicUenRSc0JiBDcl/DpshQZWP60c6STQfWUKMkENuZqcs/efkOud+1cHYM2aImYS7GNEngDFG8vyX3Yuy/0jk/7ihlkvJnQ8lq1rSAtgMHT65nrHVGYqWW2C64Ulwll5B2WecDi6dITT0/rn5vSoEheYCvarxJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833435; c=relaxed/simple;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MhrGSMj0XxGn9pSEWSE3zoDHlfK/2Byq34Enl8MXddhOO2yn9/ZCfQ/sUseqmxXbLvMt6FD1mX2wZCX2HCNEOgnTVC/bHQDVbFEolH25A6QyM9/wnOBruqDbjQflbFODAULe/Y8ijk9hj3J/FY+VGeyVEkHqEJBP5WvxWPfKlH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbvQCYCm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbvQCYCm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE994C4AF0B;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833434;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lbvQCYCmwsNhVR9ge59McsAsCslGuas/aYeAigJcYlAc0zr+E9Ys5Zs/FIowhLD3v
	 YW/9Pzz66SN/mkz3OsTCix6ZUN00UtPdl4AoQwFKQvIEHWOwWaGHMaO90raVtgp8sI
	 J+CiwHd7uCr/r4kyOuSSZ5GiWb9gvL/jJkd2l4klw7swj51KGuAvyMjf+JDDeLan6E
	 qHtrpGDuD5V0PPYLZAPn5mC91tARnLkBXdFV+bxkdnNPFAoCscMijDzd5SqU3dbpIQ
	 cQDCV1M23AmCIeUkq32p2clsh+ocn4IcxctADhefdn8VsySPZf/BZruqtKxi8RiMLS
	 0PA6GwpPsrM0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB61FC5518F;
	Tue,  4 Aug 2026 08:50:34 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:50:02 +0300
Subject: [PATCH v14 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-gmsl2-3_serdes-v14-19-763710c884c0@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Fm1ZVHBh+33F+3wTU55eZ0SR25F5VMZJ6uZBMy52XOs=;
 b=cB/IIMk7kRDG1dvHxFRcfdu7jfDHB0iZ27FKsglt7zZhCI+66fKTMQrskOyUiXsrj5WDLrGR6
 w39O81LAiRUDFVOe+Y6SgixGcTNiK6O5yw0IiJOGo1TNy7awjeLZI/l
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
index 4c81b721a03a..9d3b284ed9b1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1426,7 +1426,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y

-- 
2.53.0


