Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF7B48AE0F;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790721715; cv=none; b=rrlwaDF6gevA1mUH+VaLsQRc81JcTLl5QmiMMhBDKINhmLBBcm2aPgnyn+3PgMkYq3RtLv01vlvmbkWKyhk01j+2ikc5vN44e+vUmA/o/5iIQ2CaXGXb+J1FAx6y2LUdIA7O8i57OAJvcXlTG1Cl1Gk6OKWoCwLBWmU7QmxGGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790721715; c=relaxed/simple;
	bh=UrrKPntd8pKjX8A0W7uxId0B5R7t3LfBfdro11a+7Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGXYRJg2oDRvtqR4T/NrYJdAvS8vK6k2A7U+1Gu95LJ8UG2nrGaOi81t73yyvIeFYT7Deem8QP6ZZXyWmSYAfBdNETmTV3A3e8sLRbALtGRkakg6uUmKxxyMalpN5Y+jqCsM1BLffpiJaJZm3KJ+C3GtzhzyKxcwK4XFtENQsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkY44rwM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkY44rwM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B9C2C4AF48;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790721715;
	bh=UrrKPntd8pKjX8A0W7uxId0B5R7t3LfBfdro11a+7Y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pkY44rwMz+au7RAtx8NqpZnnkL8afiwrYnVtT4R5jl/4f8Qm7bkWtfYcCQFklWOL+
	 fD94d3m9BkKaKj896a4MwPJEplgdf4sBz7dXlRg62i+/XPsIMPeIMlqvX0IBv9aZIZ
	 45sVe96xlOj8/3I/XlTSejkmp+VszalSDyvn17L7ob0gBQTC0CgV5k0VOy79gAnAEP
	 9gVzPpaGR2Lawa2wSw1wzPy08AxaCNJuBYrz7q7Lk0j6w+PRdcQFRrKXDCZWLBn11z
	 ACOwESIbyYQW9IXlLWTBBW9TiPbMDVhU/F/cOeWEn3gVH9GBAc1bJLiLDzGaye4dp4
	 6B5H0l+vz7lpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137CECA5FB6;
	Tue, 29 Sep 2026 22:41:55 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Wed, 30 Sep 2026 01:41:39 +0300
Subject: [PATCH v18 05/23] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-gmsl2-3_serdes-v18-5-43117818f499@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790721712; l=1074;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=m5jA1gg0q41gyUvWTef61o5rcopXPb/mVs+RuRWcN4s=;
 b=8htDbpdHe1eWwFTdyIOwn7j/0WEDWKXn6iUJKMkY/qQkWQzt2HVsLARplTkj8uprLn6o7MaG/
 yqwfICVM9H8AVrOimAkcQMtRX5aNrp+fla3ynv/xR31/4BsoFwEgVSn
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
Tested-by: Martin Hecht <mhecht73@gmail.com>
---
 Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index 2159fd85a9bf..eea0f974874f 100644
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


