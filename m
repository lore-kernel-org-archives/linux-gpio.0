Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042147A89E
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258522; cv=none; b=bIgWTBSWCdIcNdTZL9wU7ixzjjoCEgQ1A9PoC6WgsVUeCZfZ9eZRVIIuKQecZMjkEqi6yjx+Y2C5byQQm3VZJjj8m0cBE8AHerPEVT8xsJFggaPQvh9YtJ4ZwkkBRv919FLi7zywTcD23uouW0NFibBm2BQzKe2PLkrff+VpLoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258522; c=relaxed/simple;
	bh=uC4tlxNT0031iIQM4TBQvwl6KchLCfjKxw65OYMFJmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fPaiDkRGzo975KtiAYvLYqVH9h/fDLgOkuAp5I5kM2y/yuB21EfCgSaJwE8BQB7UOiyT5GQeXhY1f8gMrO/mR0ruH1HaHFQCb8VFYRhzUCeEmPmbng43B3eVB7U6wPcWn23cphsC82fNqLbjVM8o/oab5w1BYw90mNqtDMBkDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lO0eEIBe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dko2Pk72; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lO0eEIBe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dko2Pk72"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJFeA1641520
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 10:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=; b=lO0eEIBe6OBsLhDq
	oFlfn1bn+3vHER7hJWc1vb0lxk0yt6VfbS7LrYcNxX8mEMrBZCKN/8ufWwKbKGCX
	VqLYMJBjn3W0W29Q7jxVAQIo+7zmqdJlMdZuR3srCZPFER4W4qLDgdm4A57NBkrT
	BLKIgIfU+xx0mNwYo2YfsyJh3rJU3Rin7iEQOuup7OdDFWRVZ1q9QDgay76kl8/T
	0MeUgV0wmStJCxlAPzu/JVfSgOVX1c/v8c0OmvsJN2m2x9IEKUMtCdSX+l+IMUPc
	/wUPsxjFPbglyOfitVOuRgjeeqMwuvC7LFuW1RUe8O1OYGR9WoeTzYaLMpnZVFAp
	PKSOSQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8t1wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 10:28:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so907725185a.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258519; x=1788863319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=Dko2Pk72qDUWt2aUBW/YxN8xBBEXipsh76+A61P8mkMVpoMomHIcBxDjpxwODMKGp+
         yYWlEYb4voKX2h1VHOcsO5ZK1cwJuoR2eeznTvTxaCpb56cfuCTal72LBk+mMTeQINTi
         71zwYLLLK3WZVeolXMJmy4m0hvOx5cBefvoxhbzedDVudoN1nmE3P4fL1dy4huxwKYT3
         v7PoEJ0HB6n04AgP7VhRnOnSBxMYAjcXFbM+RiLLUKkyLR2wCShRPiS+vXvZ6cLE2n4S
         zTEeWfl8rNaG4khm4sn/QAvXQdUpQ8wamwt5Boi38AJ1C+IUS5iOBwihSfF3rrI2Kx7n
         XPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258519; x=1788863319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=rFiZJSO1JGTXPYksO7aC0prjMKwpOBz2eDCy9uKzNdxaJIkGF+1p9ZG7eWM09Pd/yv
         W/Il5Zx3sTQtmEgBfPEhFGHFwPylimNBlROMI9sQ9/lmyCjcxQAeTRCNyVbHBNx9Fp1g
         VbFU5s/tP9/qwLKKAhazu07WPNR3MInXJS4t5TD9/Rck1S+I/P8CFvS3RpgEOWy6Xw5C
         B7fgr530P5pouWHHq0pnZI2n6S050SkVx/9DIhiSB72DQcF5ANfLWA1YJw5Kw/NlLUXx
         CtxZtYoc/7L8aNCPPiW+sLRrAK90WgdCuJ8WMjT16wLJjSrzIH9x5L0pGC05RVe2BChq
         Ymyw==
X-Forwarded-Encrypted: i=1; AHgh+RomvDIIo/TvolbTKYrYpIjJEUH9iHzBcf4jOUceA3+1YucBihOG6yDba6D6/ER9KMkF1Qcw7uKtFElA@vger.kernel.org
X-Gm-Message-State: AFuF++kK0quIHYJ+pHpaWoztHFmN8/ZBFixXZN4rCreNI5tCNqAb4o56
	bIo1f4zxgjpyJ0qUN4hB2dd2InaGyMxNoYQPwU9NQ6ssEkbNsuriDQeiYbx0FtKjP00E27ebXOI
	NauMHoprktklG7k3xAkQP0RFLZ0BLtgBJrM80tuKw8Rn7tKlhvdqiVvp7VBZ7Ydic
X-Gm-Gg: AR+sD11Z7P/RmLD4d31onXQYaIQNP9Ix7XDo8xI4P5diWBdnjL9cGesvKJ+bJ8+oXHC
	ClPBPbERp3CnlQszhWRSE8is6N242xZ4aq3Fb4jJ4vOyMrohpiTIq80cLwHUXSIF2ktV2GVNc1y
	2DiyEmwVIqmhAx4JfRIHMIFE0A4xUummCuyRaZq6ziOo5q3wQ+gRj3tbbBxZQxuL0ZoJ9GpPmQu
	GGRABhXlv2AtcV2RJ2h+V9jh5C51INEnQOVLk6BlTBJuQCsuo1DUzT6wG4jVI1x/WlhyTY2HCNT
	89s5+4MCIL0/lPNqN4BV8OihPedGyIXi3DGCfbc2xWikWQoJDwofIhTEs38jphnJIqB0oG1U8CY
	16/PqOzq5YwdeJg==
X-Received: by 2002:a05:620a:2916:b0:939:1786:435c with SMTP id af79cd13be357-93947f8061amr770006385a.6.1788258518808;
        Tue, 01 Sep 2026 03:28:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2916:b0:939:1786:435c with SMTP id af79cd13be357-93947f8061amr770003385a.6.1788258518356;
        Tue, 01 Sep 2026 03:28:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce164bcsm55860125e9.7.2026.09.01.03.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:53 +0200
Subject: [PATCH 1/5] dt-bindings: PCI: toshiba,tc9563: document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-pci-tc9563-aux-v1-1-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96a8d7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LEtEptG61Eb6tGkL2-YA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXyXs12i3rQJr1
 pDR3Nj7BpqNnSUSDO/HRUa/031IV86dlf5RsH4FgJYSOv0zVasjmbch2IzhmMpBBAl8dTzfl1h7
 9Jx2iry85tqfatPuglpBIs7eyq4ZtPdYsyg7q6YQuvK/vLiAUZAiynSqwcQkz8XuQpI++GY3mhA
 I8rowCOAtJEzVXXdiFoE7B/JtyB9opaNzWh1d9JynNvha+DI6VzT/ihYPovlhmGxSiNqwrSSyge
 YT/vJfYDpPOqGB8YNKapaP2xEIbqXao4/UgBYB798/VyOGrWHPwE+klZ5+fE8Ig2PswGk8f3U9N
 SqPt2Ee+HTJ0DVao2Ji/ZRGTvWBawbjju38z5Ia5nboCUyDPoHd+WFfuHtSBngWLW/lQQFJsSFM
 y0VWO0nlarS0HbqkcrUjd/TNym8S+o3rvY8eYaOctSOSObcQ1rZhrDdSUYxd0+nRW56wLCOawBg
 dfxRLCm02RE3z3z1saw==
X-Proofpoint-ORIG-GUID: b1TNta_sKLtdTqFo9hC6PrmOW6uudeTE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX7KetQCPzB2zQ
 65BonAD81nUyEgXQUOI7kje597kph1htjGwEdv6CT5TveFsh0zeoXg2+U0m4JPtfhn2K5Xc8CW1
 xsKuy1YinXVTx8ECy+pvmt4yFWBMFvw=
X-Proofpoint-GUID: b1TNta_sKLtdTqFo9hC6PrmOW6uudeTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines. The controller is not bound by a device tree compatible string
but is registered as an auxiliary device by the TC9563 power controller
and accessed through the same register map, so the GPIO node has no
compatible of its own.

Describe the embedded GPIO controller as a "gpio" child node of the
switch, document the per-port reset-gpios property, and update the
example to reference the controller from the downstream port reset
lines.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 .../devicetree/bindings/pci/toshiba,tc9563.yaml    | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..47cd58c14e4a 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -54,6 +54,23 @@ properties:
           - description: I2C slave address
 
 patternProperties:
+  "^gpio(@[0-9a-f]+)?$":
+    description:
+      child node describing the embedded GPIO controller available in TC9563
+      PCIe switch. The controller is registered as an auxiliary device by the
+      TC9563 power controller and accessed through the i2c device.
+    type: object
+    additionalProperties: false
+    properties:
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+    required:
+      - gpio-controller
+      - "#gpio-cells"
+
   "^pcie@[1-2],0$":
     description:
       child nodes describing the internal downstream ports of
@@ -62,6 +79,11 @@ patternProperties:
     allOf:
       - $ref: "#/$defs/tc9563-node"
       - $ref: /schemas/pci/pci-pci-bridge.yaml#
+    properties:
+      reset-gpios:
+        maxItems: 1
+        description:
+          GPIO controlling the PERST# reset of the downstream port.
     unevaluatedProperties: false
 
   "^pcie@[3],0$":
@@ -149,6 +171,11 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                tc9563_gpio: gpio {
+                    gpio-controller;
+                    #gpio-cells = <2>;
+                };
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +185,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563_gpio 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +199,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563_gpio 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0

