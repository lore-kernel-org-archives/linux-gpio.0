Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463535;
	b=Ob4Nyu/ldNa325MZ8skWFmL42E+KwmmaxkXRMzCoyZN4pelZQMA2r3Jg9SlMVQhC/guZ
	 0PghujpQyizXYaml2S1XdJt6BOLiBa0rLHtIdYjp/6BNMMHokGM0rQJ7dHRk9f9+uqrBr
	 0pS82YQW0WkLDwv1UPt7rjwFtRdzhgSG3n8G7fJPBplBIFpK+qCe2bEMlSzLqP0qsjum6
	 X9XGxKoQjbm5XX0rK2w4OONk6JfgtGjF8DPIgvE4iedTNSwMm4nXdVbvKFzFqZCl/7me8
	 TbIvE5SUsm005Lyxusohwc1wDKqbB7OBjQQhdNtqby+dIaFMZAu+U5zuODbjSftG77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463535;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DH6WsJtIJ/ZrlkdvNhXLsUwijSOq8s9w7YBhsklCQpY=;
	b=HZJlXvQEFE7WwJHVB4rPZHo/HP+UsTXsxUSVcjy6bk6NLUM6DsaRnkowG/XA3xvjCfAL
	 PuLpF7cU1QOs0/M9yFe/4oqQbAEFo1M/+E1WO/WNmzLxEYpwmyT8F5D6rlFmn6DPY3IgM
	 v1gSg5zZOden+GjEFiRcQuK71Xv92RSsGD2Gs2BZvHzTRwdjUdy/x7WC5v7Ug8+MNxY8I
	 YGFnp+Rrik/QxUUKA4tzbC395AQcCTSb9JJ2cKUdN2kUhfEMDzytRhoHTxulfsqQ849qF
	 udUtB0dkvsqRXubjM0cL9d0KRvxcTrjpUy/qMZ5b3oKSNackJNJVpQDkZgyrJGCfTfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPSNA50S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kuilyxAy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52278606A331
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52278606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bPSNA50S;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kuilyxAy
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGxEm2377199
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DH6WsJtIJ/ZrlkdvNhXLsUwijSOq8s9w7YBhsklCQpY=; b=bPSNA50SDkegywTD
	/HyNrfI/5vqHd3BN4C9cicL8d0LLfI4LqV0hbU6En5hUZASCZ1tyBXiQKNWUFHCa
	OgRyjeNjl7uQCVjqRBjwfSFZpN1tBlznUDjOti1eqO/ZSHHe35nzCVFlSqJLOj8L
	cm4CPdzDs0qb1u1f+sMyXVWuf4gqgtmKs4RrFaZ+yzQdXLGp4J3ZXbUbm/yL3aM9
	JlX24ypdwAWahre+HfZe3k2RaCUa7+g7dymTBUxT9SnHjtKesF6G+pwhYc4XyvBw
	TqOmFy7XEvT1Rw5BhNLizIt2jrs3SZ8XrfteXxIYA5uxUXQ/sdA6190zOAZ/EYw6
	A/tJ6w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7ut5tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 19:52:14 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so1964199eec.1
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463533; x=1796068333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DH6WsJtIJ/ZrlkdvNhXLsUwijSOq8s9w7YBhsklCQpY=;
        b=kuilyxAyr0nIrdbyjC3Mwbf/ZUV1C/+bOwEdeAuYS+G4JawZIuhWtbrg2F/WCPGDL3
         oT39aw2LxSApSbJFTAOfmsHw/5qALK8mVrhjiTpBNBR5iQjyuz75Oi2aiAvIZhhZMult
         8fyBL66sD4QGypAoveVGzTQdbtjrqcFSn0Atjbbx1QPFhdX/D0uE9etRei32Uu/i9tZW
         +3ZinZbIiz7ciDGcCaD+sb5nNqSN/VBDpfr+PPjtwBhpRVHjznTvoCzfaLWUDS2QvbJ/
         Bm3//3Mc/+8gRUZXEhw5FIvManO5z9SO3DQw0M3kS2nKU5zwGASRB5wEimYBJxtxNDF1
         StjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463533; x=1796068333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DH6WsJtIJ/ZrlkdvNhXLsUwijSOq8s9w7YBhsklCQpY=;
        b=YRTdx85I/sCGYjjN8ZED3YHXZesuFzRl3VcrLcv3yl4ptNoTpIihDCPkvJAgy4r4E9
         AArLyrK9VcBrUuEVA56Nkr0b5poqexVhW5ANnmY0mPrWLx6JW1dW6pKsS6rrdbWgHfON
         jfjAFk/41K+AvwLPoLkX+WHDZUhKzF3Xed8wXUw9S+qDEIPAHES3AWsuaU1cVq3zA8sM
         OFklgxVKw+W48SVvcwus5ChAG4mTbBZdr2uImzuvmhJal/gDW2+SjhxhafnivIq83/U7
         YFjp2K6lOp0FABGsc9B+30LN+R9ndaVyC5GZrUogJ9+lt9BCYMhlXoVV87DkusTyF3xI
         eMFg==
X-Forwarded-Encrypted: i=1; AL+hErEytbtgIzgBLn2ZkDlb1hmc9cy29mj09Q/zsXAaxgjpi3/A38ZqkSZcCGS9MMFNR7jntAh13cmgyyFk@vger.kernel.org
X-Gm-Message-State: APuU4Z9IeebWKvsHiL1yoFTHqTipgKeUl1i+roKdTBaUWb7g74l70N0Q
	nyyNuSWA6tilnaxzuh35YyrPrJUqG5lYTIYqEoq4bxtRiYLy2z0Ulso9wvqn0U1s2JAITwf+0HS
	uOsUpY40mPkAhcfMMBbPJnKb+QBBqyCkhTYNQt291CfcyIo11Qp9qCGFGbXGKxY14
X-Gm-Gg: AZFdTZdCbWhkyY0FDfDvYnTiM5UGK5bcPj+g28oQsKE4MgLwg1NktAab7xvAdmQsQTG
	cQ6aT2W0TQd6Iz5UjLts2G/qETqRTushNHKB5rSjzGJXmyPnDF44QWGccuR1GxJuZ39Mrf9BnLY
	ElHolbV6SW5PgNIwnvhkcI01AXP0oM8FCJ3ejFwiPF/o+d680kXCRVpKWsx+fEyebjbYOccU5Ly
	+qa/w8ATMs9QhfVbsWkU/0HjvYUF4Y/4c2fI8UsM0SMHTiABjbvOrcIs7srPCbJ1PdSLxc4xYnp
	0YISpW+VmU7MwAxptiwE4wU6rV66caZBjR09q0ARC7snuexxr8o5Eck5Q51pc30Y7O2oEYW2iUF
	ZsEaIvyk7Kjb1XkCc+5OV2EWv7Lu+f50G+sWtX+2vIT04nJWT0oiCzndyJLUttJeVH890d81cAg
	==
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr7927885eec.25.1795463533209;
        Mon, 23 Nov 2026 11:52:13 -0800 (PST)
X-Received: by 2002:a05:693c:6205:b0:386:a498:3ab1 with SMTP id 5a478bee46e88-386a4983cc5mr7927862eec.25.1795463532668;
        Mon, 23 Nov 2026 11:52:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:12 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:35 +0530
Subject: [PATCH v3 04/10] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-4-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: HhbgkolKBfM_ZmC5olQj5WIahCjzJSd6
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b04996e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RvjwIfBVDrABg4tGW5kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: HhbgkolKBfM_ZmC5olQj5WIahCjzJSd6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX4X6KSnWfmdcl
 ukAJ7oV49siAiG8pEdyaDCGM7vP3Kn39t7sZd5T6AQnWrydCMgMVolOpGrTRarPrKCqkf3I2ROv
 h0Cj/rj0pkr2xhfiN9mNb8p/YEeeOZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX1x6z9aNvI8K3
 bQHbPYowPpmtzAaMD//O1v1QtCXmNwbG2D2+sme9s6vvc/QWBWo6+5KXr1EiQbI7nude+Skkztb
 TKFhRcFLIaQ+Y5NsxBAccGhMI/T2TTS6S5CrHyvf141Xux8HdQ/oUm5CuAaaL7Ije6mcpyMJJDF
 CfWKfl/ZKzexv2q6eXtTdq4ePx8ep5OoRrYcTxGMPRw51dO2fdyhussMUqFPLNMizJuvDkuiP3y
 4wXnTnJS7RZest9Pg+EWRPOu0vEALIE+v/TvARYEF3zjQTDlPO5s3gUA5qGL5INV5jUw/v1iw9Z
 WtVII0acRbK7n2B/hwoPrCU0d/Ui13KE8nSAoXQdziEbjLHKAOyWZ+wlYNXN84VCX3iPYjdWPM8
 OvY7x+bpZVXC8X91FTAnK7if2oMojQZSYi185kx1PzTbK+H9b7XH+2XNx70NXXXfdR2GZ9MteY7
 LYdnI4Rk9v1dg4NDVvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, SC7280, SM8750, and
Shikra. This lets GP_MND select the supported PDM source clock rates.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-shikra.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sm8750.c  | 20 ++++++++++++++++++++
 6 files changed, 120 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index f205de3a936170413b21173c7af9668c14495369..f70d6bc25b0432aebb1c33f3f7ea3b7b2062ff8b 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1656,6 +1656,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1664,6 +1678,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2804,6 +2823,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PRNG_AHB_CLK] = &gcc_prng_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-qcs8300.c b/drivers/clk/qcom/gcc-qcs8300.c
index 916617a001c854c1a0349c1793a427a2822acfab..4a152e95aa997bdcc7ec56a6ae96c61b3575cd88 100644
--- a/drivers/clk/qcom/gcc-qcs8300.c
+++ b/drivers/clk/qcom/gcc-qcs8300.c
@@ -2280,6 +2280,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2288,6 +2302,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3501,6 +3520,7 @@ static struct clk_regmap *gcc_qcs8300_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index 47acd1b58f13037576888a860c58b6b777aac689..7ed7953e9beb41396f3ba65706edc7ca66180059 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -2712,6 +2712,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x3f028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x3f008,
 	.halt_check = BRANCH_HALT,
@@ -2720,6 +2734,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4406,6 +4425,7 @@ static struct clk_regmap *gcc_sa8775p_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP1_AHB_CLK] = &gcc_qmip_disp1_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 9e141a7ac424ad53f6bcf2869e456633f5612082..0708a1a5560985cae5f3eff5491da7c3de1c0bdc 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -1913,6 +1913,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1921,6 +1935,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3250,6 +3269,7 @@ static struct clk_regmap *gcc_sc7280_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
 	[GCC_QMIP_DISP_AHB_CLK] = &gcc_qmip_disp_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index 13c99a883e29877d9a929f26ca0b3b04b1ea0b11..fbb4ea209345120fb3e178a648509737a0825795 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -3191,6 +3191,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x20028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x20008,
 	.halt_check = BRANCH_HALT,
@@ -3199,6 +3213,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -4206,6 +4225,7 @@ static struct clk_regmap *gcc_shikra_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_PWM0_XO512_CLK] = &gcc_pwm0_xo512_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,
diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
index 80b8ec119c553d06e192d793730a0176e74e7b49..5449462c25ecc8893a5fd44004989b45d51d53d1 100644
--- a/drivers/clk/qcom/gcc-sm8750.c
+++ b/drivers/clk/qcom/gcc-sm8750.c
@@ -1690,6 +1690,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 	},
 };
 
+static struct clk_regmap_div gcc_pdm_xo4_div_clk_src = {
+	.reg = 0x33028,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "gcc_pdm_xo4_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.index = DT_BI_TCXO,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
 static struct clk_branch gcc_pdm_xo4_clk = {
 	.halt_reg = 0x33008,
 	.halt_check = BRANCH_HALT,
@@ -1698,6 +1712,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_pdm_xo4_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_pdm_xo4_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3000,6 +3019,7 @@ static struct clk_regmap *gcc_sm8750_clocks[] = {
 	[GCC_PDM2_CLK_SRC] = &gcc_pdm2_clk_src.clkr,
 	[GCC_PDM_AHB_CLK] = &gcc_pdm_ahb_clk.clkr,
 	[GCC_PDM_XO4_CLK] = &gcc_pdm_xo4_clk.clkr,
+	[GCC_PDM_XO4_DIV_CLK_SRC] = &gcc_pdm_xo4_div_clk_src.clkr,
 	[GCC_QMIP_CAMERA_CMD_AHB_CLK] = &gcc_qmip_camera_cmd_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_NRT_AHB_CLK] = &gcc_qmip_camera_nrt_ahb_clk.clkr,
 	[GCC_QMIP_CAMERA_RT_AHB_CLK] = &gcc_qmip_camera_rt_ahb_clk.clkr,

-- 
2.34.1

