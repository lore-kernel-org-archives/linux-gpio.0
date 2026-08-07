Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2420F47669C;
	Fri,  7 Aug 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786107773; cv=none; b=MicSgEPY7oEzyxoD8ra+fmu/8jMhkTsZccksc2vEsj0DWP9gd54LwIpIXFQ2L/fqWcDayGHEH1LVNCZK8HQ3ehurdJk7NUXripWPOWpoY9WbrGXrrmn0B0zcBzPso65Z4Z+DP5TZ4uEhX7aN6hfXzNyGvLR9dz3ef+9IUuI47eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786107773; c=relaxed/simple;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X8TfTpo1wf3efQ9hUYLhyYjtcvpwsQ0C2Ra09X/OaDpBRclQdHWySOr53YNw0BOC9qP58mVGbrDvH6CxFTcsHEc54QweLDBwFIEqy2cRJqI2qgqJB4iqYczpUskUOi3La9uf2XVnH1bvbN8ukhnH4b2w8PHfIyRV0s85z600vQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mjsUjq8r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mjsUjq8r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13798C2BCFC;
	Fri,  7 Aug 2026 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786107767;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mjsUjq8rU5JepUucjyygPtfPldB0y0gRfS5xkYHWhYPpTocAGHivmFdjENUpioUkH
	 YBOfAbEtB5AXqGl56aLkfzJakzaAwRV4ZZ1ptmlPoVvlbWiLBC5eislAs62Lv+JWUU
	 rO/BG6fjE+hvWjvWvYAC5vFZdIyOpbJhpS3A719/jE+aj1GO+dZeUT76l38zY6BYPc
	 h77UOAptef5olg1MA9yzs0f0s0VonpPuTqk0K9xyqi1xNn4OlcPX6c5JtxOralbbuS
	 b3cZlWvVsAzTD8VF0nTZxCEhU+TEJhCxcVtkC/CLXbn8+TiTHYbUBASOPQCJocXdjc
	 6NkytuWL3jKcw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F131AC5AC9F;
	Fri,  7 Aug 2026 13:02:46 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Fri, 07 Aug 2026 16:02:40 +0300
Subject: [PATCH v15 05/22] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-gmsl2-3_serdes-v15-5-7212e9e5156a@analog.com>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
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
 Andrian Suciu <Adrian.Suciu@analog.com>, 
 Cosmin Tanislav <demonsingur@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786107763; l=1028;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=kdE8G2f/TkU4Jd90/mcz/ibtYHam2bXzp5xv8fAXHto=;
 b=Zz9AIxC9+/ARKM8Eg2z3ojGrTUmlpuCXFOwQ0Yx4P2PHNOAeYXJRrSSoTv7nIg6JB66zwgRZA
 LWmiqw1xR+QCTWKiaVPVPwxbgdT4HDHFmaP0rVTeeAa+QFVgMBoEJVd
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


