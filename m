Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D14393DEB;
	Thu, 17 Sep 2026 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631791; cv=none; b=kZ0DlLJnt29a7RQzRVvFbnGWljxJuwqpdQpE//HNlw+B6/Qa2jLRJN+myUoua0W7RaYly5o5ERGVr9YMuhC7EpL1nHQkEjg8TmsBJwTC6gtUMaAusSOca6HZI41aGfUd7ZgCpPZtsjB/xG1gESgMYQWXLBQapnQUbsOoKJsjObs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631791; c=relaxed/simple;
	bh=iD2HBRQ5r3nw3b/1wVWMJvemxibCM5gCh/wT+mRK2kE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XasV7BUVbF+GC+4d64e3wkIsDOwrUM2rWKkMSvhlo15986DtZ/A5KeMMte4Rf/6qnKW6OMpfAhAgPYDf65MxRFT0PMbxFVHd+EFwKJnrrAUjb+t3dpgidsbtnLkGQ31boTkwyr8yDZCCHBr/JpO5xtQS0m6oACB216mk14x3yy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=c8fUss1m; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="c8fUss1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789631790; x=1821167790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AiXMnY0Rb7NMl/cA11mu1ttg59pAvJjYYaMy9DrlCfE=;
  b=c8fUss1mO+mpG26/16WIujLIOzXqAvCYnB9cg3yfdm4n4o6wTrxsVA3c
   dZBsGfeAYHx43gSw1fjWhieRS419l1+mVdIwBG/dSBO0xWNC7usAYx3qX
   YxZ7Htqx6dv88mvEAnhVZES+UYexiVM3lhHx1yhCJbQTU9bfdvnDad1cB
   o+udzUqUpvyVStBa9xWFu0V1Vf3tYZSo2JnGJcw4HSGPlkTAcu/gr+j1B
   HuCAF/LrXMlMVTYqxA/C5o7sDoCvzScSQY+YaNaf4eOwRSdWVP0yA4o8e
   /QcMfxfSf6KL1do+EytCa71EVbEAMWu87tdZip5yI+vt5K+22oY64L4D/
   Q==;
X-CSE-ConnectionGUID: DWWoWfMyTTuvEFsjOTBJSw==
X-CSE-MsgGUID: aoO1aD/ZRSCpDKN4gFdyxQ==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28900764"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 07:56:27 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.182:25397]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.16.195:2525] with esmtp (Farcaster)
 id 84a1b1b3-96e7-4f6f-8425-9790c103fd27; Thu, 17 Sep 2026 07:56:26 +0000 (UTC)
X-Farcaster-Flow-ID: 84a1b1b3-96e7-4f6f-8425-9790c103fd27
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 07:56:26 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Thu, 17 Sep 2026
 07:56:24 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Thu, 17 Sep 2026 07:56:10 +0000
Message-ID: <20260917075611.47881-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D036UWB001.ant.amazon.com (10.13.139.133) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the PPS input GPIO is routed through a pin controller, a board may
need to mux those pins to a different function while pps-gpio is not
driving PPS (for example after the driver is unbound or across a kexec).

Document the optional "default" and "inactive" pinctrl-names and show
both in the example. The "default" state selects the PPS/GPIO function
and is applied by the driver core before probe; the optional "inactive"
state, when present, describes the mux to restore when the driver is
unbound or the system is shut down. The driver looks the states up by
name, so "inactive" may appear in any position; it only requires that a
"default" state also exists.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v3:
- Do not constrain pinctrl-names to a fixed ["default", "inactive"]
  tuple. The driver looks the states up by name, so "inactive" may
  appear in any position and other states may coexist; only require
  (via "contains") that a "default" state exists, and reword the
  description accordingly

Changes in v2:
- Rename the released state from "idle" to "inactive"

 .../devicetree/bindings/pps/pps-gpio.yaml        | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
index 383a838744eb..db6ecb17cb54 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
@@ -28,6 +28,19 @@ properties:
     description: Indicates a falling edge assert, when present. Rising edge if absent.
     type: boolean
 
+  pinctrl-names:
+    description:
+      When the PPS input is muxed through a pin controller, the standard
+      "default" state selects the PPS/GPIO function and is applied by the
+      driver core before probe. If a state named "inactive" is also present,
+      it is selected when the driver is unbound or the system is shut down,
+      handing the pins back to their alternate function. The "inactive"
+      state, if used, requires a "default" state; its position among the
+      names does not matter.
+    minItems: 1
+    contains:
+      const: default
+
 required:
   - compatible
   - gpios
@@ -40,8 +53,9 @@ examples:
 
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

