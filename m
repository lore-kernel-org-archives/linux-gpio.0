Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014221;
	b=HzQCapFyoYIJ2YcmbSJOTjpZSs/QRzbY9OCDOTJNaKstAubqmzA824gRBrFm7ZV2Fqh+
	 l9hhhpj6hGhSvthdMtp4aHnEQImstgGykQiw2+dBrXTJ5bef92+E1uPiqz+BEhNzCdeFZ
	 nnHXZJO8iq6X8mfXqvHOdIvtOcqLxnUM9zoDvKP1863wjBf+aLHorHTFDcCdFet4ZIe6Q
	 lDsWfg8/BVQZtZTDGHlrHT8aJmHzrIShA9H3ve80Dh1DXWhDm/b48YPJGqm83o7k1+nt1
	 pIjnuht6kwNwcM9GNjEVFXL+xLi9ZAxolJwSJivphIAOr27ymx6h7bZu75AO5j92edg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
	b=w/3EkUv2QYK8vlcinpuNMQx/Mo/ZVmT/l2UZ0LwmlWrLbYdvrsNYw5nAOzGuZlD3S3Z+
	 tYqGu0PU5d7m+XhSuWOPOHwCcwEp29F9+iYO+OXs0HvYRxcOapOWFLsUSqu7p+jj79qyV
	 d15D7hYOB1lVrhDtBvCb1Y5zEpYMvXa+Fms6UTgtGcHKNO/SpXa9LV2HyigFIwdYVRG4Z
	 m4H6iS2fbNTN82UwVzjQVHfKeqRTbXD98B7mbJ/1z9Ln7iVBfRxix8jb649ToyCyfAJ70
	 ZE5CibPHINec2kwKeIdNofgcIZhxqzr/CYpUTIIsvPAOg7eUBzHcHvySeA80Ln1hsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EBB60A2616
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08EBB60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S4qG6BFZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VI57qAbO
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt4Rj4132054
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=; b=S4qG6BFZIZ7R887c
	q08zSadn5YqdRl465l1JEkvMZtIQ4Iur6HbCjN/4lXxcggrGkZvAHSKe+mVZpeix
	/fM7kh8y/aw0dVx2b/TjjPbZZmJNg/3vK4Qw/hIk/IccKY325p2fQFeH/wE7mL/j
	Q31qOcW7rqFOO90kZLb/+DruiVRO5JjblKC4q+ZMhF4lyDh0c69Mj5mLEmXmMtsL
	1eAoORa4Z/eZgIEBK4agkqqlcUqFfpgaviNBcCjXR1HfuzaSFJe6bk3zNIF6m2l1
	XJblOSKdSc/w0jlfsQGgyaP/FL79/bTpUAOKMvYa19KdpXA/W3nNhqzYWWVltzZn
	gMZZlg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 11:30:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab7f1efe5dso5127543a91.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014218; x=1793619018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=VI57qAbOjSXEmndXRV0/G3nQ3P2j92eK4gCPsCLluiCeUy1NB2tBG8oiuS6oMS8pfs
         gJghGeC3QqYfpI5K8X2SE7HSLL7bdBWSeEfka6VmotkVjAdkFYeGDVvmrUA18E+I0dwe
         /9pXZDEfmupePfFpcCAE/ke7x5ouyKFA4fiubdq2LImcjr7kb/j1NFUXctLaIiL6M2dq
         xL5CUgbiVjsOrMkbwTmtqDBQfUGdv4rp+jY2HCP9iTmpLrGRIQy6L0na4sckc2VdWu0T
         aENsCvc/JmNGnUIhEeH/HTzG8Ntdc6wXp6x+TghwdeCES8xOGqKUhgBx0sLZvSYVjxmo
         EuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014218; x=1793619018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeF/SIMKp1AhqcMN428zlJG3WBlYI6x0ZLS3Cwh8XwU=;
        b=WNtAlXARwV7QnoezuaXW2wQjoYulK1WaPFLR05wQAVSjIKOcTmi9xn77hiQLF9OXOb
         3uo+jJAhB4aHsKfQqZ26JVh8E0iju5Vc8lTOpmRWwsYeJ46zuyyszJcjKZtJKm3wC7Qc
         oWVX6Pm5DXdK15ZcG//PM47JPyNOS0kaingebF6Cmdpu76tj14tFfa+qOsSBlqYnpGEL
         xs0ebLswVcpQnDsH9dt+1W7k0ipnTxyiDrJ1e2HCxUfpEXyiE9JsUMwhZzNjoLHgax4G
         AQBob1AZn0YIgr2CS1mqWgTRPU1Q7L8TtihzVyYnmHA0BnbrROG02sh3bCj6Em4m5Wlw
         4iEA==
X-Forwarded-Encrypted: i=1; AKwUvBzGzIbw2ZRWsQTPXJBsP8UN71BCdWQUe6WmBiWk8cRc7lIgVqX+ZiH+e3piVKDFfrzr8N8xY8R50e/f@vger.kernel.org
X-Gm-Message-State: AFq9FYJyQrwpGaWGGEq/LTwKTCYF3d0TMjV2e+N5ZMu7GuZ+2ToBmx9W
	6xFGcnuq1G0deetJx3D92S3f8tnSn6X0kee6ozWAKGaySxMdpESYGTkYztFABYI/znCMDmO9MPn
	Kujys3WZjcSQuFXDw4c4iXd+MF7byyQJMFBAqG/HCi7W6iD6ww6TOgpKPgbE7NXhSYZTGHOWV
X-Gm-Gg: AYBFou3ztKumrZsVy7xt+9J8HVCtnKvVvZLSjiU+6xzRtnQweL08rV+nk5sbGwXlVVr
	G9kTInhxD3MUlo1rlntVXO8xZom+kSfT5VnoOncIibqg162qI7SV0Cwb0LXCjMxVnEwHMynEQJL
	bZyL00tmTqCuvjsfzdCDHWyvKyHuiZMUtK+0pNO/of3Xl7oCEGlI+R0iKO/OEzrFKmJN3Prcqte
	wXqwYvk6teLzMgWaA8OqWdLGTuKkrcGclkN7m+WlUe9nMNPEVcA3mXnWuSgqfaeUkeH+7COXUil
	lJnh5lS5bP9mWQzwgas6DewVClKtVhgAu1bbGxmUFOwTiTtEAPgNYo/rBJmjKevSDT/kGLOcc9e
	6esEKjz3J2C9FBEi9dPnV56k=
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308451a91.9.1793014218338;
        Mon, 26 Oct 2026 04:30:18 -0700 (PDT)
X-Received: by 2002:a17:90b:5101:b0:3ac:9669:846b with SMTP id 98e67ed59e1d1-3adea0a4d0bmr5308404a91.9.1793014217632;
        Mon, 26 Oct 2026 04:30:17 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:30 +0530
Subject: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX5sGnn3WLiFlK
 rBXFN/BRVx0zcR/k+uGHVcgfL/OWlT3koyaqTABOCsZ2INet5wG0KRE2YeG0Y67AcRlojwn2227
 TK53RTMTxW2p4NJ8Z+GEdTgUWNsdVG8=
X-Proofpoint-ORIG-GUID: imvk7-nMlKAUbjkCAxSSZRKoHhoyBnqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfX5nBEpP6LgqsI
 Gvbe146Sc6yuJIjI64eV4GWu3Gg0tf6vHJeT0bKkmmP/RlUzd07XDQMEQLkuXjgqQXX37bhUHlM
 GoRMlwks0A4YgenX6UmcXTkvG6TTiSsZefjoZ3hNcvpPFWRzzqIUbqcE0+kwlmKEyLLBamp+2j7
 YBBlw7fzGbvm3TDOTBQgXwxNsZ2md0iNIYXDw9ODx1Gaaxe/4OYJAVau2ff3kk6+E43eSWPLKvm
 ju4kCEEy8qRIqaFO1DyujNFSCTEl6vv0tj1rFb7Fis4oRS4L2oQtEzEaoRuWd81AriRktdMiAGf
 IzB0JTbWtC9zMgg8onXoIJfodIbm+MhAV2RHEdL77XpaIhKPSiVhqO5/tDFeIBcU3DR6jrYm5p+
 7pbmcmsMtDqJ8fbAVhlP99k8e/b1SHcE8/9USLr6piDBLnBbWL/qF4JapTD18nucIS21TUKXgsv
 iWdK1F7U8VXVXy2Kh6A==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf39cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l3K8MKQ1fDOuS62S88UA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: imvk7-nMlKAUbjkCAxSSZRKoHhoyBnqt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
GP_MND select the supported PDM source clock rates.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c  | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-qcs8300.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sa8775p.c | 20 ++++++++++++++++++++
 drivers/clk/qcom/gcc-sc7280.c  | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index e096af7d82bf558bedf524eb2ca959f3e9e5c22e..9b558ea023ad62e6d465155e21c54376d7b99732 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -1654,6 +1654,20 @@ static struct clk_branch gcc_pdm_ahb_clk = {
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
@@ -1662,6 +1676,11 @@ static struct clk_branch gcc_pdm_xo4_clk = {
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
@@ -2802,6 +2821,7 @@ static struct clk_regmap *gcc_qcs615_clocks[] = {
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
index 0e02af686614162dd7d5d9ab9f3a20c390ed0512..5ed3ec74b210807813f97120a4a19773f3f67d0d 100644
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
index 78399993cdcee225d2f21f39844b056193bdfca3..dc7a855be0234f6135d461175099862f2d486d9a 100644
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

-- 
2.34.1

