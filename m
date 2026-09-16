Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA524C33FF;
	Wed, 16 Sep 2026 18:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583220; cv=none; b=lUKWXBMmQBLHbtWe2jB7RoHJDbUV4szdR8UMQrcO6N9RMGIX83ITrE3EPWysVn/Z81lA/4PaPLaLIsX1KskOc7zvn0K5Z0kgluACvnHXF31nnVb7/XZnQh1s9Fs21cFm49WVo+rC3Bsl6aW+2WqMckFabSLHhbmOoKQOJdft+fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583220; c=relaxed/simple;
	bh=vbvPTAedHIloJ/hO3RGtzyLvW2K8UyP8R23lO9rOi70=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtscmDxmkWdujDNvwD9P5ztSVXCeOC/TzMBBshf/s8EOLiiMNaN02Sar9KuZNRZxer/3ZtQ4MiCwaGJFGO0EQk/GgdKEMP1vnOdlXZpx1n4fSc3fO7dtBGgqAoventMISL80vKNdVbZRCkwo0bSLDNLCyoY7bTaCw3zdxWRxA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=S2npcmPD; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="S2npcmPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789583217; x=1821119217;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BHsCmMc6e2wcBQ2EuI+SHbLbEvrnZvV+I7e/QkGW6C4=;
  b=S2npcmPDe+m+KvCCBuhlfssjEfYoIJWqUqsDw0sTpXzAsBd0LoPK/QAK
   fjovPiPYzzDs3ozKHqTXdIEFaXaiUNH26r8obhglreghyOXDHCIVKqpZN
   +9mLucH6/PITuGtxx25yy01Tpq/Ir8+mXiLv0EThY8ty9jVzVqXIICSIh
   803zpCsL+gW4qO43msUhaVAztYlI6wf6oNU3dKPsMipiMxRh7bk6ZQGO9
   0haMpYiYSS/oTF0XTAYRear4plb/JdgulzkBmI9BeK6oKntFOx9E9vJT+
   ETt5scgVLJ4sCjUaSu9+b05bq1EHbZMRnzXU+lh+EgnMVTdRpD/KGiGJK
   g==;
X-CSE-ConnectionGUID: KbshlQW4QomKYV9RrdnqXg==
X-CSE-MsgGUID: FEqC0JpqTwO8XBagKY84Gw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28846073"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 18:26:52 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:15796]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.46.137:2525] with esmtp (Farcaster)
 id bcb2a6f5-66b0-41a5-9693-8c97a571dc9f; Wed, 16 Sep 2026 18:26:52 +0000 (UTC)
X-Farcaster-Flow-ID: bcb2a6f5-66b0-41a5-9693-8c97a571dc9f
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Wed, 16 Sep 2026 18:26:51 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Wed, 16 Sep 2026
 18:26:49 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Wed, 16 Sep 2026 18:26:40 +0000
Message-ID: <20260916182641.9768-2-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916182641.9768-1-farbere@amazon.com>
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D040UWA001.ant.amazon.com (10.13.139.22) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the PPS input GPIO is routed through a pin controller, a board may
need to mux those pins to a different function while pps-gpio is not
driving PPS (for example after the driver is unbound or across a kexec).

Document the optional "default" and "inactive" pinctrl-names and show
both in the example. The "default" state selects the PPS/GPIO function
and is applied by the driver core before probe; the optional "inactive"
state, when present, describes the mux to restore when the driver is
unbound or the system is shut down. As "inactive" is only the state to
restore after "default", it may only appear as the second entry, so a
"default" state is required whenever "inactive" is given.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
Changes in v2:
- Rename the released state from "idle" to "inactive"; document that
  "inactive" may only be the second entry, so a "default" state is
  required whenever "inactive" is given

 .../devicetree/bindings/pps/pps-gpio.yaml        | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
index 383a838744eb..7d11ec4656ee 100644
--- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
+++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
@@ -28,6 +28,19 @@ properties:
     description: Indicates a falling edge assert, when present. Rising edge if absent.
     type: boolean
 
+  pinctrl-names:
+    description:
+      When the PPS input is muxed through a pin controller, the "default"
+      state selects the PPS/GPIO function and is applied by the driver core
+      before probe. The optional "inactive" state, when present, is selected
+      when the driver is unbound or the system is shut down, handing the pins
+      back to their alternate function. As "inactive" is the state to restore
+      after "default", it may only appear as the second entry.
+    minItems: 1
+    items:
+      - const: default
+      - const: inactive
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

