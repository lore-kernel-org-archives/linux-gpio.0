Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981770;
	b=uCimkzEWQ5GLXEhBozVBH5/Uian54G69O73unf3sBlTN/S7JLLbpk6u55/8dnPdOy7Sa
	 y/D1bs9TlLhmBY7GBS4Sn2E6RXUzJbNDaal4//Ys7VlfjmOElr1zUd2YqZU7auM4EkzJP
	 uz90yl/VA1oVlLVDwHCOpFng6Xdg2AxGHBRVB8rbS8XDX9Wsv5VzsZQqI6CceaN3a2qch
	 3pGoMzyzlS7hyyC3l0ZxkUBU2X6xNEzizR4VCr4eHbUmg5KytVLc9Yw2D66C9NbI+O5ay
	 RXWLaNteNv1cmFM0vljUVJ+EQ+RQaVJcz1aujck+NlSfPpJDv5Jl2kfwFc7nbqpOCOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
	b=aWyoW3V75Xre1MgXxjTGCtmQN6fY0yXlTXqq8iI5n80Dbx8gK8h6d5wrxjllsnFQuNIF
	 D1PmuEg2/Q8/yFsDGfYQlvPglGK/fpHxoVHTrZbO5+DBeOWErBs6iS/MNjPi+I5c5KqQp
	 Ip4yoOqFFOAbARCpkkjir9DzGajznqx8Mif96een2diZxqNjAqwttFbzwa6lkrNvKDMvk
	 czT5OvmWUYODmOkUMy4Q3ror33Mdc7qSPHnUR33gfbhGvllbXvOMwwjwc/RVsGdHwQwji
	 WyVsDrVa8ZsMVuv/we+kfsuFZcezrX02kV7CUJPzCgbi0wuW2y7nU8GwX1u+pWBDP1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RIP/CT5c";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E4B606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27E4B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ewpyY2E1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RIP/CT5c
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2D2764095
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=; b=ewpyY2E1UyI/b6Um
	nsb7nQHTdaVRCIhUELeds7G5Dd64qm/SDFp0ssoMM76QMWyvOoYdwXS/bO0Ls6eT
	SreOaoeRVu9R2L/3/OXoM1jKEBuPUVwie5rNsvrsdsdUTQ2EljUzzXK4EVf2r9AF
	l+pEAnJe7ReIrnkExkLQjIZV4nL+oGtkuf6j2vmLaTG3zeLLfj0ddUIwMUbCCm+a
	b8+0tW4yJ5b1Db0CI3j5M3W+1tyJ0tXHY9u8ZwaqJZcMDPp58ZiEht3kQ9NFqt8L
	zsVyjdVPI8LKoJtkHL/7zHnM8m1fT20MyjAnmeW/L58YrrX4lBwONiMf1mQT9JeZ
	gVqWuQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb9et1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:02:48 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9995cea88so5040485ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981768; x=1795586568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=RIP/CT5ctsHrKe9X97iMSdBLkUuGzK0e6JVdqYKvuo7cyYUA1+zrfhSYBi3WvkKPVS
         TBcAFgtpiVvtOA7eXRa4tbw0k4++W1A2IKmWIw94pO6rW/67oAPVQvK64CqBsNAq9hxk
         De11c3c2oD9YOCi2G51hxND/bJ3eI8XgMex1rNSesfgSQv5hgbNvy0lWy1zsQsXVfQNo
         4C0FeUTWPU7Ucacbr8IoFg13nPhU6rhueyXt2NuWrsTZmGr4bOwKoZIA4L1OgL7SXPtL
         0sHtvXa8V8bLE0h5d59sLWNuRwd+Jhysvbaza8hsDVuwAlpAAQ1dRgOPjP7n4vcqODtU
         qN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981768; x=1795586568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HDwqGMbeFjyw2odEtLjGle7HGlcLyennWwvvfumg0Q=;
        b=e9TUv+BKpXg5wNTDgHR4lvzkgXbBQWt00CvBHTZnJgNAhzyMQnJoG4rKNowQR181hH
         r9DAXdo8EFq7A7ZS8HPUe0lT0HJ3FboYzSvxzEgRJAmNS2Ojd0MOyX031NgESjd07dvh
         h+7FqNZiM33WEzSdEwYcSvADPrS2MnIvxgBiETx12HDrsdmmIoH3+Ry8pFCoRC8hwtWF
         EPHrSkLLaaWdNhcPBMSPO/I+tGSUEGWeo3I6UafhEGql1m939nsm0ab85qdU5dXt4WI0
         pey0uzSe59RwJDxfhFZ4zC7PdLhzzeG5iHmxVmb6V98gWQVHn0TqK7tnGAR/YnG9Q69T
         dgmg==
X-Forwarded-Encrypted: i=1; AL+hErGxqtjtxBG6imvCZPtssrAcypFDKxYTJUo6geWxWFbgf5yg/U/cqLBOFBZfygRuKWkJqTonm9H50zLV@vger.kernel.org
X-Gm-Message-State: APuU4Z/dghMl+au/zVOKvwnbsMdDDlwZm/3Ua0eFdpaQCir38iCXuobk
	1TACOnpJxgwYj1oFmCZgpKKTCZyf1yk61ZIXoBgIg7cSuEBD7t0VsTjhrgO7hgASRvT7K9Opx1v
	vrhPRodLVXg5SzcnwQqPKw01KF6gqGUEHMbQtSHnZLGO0H78kvuWfP60U9kwSvK7g
X-Gm-Gg: AZFdTZdmSudT06OCDfvtXPog3C+lFNaFKJF5qJxDJFjMktkSWItHimNSif+s7iHK1m0
	FJjSmWGaVhuH5c7YPdUnnGsXkDz6E3JzkwhUwEI5SnB4n4rz9NNufRPjC9o0d2ST4x3c/OGDlrZ
	3os4D/B8r0cZaWwW7JcSBzbPSZh07mpVJ2f0qT5ua2w5QJSXH29hnzV0A8W2PhiFppLfVerpd84
	G2VYt7pipg3FNe3kVzbIUIB8+yYJUEQwspCiT5NL4L5mvZeSiamUcE0Ne83V5mA1g6RFpGT6qpo
	JfvX4HsC29BPoPG4mh7xCjwsARb4TOR7tT6BDF4ZC58GuAUtaEvMXIEozxSXT+CcdPFfWJnbPIy
	MTR4G+fYNqVC/HDi4yIlDn/wAKYvTbIRlzfIWsP5jXqphXpVVD81s8AOqPEh1HR/uZrjHEMq+aA
	==
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055815ad.15.1794981767708;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
X-Received: by 2002:a17:903:2287:b0:2ef:d79b:680f with SMTP id d9443c01a7336-2eff72f100bmr17055495ad.15.1794981767250;
        Tue, 17 Nov 2026 22:02:47 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:46 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:32 +0530
Subject: [PATCH 01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-1-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8ovbxSP1QuxIbGjXJ79BVC7Q9D979Gra
X-Proofpoint-ORIG-GUID: 8ovbxSP1QuxIbGjXJ79BVC7Q9D979Gra
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd3f88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=trGgOxTnYlniadtl7JMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXxmIum6LMTHTK
 jA9R4jrVOCTmfTxn5GBoU7a9OCU3GlBKWhRGu/DrsanJWWPzuNflbb2bgt9OTsgGYXfb9m8WLdp
 r1JfMBfhOYAZafiPscPv+LPm/Vktu+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2Fga9qMD/syE
 dJs7XX5bYhQJ2A5TkRbwK0KjCc2YIL7PSRuZL/6Xkeojk4hB4NEYsuCYJjjCT43RHQhzSVlz5lh
 Mg42lHk1tSwv6neevMGQgwAPWQ4FZH03FM3hqOJ/xzweRcwaDjTIz5bVcBPiQxoiYuY/Op+rGL1
 AbnpbGW+oWCIn1O4t2MVSmZ+CKBHeVEvP7+wKPlgwhsHtwkRIHe+tc/ejsXiblPMDHJ0PtNHOxB
 aIY+IVU3UHgp9eaO+SIGLUY1JPk0M+SImCCqAfymxzHn5Th76gsZd0F+Z1KmHqG6iaMXsC2kuJC
 K0LqV2rdOUZEpEBCZy8Z6/V4jYxwxIq4NxM+A2TTRbW4Ol05xvf4fqQoNvP0IQnXoUs/pt/Wuz4
 emqCqZgbDQ81exsOun7DTJmKsCA96/p4oUAjdk98q/C3XBoS8M+bCgb2iwlPsk52zDxZx+eJf9A
 Y3PjYDQ+s6Doweh++hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS8300 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio32.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
index 489b41dcc17932ded89d8e0fad0e284e516a6042..3d499516767a4aaca5224b3a4a901ed2a90b3c8e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs8300-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, emac0_mcg0, emac0_mcg1,
                 emac0_mcg2, emac0_mcg3, emac0_mdc, emac0_mdio, emac0_ptp_aux,
                 emac0_ptp_pps, gcc_gp1, gcc_gp2, gcc_gp3, gcc_gp4, gcc_gp5,
-                gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
+                gp_mn, gpio, hs0_mi2s, hs1_mi2s, hs2_mi2s, ibi_i3c, jitter_bist,
                 mdp0_vsync0, mdp0_vsync1, mdp0_vsync3, mdp0_vsync6, mdp0_vsync7,
                 mdp_vsync, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
                 mi2s2_data0, mi2s2_data1, mi2s2_sck, mi2s2_ws, mi2s_mclk0,

-- 
2.34.1

