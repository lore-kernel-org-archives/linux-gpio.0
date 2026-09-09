Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C08656B843
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 14:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965819; cv=none; b=Otwa31xcLR2r5ECINi6Q8NEYAmNhYdCuFn4ez8DjInnvpV24BZ/z1ZRRNJfoSLJOMdopGPCyVEKHC+uqetf7EIWn6d4dLgzfj3CTGHmglIOCa6RECvZsvRbshtSsKtsgzn4N5PY5y1DATrsDFTIlLcThop4CNjDxDjHsM64UJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965819; c=relaxed/simple;
	bh=XggMInr4p/kOChUVji0s69UYgrNeKmtuSko7TtQpILo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvNtCclRHkxcHE4Ips4A+eL0PFV0NeGmuv20aateF57DshiMF2ZT4AEnx+DRzkYcdNnBvdKDDqzTtdS2GoauR5PbtFBeLlz5P9tc86M6Rm3++Ns1YH5aO1VuYPlu8rvjb3LZIPeyFC0tQqdQwoBCnf2ZMZhy3pdcns29snc2KjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYCibMWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HgL1OULn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYCibMWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HgL1OULn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7rg599858
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 14:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=; b=DYCibMWJFOOBEBJF
	/M2Nt3jUPp8Z3fcoPwUf1odz4T/m4p7+MjViPRiLjGSU4Lt4Voe5zHqSJn5iszVu
	M5C+iiohVOFBVStNKBrjJVek6RhoaehRDax9e06tmUAUbQX287THCYey8xORRIWU
	7MBxQOJ/atxJWCzpxCyZARpksoNc/D8mMrK7f5CDRyyb+EJwDqAzjUxyLqgnZXUM
	TNv4vW2LN44FADMf1gaXv/ymezqoVS58h3RcjptzniyAN40NbAJz9wz2mUBxoIeI
	rsNmP+ZlJXIaJEV8wXmdDDoQKYexIZKrTMHoG7jIIg3zd+ZZxCcFETQ+D3RNYkqN
	Bq0TfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr2y0h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 14:56:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93771aa0379so1179732485a.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 07:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965816; x=1789570616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=HgL1OULnkJOae6xKOVzt6N3K9QOSrfgtPh/yCcY6TjH+wer+Nt8KMHrp5pS8QxeZNQ
         wxPMWZTQ1KFSDE7vSqc5gnjwRqyLuAjACXl/Ampm7581ULALcwrTAHXmL7LOEBwEi5t6
         FRC5I93Is/pMdIeaZrwZbCwTGz2IKsgEG7DXQdmLVZR43btZ/l+jndIZ6vWxdUjzLhP9
         5aH17kkEuwJi/otpQcsDK32ATcvNW4o42AIMN0eUry0HyRe9PWV6+D4J5kMR1Ip6g5cm
         U8q5pxEwVaSSj+XPuMEsvquTL49riZb+450GWs4M+nQqVh2Lp+YsQvWPq6lFDccQq4Ge
         /XOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965816; x=1789570616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZCGZQ+i6grmulaXko8drMOvUQkeNLsh39m6O+zc/IiY=;
        b=jMuM7+9frNTHjeb+QRfX4Cw+UgOfoYXhn56NATvTb3uIw1igOVL9aKxM6p6m5xJrVw
         IzeyhouFdoKSk65Aze++IrEe7gATJwOSaeBuX9hTo0lIfccSBUb3bGoX1mD7+6b/oVFQ
         SeEwNqNhWzsvVX7X/X28ZxJ3iamxY34hiXCD84nZzu9cbRrMme+gf/+M94aO06x40mlh
         5+RkbAoez/JazKO3Yy2WqPKyVKorfwa4qaj8JUabocCqIzFc8rbRwgNl1MC74lViZTpU
         mJlytzrzUKc4cZJRX8xDNktwIZJRZ7CuhrdgnPkyzPYMBbsyBCFaSVjpp6xKssq4L9xU
         +f+A==
X-Forwarded-Encrypted: i=1; AKwUvByrnuBvpwtLkZaPE/eELhrFEs5eKwo8UvTmklAARiSD54OxjXbfnhq+wEyWHiA2xDcTjs3ijnNK7wm6@vger.kernel.org
X-Gm-Message-State: AFuF++lw0If8Qc7rkB2amCWQB4pHhURW4caZSaXFC0D8sSQd/mIPU6qf
	EWkzDSElPa5+5DRtOeFo5fUgctqObwGNA9Y9nNvdfSyvO3uLKPhT1GkSvUnR/5ZkGWDvZ8hm+QP
	dhp5V8JAtztzfYoCKrSl7xNRcs8ouoYo8bb35kVW4sH2XXtBeVWdopgJRwHh3zdMa
X-Gm-Gg: AYBFou2P7X6bEFz6wQC0WGFPwxuxZzv4o9nJgJyOdwuc/H0DpSBdYzVhRpdcH1wpcra
	3twVbusLCkVSeKOrPg7gtfDFPBN+IEW1KMPXczXYu2/IrzO4b/W0gnY+er6zB5Bev8NcWOPtwuJ
	jISPPct+RHP97koPJVqQgFzUtGPHAaCKY2k/rxRAqwzJdUQ8XHqvB+d/pPQefGfQqbwxiJMQtwv
	KhARGXy2BXKsRPDQ32ysHQi+jnmAeYhiIbu4ReoqOG5dLNYeH6DpOZhueDCqEHglHvkJJ0mwkBg
	5sgUHYdAXXnFcFKuvm1h0YiBkC21vWBq6QWA4BhxvsQQJnoKaqIFoo8wX5p/NR0BF8+IHRaRNQx
	FjXrzHFVYhc6u/Q==
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr256990685a.5.1788965815813;
        Wed, 09 Sep 2026 07:56:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:3626:558b with SMTP id af79cd13be357-939d4924cdamr256984485a.5.1788965815365;
        Wed, 09 Sep 2026 07:56:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883acd33sm44453692f8f.18.2026.09.09.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:56:54 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 16:55:53 +0200
Subject: [PATCH v5 1/5] dt-bindings: PCI: toshiba,tc9563: Document embedded
 GPIO controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-pci-tc9563-aux-v5-1-c9b33f56c8d3@oss.qualcomm.com>
References: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
In-Reply-To: <20260909-pci-tc9563-aux-v5-0-c9b33f56c8d3@oss.qualcomm.com>
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
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa173b9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=eKs96njmx7wsaJQT5x4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfXwYg3MWgY9CMk
 fNRgInLQIJq8XZ5uK4xP6GcI1hhzuZlQgyEIOwzk7yCbA1NgjINwJa6U4FweXtcQfyKtBfOvZOo
 qlT6povkU0mbG9LUpR9MorbitDiKYjBveYC+ykNwI3uLuL5+ICP+YPGRHoSlfgX0RGQ6UqzelEq
 tAeMUsbcdXBhQr0hUWdmoa5XiYSXHzVMGzDAuVeHeaw6eEg3AHcJF6s51Vg4V5ROx0W8VdNgdCI
 /4VVHpOUBxl3NpgOpguD7sCGvbNqcFL+VntZSYfDnKPYFdAnrhSAwSTThoLa7An4dJeitmBsQcf
 eYxV/LsrT4TRnqkOWTR6plQbGx/UIZ5HVZtok9B3d/pqsMOipgLh0nlA+hF9HtifGIp/N9+244h
 zljkWwpBOkG0KrXjmGq77HW4y3IX1ne36ZEygC8h3Nj5n64vZ2lv0alaREazu+rkh3XWO6jUyVQ
 cARO2DLO5GP7evom9TQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX+J1vjYgZcdtM
 69rDkOI62EoYAdN9cwvQboA80/6cj+u1jDGSYZ3TCM6V4KIAYW6zkZFCWPxqeKgXQn1daYB4NAY
 /sxpp2EPgsTqNmzp0Bw+rDrlLniuA1E=
X-Proofpoint-ORIG-GUID: d50BXL6eUkV6bSJQ5Q5vKdHxr09LuYoV
X-Proofpoint-GUID: d50BXL6eUkV6bSJQ5Q5vKdHxr09LuYoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The TC9563 PCIe switch embeds a GPIO controller providing 37 GPIO
lines, accessed through the switch's I2C interface.

The controller is integrated in the switch rather than being a separate
device, so expose it by adding the gpio-controller and #gpio-cells
properties to the switch node itself, and extend the example to show
the downstream ports' reset-gpios being driven from those lines.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
index f084830c6d0c..c4ebb99f50c3 100644
--- a/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
+++ b/Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml
@@ -31,6 +31,11 @@ properties:
     description:
       GPIO controlling the RESX# pin.
 
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
   vdd18-supply: true
 
   vdd09-supply: true
@@ -128,7 +133,7 @@ examples:
             ranges;
             bus-range = <0x01 0xff>;
 
-            pcie@0,0 {
+            tc9563: pcie@0,0 {
                 compatible = "pci1179,0623";
 
                 reg = <0x10000 0x0 0x0 0x0 0x0>;
@@ -149,6 +154,9 @@ examples:
 
                 resx-gpios = <&gpio 1 GPIO_ACTIVE_LOW>;
 
+                gpio-controller;
+                #gpio-cells = <2>;
+
                 pcie@1,0 {
                     compatible = "pciclass,0604";
                     reg = <0x20800 0x0 0x0 0x0 0x0>;
@@ -158,6 +166,8 @@ examples:
                     ranges;
                     bus-range = <0x03 0xff>;
 
+                    reset-gpios = <&tc9563 2 GPIO_ACTIVE_LOW>;
+
                     toshiba,no-dfe-support;
                 };
 
@@ -170,6 +180,8 @@ examples:
                     ranges;
                     bus-range = <0x04 0xff>;
 
+                    reset-gpios = <&tc9563 3 GPIO_ACTIVE_LOW>;
+
                     toshiba,tx-amplitude-microvolt = <10>;
                 };
 

-- 
2.55.0

