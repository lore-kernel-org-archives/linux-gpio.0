Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF9E3D75B6;
	Thu, 21 May 2026 12:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367460; cv=none; b=rCMf+eZw6u7PXsa0ROBmrUMf7tC6fq6EPtI8xYU02Db5Py3TmMyo26hNbATBhlJzmP9CS9uuI0VFJah4VyOsNv90rOQ6tSGqMW24NamCUaZz4km3KbmmGVTVkFPDHwFfWe6xpoOjqlaiKE3+B+vx1fSq9XO4TEjLafbQG2ejfws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367460; c=relaxed/simple;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XcGI0qBE3TNlJ0NyeVLwh0stddLFRSmc3H/WJd3SANrqvl48REoH8Cf7xpVX5flvwGJSg+5A2Lk1p41iu9mhrkc+SITzgVSUaK2jjjQgYjjWZmRveGQr0XSHAKQDjWjcwoQx4tdr0mNoCgWXkrv6c/WiqXwTt8HLcxqSIl9Ue0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgQfwc1R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgQfwc1R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC1ACC2BCF4;
	Thu, 21 May 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779367460;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hgQfwc1RrKayV8jxCP4krmcdQHrzvKxYvB9RBoNPMgMGaW2VLW0Y8wSoH1efBCiPH
	 Y2aHx5MFbFt0SZ+Qv/vb9/P2uNQYlFMtYb3niwYQYXJ3q0H2wf+BE6NRNCRLhAXHyG
	 hPFPZDQ446nDLOPNIFN8FqcngbVAYuGJHJ/SookuLNbgII88MacMV5YfQLATOzKSZ+
	 m4unHd6CgwK1Qjo2ko1GORkVyikVuCUe8sHsNLYJ5ljXwfSBrcS5j+lKF08yuLJOt4
	 VR5eItDYBgsr5sUu6bVKqhcJFuLA02mrX4SCdmxCbq4B7ZYx0UadycvoWVPS1xfYk6
	 KdH4iF7OHQRaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2875CD5BB0;
	Thu, 21 May 2026 12:44:20 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Thu, 21 May 2026 15:44:11 +0300
Subject: [PATCH v12 05/22] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-gmsl2-3_serdes-v12-5-b26d92931196@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779367457; l=1028;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=kdE8G2f/TkU4Jd90/mcz/ibtYHam2bXzp5xv8fAXHto=;
 b=lpWFbwxKc+dEsPDFYaii18gCUVV9uCdmslm+oUcyA6shdhzIpAi0hqmf1noglH/ljwGfkq0I/
 yxSlxZ1yEqCDNjf9ovco6HMvUofvM8+NBKqTW3LEXGl9tOPbWUWwa54
X-Developer-Key: i=dumitru.ceclan@analog.com; a=ed25519;
 pk=HdqMlVyrcazwoiai7oN6ghU+Bj1pusGUFRl30jhS7Bo=
X-Endpoint-Received: by B4 Relay for dumitru.ceclan@analog.com/20240313
 with auth_id=140
X-Original-From: Dumitru Ceclan <dumitru.ceclan@analog.com>
Reply-To: dumitru.ceclan@analog.com

From: Cosmin Tanislav <demonsingur@gmail.com>

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index bbb38b3de7df..0d53637a6991 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -29,6 +29,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -38,6 +40,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':

-- 
2.53.0


