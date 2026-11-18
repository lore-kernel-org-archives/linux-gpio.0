Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981820;
	b=DfNCH6Y7Jy1gd/aiqahh6EDSGD+m2J6qVGOJSvcUf70TY+jvQoRt5HLUqFA8BCchuiny
	 gvjL7byMmyQjgjVYsIi5fcdbHYWBun0Q8qvxBgBVaT2dX7a1t0waocMWnisk3ajG64MHD
	 YjOTUHWV/DpqEndq7omz1KGZhIeI/wCbL+/6Vf8LABWFp9w3f/vGRZ9kd3KdUVCPi8xDn
	 J0lOXV5Qcwua4CNgGFo+gfF0N4AeZf4glPXnP9YYN6p8kgcbQnl/450eCBHDBrqOLGTra
	 Ta5v9AoSAHo71CvK+CPkAiQ1pdNQhXJWMUU2KBm7nXVUSVspyI43LZDoKziQ69LbYDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981820;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
	b=VsV0NtxOrleqFo0Pw/UlKLOmjAKmW/HcXgoXp1mGP5orPYFa1moQmhPTAorVoAjQANE1
	 zUr3AoX6j1YFa9whKcNfgitxauQeaX7ep+t6Zzk63d3HgWzYEEk/w+8Rt/Ivj+4sdY8/3
	 arYsZ1UwhOdWPeAJOxPPQfnjjNe/fKOBGJbc0SsKpMYAc2RJDSEh60iJsRssIkTmDAVQX
	 5QlCylUprfXKuNxxRx4AqgRCmnbDZhYE07xQ1pIWzKVR6WX62XaNwjkt052uBXoIFsDaR
	 +6LBA+boqQfB+QcZ8yXEkqkmh1TYmezd6+7/gucVTk2+Xpu6PVgH65FA20NTkL4c9Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07820606A335
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07820606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NuDaoHK7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CspXak3X
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2VwRo4059979
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=; b=NuDaoHK7zog9vIxW
	6RSCIIUYrVQ9w0Guy+scyNYEUWoAvqvYyaa3I47zVNGoN3OYis0m8UwYRldXpm7b
	EW+9wx1w3poD7MV6FDVMXj3FWBvIEMv7lDhL0cn8NDztX0BjPiCOJ8U55akGmzXr
	btH2xuKlB+jU/znChMJfQURwipywNPs945gnCV/ffYQcIEYO3i0J1YJYUJWdtk2H
	yLj+uBmaJx345p9Id+bPVhDW7rND5Yh2RaCZazoJMzlZQFZ0YM0Mt7GebraLn07G
	1UFnZtKt9GchjCS98J60FOAUH3fRxiUSQFHXL+jcS55tY0yhJjnZqQBFu/1vSvuT
	ujR/SA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvchg5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ed08904845so7980575ad.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981818; x=1795586618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=CspXak3XYuU6eaDrwpVCNIP1TIH/7+vq3VeyXjkGF0Z+68T+VTDgnZIlqw6RP9thA3
         q58dV6916yOoYmUNyxe6B5alk3rXX79Dm5UDCg0rP2lt1RtKIsJ6L5mWRSvGfYGlwkjU
         yMvUDNsLvE5hTIrD3VRJsMP1YSD30Z/2UQMrGLCjyqcfUMjbuXenL0cbfRvWOS7smffE
         D/PSXg7Ov8MNbMQbubkhaUMU2iBJzaJk1flpJ6SbZNmHYZYj8Gii/bHvHSvWTSh9OSC8
         T7D6G2dU8OinZYY69aJ6uIhdK9TGRtf7jBeierZlaFzJfTMj8dQSYs0asjAK+PPrTz7h
         UM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981818; x=1795586618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+NHehLOdOorXiXkkPPxTpe7vXOhZajL6InYMD1tvlIE=;
        b=ZV45POiaLR8ymO8oBI9VWY7GfsO3TfEzr2in0gHlfb+bZKuc8sSuj0bz9fb71rWopC
         MLppg2HTU6+5Jj0i0DPzG4Hh/yIo0TAbM64qXbQ17s4BPkdex8Br6Xx86iqtFW6suiNW
         hjjHZZpP5lzqKmhHdMMytoQtWdfliQV0Y304y7/yQKtIAB2Jc03RS1K7/dqv5C/bzRwb
         GT+HIOiwpipXp12B/vsiwlVj6UxfHn+/byv7WP+01gJ0lC4Yc9f2PC7oceLqQtRf2lN1
         ZtPJnk5h72OJ7rKurwAYpEwWnBR3wcTzeK7f8usvOo+Ociq85Dps5evvMJwQGyNzdG3x
         kMow==
X-Forwarded-Encrypted: i=1; AL+hErGBlgh1LevEmPYAG+QMJFKcYyASUcDFScd2QX1slm/Ely32uatlDzl8AHrDJEgflnszVkmAfoTzpj0G@vger.kernel.org
X-Gm-Message-State: APuU4Z/TXPeNYojqjz+DhbY1SpbLM+DWfNZuuJbW54hGU+oE3AWrxRP6
	y6ba00SCJNUEiLqAeUI8LCdxMDc4ml3rmKH7ikr4gTZ2Ww5Ebyf4K1XC54a9sJihrSeUm5CrYhP
	zZ6TKwENsc+I1QRnwknyOMfq44Gy/+aI4GLUnuIi2VYY3Uy9iEXoAzpsSOkTW4yV3
X-Gm-Gg: AZFdTZfoJmCFa01xkEdLocgwrU4kHMJQqz5OlPvgXP0lz2iqWTKn5jaVi0boiW7S5FR
	TpqGXg3p1gcg1Y5obwtPt8ZrWvrvf8e50IedgZvq04x3JUyDxuyiWkKesY3mptC+DXbJBsAnD2z
	5TzwAYLb0X5tv5AJxlljD4YBgvBkB6ZmPema/PxsisfYX1cOP4RjLCTrVr5co2N5mx/PEhTTlBJ
	PYsKrTy4LNxNB4OiagtyA76P6A38LrmghqEWVRO94BN09YRZ+pTmSRpgSNGJecAlDr+JpBzuPH2
	hUKLP4TvRR2Oxk6r3bmuY0QB5c/nOKtDgC4DOJKKr6tv+OVCtD0iJ61QS4p5DT82Ggi+0h/lAes
	IwmTa0dHfGhxxl2LaGOlLcQQHDbd8OkjJecKuVsOaU1K7VoiobIP7JDuDyzqDz0DRQLTZInSUXA
	==
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948845ad.12.1794981817682;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
X-Received: by 2002:a17:902:dace:b0:2e2:e240:57eb with SMTP id d9443c01a7336-2eff72dda3cmr16948655ad.12.1794981817257;
        Tue, 17 Nov 2026 22:03:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:40 +0530
Subject: [PATCH 09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-9-703f7badd194@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd3fba cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: X_wHNKpxfzzGZv1cjZgXQejaEOJqgoVA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX5omxbR94Cdn9
 h6UVVBHqppFHPjDykq0Xw3PQ/VwNlZeNxoH9M3TKfz4fiU9MNETuDllUjoYMDpsBT7KTKD8mHZV
 N6h1i5/1y3J6l4Npz0FcSZfPuk+vevQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX06a2qdJWXzvv
 KbJ+v5e95AG5/qacSleJwldn5bQ1PXOyg/ANEJTGISqF+GgbmUF+r+iG74PRVntiIMPF7xANQ/9
 /qAEKVsVc1GTKqU7C+DIURIDrQljwYi8LhICUH7Z1XPJhs/N72DQLT4dVEknUYuZb8hx+N/Tqga
 D7ywXfBPvT+oCjykckyZj4QYko64/LnsARz0z8KmUfYU+DhQfiAwjF0lMcWFoKbT8adb5+84d5L
 0oHaF92QLngEopF4HoFK7j+ibcYcn2VG9rqq2GRpCHvDgwbaCEAwKXe0JKqwwnDI6hLcTxBaLHJ
 RtG5fKujpjhf0YHecvq+DUzeulnQW3jQWDAATGsISFjc5JqxcAqf0x0/5OdmZSBuaF0cxOvLhvu
 sipB1/2+0JW3Ne0gzryoqSJ8sWO91W1JxNKW01MMPztk7ac7TvvrtL/EaMtkVLTmIYEGB3CXztV
 FR01UDj4Xb0ByOZBRyw==
X-Proofpoint-ORIG-GUID: X_wHNKpxfzzGZv1cjZgXQejaEOJqgoVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SM8750 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
index 7aecc97745a8cdffe70720dd2f1f3391ff979ce2..1af098d45c54b99871e81e6576b516ffd0374fcd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8750-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,

-- 
2.34.1

