Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530590;
	b=08Te7rzkPXqYqaB4d4PTlN5UwYCb2a753/K5EBfIUTvhTiJVowSt0v/1x7+d9jYjKlpr
	 bBzm8b0wvunGwkoY/UL9MlS3rfaNHFwodUmfQFEL3sZkePUjM81/DV2cuSADAtqN2IS1F
	 ruhZ9ZvO+hLQKIaeibCOeEUvTc1w18Bf7eTKX9TpoeDvNgmWPNutKJK2GcbSxYYQA6lDT
	 wZZabfKcR1cxl6hNMZVLOdiR8LVOP2qBY45kKfRDwh4LugL9NDK9nVwq9nCdV+QqpTMGz
	 3cnEjxrJ0lRCszMCyx428RAsYnJ+50g5Y8oT3AYdXVEgEDNdXxsk8rYyc+gpIR+0xAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
	b=LbskyuBXIAmE+3z2g6Ng+a5K+xzJTkJfYnIPjE7CGYGM0BFucDVxrdp5EtdpGJQvNpYK
	 cWhDBwt+G7zotajpEdgzuXFkeaZvCiED4HCa4fVSB2M4ZifkMZ+uUiIhFoA+BYRUGcQJX
	 0lxXiSicad7YP4BniCxwDtW5brEllOZS1lHTp8A6SNR6vSRmfZu0tRl7p9ozyl+S/XPLX
	 ubzpyF7ymq2p1qbCtnFpsZk8CSYz55phrfHccjkEqKwD8Jyo/NMDHeDnDzUZeA07Q4n0q
	 K5Vuoi/CFFpP1xQlcK4bs/vUx/VhxRD/M2d0MJhjETZK86PqfyXmTXtajhE9IrjhqQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LT98765U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZLEKtyx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8C5606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LT98765U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZLEKtyx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AODB78P1408818
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=; b=LT98765Uj5aDufrJ
	RPeNEaiCqR6VoXwW+bVQeCRrs9rgIY5rzk1G5OLtwRLZsQCQ29VC0x9eB2yoRvdM
	e77XIXbRKGjKkj3YGiIrD4jsiD77tjQZW+vwyPsLchHJM8waxYX8kpFGYyG1vHek
	povMORVEx03RjzsVdqob/usfxThb5uCS6hnfkxjU9ZcMI+VT+kVX05tth0zdR8ic
	6uZ/qwmFZT63tSDY1//Rja/lPdPPNSRmhuCknPq2I/hInczWodaHehjCDafRnEK2
	fqmtoKthxnLUhDOnLIAUkApjUT5R5YAJ3RPz69X1aGWmdXLa1hTvoDP8Glac3F2e
	FTWAsg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b800ded-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:29:48 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8b3b74c495dso68912707b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795530588; x=1796135388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=bZLEKtyx9GjtpwWfs+fCVHDHqL6RBfVMxJ7BTmmzwxpFXkfQlA8Syqs0Sz9jZ+MBDo
         iupAdS1HLQ4deBewxHLJp3NWTA/TxzKUiJFHl7ja15kDRqaSIcZ8qGqaNLmLzr3sMxrM
         WlUn9fYlgDoAbTAd9nKxa1XCqgjMwAKTSU8WC2NIQ78K5lVCOV3hgMWiLmZqlnt+ZSSV
         Ro0LF5uP4s4lMvzkWNr3pog1xCfW8v4GI6xoVrD1l4wkq4woQko4ycXnNwHlY+MG49ZO
         Y12bdPsbbZNt3Jz9vGUMEKWEdGvIH4YWo1j8odI45udz18Rg+r40gQl/V613Hg8ECgKO
         uOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530588; x=1796135388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=yWCffjcFRMx6hgJ6VJTnu3wpPkp2B/w5l2Z/+40W7evV8J6CQ5Txpns30OAsGW6hVL
         wSouDeBkzm7TszltTCTN90RJbTAI6WIBnwvNHpQCLxm5RPl0tKwqOL2eZyF4HlS5eOk/
         rvf4vGAIoKOw4kphQLnjG93WtPKOXPiiH1RmZVPeBb74Jp3yRNi8kMWe6psF+XHWDo7S
         FMcfz/kXgkIvpCsDSbTlZ7754o1kHSFVMBUMqUhc3SibPbnIK1XYQJqPfbtdDt1AK7BC
         vurLa+sQuAvc7mCI1hOWfBuqYwuCiVndbfoZcr8tNxxeG6uOBZh8qkniHVU6ykqrtdi4
         LTVA==
X-Forwarded-Encrypted: i=1; AL+hErHsNIMwAaNhajBHHGJGAiwQZl+EBibInboDFeCLkdxux7mDUh6JozXb7EBEpMVj9adbyrbJAED77ISD@vger.kernel.org
X-Gm-Message-State: APuU4Z+3RbHl5bkZd0OiBYnw1Uj7WDflods+ZwzbKZonxfhmwnRRKZTf
	LPDV/d9eQzANvnZZmiQl2f750ZGRtG2bNRZSs5h3H2hmdfXtSNMUl1eOIaDYsC3qfrJIT7I4lo+
	vMkG/X39S35UaNub029at3WJWN7TRSG8CMaUvqaWA+PIscQobx1pQSwcOKfeUTMdi
X-Gm-Gg: AZFdTZfg96tfhGbBeZst0S92dXzbfkMVo2hFJK/XdMVh2zLoPELUE22Yrf2IStc6gTl
	kIII0cSsLwHt1Q3KY1pcIF+EVha81CigpZm8uMwfP/bwAvzfFpaQLg1lu/ktrxl/36+Y+ZXcGBZ
	Og+t5YN+LZDPrk/75VQ+gWJjTZVeORTT7t56HNzqYILBobaPKy8eYunO/YtqRaTxqctQM7BBJ1b
	6Rxkt7pVVK41fR2z2+6ctvouXvp7TQ2daqVk/vkMcu0c2TLDuU2R1Jw9HxgA+cVUl2EANlauYqz
	7jx074NzxMvExyb3F4kDxicXvu4urwYXsi0MTE4hxbWgzHqhEIJQjZUUqH/uCdDFKLR7xGZn3eX
	qdSmAvgHENjqrHZefcfy+8C6oMrTJ9U0XFHYPu4qD+gjGjpzrq7yDFCAW39azSEeuaBekqlIRir
	Iihp3grPQWrxMhb4NUm4D9TRwMaMCBXizSGcnkXiCWvbTVajbfBPQtfQEflnbg/5Q=
X-Received: by 2002:a05:690c:4a02:b0:8b0:f1c0:60b1 with SMTP id 00721157ae682-8b5204a7d4bmr46568237b3.60.1795530588404;
        Tue, 24 Nov 2026 06:29:48 -0800 (PST)
X-Received: by 2002:a05:690c:4a02:b0:8b0:f1c0:60b1 with SMTP id 00721157ae682-8b5204a7d4bmr46568117b3.60.1795530587986;
        Tue, 24 Nov 2026 06:29:47 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b34e9c3ffesm12013821f8f.19.2026.11.24.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:29:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 15:29:27 +0100
Subject: [PATCH 10/11] dt-bindings: pinctrl: qcom,sm8550-tlmm: add the
 egpio function
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-qcom-pinctrl-egpio-v1-10-34f2c06b2658@oss.qualcomm.com>
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/dsb1sgncorSisEr/533isCV/S/Q67kIN+W0RZxWI0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrBZ9DVzCB6LvNtcb6SnxQhmncdPBEBs9c7WMZ5
 ec4nO3zlcCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawWfQwAKCRAFnS7L/zaE
 w5VzEACsJFDsxZ4a4KaRe+Qte7lD5bRapxVnIUlRLFHcMYPq7eVf2Ztlc5rZqd/LHZyIOydJM1o
 g3NPPRh8Nc5WaosJK4aJkClSM03xOyGb4b60HYoVX5iUFwu3tvB5iBhU+h9U7CNELcPd1asMRMt
 QXWf2Zd/x5RrGUPjzQaXkSGnESECammZRyb/UjauLJFnLXlnZGvyaxSDD9ECzeUGmC+aoqoJKkZ
 YcIcNev/mkpyvCfaVs3LT0Vg/g1+fNH34TEC2+IleZMctxwTfjyfkV+bL5LrpzEL+FQpCTOC65v
 IFNTzmZBH7l7p4wGwc6+9JHSgEoSzJnuG7OIRSnxTaoZJ1LyFHB07SYxA+Crl90RRipELly/pDW
 q3IL5sQxnfKwH4VE8p+z9zsJ8/tbj4mYEBpON6DGbq8etRCbj4sXORmuWxUjXkPjnEntxvx7O0L
 rXXKcXax9SZNzluKsL/NrUpaCfi+qvFPOiisZag8WPoUGB/iwpmnSclp6QHAoIyngYJlBFz/yWl
 UuGewA7KcVM8dIfZIV1uxmwpK2ITaN+3tVnHSX+uZ68qZluK+2YET23EQvMCXGoZMofFJ/d5ufT
 hb00MDHPadMmfAt2SQzYjJ0Kww+D19MHEf6TfzGwBu10T8OMh3XZaQaHD65SVsqU09FTUqrb39O
 XgQhipeWnPzVZZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX+06QuZPB5cJO
 Qpgz9ZfgClTYB6Squb/02L2vKXf1o0ffcHwuiZukdP1qTMB79QkIJn/SOK/s8tMg4MxUdDSC3ja
 FIEK8CEAyY/pIu2emaN6wn8wiXE0fXPsi5NIXEipp2OKhlsGuvvswz6tfY2q5ImnTnVc1GbEUr2
 VLzIdFlzC9AJaqWqQEk+Cn62SXLuOJDh+8G2xIjlnzo3LyjceSD9ByUQq5DMcRCill77rWPbXih
 0KWEHKZQ4p3E9u6JollZYk5eoUVtT1KBq5fDbsiBv8MsnK9Xn//n36p5vohNjsqQnZa6MrazfuS
 ySlYkooctwCEumDZJwNpv67WnD8SO78x5HuThuWdnWW8hdH9163W8upCgQLNjve6ehQgmEw/cea
 6zv51dzwHXGtENjVFtIvzXFkgYq6OGMid2MHS73ZGZODLt09VGjvS+5Tdr8+BgtsAQYEf/Yq476
 ER8kam1VGniFoyS96+w==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b059f5c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nBsi83mCGTvHtYwPD4MA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: R6giuW4-_vHwCacK93fTkvzfdVDQRagn
X-Proofpoint-GUID: R6giuW4-_vHwCacK93fTkvzfdVDQRagn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1NiBTYWx0ZWRfX80gRrBSXOlYS
 QQ27jORmgwrt3F5S/INqTnQfeHsIlLApN4j2EQB4/CIjr/QTbULw4g27H5B+cT/Q1zc3IRyfMLT
 tyCOxNa/Nu/2HxvXIa/NT66J+JLNpqU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240056

GPIO 120 and GPIOs 165-209 on sm8550 can be handed over to the LPASS or
SSC island using the egpio function. Add it to the binding.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
index c2ae79df424fda1be7f8be2b2c3d304df9040c60..8c0c677d7fd7f51de62d4cacfbd429789e04878d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
@@ -74,7 +74,7 @@ $defs:
                 cri_trng, dbg_out_clk, ddr_bist_complete,
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
                 ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
-                gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
                 i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4,
                 i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck,

-- 
2.47.3

