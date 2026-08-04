Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296E43BDC5;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785833433; cv=none; b=M39E9xFL3jyWVHcE7huy9iym3tD/4x3nR2FXqSpQrsx6t4OpEl+Jq+9mxG0+HunU8jv0+s7Mm/KwJDD6wSDVlcVh5NlsHoF5WVVYeRHXHMLKMkTN6Uf1RJV0dU/EX/ClXaDa0d6ngmy5OHRMqE14YkrmnbwTvTiDkmNuttAQqNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785833433; c=relaxed/simple;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmPx0U1SpBJmU+Mj8srnC2sJHGI3Wukw5i1peMz0t8x+6278LYL5AeqcX5z+Q7uO+mJV04XYct4Gwp6uUd2JNJre57rfERp8GCX787FgifTxYZneICaLPomK35zFlINAhbmP6lJENM5fyIYufaW8AC2fRO1xEeeEBd0p97Mdmms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YyPqPjI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YyPqPjI1"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FDAFC2BD01;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785833433;
	bh=BKRnyLSX59IE0zfiNOQX8tE/TWnmktZCFFeLRCV2Ecw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YyPqPjI17XcD6K0uPuCM7mjyVrLwjj61CP6UfubsY0lCwqe4oeU+kZDZEyGTFGpEN
	 SC3LSasFnR4eMhIr40NGDkaT7iLvPnpRCMceSGevMoWWew7wEvQb6927ZNLPZKCX8h
	 XS9aQIPrFlooQWmbF9ZpvEYg1/rU5ERMOqs72NxWISdUXOgKrT5chn173aNuVq18aM
	 AR1fTsOOfNq9MFTDjKiuxrPXfw7L5i7cqsRP6CFrhVpCRiPXo3jNuWmUBhFXVKONbs
	 xsOizhB0XPX6GyW+QGn/0ZqWGZ0tvh/1HlCCbzw0JgwbvX6oO5bs1/cONmdMz5n19v
	 5ZkA4FiTDMitw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F140C55ABE;
	Tue,  4 Aug 2026 08:50:33 +0000 (UTC)
From: Dumitru Ceclan via B4 Relay <devnull+dumitru.ceclan.analog.com@kernel.org>
Date: Tue, 04 Aug 2026 11:49:48 +0300
Subject: [PATCH v14 05/22] dt-bindings: media: i2c: max96717: add support
 for MAX96793
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-gmsl2-3_serdes-v14-5-763710c884c0@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785833430; l=1028;
 i=dumitru.ceclan@analog.com; s=20240313; h=from:subject:message-id;
 bh=kdE8G2f/TkU4Jd90/mcz/ibtYHam2bXzp5xv8fAXHto=;
 b=QODX+TSAhXtZKgg6fhAfj/iwHZp8nMw6AIhPrEf7Sjk/CEWEIzzXlzKncqSJ8g2oU+1swJK5r
 2a4y3mZ3gV0DwO042Esz0q6YrjveoNth1RtGpk6dWLDzganuC/H4rZI
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


