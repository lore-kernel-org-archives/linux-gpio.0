Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014241;
	b=Xft6wx+2eqHO2VLkB+IyTB+fYZiLE9E2+eWKiEFAQysQwqNqNPcJd4pkigm8C2ssJ1nh
	 xHWTaaChuOlfrdEjf79Ljk5c6wRpC9LvoxxUmjHJ68Fb3G6L0ceTQLn5LNgbtjjh8WrBv
	 2WpKtGw0DMSk5jjLKDU3d4yc2JDWu6Pn11mDXbf1MSTI2Hn0q26yAgnkEohCh7ZjsF/Y7
	 oH4O9V5hPmLPfxOdtfF/dq9SMr9u/VeS32TuSHhSjHu5GM3IUmbjhAv9UefaQ9fbAguoA
	 wa2qKu+rmwvhHxiAI84jwurVpY1mxYnNLnPqOKYUV1X6Zo63BriTqk8nDi79fjWriPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=VR3s80d8rPHNlydWVisvegBgdlFYMkyj8+7Gp222Tvcoq1cxdVBSO73QL83oktz5R06S
	 Yo0JCrd99ye0Qz7Ezl3tRyJmGINfRib//hmZdZfsNojdF3AbwScUpsFytK6pTWW/IFtoD
	 +qbM/DIMnjSHGzKVs4OeMgUmR+CJtz+gg2clt9i0okPq6RnmL3VSrAzlHWHfosgXhJcFG
	 3MnkUPN/8IheeGRymcbXfcvskO6CyVKIS09s2QB2ribqE85+ke1lZTS1j+kVAP+8Kx7Bw
	 zCdlX/qtj4Hu+K/8JdHsNcmkqE5W8PF8TKmOJlmlcHx0qvA7MOHr8pTYUVr2Yo2AfvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C860A2622
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24C860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspIq2168616
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=kBVrqT7Do5kCKYQp
	Xr+mV8eG5A3PRn+t4jCykyOpI0aLy4kRLbT0eqYs5BGCTiFp0xi3RPAbywuU16Ec
	2GnRgzxKf2FQmmuMnzcza3axbUK9txw3KndVGyWSmvpoZ/eieS3gVwNhMeMTHlsx
	QiuJB7g2a8wqCqxuIiaKb+eclt7TDVPZYpEwkJv9CqrxNAzLh15CtS+X1kFcWmjt
	F1wlTRFtS0TQ/ejC14KuhLzbQNBnhaC0nBKuXBANScduph/+ABnNR8+2IOfBWJCQ
	A4Cosar1pPM5lxpHB78mEY9dHyg+/VN4ISyIyYZBd0aV+9T429kVr349GayZhym6
	LzHW2g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u60j18-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a0522cdaf3so2619684b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014239; x=1793619039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=U1Okux830LFf1hdHdIHVNty2/Z3B2F7hxKRv4jEbOJl8ePkAjiwpS6156Yib9PnHl8
         b/f2OwSW1Znkz+IJIgSpjsv+g/ChwW7n1zrMdAo6m2MlDkmPvAUfH48M9+SGD7AGW4rY
         TT4zVCPDshY1mmW1fo2C7IC1ebCc9oEGV/JfUZSg+t/s7bgIK/2f8VgDMQd2Q7CWVXGR
         3ed27hmUaGkwvVJqK0anOTg/1wRrlJf2I46zPMbe/R4qkLZz5v1IbcARRkpouFS07R0o
         TVrGgmWfkvk1ufkNPmf7bSLiLs9J+e7ceG0UsW7c2P3iZW8eUEIJKKV5jofZFPcr8AAn
         UhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014239; x=1793619039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=phVnZ2HzDJ52iAOrVg2FndJy4AA/dH9gBeqvtPjMTD+vLf+6CQcqAdKN2FYzUkORTR
         rWovPBTxCj2cVMvrAQbH3fd3368NkqIk6hUZg5fWHhlMdZcSUscCPlyH/4XDs3Vc7J9E
         rq2O/8Q8jICREiFvW8qOk+vq+i3VzvUJTCwhwkAyvI4qYya463fJ3ybhtksBo9P7OFaD
         nLk7+rhiyUvwLJcnPjNH4kdBX8+T4wd7vbzUVv/w+b4KpCkQyH+SuXuGRPElAwvymDzt
         lbzqjX4Fthkt5uZKy4mp2Q+NC663XUgri88O1B1VPTAdzGyaFc/Jfz42w2tIVd0DpM4n
         A9iQ==
X-Forwarded-Encrypted: i=1; AKwUvByKgOWsoTpGQZ2Hm+XrI2T13cwKfYtpHuXit9faaBOyQPXnfn5EYUm4sS6xoMmHdeYOGI5UuQYOJ0A4@vger.kernel.org
X-Gm-Message-State: AFq9FYJBYyAlRYXkV5Xilk1ky+dyeIfV7SewDw/RQHTPwJqDyZADcyaJ
	EH8uYNLU/MQTW2nkBUTTx0ZYmicVHyx2ZuBfkBkGspkMXjy/KVadPX1pPcbxeD7R5l5SwqREJq8
	SZt3FBSYKm83eoYY+9e/0N4I3BQEII9+Z4PNx9/olEwX/R9UPl2tgbKKkQvwdzxfu
X-Gm-Gg: AYBFou2OE/LGuQrfEO+b5q/2tvefSrehO1cuxih2O6OT5zKc7uPzc1pKDwxnTSxkCVd
	6nitf7eZ0/4JwvgIu2ePdOFMz+7qNQHTpE/A42QTr8Scup1P23wglk619+8moWAgBitvVjD3JME
	BEc0NBdBqGqwJ0W9YM5ZoMRD2WI/rtsBmSzEPHg0ctBhohnZqHgDZuZVYqYlnjtXp+qNcXU1aUP
	ZtFx5SS4Y4IuKzplVE7OLfCSZjUDgC3arqI6jEPgaglBlho2JbpSFAfTfo8vJVr8bcuQeN3tFS4
	yK1t7ofQFW8UE1Qy3cJFDQnR6lqFdCy8hbnmLR/BG+jmHafzQ9k5WpX07yyo9HuoSWIJHtKpGL1
	vxkgR9muwiaJ4qM3jvP7GVzY=
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970122a91.48.1793014239306;
        Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970084a91.48.1793014238806;
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:33 +0530
Subject: [PATCH v2 07/12] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-7-ff8e4bc8d567@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: nVSPO5UgDzsvrMqqZ682CIdhI-a06Ulb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXxJZt+mhf4zWd
 UotdL5MHUw4Wf/5XDUiMTP2FgObVe2iebZ+YyT9M1m2iVGoVKr+rxAB2ZK9PeH26oSZbUW9WkgM
 Dd5oItenLm1bhUPKACXKk163kGGPDgWnbZAxDPIAvGwA+r3pAiv312EujTzSZWjRUxPUf1Iu4vj
 9vPKXY+V7mBh23ZxHoaE4WL86lf0lnFaEx9lSrENI6eaa/TYz2712lMvcEcaGAhHHI6AVYMlOYO
 ML2fI/I8IluxQrL4u49JFdrMqgJKILWAo1oHtHkCS4mBh7bBjeySeLAbQzFFgcVLIjs8ANhzSNX
 6yyPvk8FEDiNAS3aL6pREp5vyfCdWXkfgTusgt3A4dFjrUOcDy3/aEJtpByCUcwxlI3vYII/qKX
 htfuTTR9ONTI5CZ4WslVUutKqegjTActCEfZrW6txKBJYiYnQATrPoHJUY2OKu2Tj0H4PWv2Kes
 Hp/zvCO/8lWDmYwClcA==
X-Proofpoint-ORIG-GUID: nVSPO5UgDzsvrMqqZ682CIdhI-a06Ulb
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adf39df cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX8S+gd1oWr6qw
 85dbQIzs8kJIZxbkk2hNWjPLwto4xE7z3i9csfQ+MzWWhU/linzC49isuL28NQRpfSN2iUHpJGQ
 rHFRE0CbtUZadcnbhhJMJjT9GTxEc08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1

