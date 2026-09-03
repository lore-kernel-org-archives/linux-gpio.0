Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4203F54D2
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422027; cv=none; b=nMd/q3lsW+6SMYV1lOoeSyE6FyyMKOhJpFOBtsq/UU7AsewnvKqQwREma/xtzGFGpEVap1XtiIojhaNOs8SzetxK4PDgDTNtz/K7rkoAN3hVL3ZTRkMifzlaCl//auvqWjp0r8XoU3Wbv/cx5kgK1k1/7wmHl2xZ00Qq1Vd0PAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422027; c=relaxed/simple;
	bh=uC4tlxNT0031iIQM4TBQvwl6KchLCfjKxw65OYMFJmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=auyEmKzaGXnjOmvamlIPHDkvL0T/mTk7s6upeked4XJYIDNBYHvsE6ZtmwEGPZmLixZEv6WKufP1/djdNt9FxlH2LVhsnnTBqCZNmqjP7m3OKBpcZ1rc1k8F9kOfB4M4nR5s8ekGWOSmBaIUzivVuJyyT2Swa9EZ8+YXLIleuLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qlbmce1w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBw0/fNF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qlbmce1w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBw0/fNF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lduY3641971
	for <linux-gpio@vger.kernel.org>; Thu, 3 Sep 2026 07:53:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=; b=Qlbmce1wtdvNKVSP
	IcgfhhATCl1DP93hH9tHXr+RCBZzFK5A64SgP1qOKJpND5SUBi951NP45nWvfkP/
	6zTt0iSHk6zmH8xNqV72WQ2yrINpUXscJVJq+yFU5EXxh1L/K4g11EcKjAqxrsm5
	2XwqwHA7ioijLjmo8hXxYQvLHT7w4YUlwkOii/d2VMtL7HDIaCXA/Cjh9UhovHTg
	cE9uLNlkAsPWchTv7EBgWfvC0xWO0upfqCPbDj4LObgA9dahYwb13mGqJvll+6rZ
	Wri68jmzYFDVS5BecDaGjgVSchfFCVPZ4l4pE9H3hfnpkewJ4HL5O4y7zrAxSb8j
	XtCSnw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdut0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 07:53:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93975d63ffcso33492085a.3
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 00:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422023; x=1789026823; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=QBw0/fNFUv6hyYmZLAhK72RDcyAbtJn4/eFwCo8QKPBnIN/vlS2/df/B2fvWyXmw47
         bJQGISO3aPmce2VvT79qgK0pNO0nFGqu/O6ziPRcVi6dKcEKgUTmezWUOvWUyWx5yywH
         jr+ZLW+p9/KSnDLVIZN94eUpU0DAg8U4Iy8oMGkl4qK1i00wikl7fcWpe7Ltkt6cm0jQ
         EMi5Axi67YIr0oHjsqY6wUbcxE9AZcwd/FYDHPLWziKW1YG29AjiD3Gm6jeL9I//kyqj
         y6Lv8FpiaYF6afBkmrR9ch+FUUUvrx8yttMPv5lZZqrPVvcfAW3mPRVAX6rQDHcl19n7
         StCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422023; x=1789026823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PC978y0C+WT0DKBK3S73qJbvQPZtoMfFE4MNL321JA8=;
        b=SQmRk/UB7Jljm9wfbdxlKjN9gaiwvKLE6nChVB0XnyQHrVy1hg24UYJnrmXUYkmAGD
         pJIfdSjMP7xZTTmF+D7XOegCVNrXWNVFVK56S+uf+r5F48snNVrRTXduUEn9G1GCI7hX
         F05I8Nz4kwSYn0JKWNNrlmGZ9WAc2n9urYSXl8GcbcDBjiF3rCCUA0RBgtFmqFeQwpjy
         /uyP+vUlVn3Ewx6ok27VkvQKiL1DuhI3t2UmgVXhuXf/QMlnPqOsM5++/dICZCXCBjfr
         tp1mffsoqgSAsmVh4ikKTu006SnykambCaaAa2Wx6nwlShSWvRPH2aSa6sq189osDqBZ
         YQgQ==
X-Forwarded-Encrypted: i=1; AKwUvByl4zRr9yew/1OSM27af9l0brgMeU4h+DEbvxSI5S7KrbEYXa+dXanu08yB0Y8AHMIGdu0Qs9EhmMLP@vger.kernel.org
X-Gm-Message-State: AFuF++mITEig4z6ZaVL7Ip/uxYdD09vFLpJZ1tpWK+R2MwKocDaLld/P
	dG67B4kby/pXlluPaqlKJ04Ld42WdUCDGzxTVHurRZafEXnktTzBrNh80ZYHiNmT7OXHUmXwYed
	p/CU8yE2qPv4TWvIGxbWZo7LL1M4JIWwDpuoUThMnSyTwrK8mz9kyOyNXlT8Cfaaa
X-Gm-Gg: AYBFou3pUs1YoVjneVi+sSWB5kuHXnRbguuZm42b+FSAvXgBkFEWWsL/9cgV3qMI6vt
	BhssxxWgk2/Zl+epAnMqR7x5DNzDFQXie8wCrXVRGZKXVnY6euxeGmp2LI/AaoKoHHhzZe18aYp
	/EHKXV0FpyL1pW5qFXzXCPAWphBnrczqiohPyN++eBxu2Y7pZLS8LgxvhMEmSfmqXePT1pvIqEO
	MaDaEzy8gtDsyPR3bYFWVnTujf+S+7jILp7ISiGrvVcfGU2ndxKXVvJ4abf8Scr6S6oiR3FqcNp
	Y7hYaU1bQwzcx/3Dh4ZtwVRzP1qup5BnU2BQgyG/bKlJqEPVA4V1bJ2tXeWi91DjUNtp4MqFO0x
	7/kmNciF8z0Mcmw==
X-Received: by 2002:a05:620a:3714:b0:937:19d3:3fda with SMTP id af79cd13be357-93960f2cb1amr1190981585a.28.1788422023600;
        Thu, 03 Sep 2026 00:53:43 -0700 (PDT)
X-Received: by 2002:a05:620a:3714:b0:937:19d3:3fda with SMTP id af79cd13be357-93960f2cb1amr1190963685a.28.1788422018352;
        Thu, 03 Sep 2026 00:53:38 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72c28sm12878376f8f.6.2026.09.03.00.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:53:37 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 03 Sep 2026 09:52:57 +0200
Subject: [PATCH v2 1/5] dt-bindings: PCI: toshiba,tc9563: document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-pci-tc9563-aux-v2-1-34c625b542c1@oss.qualcomm.com>
References: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
In-Reply-To: <20260903-pci-tc9563-aux-v2-0-34c625b542c1@oss.qualcomm.com>
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
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a992788 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=LEtEptG61Eb6tGkL2-YA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Udzr-SlSNH9vXn4pNI0qQEifQHH8RqyO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX3tcA5wo54aGy
 lcZs8sbB+0HUi+QKn3q4ME0dmeU7/HaIHRvyWWi0O2vqaF0YUy2jk84XV09mQyVy3jHOcZvGCtE
 0aYVLiFhlZ986ZytAuw8KpSDaDuKROMRrCsc0IPPab1e8yp0YDUNI6CGCgxQ+TX/BYeI8MPSLOA
 guv+m8m9RervjUluDKxBw7aL+1SJaaw7s4zbJZkdT0cjjrtCei3+b+45pFrT9W2GXBWo8Vt/FOh
 +g6BFCw1thyV7fZrIntGHwbF+qYOI+eHsgCDxs0yqfWsPz9fx44M0ozmPvnK8TMRpivDaGadTgx
 EQA0QpgsC6st+PBJU+e4tLixa/kWV+Rdms4W910TjXxB3EUm2u243NRZEELkhEG0sA+N3PbOxOz
 MqFQ6czOsoWBKiO5lUYfECiGSk12cIBuODAZglR4d8Lg37UQWfyDPzT3Ze5ZPnSmeeB8tuR5cKL
 VHPpvs5xC7OrIHPzYvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX1Z/N/g/H99Eb
 9JW51LvZtJfGEZxQSN/Eyiy4oHuuRvsLouo0aUyqXOr92FwbGREdMwiCzvFUK+MFTo1YLTDuuH7
 674XX4tuenvJRXe8zfrrVkH3NBBLRWE=
X-Proofpoint-ORIG-GUID: Udzr-SlSNH9vXn4pNI0qQEifQHH8RqyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

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

