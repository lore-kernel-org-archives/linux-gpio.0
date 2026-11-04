Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813367;
	b=afLvePSRfZKXwYsPHfDeMrMRdtogoiyvDxl50zJ4LSv5S4C1kxaf5vaQ3RiUXfB0DfVS
	 l2P6lkSPryTXwrmQPNL1/wQf3NnFw9obVZa4tVy4g1+xDK72H2zlhhIzCFfDh4mnklxcR
	 fdqBkbA/KKv2WcreDwiWMv00xJwbPoJ/WmYYU9Udr5b8NpAqEPK8zyqn1efOwdEa+Ic+0
	 oD7My5RHDIuI6mMw4RgGfV8DPKyrFEszDjPkZ9mHckpPSVRgtLzJjIpTNKDFdoLhxTkrJ
	 PBjNx2IaUITrv2XYL458kmoToa/puZyHerYK21iuSmle5NuCNKKKsKaIrnu/fU1x8XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813367;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=1yjePlK/OVhSN4qgjaCYH8FyVFqQX6cYW3VsCzAcJls=;
	b=o2Nx2cnV/pDptEbkEXBqNpg2BzUFmG/w4Qx7LEnUW9uqbW4f0etTd39f8y7UVp6CzqTv
	 mDn6CBmxIAfoU88H8YmxDzGTC11VFEC8vOs13WCXq/PyIYcrM056G3R+hkKiyl0dO4gEM
	 7TdVS2O3tyHVX/1/l6XljsEA7p/2qLN1tJfM9y+rBw8eEVpdmg+IpWQmjB47mM+GfAprA
	 ywir7fOGMEC9ueqS0D6FQwKgDdov4bpIk3DenbAtRDIEVQKpiGFm/No/APpSBCNWxywJp
	 u/6mGJOT7TbGaroKEPd93zzxmSZkABdQZie4m6f5ovhrLZgN5TD9v+EYCGMqzqh/bCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=VSWTAoSQ;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AEE60A2602;
	Wed,  4 Nov 2026 17:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88AEE60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=VSWTAoSQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793813367; x=1825349367;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1yjePlK/OVhSN4qgjaCYH8FyVFqQX6cYW3VsCzAcJls=;
  b=VSWTAoSQloNgD44Qspt3WwON3QCkpkZbiaxkMR+JL7h7m6tQ6UWmU1om
   1st6TEArYQCYLlfJvzJCDBKOIns3lvjE2UidAcfhxUDvdig3KvxAvqb+U
   3pzUNJpbTd/jAPebP8rKIMi7kFjXG7RWRbl3WBXWeLHkfNSrchIQTncFz
   oVLdZcLTD8ncKBCIhgjI0XJ+ykrIncwXR5ZTNCNNY07LQrzo1o5os1cXS
   lH9jFsfcXPwCmML7fW1Hy12VfmGjH3bpQCO1Wg/++1uvx7tU6ZwPfBLz7
   w8igNG1qolBmxKnaX7ARdGPlC76ywcdvPDfx/XsOiOGxIyrR/YXjgzRIm
   Q==;
X-CSE-ConnectionGUID: dKg5AfX1S2WyTmoW8PpJxA==
X-CSE-MsgGUID: 8/9evcu2S+SeojUnp3ySeg==
X-IronPort-AV: E=Sophos;i="6.27,195,1787011200"; 
   d="scan'208";a="32909561"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 17:29:26 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:25339]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.44.23:2525] with esmtp (Farcaster)
 id d06f3413-26cf-4617-82db-f765a5bf5c0d; Wed, 4 Nov 2026 17:29:26 +0000 (UTC)
X-Farcaster-Flow-ID: d06f3413-26cf-4617-82db-f765a5bf5c0d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 4 Nov 2026 17:29:26 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 4 Nov 2026
 17:29:23 +0000
From: Eliav Farber <farbere@amazon.com>
To: Andrew Morton <akpm@linux-foundation.org>, Rodolfo Giometti
	<giometti@enneenne.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Takashi Sakamoto
	<o-takashi@sakamocchi.jp>, Eliav Farber <farbere@amazon.com>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 3/4] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Wed, 4 Nov 2026 17:29:11 +0000
Message-ID: <20261104172912.26456-4-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104172912.26456-1-farbere@amazon.com>
References: <20261104172912.26456-1-farbere@amazon.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
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
Acked-by: Rodolfo Giometti <giometti@enneenne.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v7:
- Add Acked-by (Rodolfo Giometti) and Reviewed-by (Rob Herring). No other
  change

Changes in v6:
- No change. Rob Herring confirmed the two-entry ["default", "inactive"]
  items list is fine as-is; the "sleep" state discussed on the list is not
  something this binding needs

Changes in v5:
- No change

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

