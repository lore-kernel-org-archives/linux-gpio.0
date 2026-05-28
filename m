Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5530D367F3C;
	Thu, 28 May 2026 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955511; cv=none; b=erCHfUHt8Fr9FXMzL5DExeI702re7XGiVIhhnDd+WbD+OwhPXlMgxCl9ru/GYJyz67aPHvBRR6HaZrQfWL5I8Iv//VNNNIHDvEeRWL1CRM9jcj2W1WwIQfGiaBmuuqFaNKUw9cQP5GBt0qpZPmlnAhe/o/3N5UdGePy6eS6TAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955511; c=relaxed/simple;
	bh=xirvXHtC/ArjiPqJRmGy6rCPiWrM/ucwQYnWScSrVZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJzIlLThykaWDP7B43KUorNJL8OIXHYoWlyj5S88gQNUO9Gub9YiZsfkhNvVkqKimganXOAmXiXxyj3dFWxwpBqtCwkA3vL0AVqXJlCYzE7hzp/I6Qv3NvY/Mij2S6rzSQROV2C65ENYGQz0Y81x2SMPUeoEoTc5fWPkgk0PF4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+ykfSWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+ykfSWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD261F000E9;
	Thu, 28 May 2026 08:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955510;
	bh=SeNY6NLp3JOsBY+IVTny8zrODmZcrg5z5df04xZGriM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=J+ykfSWxJ4qtxp12Jf5+bR4T9y41K0vA9pK4ymkxkwzME+8OdnONQdZL68RRMyAGQ
	 6xHIY4zbPXMe/3jKhws/WPPR16AajBncCeO3P6S3bh8QZ56pT9TPMnGeVKwPGzOwFa
	 LLBACPh9aLxCv96Ll2Iof+DJevlQF1CEKruin8XsT2culFtKRrfmq7vU5oardg6ruV
	 5HS9hk1NAx5wGIPLemS38fvpsy5qv8ONIaEJaoTs13lhwxP2r5s7C7DYzpzk77lXfp
	 gxPaeQiDcIwmS9yVRnbYHKgaj5rlZTaWHD844YdgnpV1gjJR+KnWxFA3qSGYgBE+PW
	 hp5a/LzGJtvYg==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/7] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C power source option
Date: Thu, 28 May 2026 11:04:37 +0300
Message-ID: <20260528080439.615958-6-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
1.8V. Document the missing 1.2V power source option.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- collected tags

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759f..32864c9add4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -129,7 +129,7 @@ additionalProperties:
           enum: [ 33, 50, 66, 100 ]
         power-source:
           description: I/O voltage in millivolt.
-          enum: [ 1800, 2500, 3300 ]
+          enum: [ 1200, 1800, 2500, 3300 ]
         slew-rate: true
         gpio-hog: true
         gpios: true
-- 
2.43.0

