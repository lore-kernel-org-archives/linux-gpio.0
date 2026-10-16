Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B6B5172EB;
	Fri, 16 Oct 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169217; cv=none; b=M6QZsvUTTbxeVuazLCMap9loXsN/IYZVZcjjX7jPXCKKUHByJHzt0jwvdst1Yf7UgyDI2zv5LmLD/hiJjMi5FfJTa2gbv1QMrPZ7djxT+6Y0r3ey6AZII7Puy7vsZz6pk+Eziz4OQvsEBJhoq6Xn651TIBwywAtJaxUUOFO5b98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169217; c=relaxed/simple;
	bh=TI5dX6jwA4qfKZbgAugh3e8jW7lqVbZrbNzcL91hVx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=badTyk/Gxj6UjiPlynrQaZHnE0fIwzOw59pPK3Xpbr7l+SEADMvVT2PTJndcUY1U2rULVaqjB1pRVV3xD2gpra5MBR4SUwBTGl8gJ3LfcSimfqXwvu3OeGVGb4OGOrB9axv25sLJ1SbhzMd1gaefs+lLyvsywXiXKjO7WAhxc2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E66F20021C;
	Fri, 16 Oct 2026 18:46:47 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EB86920000B;
	Fri, 16 Oct 2026 18:46:46 +0200 (CEST)
Received: from lsv03900.swis.in-blr01.nxp.com (lsv03900.swis.in-blr01.nxp.com [10.12.177.15])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2889818000B1;
	Sat, 17 Oct 2026 00:46:43 +0800 (+08)
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
Subject: [RFC PATCH 3/7] dt-bindings: i3c: nxp,p3h2840: add clock-frequency for SMBus target ports
Date: Fri, 16 Oct 2026 22:16:21 +0530
Message-Id: <20261016164625.3166779-4-lakshay.piplani@nxp.com>
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

The SMBus Controller Agent selects the bus speed per transaction through
the transaction descriptor, and supports four discrete rates: 100 kHz,
200 kHz, 400 kHz and 1 MHz.

Describe the standard 'clock-frequency' property for the smbus@ target
port nodes so the rate can be specified per port. The property is already
available through the i2c-controller.yaml reference; restrict it to the
four rates the hardware implements so an unsupported value is rejected at
build time rather than being silently rounded. Target ports default to
400 kHz when the property is absent.

Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
---
 .../devicetree/bindings/i3c/nxp,p3h2840.yaml          | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
index 09508a7bcbeb..66f9e2b982b1 100644
--- a/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
+++ b/Documentation/devicetree/bindings/i3c/nxp,p3h2840.yaml
@@ -168,6 +168,14 @@ patternProperties:
         description:
           Enables the on-die pull-up for Target Port.
 
+      clock-frequency:
+        enum: [100000, 200000, 400000, 1000000]
+        default: 400000
+        description:
+          SMBus clock rate for this Target Port. The SMBus Controller Agent
+          supports four discrete speeds, selected per transaction. When this
+          property is absent the Target Port runs at 400 kHz.
+
     required:
       - reg
 
@@ -248,6 +256,7 @@ examples:
                 reg = <0x0>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <400000>;
                 nxp,pullup-enable;
             };
 
@@ -255,6 +264,7 @@ examples:
                 reg = <0x1>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <100000>;
                 nxp,pullup-enable;
             };
 
@@ -317,6 +327,7 @@ examples:
                 reg = <0x0>;
                 #address-cells = <1>;
                 #size-cells = <0>;
+                clock-frequency = <1000000>;
                 nxp,pullup-enable;
             };
 
-- 
2.25.1

