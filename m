Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014234;
	b=kEkgARpl9xGSrCD7L4UhQ+T9n5XLFIcS+fUmq717vIIyH2Sy5Qe8+3JGNTr8yEP4sBpf
	 S9PoanKj3RI3Dgs7GZ35Q+4E08WQfkxOC1aEmSP4XIsPp+BQCaEM4/i0+2uXNnIkXDtJD
	 x8D929yROTWHSoOmOBHJv5oSjW9Vpr3meHlbX3z31Ri9voDNm+7ZfiMmAbU/xQ2YRDf3U
	 f7govrOaJ0ugIipSNwVypXhmHV87G7WPmf7Xq2qZRp+daTwbneNGN0HxYNJVAWtddSFPN
	 9qgowQxJgSZtpRx4Vx+WAdqpYoH1ZjEM4QJr8XtZEEZloDBP4RY7nbQTbMb0qtPMRYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014234;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
	b=3omowiZ71cSx0l7VH1y1UfVzqibM8StuwwPoksSVJ2X/wmwzsiK6nDqmCPVrcB3cSXkJ
	 hOyboXdaKBV4Cp46Rwe4TvILXRI/TG/a/ydI6fvajnavcDwCpTlo/BFExcHgRTTvhkjT7
	 pZmkmVGJIihTFe6Hqy/ZJZG6vYpuIXSOFu/dn1zv1laMJIOnyUMPvbJY50YQwYJWm6E4w
	 na01iLRpxGlu3YW99Wmac89GPZ0oD30zF6rErfKcS4RwNYkt5keoQrkmh34A1Ca3n57ry
	 ZWUhcntDHABkxjKjec/yUA8lJtI/ubTIejBmbO+lUc8rcGDf7Td3aRgSCeJxi4Yzg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMMY87jC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0C60A261F
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD0C60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EO+mXk5L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eMMY87jC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtCVT4126701
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=; b=EO+mXk5Lz5FLLXjX
	HVQdlKor98Xebdy9/kOV6qz8DgTUBXZmn4uDnosnBovS/QGTQDn7+01mQrUwMYVU
	nt4yRXVLhs44W2ekxGeFWV3ovCC5OFKmdrCpbNgvXJDPzijk9YuE2FBL9B6HJLMN
	jEKLANIe9K35jVivIBkodPUYAZMJE3PfNkE5lH5LWSv+mDa5iaGOSC8euIKMlsDo
	08wnXCgypjjHy4p9Tg6jocXM9ncIUOMsw1oh80v4rOPyq8rRqlcYnu1We39dMa79
	XOQUxBYs2LOE8V4McV0PNIpyy0SYvMlGxNMHtlkVtUsDiEiKrer9jwX/qo9XSrD2
	3vFkGw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpt5vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d5dbso2391486a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014232; x=1793619032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=eMMY87jCrNtgkM3/WaR4sxm1TzM1UnWyPzRmMj6CSelRF3vZkGehBCohBpXEjFF8Sv
         YSd3wpXjXyYv3tVyS67w1DQ/k+Tjb51tbWVXIoz0dV5NMRgntxvXJWuvRVW+4gLjLcD5
         JW9P8h9Hd/FFC1qB2a8P4/2RFlSRGjz6MWU5nqFWsjrrIiXRvlXr8kbG3gyKV4sTx2km
         UNsOsOqQvGQxcR8W2ZTwkAddT24jY7DZRB9Mzbxr93P8xXLp04x3dS4jCrv7NMeEs9L1
         gWsWUqXNGOvqy6dW2Kpokth9L1TpNfmDXLxdZRU9uXHzGUjw9DdfzmswGL8qbQ3sUQJR
         ZiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014232; x=1793619032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9vT8yXNFTPu6Ue8rKFPc+BIeRC0NASUSV+4I1ZBNGQ=;
        b=K+A9PiIW6wibaQvh+fOgbtTagbLCwqUqCW3KywyhNnPKQIYcRAqYF2qfo8HrkszuCk
         TKFV1kvjUoBS588NfCYhhqft/uw3/FVf1Bf1JT+OQdfEhz1icXA7Ucercic5F1yMVyi3
         dVSYAuF74slWlK3WnmBpcIhHIAma8fVzFIzZ3jtqZI4JL6C9S1bgrAQBQQwNFGOdixoZ
         /FtDc3aXa4/LbKvBe3Ef+GDkArV+bTaK9WptOHLDPlC4rCTpMNK9tw0fnY6TxvIrENa1
         og17bwZGvuXKPxJMcJibFnguVIUyWODpZUrjvN33h9PrYsHlj9UoN2rj0FPZBI/TiSgg
         yK0w==
X-Forwarded-Encrypted: i=1; AKwUvBznAM+Lg2Baon+93L9Dvgb8byOdINcLgTHYoG25MjuF3epBM9R94iXvqkIm6yVl2Rf0lZUwcSLcw76S@vger.kernel.org
X-Gm-Message-State: AFq9FYKSAwVhALnxasBns8gYCX41EnDGiY0OMe11zs8YCYTA1HBawQAb
	TK+zh9mVjmfrhdHrmM7z3V84h4fK96r3qgXMi+zoLBi0PU9pmXNjdhVo7nPTdCnME6Y8Rs8BIib
	J71PrV8l1I3tjvocnzY5wz2qxKH8u36AHPdHniNEKMq1y8pV7g88jT9MUn4i+d570
X-Gm-Gg: AYBFou2jc5z+wq4Pji71lE4r+e5vLK9HpWcgEjeV+XmGcPoH66koHbncVTa26ZO7epf
	AjA9sWRl/RqMU/ucxIhXcMdqqiFvOTrtcMLkzKLaVB4veGs96SYnaHcLZsvJoM+HBDhp/zgZNia
	/eEZM8nIbuvuizwfbRsQTPLJlYb4zBt2ykMqYIq8pmFRysV2UhH6NuAjJChYyYmdL+SHq96Sp/p
	LXBF2u90oeJl3lStnt2bhDrvP7TpbC8izT2y3PhoELnCSGWF9/cc83hD2oNuye5sARatR/gdbPw
	9ih5ikSiE3DTnCznZn1HQLR1ZSEot5ih44+j9fC3OE90IVb5Mq50y/Q/xooBEknlewidrEbpy6j
	iMqivIKykGB6Rci8AQ2CFrPw=
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5438012a91.35.1793014232312;
        Mon, 26 Oct 2026 04:30:32 -0700 (PDT)
X-Received: by 2002:a17:90b:2686:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3adead2e19dmr5437971a91.35.1793014231659;
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:32 +0530
Subject: [PATCH v2 06/12] pinctrl: qcom: sa8775p: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-6-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX6ZLvSFeDvwfr
 11SalbZt2HL9+zH5/O3jEFvxsDiyMNS++D628hBMiIvLbEWct3fEbfwdOl5WRIOXAdYyzCUcLEI
 fd8/eY/NRLNkZt6SiU1qPTYfhVCt1FE=
X-Proofpoint-GUID: SmA02QzXY-RpPKJu2BZczqsU5kwaenJL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX3f6Mr+Z3qxre
 QVDccRQCvrpLh04b9LzHhXu7JrhsJXTmrT+LCuLZQ2DTPJspU1LXWOdFgRSukiT02C9Hn8CdlE7
 gZ1VnloA1bVaVHL0QOcLuVLGbsrzm9kURWYhoaTQqtgEiGZ7CIBHuDgir+H0gXKc75Lmh3AKFUN
 R8UavvDjaxrj9ZEmGtaDIEzdcODI/EHkFaeycoXOQ8UfAZOLWHrrZaDA1hK+tXHZ/jX+yspo30M
 uR0VQPwHkI7mnJISqctOjVxvuc9rUophymReO6rzRui0JoKZ+fHDTt3iMJywj46oLk415JgWrUW
 xN1HA1y9n7jhwhgCc3p4d+C0554zkay9qs6v64cjTiW8BTwc42utkr5KzeYdXn51CUF1O1VmuNr
 aN73LeuCjbR63NjUIl1WO96PqyeN0hlTLqpWhUP+bHPOYQ6r+JsIEVlLQtjQo9RoG4fvqN0dWhf
 gA6yzAZVm+1wXkF1zSg==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf39d8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: SmA02QzXY-RpPKJu2BZczqsU5kwaenJL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio35 of SA8775P. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sa8775p.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sa8775p.c b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
index 5dbaa50cbff008a2605876eb329496d305735700..d299f47a0bd4ab1a0cd0e553ba50f9ec1e035686 100644
--- a/drivers/pinctrl/qcom/pinctrl-sa8775p.c
+++ b/drivers/pinctrl/qcom/pinctrl-sa8775p.c
@@ -480,6 +480,7 @@ enum sa8775p_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gcc_gp4,
 	msm_mux_gcc_gp5,
+	msm_mux_gp_mn,
 	msm_mux_hs0_mi2s,
 	msm_mux_hs1_mi2s,
 	msm_mux_hs2_mi2s,
@@ -828,6 +829,10 @@ static const char * const gcc_gp5_groups[] = {
 	"gpio34", "gpio42",
 };
 
+static const char * const gp_mn_groups[] = {
+	"gpio35",
+};
+
 static const char * const hs0_mi2s_groups[] = {
 	"gpio114", "gpio115", "gpio116", "gpio117",
 };
@@ -1230,6 +1235,7 @@ static const struct pinfunction sa8775p_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gcc_gp4),
 	MSM_PIN_FUNCTION(gcc_gp5),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(hs0_mi2s),
 	MSM_PIN_FUNCTION(hs1_mi2s),
 	MSM_PIN_FUNCTION(hs2_mi2s),
@@ -1361,7 +1367,7 @@ static const struct msm_pingroup sa8775p_groups[] = {
 	[32] = PINGROUP(32, qup0_se4, phase_flag, _, _, _, _, _, _, _),
 	[33] = PINGROUP(33, qup0_se4, gcc_gp4, _, ddr_pxi0, _, _, _, _,	_),
 	[34] = PINGROUP(34, qup0_se4, gcc_gp5, _, ddr_pxi0, _, _, _, _,	_),
-	[35] = PINGROUP(35, qup0_se4, phase_flag, _, _, _, _, _, _, _),
+	[35] = PINGROUP(35, qup0_se4, phase_flag, gp_mn, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup0_se2, qup0_se5, phase_flag, tgu_ch2, _, _, _, _, _),
 	[37] = PINGROUP(37, qup0_se2, qup0_se5, phase_flag, tgu_ch3, _, _, _, _, _),
 	[38] = PINGROUP(38, qup0_se5, qup0_se2, qdss_cti, phase_flag, tgu_ch4, _, _, _, _),

-- 
2.34.1

