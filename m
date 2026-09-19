Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCAA37E5E9;
	Sat, 19 Sep 2026 17:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789837934; cv=none; b=bSdPiqMnNzVOJXvnROl5x4VAxqFp7ySXv8XhOf9G5MJXvDdfXqPt/M8C/spbkgVA5vv+ZDpq8Yk2KR1wIJ7OBLAlF5WsGkWYpU5UJ4JmCiNUfaUTHRAMhh659rJg3WxOrQmZkbX6euc9h4wTSHlRy7fydBFx+hs6JXHrgNulekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789837934; c=relaxed/simple;
	bh=pmcieg6oScmEYU6/MyQ9Mj7cF07ICbZ9Av6qPsPrE1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJzzMtRplrIIWzZYvhOCh6ntWsqMxMFJHPU4+4b/nkIV9wjXsKwf+TAgITE60+EZUvDM9CXUmkb4OAQLUxkjeAkYEo1Rz/M6wStJ8uDUA2ErH1SXwCowGWj9la9pQsGFvAV5/hfQGjlxQ0k5OBy4szUXCie+Sq7hBc6o/ppjPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=sRQyWpus; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="sRQyWpus"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789837933; x=1821373933;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eohaOZGCuEICBV1DzPfZR6vfi8a+kP71azJvuPSBEO0=;
  b=sRQyWpusofX5zvzqlCivVa2wdqdAaPjWFoy961ya5RPmKhN7z2jTLhYM
   uPclA1XJfH5hTBRPlfq5yNXOxEj8oyV9WjLYWCeBai5w/lDc4x0xnqZe/
   0FvopRjlv3M2qkWcsvDRkXhwpBgtyBNzDMDZLNWsAfjvU4V4fw6ouiAbf
   abfp58euxohTBMqtq2Z1NBK9QWrcw3FaGyyZh2tuS0fEkoIqx5AhLSLdf
   moa8wz8zpKHut/URLqDCpswOs9qim669rkJloukJ4QYkyEJd1/3G+6TxV
   mO6R+2WQSQ70cFjJuS+1JtEpauxM8u7hMEDS4GxUAY0FoSiPtDzvoCvwe
   g==;
X-CSE-ConnectionGUID: 1fId1l+JRE2Agv4Ad+Q73w==
X-CSE-MsgGUID: t5o0DuLGTGWrgpGe4XraEw==
X-IronPort-AV: E=Sophos;i="6.27,111,1787011200"; 
   d="scan'208";a="28893888"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 17:12:10 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:18300]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id 817fbdde-ebe3-49f4-98f9-7c018f8aa1a5; Sat, 19 Sep 2026 17:12:10 +0000 (UTC)
X-Farcaster-Flow-ID: 817fbdde-ebe3-49f4-98f9-7c018f8aa1a5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Sat, 19 Sep 2026 17:12:09 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Sat, 19 Sep 2026
 17:12:07 +0000
From: Eliav Farber <farbere@amazon.com>
To: Rodolfo Giometti <giometti@enneenne.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Eliav Farber <farbere@amazon.com>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 2/3] dt-bindings: pps: pps-gpio: document optional pinctrl states
Date: Sat, 19 Sep 2026 17:11:56 +0000
Message-ID: <20260919171157.5502-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075611.47881-1-farbere@amazon.com>
References: <20260917075611.47881-1-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
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

