Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952011;
	b=4gVOVL6bRth6Y4RlWSaDWcDhXRjp/tbFx6Hm32ERuECM9+TrJGqFK5UeG0UgG2RwmWVr
	 nL2AZ5uhFPe99Rm6sRYpVHoHBvYcRMAd19yEWCEwoySNJSWzxqsXEq9EkWT4l0ocrJYbD
	 w4jBssvULy+HratoMoS0vUfPGSaMuLT/OBQSzDZTjXRySyO++AACiQk/tXf/QU5jRb7XL
	 xZ1LQPYn5lQc5qNSF1lI0bhG9Qc/1iuVo3sXRgahtjXZ9hTSJjycGRQu8UtDmVa2EP4EZ
	 lFrCs0oKBtlM0+yzU+jUHR2vlEvie9vUZk2RSspUs/Vokos2lyhwJ5u79vxJ3WGEDNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
	b=PRgf0tYXmbLTjhGmpY8itLZnv48eqVEFR0XF2E3pNZKjO4PWcGqivl3oNrn+cd/b2uUe
	 Qcmosr5TacFqRjZ+V7upT2FWFT2pJD2OU5VlLaLq/o4Kr6nVEEzX7zrlFfwyLzxXuQ96D
	 VydYcxztPz4SeNasWDvuKEF0StpvQlvTiOOrukF7iWrpVI0QC1Jn4YLBkvftlokc8EuON
	 6VUTVek+WIfI0DZsVNGDHBjPC1hG1KbsPlrC6m/dBnmY9thvezbAK06LQuiVPloDjcJPf
	 M3AwVPHvc5bedpQmC2RKQtGvBOY8AMA+1ZAMBnf+R3mds2v0XYkNdaY9Yy3x6fXF1zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E7460A263B
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62E7460A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gC4ka6wv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ib+hXPl6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RAWY045273
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=; b=gC4ka6wvvexq3Eu0
	A8JxHpN5jaGWmirVAolVsqLvMcdmwIap1vspNRy0s+jHuDvekHoidn72sFdwBx16
	bJO07CJq4C9vGt/GBELk79ytBriG8pfUljeYFbl6K1e75qDIJloPdKEDd60yRo8t
	Y//fkfZvDNafbU+f7UAjIk+Gd1tq3MFETLNJ+OloDV8kZNwfUietf4EogX1BhJwk
	yCOVyvg6RBsZawfhg34uTjT3ubDT9kAFNyVBqgJeSH+PA/5epwO3yK4fmNVEdSBE
	4pOHytjyfXVjy3qK+koWV2s0F4nbGJa6tFwCDrHGDuJbBOFndqDwbe/9DbkO7DGB
	ff2tgA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9srtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 08:00:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb92868263so287009a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793952010; x=1794556810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=ib+hXPl6S7u31rGkVQebZyJV2wnIcYQLMP3qX4z5T5gbZcbBA2SlTALlOld2aWwqft
         aXKWARs6vRunH6/qolzrMFvrkib+yoZn6g8cAi9ex/iJ+KpLUQCkiHY5JRSw30eB1+CB
         +fIGIFbEoc01FiWX5QWOarC5Pidsaz7st0AoQle9c3KimFmsr2eNpamM/79Z//OPXNpG
         mlkFxF199g4MH8MRroLCEw8lQfBqdyOtWOfcMDtBv+VJnM7/NDji2PB6ILg4EHIMTT6c
         2YlERtted8zqeIXsJpTMa3h3qwLLR7oY4Btt67J6jiFZkJzcvXts6EmBOFteGhEKV4X3
         dEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952010; x=1794556810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ic3G7YkyqlUTxJQR0hqaldS0Qah00QaWc3tsc7BquTE=;
        b=smQnfRJXWcjhs78wkxg13Jv0BRxiTnONXChqCvlUzIGgNdWjk9cbLX5TjcdZz1Ii57
         KZssoXVp/i30K4jaxduPIJ+9D2EgD0RUSRwRHH/cv1rTbio1WyHLXdF5ocGf8lkFBa02
         auMfJzbGd7qaRHGGuf79lVnTi7PD5qqt0HQtXWCLA0NXe/I7oVJUPrOlZDvwMtTKGKrE
         8zUXZl9kUzfmb+jNj4GnrU5EsQsqxEZPtEeoex/bypjdUTjlFM2og+5Ywygqn0ochGYn
         G1+Y9eiX2e3EPoGmgNN/C3heV3EBZeWNUoTC407lwuZXGRUWhR7cc67aiF1eu0rXV/Pm
         WQJw==
X-Forwarded-Encrypted: i=1; AKwUvBwejvOibaJLYtJlywbFXwwP35gksDq5q6iHuNEL1XjrJhA2i/JNpwbNG4PXNsbXouFx+gbTiNgom6/2@vger.kernel.org
X-Gm-Message-State: APuU4Z+jotddDvrRPd25BxG+c6Z+ADz+iwQdua/gt1tlRC/Pa8xWjZ23
	jhXAfBAaXM8jb/r4ZdkS9Y6MJV3YYV5dM/n9muYyuzKjixlhzE6OVy2zsjPJ8SdofLe0ubA8IuH
	5X2lhRcpxLtB9tcU6Ilqn8bUBkLJUWOecSmJO2co7QBNk+A+pm7An1eO5hu1ekVa8
X-Gm-Gg: AYBFou1MdKhzXm5D+d9M1vImwXkq6RBaghCAD176cnYaRU0aVubv3P987631M+y7u9k
	1p9Q1NARm/mAMVavRiJfCt3VayKYrCg/Y4AANgF6mrtrZl6XIy2FBbYbTwi71SIj55GMk2h6rBW
	+sFCqtIt2aXmqSWWP8AYjzfLp+rNOZkJicDANZhJVojaU5AML3JeUe/nWhQfiXCqVY7RHRSGYoi
	bKd5S4+0PHMmAQM0wuFP3y7bdALbIgahsrzXZLG7sOBi+9eL6rgZARW0QCjRK0TV02xegtTGBD2
	itog2UM0ntgm6HibJds5XZBSrH2NeF00A7n+/xXpaGhPTw5/S4izN6BvZBSFqzzZr/gkvikH6/A
	YcQrz+EEdk2wXurHyeT5AN5K1ZOQ9N5MEOMTTuLpT0bwsgmljFrnRLVn+XlwWAfTf51nG9bljtR
	LNZrLFNAor1b/j0WVUuP/Zcyvl+PiWyY+/TFj01qlvbmTiSFWpNZWJGU0olzSl89yIU+xM
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772176637.18.1793952009764;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
X-Received: by 2002:a05:6a21:4983:b0:3de:b0cc:b0ed with SMTP id adf61e73a8af0-3ebb298a8bcmr1772159637.18.1793952009345;
        Fri, 06 Nov 2026 00:00:09 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b359dd36d3sm354529b3a.37.2026.11.06.00.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:00:08 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:29:41 +0530
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
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
Message-Id: <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
In-Reply-To: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793952000; l=1463;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=v1VwzLIVBJen4A0nAYBoJxmCuCj+Ao+KApsK3wQ2L8c=;
 b=3MRGkfYYbz1vuQJwnIQLL672bkTkOf5vmz40JpS3zxg8k4EEjIuNsZEYz0lalZTfJbetjMGr4
 87pSXFms3NeAwtmca8YzIgsmXdJPY5fLe+mBtDylQlwmUPGfKh6+tLO
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX+p+qNT7Lwjb8
 iDIUP6gnj+YqAUAPDnZ8U1BMM2pHNf4+uuDZ13KLcduk0nbudR1YFagPzzh+U+3crQOjHa4OauL
 zMWByYcXmkbuWAcxhjS3ZkPTEE9BJB8=
X-Proofpoint-GUID: l384KfuhO8sCCROmlMZcz3iNY3wqaj-X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX5zinsbljcGI4
 StwGtC3TCl/lARK5P5elEDZdOOhnWRht9l60G7QWNV96YjkvVt5lZCuskadCDobO8+6pLvXRScN
 nK+diZGKzygLRagTK+lv2gxS5rBWh+3x9009UvxYO3/4ac0Kg+FwX8StK1yGMAnkMAwyo+YXNKK
 gSmpdEFHOl2o82Df4o66rcuNFWOUe9CrMS5LF9KlnuagsUNTMgTJL6DQ39MivBXTHDiWuj87N7F
 WC4GjwLGotfEQYf1xtNvhZHDTjbyYceE8L+k3NSD+6bc8v34BZQySdbRgI2dUHk0/n0Rzt6f+vX
 e+HBdPlnQVy5AnqPZx4Kbe7Y2dPA/DfWm9/8Ux3JIHPGoHSJwsFRwvkZfzTJLPWxXD29yVUsl9w
 h/xFHLAstBCAc8dtx3mB/+J0N+KgQUtKQBARYGwpnw+axmq9IN0UTMiUprEWraZClDSOgWO/Ke6
 k65yogAYtlKNFOagQtQ==
X-Proofpoint-ORIG-GUID: l384KfuhO8sCCROmlMZcz3iNY3wqaj-X
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed890a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FfQU36pP55OiWfDkhZYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
be owned by remote island io independently of the selected mux function
even if function is non-egpio.

Presently egpio is treated as a mux function level decision where as
hardware programming guide(hpg) specifies it as pin conf level decision
i.e setting egpio bit is independent of selected mux function, the
driver/apps claims the ownership of the pin if it's egpio capable in
case of mux function being specified as anything other than egpio.

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aec72e8c0621..d7ea3eb4e124 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -87,6 +87,13 @@ $defs:
       output-high: true
       output-low: true
 
+      qcom,remote-owned:
+        type: boolean
+        description:
+          Hand the specified pins over to their remote eGPIO owner. Only
+          valid for eGPIO capable pins, and leaves the mux function
+          untouched.
+
     allOf:
       - $ref: pincfg-node.yaml#
       - $ref: pinmux-node.yaml#

-- 
2.34.1

