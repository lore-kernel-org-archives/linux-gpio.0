Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981781;
	b=c8bfKaCpH9uUIdgxPDoLJA1bcuxIEbRNZ/1DafP9Ytpy/Dk/2vYOmXmv6xdkU1dOmUkw
	 WoUrR/zXYamm8dDpgkARGisAO2HaRpe4Shy+ruM0cVmfFpnHL5UMsBKEHJLuqu/gls0PG
	 tqugfmA7LtFRk24nMUYDzw3ZY5HU2llfJZhEgSFaXIq7UaQgtvwK3+j+Alnqb/psghlJe
	 /rIxUmY0tTCoyZsolenDnqcWkW/Vipcr/VPrUcaLRFCsktRN3K4eYCzDDXWLXCIALtqSm
	 i/pAfTdpO88QbDw6/7D2mx5NxY7xCGtEcc/kv/Tz9Nt0CfbhZITwLdf3JhfkwFx50ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
	b=ckOz7PIb4qDLVnDhFzKT8FSmNzPDfWok5Tl3cigfPT6KY3G+3gUFbTUwDnxkspcmAqXZ
	 0Q4CRjYZ70NuA8tuM+MsO1x1PdW/eJzsPUqgxGAit5A5wbDj7VwmAolIccLEUpaxmijAe
	 yrwKXfLV2rlqI0aX4k5YmlPn7Qxp9dIFZNgWdsta5QEeePHe8V7jiAM0A8LhFo59ro0pc
	 cmygcTPeIv9evHLLPM1zk7ONj6TQk2R7DHZl0Xx+yuIAjGXsP+jmDdaWC0/6FOcEB8rlL
	 kp8V5XXlB9FW8VOeDCKnzqI1vb/6nCpumJTIfttb1GYqRjBHY1f53d/BDnl2bC6ow8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F840606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F840606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtnQKBgr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cqSaMUA9
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V0Ot2602501
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=; b=KtnQKBgrryNKBV+K
	X14+Jy8gx3M3wi0BzySspud7Y7foqX/OEzl1X/cQccu+jSSLNyiwPc3lut2qiH79
	UuCf5pp6ZQ2FpMbZtMYGOIYxHzbAbY3g8AXIgQ4kOpeH2INHnwMgnabjw/KOv0Ph
	JrILVHRbu8D9R9c0dmrksBf9lASahSU3ShW9EtDAq2GI0nzvteKfSYSDg0/A0/VX
	u0f1d51bFgyIb+3ANe0rF9ax+WkUSJ45LZ0YISqX7aZoDDAmQvgQbGVS0AddcQv5
	+zKWf0QcSN8OpUXar9hJMHap2Rr7aRB9P09cSkEI1O4toDuDr2buWovgkrQzyOUp
	G6F3ww==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eff4c37998so5300465ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981780; x=1795586580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=cqSaMUA9uL5CmhqrYBxt7AAQIG9rNzJ9MjcR7IwtnhnA3iZ1WUKruQVu+gQNJqoioK
         drmMwCGq6j0+bCt9OYb80NNi/6SGfUPsDP2fFgWh1dejluep9CoMhqspLtbEtdpYw0kF
         l3Q12u3fDmUqsZ7W4ar0tY1rihMyDzdcvX8+ez4lsgDBYpjxJSNrIyVcbzbEI5xyobUL
         2bmIDt06gudh+HCKne0QgJymDIo+QJ/LkyITJDnIUAx1Tbnfx1/APQJquTgYUKZd+YR3
         lnt2V6+o5oIN1qhi0jdUNBHnW8dQ0wdP6HE4e4Cp3EoFvvZN6ldx1thKDDVNSu2KUq0p
         nC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981780; x=1795586580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jeDDWX+SDnOiYxpVvPf8FryzZEWS7fULbWJ5Ft8VMWM=;
        b=ZUebBFM/9WRHhMHDLLZoABdjT1GviwkUoaBmt/zAcqf41C6RmR2dNs+XksujDspydC
         ca22kYa4ws+zg2TRmkyYXKFU5uAdN2R5kgP2+Ad7ISNS+ZM4DWcHp+m5jj4kz0guj6YU
         XMJo4K2vICRsxFadnkh4uAc8hjBGdyOuagQITh5G6ke7L4gZMX0VO7/Q0HXsgoViT2Gh
         N3KzbzxivBOp5egVEkC34w69VNvvyITDyZMMAS6YZsj/CLfDSyxq7QpXMIJRZ47GD5iR
         UqpSzAszan8ptoS8+mK7K7F3Esy0lciS+1yP8O0kN8fe6hkup1vcThaqx2B47H+Fs9Bp
         LaLA==
X-Forwarded-Encrypted: i=1; AL+hErFMh4T7/6ecr+fSacaT9ZxIT79gyYaMOhwU7LL1PJVHPserkRBSj5b7x+sK76SjrJph1dG4Gv605vhE@vger.kernel.org
X-Gm-Message-State: APuU4Z//ie4Vk1DGHMm39GTrGC+7EMtYntbcL1afmt2UD4rqaLhMde2T
	7yX2hMOq9BW2FoqFw03qHTAOK8wL6lzmsHzd2Zi4iP2RodqOn8pnaCuFjZnmddA4ZVGFflZHGdL
	HmChRfO36uM91shnB3V3kOAQFfhyiVrtW3eTW7553XfyyfI1EBSJ69ntQa/5I26z9
X-Gm-Gg: AZFdTZfCSoDSlwaGLXdcv+/vXOkLcigDwhcX/E2sfLXcd3ZpQgPB0+73iwUBiRqIj2P
	BtlZQJGiezS5q2h41LGaf/1QgAGrA8PofyoOBcf6mmBpzNwT4hdcimX7SE4Q2JiTNsC5T8ET6w9
	F3bG07+d9DiXt3OI1cr2P5i28kqrUTPY2Q4h0vuXnpcaRxaa1hio/JxK2OLrwQe4eYfi8E/kOUt
	prZe8bXHOa4yYDs5s5qmnPUHp6TOfOnNTRJpChQVKFGDidUf8kL0v3iTi+oNmYC7F6G1ptvDmmf
	9bFsUDkQiYWSdyRSUh8FvC9d1B70wYuXVTvfnvqxdFUiy3QvQ0OJ3f9EPqQbcQqCjZfwcU5MhGi
	jL2vbEbyGgmi64bY5dFcOhgVNS12a8Tugd91lQ6G5gWRi9axMxMNYRlfXWTwsszEoYRNAPqz2tg
	==
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780815ad.39.1794981780161;
        Tue, 17 Nov 2026 22:03:00 -0800 (PST)
X-Received: by 2002:a17:903:1b04:b0:2ed:205e:eac6 with SMTP id d9443c01a7336-2eff751fdd3mr13780565ad.39.1794981779689;
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:59 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:34 +0530
Subject: [PATCH 03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn
 function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-3-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: 3gdWT__cubyUcP5RrwW4OMWu4C_2f7L1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1A4wfC/ILiw9
 gEZdulsEWK2rr63hYqcrvh21F1BkBDzLyv2mh5pgPiReemL/oaKTU7DDDnhECkJERZh+P0mYwQU
 i5T7mXFZJotUCicZdKLyBKYiC5SK9tgF/hmyNv+lrYeHecKjzk4l20jKzkF0Z9ovg8zzDPQHAgT
 eOzsvWHzblkEia0FcGfjsDPAH6eKCuB5Ez8fdZ4gg9UbmuM24Rw5H4ByXoYYEXqDOYKBYy/Xm6U
 LvV9/9NknM0Svdh8dfl8Jefy/NEnyB2vYvRF9SHouns2tufWzze39Bl+qa4ZyNeT89m27+8fowb
 +r6KrEM3lgsIBF5lJhugQkkatyzezDl85t2baPC8Oz/YPYqzLBTgd75UVxUjunUuVQ+RWc3/NNC
 gIoUqrKT1LMtOloANW+ap+fSl/mLP/rwsZmI6lSVgSAIhC3yRaHNT1LmteOjVuJRjU6LR0b3d5T
 gQOA/S0LjGpAjpN8W2g==
X-Proofpoint-ORIG-GUID: 3gdWT__cubyUcP5RrwW4OMWu4C_2f7L1
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3f94 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=zDgi9xSYwh7u5fUgZvAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX0mc3JJRAyyBv
 Oz7B/xzvGSdxAEQMVGQIpz+coORk8A+gdA5Ls4NkwhExqWsVjLmiAgFKEzeIGaC/5FqFXS6n+UJ
 QlKlVQCWlxc9XVIREUB4p02jYfLwVes=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SA8775P TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio35.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
index 7a156b9bfaf32909125efc89e27f8dc671909964..1100ddab52290093af87250e4181043e924497a5 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml
@@ -83,7 +83,8 @@ $defs:
                 emac0_mdc, emac0_mdio, emac0_ptp_aux, emac0_ptp_pps, emac1_mcg0,
                 emac1_mcg1, emac1_mcg2, emac1_mcg3, emac1_mdc, emac1_mdio,
                 emac1_ptp_aux, emac1_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3,
-                gcc_gp4, gcc_gp5, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c,
+                gcc_gp4, gcc_gp5, gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s,
+                ibi_i3c,
                 jitter_bist, mdp0_vsync0, mdp0_vsync1, mdp0_vsync2, mdp0_vsync3,
                 mdp0_vsync4, mdp0_vsync5, mdp0_vsync6, mdp0_vsync7, mdp0_vsync8,
                 mdp1_vsync0, mdp1_vsync1, mdp1_vsync2, mdp1_vsync3, mdp1_vsync4,

-- 
2.34.1

