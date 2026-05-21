Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF093DC856;
	Thu, 21 May 2026 12:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367462; cv=none; b=HZ+3mWCfHGuL0L4SjfxdO/+kstiltvxFQQfvyBk7mTgizYrYp/vSheRHg9Db5TiKvKxf1z9N8O8E/s+ybwAx0eS/bw4OjZr6PwI1gU3+CacKOAa+BZPSznu47Br7rqXqJAmGwjs6KHQs8XH3WZzU8Ly+vvEhfbUgtdFmmSWSBcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367462; c=relaxed/simple;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hckM3Xr7Xe21vorAOemFRASINM/7yf2Z2yZ/oP9WSpi3mOJFyFWkghZnlmvdAdvMRYxTGc1mF+JbTNUxhpbKTTAgBH1DPqWvPltXE3UYkr2DNmYwtRUL0XYGoWRaLEIOCBDImdSWTAiwgpBCYD/8o4ij+5C3eL4tGQpBW3Hj9M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOLf/8sf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOLf/8sf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4153EC2BCF7;
	Thu, 21 May 2026 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779367462;
	bh=OwrNl+pNAFAGPGuHjWuiWnkMoEjpWW4G2eAfknSupN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GOLf/8sfQmEkXpRF+wFA/ewgncfoBtXhqHf7CVOK6CkOgw/8gXib5U4zA6uLvruX6
	 sOXSx5z2bvBUmjfHo7WykdRtlShol0iveQxmQ1RbTXx97IcVqClKpon9lZaF8UTff9
	 Oa+Hr/IoK+DWHUR9XZuFYSniwPtbexRKx3yZHQaPbrdMq0kPx7nfieiHk6bnwtew11
	 UyjQsFqW8YAvhWtuTOlAlEx4MgvHae34yqMucW/vil2rxmfUGVNIR+YDuU2xaDPcz8
	 eUJci8Ul9ZmLN6YWkvlOjdgxgJL2aveeZ6ftBt26pNjIVHdqqYAg2Jh1O9ppjxX62S
	 R8EG0v/WtncZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3703BCD5BAC;
	Thu, 21 May 2026 12:44:22 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 21 May 2026 15:44:25 +0300
Subject: [PATCH v12 19/22] arm64: defconfig: disable deprecated MAX96712
 driver
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-gmsl2-3_serdes-v12-19-b26d92931196@analog.com>
References: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
In-Reply-To: <20260521-gmsl2-3_serdes-v12-0-b26d92931196@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779367457; l=722;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=Fm1ZVHBh+33F+3wTU55eZ0SR25F5VMZJ6uZBMy52XOs=;
 b=CDOsLRnm+qgmZcajzBb7S42MIH3P/u8WugqdF/vDnTBIg3vuVUceisMGd/wKLnSk4eKJe1GHa
 57HzPUyoArJC2KH19TSiddo8CF4n6GZOU5vzQlF7AjGPEgMObwK0nfX
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


