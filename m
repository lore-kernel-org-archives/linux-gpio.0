Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BA51D530;
	Fri, 16 Oct 2026 16:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169221; cv=none; b=qqR+6C87ACh/5CTe/S8dOwaXDltU9IxBM7GapOx3FrHO62E59hmNofsLyaRkzi7M/B4PRodcti34akjKJ35YvX/ziJ3LhZjgNbF8z/R8RyM8gxPH6UO2aNITiACSZ+cejsHWZs3F3IkCrRqzIV85JmeiOzMrdX1VMH+VnNBK7is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169221; c=relaxed/simple;
	bh=8VpU4mwP01Q/wXKTq2T6ZitZ5CCc1nyiu9TtuG6ZyQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Pw5s1hLt77Omf+eLNI5aCkAnr2BBKNdSxXc5ttqiMZIFgP0J2b6wTGnNE+uVIblIXGkgiVc6sCmC3f0C/S+Hc1RcNNIVBkBU6yWFDY8XcBaLVHY0wfwELB//4aiSG+PG8enUAirA5m0sViKFyS9XvDgRNF+bPpAiDszomzLhrGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BB7581A0219;
	Fri, 16 Oct 2026 18:46:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 530251A006F;
	Fri, 16 Oct 2026 18:46:55 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 86C2C180006C;
	Sat, 17 Oct 2026 00:46:51 +0800 (+08)
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: linux-kernel@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	broonie@kernel.org,
	mfd@lists.linux.dev,
	lee@kernel.org,
	Frank.Li@nxp.com,
	lgirdwood@gmail.com,
	linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: vikash.bansal@nxp.com,
	priyanka.jain@nxp.com,
	aman.kumarpandey@nxp.com,
	Lakshay Piplani <lakshay.piplani@nxp.com>
Subject: [RFC PATCH 5/7] dt-bindings: i3c: nxp,p3h2840: add GPIO mode target ports
Date: Fri, 16 Oct 2026 22:16:23 +0530
Message-Id: <20261016164625.3166779-6-lakshay.piplani@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Add a "gpio@N" child node for target ports whose SCL and SDA pins are used
as general purpose IOs instead of carrying bus traffic, and mark the hub as
a gpio-controller.

GPIO mode has higher priority than the other port functions and leaves the
port disconnected from the Hub Network, so a port is either a bus port or a
GPIO port. Each port contributes two lines, the SCL pin first, so target
port N owns the lines 2 * N and 2 * N + 1.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 .../devicetree/bindings/i3c/nxp,p3h2840.yaml  | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
index 66f9e2b982b1..2cd52d142a17 100644
--- a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
@@ -47,6 +47,19 @@ properties:
   '#size-cells':
     const: 0
 
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-line-names:
+    description:
+      Names for the lines exposed by Target Ports placed in GPIO mode. Target
+      Port N owns the lines 2 * N (SCL pin) and 2 * N + 1 (SDA pin), so the
+      list covers up to two lines per Target Port the variant provides.
+    minItems: 1
+    maxItems: 16
+
   assigned-address:
     maximum: 0x7f
 
@@ -150,6 +163,34 @@ patternProperties:
     required:
       - reg
 
+  "^gpio@[0-7]$":
+    type: object
+    additionalProperties: false
+    description:
+      A Target Port whose SCL and SDA pins are used as general purpose IOs
+      instead of carrying bus traffic. GPIO mode takes priority over the other
+      port functions and leaves the port disconnected from the Hub Network.
+
+      The two pins of the port are exposed by the hub gpio-controller as two
+      consecutive lines, the SCL pin first. Target Port N therefore owns the
+      lines numbered 2 * N and 2 * N + 1.
+
+    properties:
+      reg:
+        description:
+          The I3C HUB Target Port number.
+        items:
+          - minimum: 0
+            maximum: 7
+
+      nxp,pullup-enable:
+        type: boolean
+        description:
+          Enables the on-die pull-up for Target Port.
+
+    required:
+      - reg
+
   "^smbus@[0-7]$":
     type: object
     $ref: /schemas/i2c/i2c-controller.yaml#
@@ -199,8 +240,14 @@ allOf:
             reg:
               items:
                 - maximum: 3
+        "^gpio@[0-3]$":
+          properties:
+            reg:
+              items:
+                - maximum: 3
         "^i3c@[4-7]$": false
         "^smbus@[4-7]$": false
+        "^gpio@[4-7]$": false
 
 unevaluatedProperties: false
 
@@ -216,6 +263,8 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
             assigned-address = <0x50>;
+            gpio-controller;
+            #gpio-cells = <2>;
 
             nxp,tp0145-pullup-ohms = <1000>;
             nxp,tp2367-pullup-ohms = <1000>;
@@ -274,6 +323,11 @@ examples:
                 #size-cells = <0>;
                 nxp,pullup-enable;
             };
+
+            gpio@3 {
+                reg = <0x3>;
+                nxp,pullup-enable;
+            };
         };
     };
 
@@ -287,6 +341,8 @@ examples:
             compatible = "nxp,p3h2840";
             #address-cells = <1>;
             #size-cells = <0>;
+            gpio-controller;
+            #gpio-cells = <2>;
 
             nxp,tp0145-pullup-ohms = <1000>;
             nxp,tp2367-pullup-ohms = <1000>;
@@ -337,5 +393,10 @@ examples:
                 #size-cells = <0>;
                 nxp,pullup-enable;
             };
+
+            gpio@4 {
+                reg = <0x4>;
+                nxp,pullup-enable;
+            };
         };
     };
-- 
2.25.1

