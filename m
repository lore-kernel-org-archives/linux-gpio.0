Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D7477991;
	Tue, 22 Sep 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.35.192.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073076; cv=none; b=C5lOZLRHKAKnwyS1IjaB7Dv9QuVuLTbxsJJNywr2cKNVtGMeRXh/TRJ/d4uYCZCc7Z4YCb48J0yYs35Pf7vvjPtDZa5eJmDcStHiooNSMk72usX0RbygjvhraW1JI3bTMRGMbO6CjMN8YuQlDjPTz7dQgRsR2RExbyLOIZt3ZqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073076; c=relaxed/simple;
	bh=pmcieg6oScmEYU6/MyQ9Mj7cF07ICbZ9Av6qPsPrE1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hNjk0Y2fTWPPAJDj3kNbMB1uT8Nzf0JKHSITAq/AD+l7R4J/jzvCyvminRoovwzFp+BK8DCjq2PpsSideLbqOutHEMnOQtSkNd/OK1fjuaLpn2aGC63kqJLlaxT7Ia/ArIZvgeoDpYicPQA+GJjsxp/ykkP92LaQL+bDE3+rE10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=aW+tLNhB; arc=none smtp.client-ip=52.35.192.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="aW+tLNhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790073073; x=1821609073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eohaOZGCuEICBV1DzPfZR6vfi8a+kP71azJvuPSBEO0=;
  b=aW+tLNhByMOxqn+O0PbIvwnyPRxBybnq1hzopvIcZ2+1Vm/XbSGC32GV
   OzbH6ftTdEYxyEfK3xowCvWwPIDLd8P2g0S3SqQqU4JGOwUyHV2ES4wOs
   uZ+YvXbo0Qi1WTyLdE5MG4002cZWOVwxoTxMbb3or97t2kZNw7hj/r9WC
   PxLw1h6Ix8baemvWhi04ZGWlcuMxcsjSVGXg1H5UYBFVSMCreg+NIB9Ty
   qYxf9Ox07uLC8RIDXh+rUqdLFJQY4G0zQoD0eflWExXL/AtsCBc5yo8UX
   TPLEVgXl2BJgVDj4shlz0+LhzwHP3rSKl/fSvAXwaemM9I8U7fSDUi8kE
   g==;
X-CSE-ConnectionGUID: AZ02Gq1eRl2DDWsBmn8P9g==
X-CSE-MsgGUID: c8U2zRlVQX6jjHEQSagDyg==
X-IronPort-AV: E=Sophos;i="6.27,116,1787011200"; 
   d="scan'208";a="29095334"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 10:31:06 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:25616]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.35.200:2525] with esmtp (Farcaster)
 id 0939f03d-e97f-4e42-9b76-a3b2cc99918c; Tue, 22 Sep 2026 10:31:06 +0000 (UTC)
X-Farcaster-Flow-ID: 0939f03d-e97f-4e42-9b76-a3b2cc99918c
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 22 Sep 2026 10:31:06 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Tue, 22 Sep 2026
 10:31:03 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Tue, 22 Sep 2026 10:30:50 +0000
Message-ID: <20260922103051.5257-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922103051.5257-1-farbere@amazon.com>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB002.ant.amazon.com (10.13.139.139) To
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

