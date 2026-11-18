Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981808;
	b=m3rqF4kBiHGMU6phKPL+Ngv8dHeCI5DqotSMXJqYEHNdPobjl7ZQr1aZkFEbxptDRf/m
	 1CjZb/nSBHrXy5lCExSHt2PtaKgP7Ua0Fyu3NuFt+hwYart6tGycCePWYYTGeuUS4QdTH
	 LNbzbz2dYlmIBH98UTPnVSpOx7rXJZRlyFRFOFx8If+7Umo4sbpYdz1QP8bapBDA2Aduc
	 ghyjIJtHHiHDlgVlQiGJfL7xlTWdzh59pmVvgVU16Lbrsot5xiqBNTRvlDlPXuP3NulXQ
	 9U7YwTFAEfIYm/sfOKtbtzPS25kEt/40aNPz1jr+Wwt3tzTQYIYbdl/LZ4a/CuTH6yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
	b=PyrKd9pBTrsvcdHfhU5AGkDmZBVjJ8LiKnX50H1Y5Hq3ktH6dPcWP8xT9scoUYhSGEM0
	 ndiGCUI0khQaqbVRY+JfbAXWRg+aY/+N6zfCslMO3M4Zd9mXwL7E8A5GEb7dl3rCHgEBG
	 Zg+qUUsbtx2wcidJ3RVsTFJcJd4Wjt7UG+e2kCRCnJWrjjHJ4Z/mfHXdG9SV9UYktZS97
	 EpENyYBpczXtHlVAPha6fAcRV/Z0wNDeB9ZicWcyf6hHcqFs8lmE8EeJ2f8W069jtOyyL
	 hNiTLkJL9Fd7kZNzkVnvb0F0W6seSgaccQtnTIgrDsjAfOkQDrsXzto6O+6JsHbOFNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="csZl1/Gq";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B38606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B38606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csZl1/Gq;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IAC7bR6V
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VvXD4059972
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=; b=csZl1/GqXiGYJtqZ
	syMkGj47N0vft8Hrr+hCCoFG9J/uxuOFskOzYjZvPI25u5DeStP0ATnZuNBnDcM8
	9wf69nulRESftniW3cHL3S8AAGY+AW4EYNsl2HDrdpHtSZJEqgtu5rGdDuSbTXzB
	AUdFPnbo0eYrckieoLXSEL9mDas9wvJX0VeEn6g4qT39kNVdQckTdx0RAbk+zLGU
	AG3lOs+gkv8rrEAanHadB6FrWR0PUuePlDq/PhYg2MHVJjANKyO6oq71C4GGjSM3
	I/X+QNUB8B8RfgHNuhmG5Qqn6wqnc1nMZchi3YczfZTHgfpaMUHAJm5Rpo4QQ4RE
	fHSrRg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchg44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:26 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so348989a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981805; x=1795586605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=IAC7bR6Vi54NOfuF6rqZ6fSn75EagmUuGa3DZwPN0BlIujuBzmxM10Jq03WP18mBeQ
         1RXxGM/mfpZP4+y80vC0rXARIZvqPgN6t+0rkh0inXfejDdhS8fOGtQ6wiGYTgKI6Di6
         aJY/9t9HAbt2YsA4UfSzl/Ec4MY61hsZwbr4JyEzizectpalsaVGQqafeEtk6uMOaEuH
         0eRzyLhxzR2VKIOqPe4IrnyARCgelKntoTH0BMWxGZ4yiM9/zdBeGZKwHjeDbgAGrVhW
         lmKxVw234KXn6DgjS1ZliWxJHaDzWaLNd2+XKDxbkDKOP7qS7Ck76H85/zgK/kB9RAhC
         QGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981805; x=1795586605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcq6Yk1TfnlDEBHf00jtWdtH+xxPxFHHxDQe3rqWEE=;
        b=P+MhTAU7ol8gTHV4EHywm8MnfU18LRiUaPVM8gFOiT+Vu4/ZTtjKXa9YJ197TLW9dF
         L0D3sHwe0wO8E/AtV0b04frEumuPYtCRU16CE9VRPBgT7nlQUF6T3WD0QCgMMYF/Czbo
         z76hLMzqgPucbypeHwKEkNyFfbIrB0Y2NmofZJQBx4K8qFr79Mpc7Vx1MoIoLCn9ak8i
         9IMkU/KT/iNExJ1XxKonIh8kZr6d2yFGfW1komMd2GCnYJ/tXIUt86/6nt1hpFJJOriP
         N4K0CnAExsHcndyBE5B/WH7yyIJq7smUEakehLaKjL6XT2YfIguf2VVOXsmymDscGJNB
         WXAQ==
X-Forwarded-Encrypted: i=1; AL+hErH4lgSW1mHdA6Gp8nI4s7NrdSgCKvO4KgZF3gLl2NkIubcAnl0Tkzrvc0OQcLooWthD9i549shW4eP4@vger.kernel.org
X-Gm-Message-State: APuU4Z9yS9c5O5aykEupTPr8Mw0mx7+5OC6PIANM0XbuQbC5gyhenjio
	9tVK8N3HMkKO5r9mYerbV9UGtnr2+PMEAJp4jnnIvNMhcvtMOaV1KHZvykQBZgEqIGXe3Q6ch+9
	CzUauXhBALpRtfqAm01VxsLw1WXz8PddXQxMGxe1zx5ER7ZqxgU0dB5CzyZ/L1BmD
X-Gm-Gg: AZFdTZdajp522IqhkSpYPDOl0t2JcgKDQgo9/YtPSukCbiFNattJ2DhgUOpRTT56/Wd
	F3Ju/JFOUpaufBA3sYYla8FWkAKguoYX6EnEfA9D8/fPAM+rpIWG/Pn9AD6hcwUIIND2GVFpsQg
	L74t14fidJGFPEj2g+t1zdKTM5sjiJm/y7A1RCUJFxuoyiJhAEsZinHw0TOryOxu+hgxJAI2ymD
	FnFRepvj9zsp7g18pLsZMiRPxoty6h1nWC3bdMT41hP8PcK0wtjelbp6fNTGSJhXV0VkGC4PlC/
	8uuiB9wzIGrWYE7SPIadGazUk/T4oa9E02UG4oA3zRrgXNEfbRnYp/JYVjJO2RvIiQP090dHGRK
	htkI8nweXOW7AeXwFCTroCB08QY9AULYvCA7PqaWv4itptF1snEu0ntuS2mJQ65s+/+2FGuEA5A
	==
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14868265ad.49.1794981805106;
        Tue, 17 Nov 2026 22:03:25 -0800 (PST)
X-Received: by 2002:a17:902:ceca:b0:2e3:1bb4:6121 with SMTP id d9443c01a7336-2eff7541959mr14867995ad.49.1794981804661;
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:24 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:38 +0530
Subject: [PATCH 07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-7-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd3fae cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=5Of8VGKfJeO1p_vZ4b0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: jobC4kaLRPYMV_WD9zwSvFiG38Y_m31I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX821jb+EvCHCx
 fpgNo9Uhfo83ajOoRV6+CWcdBb+fnUX78jEhdfneLti/4MfdFUX32Fyhw9+UZHWZcnnKw7nkMVt
 Vfp5FRp5gA9MT668rlhTGQopCvwwDYY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX7EyaXMzKDsxY
 3vxJrF1+fYf1qFSFOooxiNXl2tclNVKtVGcq3fqzn/NRXVBs97f2OAAX7Ji8am5rALl8D/kYiJY
 IhTi7kAYALevH3JNtKM2r6as9u25EdSX/+xG50pbSWhQ6yIrGJPQ60NUvcU1tm1Q2aABNU1G6R6
 kgG161ULG6GrFbGsT3QLdFBDn7vuSYLpnqzGNafNWh/aPuHJ0G4v7gsepm9AJNcOlCg0p43a2dG
 6rMaqPS8GoySJkLlK1ZG0MuYnZmbtmJle7mpnhg68lcsXHRp8ZTIRCeGX3oYw8ZL0/t0schkri/
 EdsJE2uGUGUV4OqmzHy4qSI2MkYshZivVYtxHEAk7uzOxkuCiJd1eOdkWtZFeqYvsrrzd29F/dP
 Luolku2JtJ8brMQwu8M8wpfyN6xepMI7JLoMxxLA+tN3E5wqXCHMhc+1atiw/AyP5JUnULHsWdL
 /vG1LPAJDbq34iKQsyw==
X-Proofpoint-ORIG-GUID: jobC4kaLRPYMV_WD9zwSvFiG38Y_m31I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the QCS615 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
index 2791e578c1ded3fc1b839c59fa1d8c90df4d837e..768f8196032e01979df6ed39c2036c2aebdf3905 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml
@@ -78,7 +78,7 @@ $defs:
                 atest_usb, cam_mclk, cci_async, cci_i2c, cci_timer, copy_gp,
                 copy_phase, cri_trng, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot,
                 edp_hot, edp_lcd, emac_gcc, emac_phy_intr, forced_usb, gcc_gp,
-                gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
+                gp_mn, gp_pdm, gps_tx, hs0_mi2s, hs1_mi2s, jitter_bist, ldo_en,
                 ldo_update, m_voc, mclk1, mclk2, mdp_vsync, mdp_vsync0_out,
                 mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync4_out,
                 mdp_vsync5_out, mi2s_1, mss_lte, nav_pps_in, nav_pps_out,

-- 
2.34.1

