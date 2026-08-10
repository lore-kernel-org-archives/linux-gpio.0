Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CB740DB53
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376537; cv=none; b=apqz61yWEjN+nMCJnUJAr9JSBJ9Z2ru2vshV/ImT+ACZoOE6+mXlrWIPqRG/0s9nPIY+pdOte9Yjf2LaIOU3r3a/Ki8clxo0Tr67Im4lR7JwmPvnWJSw1M7uaIih9vRNxpZnn3+F8Lpe2ZHqDHCmadQgrIj6vah1srYVHz1u+vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376537; c=relaxed/simple;
	bh=MxJGfWyqHkmujFHgf6OYxUEmpp0WeZEB1egj1qYnlP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LvKUwGPDI3GSL0+Fg/fdrJPKqk8KkbS0Lhr7J0IqQEenywVvbtY5mJQluNItZF4fTl1+2S5B7TQr+/aioxqKQCGntnIwaHo42TJn+GFYSwhkGT8pYZmHYmjYxQpPwjWstOJMDMuOIqVJl3zG3IIIKsnHKbZgrSSl8tbwqTFdseo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SgeQAnFQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6vlTQ8E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SgeQAnFQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6vlTQ8E"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWFsb2090631
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=; b=SgeQAnFQ6OUrue2u
	tzCoZX7bv25HSmH3HVJ/IWfJD7HbF1DYSwZePJMGXzZgwip+v6+m38Vc+MM5WYF3
	YqFkaeluIKvLv86RisM56hPiMmENGVHt74MuKokXif8DFOrrMT3Q7A0lJJ5kLxH5
	bi2pG/ltnTFFePNiQ7A3Su6JLpim1S5LKfz/cFvIFNs2KlmzJPDEb1R3BIwwVe1b
	85c041TpnBSBoDHc/9I3PYkyaN9knarA7RhWMe2ZyqDP0EkE1P4LoVKxXHwtTiOF
	j99j6VH3vBnMPfvdxbf4smmtWyFzKHKrFHtO8jJjvX92XTGZD/VpVnUqcZEfbU09
	5ltSkQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fybh59qb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 15:42:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so18123201cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 08:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376533; x=1786981333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=;
        b=g6vlTQ8EFojVwY19zKX3EvDYNmC1lzxIibpEB5O2FMcLYjDBrNrpKly7eseElCx+kj
         cP/DD8PMc9S+MxSJbquLyYVmntqFqhT8DM8hAbGgs8fKqbP9fxNWNswxixhctguYwaja
         WaRCrj1+oFHYPF+LhAvLa51+8wyrpcRBmWSwsytSiEjRunYcB+NSAbQ5ZSzxb2tV9Mv8
         vnxH8T+FzNNTPXzosLl2RND+45QA11VRBtRhEbD5SScTPerECMJht+cFqW1XMiRn9M3U
         vtxOHzMWFsDxvfH96UXTM+ITvnbnixMEu+BxZPOWOIJlhKNPRFoSzytNoXTtBntK3eYC
         KGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376533; x=1786981333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU3nSZ9YOSVhbe0tEc9W8hDnA4xNDc4U0VkZpFIzSy0=;
        b=XBAoFUGwp9vAy4ShH1yenhr3Z6CLV1YbXf2Yu1Bfjbw+8D4vJsAbCBWyEDUDmstds2
         CnBVq55g9xZYKdu1ZXWeTjXaS5s7PYwj8nl7khjmjLpx8qvcjZToJjjFTKDIgzZnaVYD
         a+keu9R/BQxfCHuNzptt2sPa/+2idQaOCkPChtHbRXZSkfK1NOiZXvPxHbk2mbTCXV4V
         7j/3DQpoHU5/dPV0SxWdXJYdNRMYNo1YqdT/d6npRHmM/y/BjFSgf92TxLg6Pr2wqxFP
         L9bzI5j/5KcL4qZJvrrqm49WGSKRw5dYBRWr4ABeBi/0DJdNBNf5n+/6UubF97NFTN/1
         U4Hw==
X-Forwarded-Encrypted: i=1; AHgh+RqZqQuAmlUOu2FtTZAUsRXVOYjWIwMPxUzrAPwYLtk0Eqpam05vqNTl2IYFwjpmKTQY2HbwxVkZOYGh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyql1UYYZ8pRCsGGGyHnHoj1aPpQJ1SzwbSNB6+RpaQ9ZpNQPOa
	bNaknoKwSUwkICnjbQTcnh+igNEgx7rrOkBHumJ7/S+j9bkKr36KKkChBWAGTPZ+lpq+oKnrD0/
	dsVhUNUc+VjmMViUPGwJkAZ44pqcYh86Cpx/WNZ1absFyVkr4kKujb0jwL7oBhgvE
X-Gm-Gg: AR+sD12JYUOix9g3CA3GuIossoas+t5i+U4Ec2kePGhZRGiCpuuZxIdGd1UdpoGt/RT
	07NffoOD8XFRjKRWSdgyxuiCgew6NWeZ+QRd6owwJ7TeKDTfQ2SLv6ZpdNQsqQGpYzCQJn19QGo
	H7Bjn31BYAyljJHpLhLkDSxQobEhX4NQtnUJroC7ZpZbm0ppDmCyx3oc1xLYUqrarsoe5pvclov
	M9lEANKL6bUUoQvgo/Rg5vyxfxN7k7CL2eZGWNxnjmFYQsPbsPOuBSKcTKVUTKL4cubohmW5tKY
	xJpQ4RGtIV65WO5L0EDRZvvGcnbOZjpRe9sHN7BXIaaGKVel1MJfoXAe1wIRCoz9HAKxhODUmw7
	9r5PvO3CFWg9D0Qci1eL/6WCdtY4KEzyIHZHxmZpGf89r1egpQAeNmEPDKB5rjDiqXET7Oq8del
	DuB9tZxVh4F/I18Q==
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52ce614ec09mr547787641cf.34.1786376533393;
        Mon, 10 Aug 2026 08:42:13 -0700 (PDT)
X-Received: by 2002:ac8:6546:0:b0:51c:e14:87ae with SMTP id d75a77b69052e-52ce614ec09mr547786761cf.34.1786376532932;
        Mon, 10 Aug 2026 08:42:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:05 +0300
Subject: [PATCH 01/10] dt-bindings: pinctrl: qcom,tlmm-common: allow
 functions on the HSIC pins
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-1-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MxJGfWyqHkmujFHgf6OYxUEmpp0WeZEB1egj1qYnlP4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1blxwDXx0EKhs5r8iUduX/mB8v1LvJ+OavmxPuvYp4RV
 0xbl+p3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiH76x/7OWcQ5nSctTfrv4
 mI2agkXarencdQLBcfucH8opH3VdL6B6Yu3D+7rJic9XzgqUE0u6H8fVZvdvuq6Vd/8hH9M3C9i
 sHO6bTTDSM0wW79xyKCEn26fEMPuq0ow6j9AiXqW509OlDS4HFWvyLBD2/nupL9Kd71Vt4NcLIS
 W+sdGH+WtOeC0oOq6x8WL8z8TIGOZGbwvdHZuM0iq/xzsYyF44qBL/R9J93uYFPd37Vs7aFjZl2
 p3Ld4oulr1e+1fNYe/HtHd7ZnZkr+HawPZILWCpYf2jBYqZRhu0bC2qhbkDp2wTtmharfBqk1On
 UVzZjTPlf2fXRa2ZKl589NmfpsMrdv2UVajOrb5uX9YHAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a79f156 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ajVk9B4GSH7WaVlF-OgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: XkOKADS0FW12rh5FsCKJG6aKoWE0TepR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX7330leUa0T+d
 T3IQRY6Zzyt75T/TAtIuT7IfFGP/HEk4Jt9vtRdglbTS2EvTK72+vy5R18iX5v6fxw4MwjSW96h
 UXwJaDchUxvcNW74Ik2kVSNRnEYXX7w=
X-Proofpoint-GUID: XkOKADS0FW12rh5FsCKJG6aKoWE0TepR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXwVBf9bz+dc63
 UuiRO0tkUGk1NjoJZz/TIAqW2j4sOPTiHAqn2vKsyfiEo28xHScGq/KwqarZldmZVXwHzt7ySWc
 MFm+PDDxuKhmhVvxFYgmmXIl4i7iExhxRA7TMJimiIBYRxgmGrFlD65220KZQyRh3THJpA0YfTZ
 es/7browNFBHvhwrAhOFoQQLfyjdDu70p+dvCD6Lc/niu2ebrQjcWDLlCyUEZeD+CRIbsl5ibWy
 9Vinqi31ibt8tJjw8QXryUdrbUlTRzQuRWeKcFIJTu1V+Oh4IsTX2zqn1qdbJTHlgHvb+LBDlYY
 FBBLgnjrRzVIKVmSB9y88/5gaIQpUy87j3QQPdPVnjjWYdBiFvBF6F1KzqIEgy5E8g0Yi4G6cDk
 hur6+qoLc+pHSRXNZ+xR96eZFtVHY+I2L57gj0a7an4mOfLPsAfqgZiyi5cZ2W3dxYHDtudi/0a
 69rCkEkJ/WWx1siV4gg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100135

The common TLMM state schema requires the function property for GPIO
pins and forbids it for all special pins. That rule is wrong for the
MSM8974 HSIC pads: unlike the SDC pads, hsic_data and hsic_strobe are
muxable pin groups (between the gpio and hsic_ctl functions, see
HSIC_PINGROUP in pinctrl-msm8x74.c), and the msm8974 schema already
lists hsic_ctl in its function enum. As a result any valid HSIC
pinctrl state fails validation.

Extend the function-required conditional to cover the HSIC pins and add
the now-required function to the msm8974 example.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml | 1 +
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml     | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
index a9aff442824c..d9178b265268 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8974-pinctrl.yaml
@@ -161,5 +161,6 @@ examples:
 
         hsic-state {
             pins = "hsic_data", "hsic_strobe";
+            function = "hsic_ctl";
         };
     };
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..e10aff02be89 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -95,7 +95,7 @@ $defs:
           properties:
             pins:
               items:
-                pattern: "^gpio"
+                pattern: "^(gpio|hsic)"
         then:
           required:
             - function

-- 
2.47.3

