Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261B26056C
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788058956; cv=none; b=aExGXdCFQxySgHQhQR8RvulBSwsaiSbvNR8MNwxrUXqwsrwtiunF4C86QxEaDl2vTmWsRNAEIqwLsilFRSoRR81g3DiUwDQTGqgVncGBslgxd5T42+kk9BAP4TL2JXyQVPNi+eYpwv0XhaRYCPZeG4ZH/otdu9WV34ycmQU14xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788058956; c=relaxed/simple;
	bh=moqTSGv5ENKB5c0/Y4DGniSwhWkDVvYVa6wj3DK41ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KB9V6h5NC7EbytbwfgKhrDpgSU7FODpFQoG+UthT0YelX9PiBlhPD7p+N4ycyJaoQzNzV+e6JX6497UXGf8c4buHTFOMK8XnR31DyJuxaz1wH1PYFlggZigccDZHj7BnAf0jWUjYuGg+xC6RL7075+3AqOLa0b1vvHJwNA0FiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C07O4Oj4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X38j7jNC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C07O4Oj4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X38j7jNC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U2Rqii3678511
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 03:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s1c25Lyhl5gqP4AaTKFM7nn3FOFd5aFvBEs
	hY/ARIuA=; b=C07O4Oj4Q1S5lSqvQrd62n/dLGWGm/E3zM2dAvcXcQIL6a23iwK
	3AjBfiDKXH3Qm3UtVkZvVXpi/LKZGYNdycEylHLAmryWVg7QDD5rjcomKc40EcGR
	XCfXWljKgA68PRhjpfP+zyS44jXztkCEizYqVdT7WvZxHmrS0nHDz3Z3TPKyTc/z
	71TFHk8K6QNt3M3UzME3zsT+JF9F7LInFJNIj67wk6ycfMKaaNk2vk1yAC6aXrpr
	eLkWKDL8PgmRdRvy8rrQEP9aZIyd8VKNRReaMfbjzJbJgMxVf5xB+dWHWcdYa0em
	2dz7yMAF5NdScaVzliJIDZZ4t9BZTGz2qnQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqgyj90j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sun, 30 Aug 2026 03:02:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3018455a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 29 Aug 2026 20:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788058945; x=1788663745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s1c25Lyhl5gqP4AaTKFM7nn3FOFd5aFvBEshY/ARIuA=;
        b=X38j7jNCuu956sXEzD+AZFY11Fc58+u9EdBFZo2GFMXSQhXWC56myj+rccXSF8zEm/
         RyUn7BEXESJKVBE+aUhewkwzqF1SoUB77ZfOGuKnaEWcnuO2EbdYn9/DeisMe2OlqHft
         2/5gk8yrYX2G8FYa9+c7fBCD9golJRvoCUHyNeZGw98EQlx4flI9z6uKKm0EHsF9U8CX
         iIJ9dZTitTeu/CgAMOQsHLmDp9MDUh0zbar+NevafhhL46iwhq9hqhHmjmRUFhqgknCp
         EMZHobhrJzLQ8/k48iwHt5F3DZRS7CCO5YKZMbiMgSnIUk/G1Dcr+gjWIJONL3EemUGT
         9FfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788058945; x=1788663745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s1c25Lyhl5gqP4AaTKFM7nn3FOFd5aFvBEshY/ARIuA=;
        b=Ef0u5tLBfd9KsgmhKx4wS5ZN7+RYKIX+70DDV8uQSOWFIgbHRd0ZcovEOY/qn52CI/
         Y/axUy9l1kPcmTPBK40H/hbNY3uZd6T/G3oZ2z7jTSGGTpyFnDHKPbOkV8NQRUZzc3yz
         UWAwVR1GpsvudZHQeBc5eUqkrtgtQYbXkUhwn+wEgH6PRP4RSLGbNCLqpkV2JOhaZE6u
         M05gqhmU8BXPTIyHmCHhZkbDItjoNgZN+b6UPFU6OUlLeoP4cRkzeqlMSKfPsRPX9Wkc
         wXlqiZjuvGt7CVkx1A+TzfRyRgP+7T4eiWfU0YrfqL7vfy5u3KMTBw5W5WZcWe2vJ41J
         lSag==
X-Forwarded-Encrypted: i=1; AKwUvBzFY8B43z3iQ0ZvisFemOXJKNtF4i+aQe7DusbNFy/zykFfaQ2wnU8ZPde/Sc32GkLZ45kXVSx/q7dD@vger.kernel.org
X-Gm-Message-State: AFuF++maheNX5a7unYunQyMCHf0LAdfmK5XgefQoalP5SgeGsvWvWL3r
	7RWeRVxfefhYJqnUvzdiC6zV6mcZrtqz/sg8+x4x0v+TSvC7E2yxmGNhrUFhcc4CA59TU2asa0n
	OCTW8UqGLCTlNI0hnm8XGWxtcDhK8o2sqHDBsT4Zp6M1dB2s/4qSE5wEd2bCSlLGgAO0LdM3r
X-Gm-Gg: AYBFou04dqgbVK1azz3qZT9bHmrBxzeMpIXZsJBPeP5grKsAA6NJ3xq77oWxycOrIij
	dtqVpyiWjYINblX3wk64ukpLahsQ6XqwPf5OoifthLicWPf/RP158rvAgCTSBMbvbHhwKf8b2MJ
	TvfMV3daggKAmxF40mE4skeSwOY9cfjimVLN61n4rP/18CjYw/BvfeTSH2XqF6/frjW+2l9alaR
	jINu2RQ3A1wWuxHAK6sQlg6vJPCvgXCPGFzMHGqP25GheL7i3Mlsz+QwdfySTAlAsh/VHRNgN9t
	nJrp83AGs3SAgNXCKW/R5ep5HsWPr+w4Q/3iBBMAb5c6MCp6KK5RQPf43uPwQ7KMvgVD8Vq5Dsh
	i7Z/Bot4QMm1j0ps2jCaO2z5lkBgHiWx9ydFjmlel9ue9KnyexKLL4m/YWinJ
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr30797651a91.2.1788058945314;
        Sat, 29 Aug 2026 20:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr30797587a91.2.1788058944696;
        Sat, 29 Aug 2026 20:02:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm28608046c88.0.2026.08.29.20.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 20:02:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair functions
Date: Sun, 30 Aug 2026 11:02:01 +0800
Message-ID: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDAyNCBTYWx0ZWRfX3MAWMrmX8m23
 roGOYYYMUajSuSF71WoaYSlUNSd9VZlnBhZTrsJ9X3uDp4941LJqlGLQ3AB084u0lv6pWtDFquD
 raJuRFwW0snIs3WoX8C9T479GyTZIBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDAyNCBTYWx0ZWRfX+TaQorqUeU+c
 thvGtoIGv4RgBUtU2+ra9XzFWD7WFXziYRPEbEN9X59my4j92PpLB12A/Vlwgdrzx6tCvVi143Q
 p32fBU38F1y7QujmuZ8TgGzLPASGuD/5zQbwIC7vYOUlU9M42xpyCfym8f/eFE6AnHzuS8zlI8G
 QM5rSv3wceG9e1hIbNdsq1x20mAwg9UGBPjCydwrxEMOKCx3iVz6wtnPOoyO5viXZxNxg+40UbD
 5Bd1xzOnHDY3kRhy41uPDyaZSzpikKorzNLpWKqPyE8ca9tjUTYwGc5RCtei5ToXtPy/sOd9OAQ
 fU1MZQxveBXw9JKxJAMItO4z9rcM+88nozDaQxKOQ1VPoWaKRtHIIIbjAebz3qyTX55ehMyG/Cm
 R/UpduRqM6epMhoAmBSbjZi4GCRYt8uPV1VDDCgc0R9dCaJfyjPiKOY+id2BblfjcX8u4Pz+dcp
 D2neyqVLiTVr9ieRxbQ==
X-Proofpoint-ORIG-GUID: zQgrszBqK2nAfoCuNwDFSYGfK7UOh6y6
X-Authority-Analysis: v=2.4 cv=R5Ez39RX c=1 sm=1 tr=0 ts=6a939d42 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hkSOFwkIQQlSBzuAjywA:9 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: zQgrszBqK2nAfoCuNwDFSYGfK7UOh6y6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300024

QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
respectively.

Both mux values were named "qup1_se2" (respectively "qup1_se3"), so the
two distinct lane pairs became indistinguishable. msm_pinmux_set_mux()
stops at the first entry matching the requested function, which means
mux value 1 was always selected and the I2C lanes could never be muxed
out. In practice i2c9 and i2c10 got the UART lanes and did not work,
while uart9 and uart10 happened to be muxed correctly.

Give each lane pair its own function, following the _01/_23 naming
already used for the same hardware arrangement by the shikra, eliza,
hawi and maili TLMM drivers. Both functions still cover the full pin
pair, so a single pinctrl state per protocol remains sufficient.

Drop gpio129/gpio130 from the SE2 group list, since those pins
belong to SE3 and were never reachable through the SE2 function.

Also rename QUP1 SE2/SE3 functions in the binding doc accordingly.

While at it, add missing "gpio", "qup3_se0_mira" and "qup3_se0_mirb"
to the binding function enum to get the list complete.

Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add missing "gpio" function to binding function enum as well
- Link to v1: https://lore.kernel.org/all/20260819152356.904023-1-shengchao.guo@oss.qualcomm.com/

 .../bindings/pinctrl/qcom,nord-tlmm.yaml      |  7 ++--
 drivers/pinctrl/qcom/pinctrl-nord.c           | 34 +++++++++++++------
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
index 4bb511719f31..56758a85ead8 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
@@ -67,7 +67,7 @@ $defs:
           Specify the alternative function to be configured for the specified
           pins.
 
-        enum: [ aoss_cti, atest_char, atest_usb20, atest_usb21,
+        enum: [ gpio, aoss_cti, atest_char, atest_usb20, atest_usb21,
                 aud_intfc0_clk, aud_intfc0_data, aud_intfc0_ws,
                 aud_intfc10_clk, aud_intfc10_data, aud_intfc10_ws,
                 aud_intfc1_clk, aud_intfc1_data, aud_intfc1_ws,
@@ -98,9 +98,10 @@ $defs:
                 pcie3_clk_req_n, phase_flag, pll_bist_sync, pll_clk_aux,
                 prng_rosc0, prng_rosc1, pwrbrk_i_n, qdss, qdss_cti, qspi,
                 qup0_se0, qup0_se1, qup0_se2, qup0_se3, qup0_se4, qup0_se5,
-                qup1_se0, qup1_se1, qup1_se3, qup1_se2, qup1_se4, qup1_se5,
+                qup1_se0, qup1_se1, qup1_se2_01, qup1_se2_23, qup1_se3_01,
+                qup1_se3_23, qup1_se4, qup1_se5,
                 qup1_se6, qup2_se0, qup2_se1, qup2_se2, qup2_se3, qup2_se4,
-                qup2_se5, qup2_se6,
+                qup2_se5, qup2_se6, qup3_se0_mira, qup3_se0_mirb,
                 sailss_ospi, sdc4_clk, sdc4_cmd, sdc4_data, smb_alert,
                 smb_alert_n, smb_clk, smb_dat, tb_trig_sdc4, tmess_prng0,
                 tmess_prng1, tsc_timer, tsense_pwm, usb0_hs,
diff --git a/drivers/pinctrl/qcom/pinctrl-nord.c b/drivers/pinctrl/qcom/pinctrl-nord.c
index 7c21306e77ff..7f37f8e819ba 100644
--- a/drivers/pinctrl/qcom/pinctrl-nord.c
+++ b/drivers/pinctrl/qcom/pinctrl-nord.c
@@ -570,8 +570,10 @@ enum nord_functions {
 	msm_mux_qup0_se5,
 	msm_mux_qup1_se0,
 	msm_mux_qup1_se1,
-	msm_mux_qup1_se2,
-	msm_mux_qup1_se3,
+	msm_mux_qup1_se2_01,
+	msm_mux_qup1_se2_23,
+	msm_mux_qup1_se3_01,
+	msm_mux_qup1_se3_23,
 	msm_mux_qup1_se4,
 	msm_mux_qup1_se5,
 	msm_mux_qup1_se6,
@@ -1152,11 +1154,19 @@ static const char *const qup1_se1_groups[] = {
 	"gpio123", "gpio124", "gpio125", "gpio126",
 };
 
-static const char *const qup1_se2_groups[] = {
-	"gpio127", "gpio128", "gpio129", "gpio130",
+static const char *const qup1_se2_01_groups[] = {
+	"gpio127", "gpio128",
 };
 
-static const char *const qup1_se3_groups[] = {
+static const char *const qup1_se2_23_groups[] = {
+	"gpio127", "gpio128",
+};
+
+static const char *const qup1_se3_01_groups[] = {
+	"gpio129", "gpio130",
+};
+
+static const char *const qup1_se3_23_groups[] = {
 	"gpio129", "gpio130",
 };
 
@@ -1428,8 +1438,10 @@ static const struct pinfunction nord_functions[] = {
 	MSM_PIN_FUNCTION(qup0_se5),
 	MSM_PIN_FUNCTION(qup1_se0),
 	MSM_PIN_FUNCTION(qup1_se1),
-	MSM_PIN_FUNCTION(qup1_se2),
-	MSM_PIN_FUNCTION(qup1_se3),
+	MSM_PIN_FUNCTION(qup1_se2_01),
+	MSM_PIN_FUNCTION(qup1_se2_23),
+	MSM_PIN_FUNCTION(qup1_se3_01),
+	MSM_PIN_FUNCTION(qup1_se3_23),
 	MSM_PIN_FUNCTION(qup1_se4),
 	MSM_PIN_FUNCTION(qup1_se5),
 	MSM_PIN_FUNCTION(qup1_se6),
@@ -1633,13 +1645,13 @@ static const struct msm_pingroup nord_groups[] = {
 			 _, _, _, _, _, _, _),
 	[126] = PINGROUP(126, qup1_se1, qup1_se0, ccu_i2c_scl, mdp1_vsync_out,
 			 _, atest_usb20, ddr_pxi, _, _, _, _),
-	[127] = PINGROUP(127, qup1_se2, qup1_se2, _, atest_usb21, ddr_pxi,
+	[127] = PINGROUP(127, qup1_se2_23, qup1_se2_01, _, atest_usb21, ddr_pxi,
 			 _, _, _, _, _, _),
-	[128] = PINGROUP(128, qup1_se2, qup1_se2, _, atest_usb20, ddr_pxi,
+	[128] = PINGROUP(128, qup1_se2_23, qup1_se2_01, _, atest_usb20, ddr_pxi,
 			 _, _, _, _, _, _),
-	[129] = PINGROUP(129, qup1_se3, qup1_se3, ccu_i2c_sda, mdp1_vsync_out,
+	[129] = PINGROUP(129, qup1_se3_23, qup1_se3_01, ccu_i2c_sda, mdp1_vsync_out,
 			 _, atest_usb21, ddr_pxi, _, _, _, _),
-	[130] = PINGROUP(130, qup1_se3, qup1_se3, ccu_i2c_scl, mdp1_vsync_out,
+	[130] = PINGROUP(130, qup1_se3_23, qup1_se3_01, ccu_i2c_scl, mdp1_vsync_out,
 			 _, atest_usb20, ddr_pxi, _, _, _, _),
 	[131] = PINGROUP(131, qup1_se4, qup1_se6, ccu_i2c_sda, mdp1_vsync_out,
 			 _, atest_usb21, ddr_pxi, _, _, _, _),
-- 
2.43.0

