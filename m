Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981857;
	b=dbo/zpYOg9xIZ9+4EdPDlLALUab0wrA/i7wDiwztFS5L3n4JMaI64UleAYP5uE1DDYR8
	 irGg6/ZhS94p0SZaLgNC18+7xFJUKU9Wn5/tqUEnHNGc4vKNbE7HyAknt4Y3gA8mEJ245
	 fH8UkmtFfMHSmxiikT4VFk7oXpHe+0FgFZiNseRBdZ6ZVX5wPQhHvlDdBmnfWRBMCOnRc
	 RCqajLuywIsah1SSODtvmOjEiXTplq4tWgNuZ6Jx4US1+7a/sFsNaFI6SxwkSIO1FrC6v
	 hP0Od2u20iFuQHu4veq/4iAx7kp98OQQc/+8fIfgz37nCpiegnLkNpJwoflGF+zBCWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981857;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
	b=FGeKRjVZhepKWyhql5BAfWtAmQg4wRwZ8bZAaBYc5k5uxjOIa5ZCVI4GhCJT/XxRXbvI
	 E2VJqaYFWqmdYTRJe2zzzmgSsWY9QzAT0efDr2qRyLn8YzR3sXpPgRjD+BjPk9cNlLr7x
	 VNtzxtJXM/TX4VDj3Rve9BnrcG0bVpdb5pum3qaYdsSkMROG0y3rrsZE8TsMRDfqvYjpm
	 vVe6sPyTKbR9ew0JsA3GSixGfo2Rr2va3ASI7cFMKOMiGwC1k914fQ5qz7nH4GFBDh7yD
	 Lu5Ta6NN2ZUpfSsP6XBvtenFnR1/6mO+kf1gy8xsVuJvlOkculoGO2SUQl804y8Xssw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E063606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E063606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aIBxJlhB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WJADAJ6o
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2nq2106344
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=; b=aIBxJlhBUfMCdaV6
	jD8F9K0/I+x6B19Hzu4zrUUf7D9lennCZygcKOdXpbPaqYe4SdJsJtgURwwevFQL
	kAvVDvFZKFEtZFZ5tp472eDejH0FE1J+oDew8yfZihjGmtZj4o1SUKvXDd9NPm6K
	d5KtqrLsZcNAqg4yorxsagrzndxBKybpSiw83F2stPUR90/pwLvxBTCKkcSoY0s0
	rJR3B6yMTHgi9MG9wJ0Eu0eX984DW0mx15+T0FNJY1qDhH1mD/iXcMaMoN95uwcT
	ig5kkY6zAlMbTNwsY1DsnrWN1qchn5n6YF8DUMZdenfO7lxuDhHNnBuvunGLp8dh
	4y6zMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sech-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efda2c6605so3998365ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981854; x=1795586654; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=WJADAJ6oMzy0/U9oV6a5LodDvgwvaykgFSTFK9y85pZovcLAScxNihkrIOP6m6Mc/j
         obZZyY60bfJY7Ulb1Hge2IuGY7Pv8WpIOR4CmjPj3BollB3yxZHDuWsLCKoUYRfuxHjf
         4CisZ+dK3/QvWea/hbH6BK5M6TE8QJv/vxzW57fGi17ragUuCS/cUEP2i7UZgfDOuhy5
         bjqUE/bVgaeIchk8R+Q1IIFYMTlr6DStyyxpE9XBx2mfnVaCYg8p6WODU233lgbXkbZ/
         yEjGN1IpXA1O5dIbwt1nhhSKWukNtBX3MGhOvDHxFASGUHIik2uSAwhLSu8n76h0dkTR
         x8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981854; x=1795586654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JmMgwWrlYArqAJiyQP0GZ/j88jfULxmPpmaBoNWMxCE=;
        b=frjUOcP9t95dDRc/gXA6ZPHQcxpAqQp0jyOy9jAR2C8Wxzu0IOLGwpRcCfYRlJuSn0
         58+VPhxeuxktiqorvcBfwL4ne6cw+6d8HZJnJNyLcG8Cwd6Az5P2QUz6ZPerHchOmAEI
         eFVY0HQxoaI3U4/aba6/lEGCOe+0FN0ZyWN9UHy5INBHZsZnVloCtE6C6TXrg3Grzds4
         xWlUAaHqnpsWkDcfrJzcOaP/WvZpMEye5Vz/aHyj/Y1MbQSY2QqOg3tlHjevATAgX7yj
         K4m3Ao9U1Mo/bNiVg47eiF6gsU2PfHfz04NhfUuQRRo8jybR8q3yYEzDzP+wHQDEFBdY
         c8gw==
X-Forwarded-Encrypted: i=1; AL+hErEJLIe0MnVFSIPVNffx8IZULfvWdpTbTkDe0IfBfe/jG4Af/DBxSVP94VRM8JZPk9iGFfok9wGcG3fv@vger.kernel.org
X-Gm-Message-State: APuU4Z9YUURXtD1pRkxO1yvbKrfd6oufm4H+TzTTEIayJENJXSsIOOYJ
	uBRcSiMnTVuBHxyh1lj2lAC8frxRFtyq0kuVgTzf30lHFuYqxhK2A6I4rmMPWeS5NL/Rd4SmOHA
	YgWZ8Mz03QTLInYUVZyOb3IOGJowp4IgljTyN6+D126HsjT+AC8J8Uuue/reSGj+1
X-Gm-Gg: AZFdTZdhmXOhrE9NTnanPy/tCsMRfa58ks2J8a9ahdpI1UBKtAonOIGJFrIppjowTDD
	QJxW5IbdT73TB3WWE5zTQPPFb/qE/hEQ+VSNoIwArPSbtADD4JIsRnatfLDWsAX96Gu93AYTIP+
	jvjaHcA8IXhZgUPj0aHkButcYUlLbapjuc1DD/1WiF+Ht6QafdwnvLI9IJjBJ5vdPfsM/pm3Mxa
	uqDMD3SKWi0sr+ZbsU5FSEjsQfKf5vcrESZg4vUXqvEUtkNNgOvhaY1IRcUzhUGoWzU2zxABlyp
	S6ZVslTOadABSqE3RWd7wsCaxeU1D3NCmb1oyjkst9InJb1WvYMCjiWlkq4i3CB26+fA/EvAvfV
	/luTFs1qIMWiAD6v03o5xc/9BwnIrGYl0bbs0sPs5LS5HDzGYiGA8McBpPlcuXOC8Fz7clGOUrw
	==
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933455ad.63.1794981854143;
        Tue, 17 Nov 2026 22:04:14 -0800 (PST)
X-Received: by 2002:a17:903:9cc:b0:2e8:e17d:c8b8 with SMTP id d9443c01a7336-2eff7557702mr14933295ad.63.1794981853715;
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:13 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:46 +0530
Subject: [PATCH 15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-15-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 9JP1X9PM4Fq8LtcrB1aP-q3X1FQ-zQvz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/NPEWzFbN8qe
 rXoAJTiOnATSN67mAxhflZ8MWxxQtpCYFy2T2fp1ndi0x5UsiRwUUP1ElFWcLdYifcn43asq0UK
 zWmhW9m6i0k3U9m+Iq1k8RifzV+PAXA=
X-Proofpoint-GUID: 9JP1X9PM4Fq8LtcrB1aP-q3X1FQ-zQvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXx7N2p8ASUEhf
 XBxk3DlsM3mjL2TbBY+l6wXWOMj8HCcLE8NC0/vN8v8CjOBT0SW5yxCi0bQg5L6m6Jn3rBQ7tkZ
 Emt6m4qoC0NX+Tlib1ePJp9ENZ3ct/ScbFWF6uJIl/FRzj6dhQwS8OLEttpdoT+iFRU20h3AsrA
 DrW7g/Zi8jNkusIFwjuOO1kaqWP9I+GvvC0Bh1tN6E4tJI9E7nLeJhHDB8/tExdyDB0lENyemkS
 cIVzbCntLAk5aerGNs6n+ySrz9alcWD0iU3MGlpW/gHgJM765TR8Pce2H3EkiAAoxBbkBbb+9AC
 32kZdLIom/8Ga4HQoaBgwJinxvkMFvZwavwCMTZYYYCOfpRCEfZz0m75qf73LUTA2hNB6fG5P6n
 DwI9QHeBA5cg6e1teBR9afDSffUr09Bl/LH9GHEg+FaWe07uTUdlKSeWvyuANI2IUf6tIW160bD
 NPsTCHhvI2Zy5wRsdIg==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fdf cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UWeVNdHasT3lCgRpUHEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Shikra TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio87.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
index 411c402f9044faf36c5a2250795a817fe43dc48d..420d0b5eab1821bc81a74cdbe83a5de480f9ff3e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,shikra-tlmm.yaml
@@ -73,7 +73,7 @@ $defs:
                 cci_i2c1, cci_timer, char_exec, cri_trng, dac_calib,
                 dbg_out_clk, ddr_bist, ddr_pxi, dmic, emac_dll, emac_mcg,
                 emac_phy, emac0_ptp_aux, emac0_ptp_pps, emac1_ptp_aux,
-                emac1_ptp_pps, ext_mclk, gcc_gp, gsm0_tx, i2s0, i2s1,
+                emac1_ptp_pps, ext_mclk, gcc_gp, gp_mn, gsm0_tx, i2s0, i2s1,
                 i2s2, i2s3, jitter_bist, m_voc, mdp_vsync_e, mdp_vsync_out0,
                 mdp_vsync_out1, mdp_vsync_p, mdp_vsync_s, mpm_pwr, mss_lte,
                 nav_gpio, pa_indicator_or, pbs_in, pbs_out, pcie0_clk_req_n,

-- 
2.34.1

