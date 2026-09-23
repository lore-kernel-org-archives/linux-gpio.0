Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305EB424D72;
	Wed, 23 Sep 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187779; cv=none; b=KLzmjEXF7u71Ks49wlfmY5Tgguoh7W0kA9Cc2Mx3Yy7Rl/Mf7oXZBwhApiqWc9ITzt8q9KLM57t3AYZhrOhlFOJG7ln3yqVJ9wVfu5fFTCRGgT5ms9sNZ0NzZ05N+l5pc2kh2OlJFG6pJRVE+CqA2bClbe76zfgeyDoNVe6ydaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187779; c=relaxed/simple;
	bh=guGxWAeJje+4zwD1zh+BAAJksVcnzFhlqD51+YqxkjU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tcB7B5v+yQU0HcVXBDixLUpFAuoEd7LGehz1G7qq5gn7Cz3r+GmHX+rS8jHiWxn8A489degcz4ZodCa5Er3kXus4NDNrSS7a6WYv03FbddstgIBFTwDUHyO6+oY/iKGC/uOkD1IphWzRxxKkrw4lvK0OfB0M+uOp++hxUStL28E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=GBDw9odM; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="GBDw9odM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790187778; x=1821723778;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cuZzP5BHP/HQXMzoICyvxPknNPZaghsdUty4kJA3vZQ=;
  b=GBDw9odMLylsxggwwrWCwDEq07RWF7trJouHwFrmRX1V6Roh4z297DP1
   YD0LdwixYcNzIaSSCetvBV2n7buYGVQV79BSumCVlNaBP4zUhLQgnEO6F
   2LueGGqlId2bFtrVv7z4OyLXTtt1CU9ebTjK9IoaNT1XdYEwgEODNbATR
   dqeSf6IUN7n9mMYp8ReGqDRNS7mQWI74WEAsJM2dS6Jz7dkTK9OIrSmF3
   4d2SadGRZXJDsHumseiEyrnegq/mV5pyORrV1W9DNheMJRQVJAxmtFexx
   J7npUB+6JkSOJA7i7tvagXwjnGCKk/GmYXytAf3DEHg9Bxguc6RXer/NK
   g==;
X-CSE-ConnectionGUID: W3CMBYLqSvGaCPMoWCaDBQ==
X-CSE-MsgGUID: QxDCdQCuRFeHUgmnSjjMmg==
X-IronPort-AV: E=Sophos;i="6.27,119,1787011200"; 
   d="scan'208";a="28969805"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 18:22:58 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:14484]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.110:2525] with esmtp (Farcaster)
 id 4f0e67ce-fbd0-4e54-a5f1-ca3a5ffe1a88; Wed, 23 Sep 2026 18:22:57 +0000 (UTC)
X-Farcaster-Flow-ID: 4f0e67ce-fbd0-4e54-a5f1-ca3a5ffe1a88
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 18:22:57 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 18:22:55 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 3/4] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Wed, 23 Sep 2026 18:22:42 +0000
Message-ID: <20260923182243.41060-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923182243.41060-1-farbere@amazon.com>
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D039UWA002.ant.amazon.com (10.13.139.32) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the PPS input GPIO is routed through a pin controller, a board may
need to mux those pins to a different function while pps-gpio is not
driving PPS (for example after the driver is unbound or across a kexec).

Document the optional "default" and "inactive" pinctrl-names and show
both in the example. The "default" state selects the PPS/GPIO function
and is applied by the driver core before probe; the optional "inactive"
state, when present, describes the mux to restore when the driver is
unbound or the system is shut down. "default" is pinctrl-0, matching the
implicit ordering the pinctrl core already assigns it, and "inactive" is
pinctrl-1; the driver looks each state up by name.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v6:
- No change. Rob Herring confirmed the two-entry ["default", "inactive"]
  items list is fine as-is; the "sleep" state discussed on the list is not
  something this binding needs

Changes in v4:
- Rework per Rob Herring: do not express the ordering in prose; use an
  ordered "items" list ("default" then "inactive") with minItems: 1,
  since pinctrl-0 is already implicitly "default" and its position is
  fixed. This also fixes the "['default', 'inactive'] is too long"
  dt_binding_check error seen on v3. Reword the commit message accordingly

Changes in v3:
- Do not constrain pinctrl-names to a fixed ["default", "inactive"]
  tuple. The driver looks the states up by name, so "inactive" may
  appear in any position and other states may coexist; only require
  (via "contains") that a "default" state exists, and reword the
  description accordingly

Changes in v2:
- Rename the released state from "idle" to "inactive"

 .../devicetree/bindings/pps/pps-gpio.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
index 383a838744eb..61b5de6724ea 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
@@ -28,6 +28,17 @@ properties:
     description: Indicates a falling edge assert, when present. Rising edge if absent.
     type: boolean
 
+  pinctrl-names:
+    description:
+      The "default" state selects the PPS/GPIO function and is applied by the
+      driver core before probe. The optional "inactive" state, when present,
+      is selected when the driver is unbound or the system is shut down,
+      handing the pins back to their alternate function.
+    minItems: 1
+    items:
+      - const: default
+      - const: inactive
+
 required:
   - compatible
   - gpios
@@ -40,8 +51,9 @@ examples:
 
     pps {
         compatible = "pps-gpio";
-        pinctrl-names = "default";
+        pinctrl-names = "default", "inactive";
         pinctrl-0 = <&pinctrl_pps>;
+        pinctrl-1 = <&pinctrl_pps_inactive>;
         gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
         assert-falling-edge;
         echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
-- 
2.47.3

