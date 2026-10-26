Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014200;
	b=ZkuFE/HM6fTCFNFJy7lCSpMioIoEB0dIE5ekx4NgqNvl7whBpZLOXw6ygMQnzV2cwOut
	 B+9ReNNML3kwBmBDae3+PJ4YegVanisXHVBPXiV54LHMD7CdYhokVPV3nUuwTy+ydEHP9
	 v6TcqHTRUv6rRTI4/i8Hj7X8Ho3j06sAelZDiW3ae+Dv5dMt0sELyioaBAfaMfD2UnoCI
	 AEnH3rG3NCjQhlQCRO6aBcatQMFuCIQ25pVLaSTIw437bR641xXR6gGQfk2TEjtvDuYws
	 YnXtFJdL1J+jRc7YARCA1IDf2/DdT0Eyt2XDAdbIt8wmsqO1Q7tVjSc/uwZEqTXMrsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
	b=dYTxdODwavxxu8TI0jK2CfmfLPs8pvaMEjN0qsnxhCXHFjCgPCxiAhjHY/1Fbvluaom6
	 b7R8mh+GS3rCuzunwN+6Xbe/O6TsdUtBQ3BmKEV9ErSI9vmY0GbW/GsGpjF+AL0ZHohRp
	 755wLSGqKrc+sVSJjNhnNyEieGBcSp4YUXSobuxteP9mPG6QDhRRqqs2/6VQpSFJ4QF57
	 PN50skjuH8iv9p8XVP5wP2XhioX6Ntof4fAcSO7RvbkScl4lu9KR/9vNUMjIuIsixYy8W
	 KydUZjckcqchKmGEsobhJoeAG6HOLIosHrMX7YxjCwbYseokcZ8AFsjQ0l/Ha3+6yFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ov+GCi7x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZMoi31A;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F45A606A33A
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F45A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ov+GCi7x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UZMoi31A
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt5BI3562900
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=; b=ov+GCi7xKRd1I+Ri
	qOWyUO4k/s7FTg8ltD/EBkUtEUyOLqARivYn/syb03lEcSoPZq1RZq7egxrpPmQw
	5pa+pCMQaK+Bzyq6RUcPvCMN9ztlg+apmtkDmQeAChqKZYBsyAYIk1A4F4CYyP18
	t1VLapeJCnzxxa1BpVpe/ZHQ4NO4kJ8Vd+j4+ZKXc6YNtwSC5Q8du+WFBdLsz+Se
	MpAKVlwswpPPnKGB6TXf7M8lOFpJYx8w7lsor5ziMmE1H616MJem/tVgCGpq6uPb
	b9I5yw/ofHr8epUT/tbdK0wZbDRdVaT0XS80kNgOFmx4W2bnzXqDl+da0XCiq7aC
	4MOCSA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90b58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:29:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac0ae43900so2896976a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014198; x=1793618998; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
        b=UZMoi31A/E0lO4BOSjiu1c3mlFzL3ftR1fmozKnM1XzxsyBEYek7pbT4jR/gAnO10b
         7H++KCMdPhpYbZ0wItf4aMRnx2UodJA/PRqOzFlrwa4H/p8dlSgudcOwQ6ZoAr2o4Bzr
         Ff8hCE5AY7178akXxFkPKvyoTymBiJT6+1SpykJoD4BnvSiUlYHVAcWv2kCBZiy4rYys
         M3RabDJzpA9TYRssoh/Ncv7zUT8NwFFHEl86XYa3bR34Vc8hcDMNZzn+E1H47jcPByGh
         Q0sJotIbfbVVoC8T6Mgr63H2/HU0CMBaSxtDpHfd0gOeWTCQM12DRmaurxptJy0/pl9D
         FW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014198; x=1793618998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+hi2NlDZX5Pao7C4sGve2f68JIj+9H2GCXxUBBJ1EM=;
        b=ytbfYfk0BRkeoyO9I4pMnRjqyInGd1Ii3GPnucefm2yFimlnzrt4v2kbErnUQazCth
         sipkJ/ubecCQHNx3PjH7IxpmBGg8qTqMrjIvOSHXeHkOzi6NbFRGHzSwmVsdDZz4ULva
         9sn0xv4P27yHzBhv8SNVHj4flvmVinyHXGXxOVA3lxYkd73lpemPpib2/iOboB1AjQLM
         v5M5gt4b5d9RHzMf/KQjmzWm806vuds15qCFX+W0OEafJu6sThP35UzV6LS16SLw0GtZ
         APoi/ViVNp7PAAxxpZGXwjBeN0UlT8EbeEa88N/TMvXZ0QUAQ/5Qm8fedENujgNkj85j
         gZFA==
X-Forwarded-Encrypted: i=1; AKwUvBzhhxGE9aSsXiQDFPNhTtXFA00DeZoJKVA9ARt5nWz5YRqgemfZAMms/+9P4vvnxeXtJUxX4irPi+3Y@vger.kernel.org
X-Gm-Message-State: AFq9FYL/o8Mug4SSWA1tM+qfqMLVMMqqGNDA7UTR3I2Ypr4fNQK5fZui
	YJizSbCo5ZdPwTVVfeS+OO77Aayb872nCIbYv6t0iMBEZPZs5g3H07Fmm/8k9zhBxDTGpjygQEu
	DCKU9Mh5bYrDLKYzTV22r5+EpCtx2p0G4iRlmGCQiIrg6aTgLajXdUxlUwBl2I/n3flUVEeDL
X-Gm-Gg: AYBFou32SCiODctshXMicbkaCACllHrn+uc39KqLV4Ph7RvHvrrwzNmlrbjDuI/OQZ+
	cPiIjDPeperi0+Qtax2klqvm3F/nsubhvR7W9yZKo90+4IfW138PJvMC5a9pmvZgrMRAj0kJY08
	noFHDnGKMw4FBnM9Vn0PY8gHGY49vM9qyL98yFjYtFzT/nuBvjUgn+0fl8kyp/KGGq3bLpYG4fF
	jv0z2OkG00lGn+mJNWiam54pVzXkuwqH5GDj+7yA5iMOpi6tGnEz9kRg3SSdSQH4DA7NH2HG384
	2rb5tdI4G5iSUOXyrPRKbl9kmkFJXQLjFMEzhq5m2qF0LThv8cX/jGS7wW/ypJAhECu0xovaSSa
	7kO8iZqtfU3yaeoXCGda+dOU=
X-Received: by 2002:a17:90b:3c8a:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ade9b2c4a0mr5122120a91.6.1793014198025;
        Mon, 26 Oct 2026 04:29:58 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8a:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3ade9b2c4a0mr5122090a91.6.1793014197529;
        Mon, 26 Oct 2026 04:29:57 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:29:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:28 +0530
Subject: [PATCH v2 02/12] dt-bindings: clock: qcom: Add PDM XO4 divider
 clock IDs
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-2-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX86blxiQQSxW5
 mq6/3yT0vhx43dy6qNl4IDvMTV4qBmrPkaSkqG1oidTFmGT11SPUhAClt/2QGILNJZco+MtmO14
 /4sALhuMxjlbTgHb+VOyXphZU385z10NgxSOQYe/2CvrW4cifMLhHPVypViwcSxjTqCaxYbqYj7
 TEI9B+WV3Th76tn3weoTmxrHPJQf7RrS1Z+vZwHOYBMGCWbHURTLFIan+YrAO/Soah2LuY6h8dE
 +jx/hQwLNLeyiLcTt/4lFf4WUhw27EHPgMYu9zDq8j7St1ogCM2RnKY0NiFbdp5IY8KvQpcuOgV
 QFmBw7fXL7C54ZBU1CcTC+IRmKBDOsNzoeRqd7fF2tXhgRhBNz6Egdu2SWMW80acKe/WeMleDp0
 onhd+TOf3rv4j+u4Ls3Ivf6OHUGs7BxmWzjChKtJoFF4SobSsnP5wEmk36uHKCgDcLBRD9pEC8G
 no+U8GGCBCio/rAPMcQ==
X-Proofpoint-ORIG-GUID: B-t8YxtLzn8ONFVre8r16f3iBUz88mE8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXyP/SEybErlW2
 +0nifYDSrfsCnokYHX3P8pnW8skmahKvjnnI/NQWKkoQR7qsnWMF1P+RM1KP3mG8nn+slICIiAH
 xCMYcw5c2B+mn/o8WJqRHz94y4nlH8s=
X-Proofpoint-GUID: B-t8YxtLzn8ONFVre8r16f3iBUz88mE8
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf39b7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JzXKva1iMknIiGK8KiYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add clock IDs for the PDM XO4 divider sources on QCS615, QCS8300,
SA8775P, and SC7280. The corresponding GCC drivers use these IDs to
register the divider clocks.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,gcc-sc7280.h  | 1 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h  | 2 ++
 include/dt-bindings/clock/qcom,qcs8300-gcc.h | 1 +
 include/dt-bindings/clock/qcom,sa8775p-gcc.h | 1 +
 4 files changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7280.h b/include/dt-bindings/clock/qcom,gcc-sc7280.h
index 3d5724b79bff18a858bdbb5c1654c5174e8cb23b..68dfd6616ce4b1c1e41f11603be639685301129f 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7280.h
@@ -192,6 +192,7 @@
 #define GCC_WPSS_RSCP_CLK				182
 #define GCC_EDP_CLKREF_EN				183
 #define GCC_SEC_CTRL_CLK_SRC				184
+#define GCC_PDM_XO4_DIV_CLK_SRC				185
 
 /* GCC power domains */
 #define GCC_PCIE_0_GDSC					0
diff --git a/include/dt-bindings/clock/qcom,qcs615-gcc.h b/include/dt-bindings/clock/qcom,qcs615-gcc.h
index 9704091636b87108a2a8c5ccc4a6b293829d8272..cddf21466a96a2990f1aaaf7c655fa6a4369ccbd 100644
--- a/include/dt-bindings/clock/qcom,qcs615-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs615-gcc.h
@@ -175,6 +175,8 @@
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				165
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			166
 
+#define GCC_PDM_XO4_DIV_CLK_SRC					167
+
 /* GCC Resets */
 #define GCC_EMAC_BCR                                            0
 #define GCC_QUSB2PHY_PRIM_BCR                                   1
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gcc.h b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
index 3c674c7baaba91815b13450e647b41053bd7330d..cee26f50092044f4a0b4cead6f669f0ccf7343c0 100644
--- a/include/dt-bindings/clock/qcom,qcs8300-gcc.h
+++ b/include/dt-bindings/clock/qcom,qcs8300-gcc.h
@@ -196,6 +196,7 @@
 #define GCC_TSCSS_CNTR_CLK_SRC					186
 #define GCC_TSCSS_ETU_CLK					187
 #define GCC_TSCSS_GLOBAL_CNTR_CLK				188
+#define GCC_PDM_XO4_DIV_CLK_SRC				189
 
 /* GCC power domains */
 #define GCC_EMAC0_GDSC						0
diff --git a/include/dt-bindings/clock/qcom,sa8775p-gcc.h b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
index 01f54234963d6a531926103f8658307d4e0662f2..e101c9b565d650495e63f5f97b3458375d0e85ec 100644
--- a/include/dt-bindings/clock/qcom,sa8775p-gcc.h
+++ b/include/dt-bindings/clock/qcom,sa8775p-gcc.h
@@ -257,6 +257,7 @@
 #define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK			246
 #define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK			247
 #define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK		248
+#define GCC_PDM_XO4_DIV_CLK_SRC				249
 
 /* GCC resets */
 #define GCC_CAMERA_BCR					0

-- 
2.34.1

