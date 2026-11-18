Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981794;
	b=Y9Z5BWrwNW6ts27YSMROp4Pu0C904EqejcLHaSE8BlUrWmMjyCijf3W/jZyvws6PbtgI
	 y4QGK7ijBndf+MDTiCNxBOwDkLwuerdii62UyKGRrNJ/9wuzivC8RZ2IeJ54AMWHcbAOk
	 sDh1CdgYIbivAD2WLswsIeGRiLpLBFNeniwmlZML9TbplcIC0qp+Xl1sN4KovoXysclYm
	 tFAnpKI3+DC90vLSCtMF/ciANfm5I0A7nyidNc1WLwe9e7i8JA199Qs7yB24bBu7FRthN
	 uN3Nm6w2N3dxp+OpIwCFVPg+xUlaukXuD1zQS2naqL1DwbfNmGJ8KYXx7LCO/i1Fz0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
	b=kZu8q7RoJrQQ2z+VresOC1i+ABTA8Kodz7Yx2p0/s2kHa137g46JU9E6ORBc7JzNHdw0
	 CCZMBHV0Q6fLAjPWcj/HWBl2sQ/hU+lA/bSsiRxE7/OUAz6CAZMiijUNCKR6Y1HC/Djpb
	 vgCLB9vqbIdK7P13WUrC16l2DFw/7wmOLOfcuzqblyNbTBol810oXhihoeMWhmOUe+vxg
	 XELbKYjMZliiVUCqZgljMKaUGU8YBQ3zPivScwrxKUXMn+PJMt26mW8aME7kv+LpTFoAA
	 8rOfeQ0BPNZtaqJIENBch0/55H4w5LHuuHzmIld3pTFdeqvNlV9/SNTamXP+2rafabw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A33606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCfXUpoN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EXxN4mHu
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uwsj2602450
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=; b=bCfXUpoNIdFsrTD2
	78cSneZxyRgsqgKbHlmT1xNF9jjjo9AER2ZPELbKCw3x0c0/y57F0nKLnlSED2LB
	lWqYEV/yhnwX8b4uLudgxpATOGc2hBV4AEeEM3oWikIYJpbqdrme2DHHRgc8/sFs
	z9Oo268/xX7aT1eAYESRUNaveYEx6ommV0ShBtBs6MZgmXapOxKTcjgIL6fSjHVa
	SPgyTwv07n3pOG2+/ThRQLSzXrDvGLF6XeuCS30JHnrbCjsCcRZp/30AByDajtPl
	hNHhwydUaj54qjZs88F6HH+lspM+w1uJqDTwo581FN0L4op7lJsm0v/mP47YBZvi
	9LieVA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv71fjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed00709df0so5691005ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981793; x=1795586593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=EXxN4mHusV6m5ZoObFBDWMKrG7VMjRZxaSPTyx5mNeUWTN8l5QGIUTOv14gyZnknGR
         vbEGKfvam9j5sRNN35/55rcG93C56cSAyVMP/gr9XW7gPUChgByc4edxhc+D51LpjMf4
         OWjTUfHiYlaNY3KAydzxZQjyHrb6XUdtzkeld9hCV5ofJCn9m3Cpew0ak9AlPAkO8w4N
         DPzpglmy2UwcoOYDctNtFxMCBcAqeE52Cqq0h71iBJacRep6Jsd8zO2K16N6zOd2Njcf
         OdPGV86/RfqO20KZ9u53fqFqEsMRKty0Vo8SRXZi5ev3ZJNMlhqGj9m0gJx7Ic/LTl97
         xAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981793; x=1795586593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yKJOOe7dxWQ0r5WNO8PdVxtOKxOpWeueu0z43hFM//o=;
        b=bQIViXoVsvj7A86qceOfoB0ybb+5LtJgilgIr3RllJN5RrkAMuHZT/dmRv03AVibBE
         m/aGwI6z1Uxd67kwpfPViEHXSXDsU8z9mC+NDJ6PLOp2HzlsLBexLmfdGoXTssTAq88J
         IxBRTBZAUiF4o0wKRYp7gQMhDkg6n8TD7D7V+/ey2QFiEx2AxhyKmDPuiHDvV9xyOZcz
         rSIGF+SyYsOb2krUhlN5cv56x2IqjrwWlxGnX8gOwzuUhIckOL/5e40OiDCxEL3T2ic/
         WxXp2BapY+d7Ulde3yXLC0LCHYPzAQkVpCFE0kaPj9p5Ik9D0R543sXUvl4NPei622/5
         yZ7w==
X-Forwarded-Encrypted: i=1; AL+hErGpeHN4EKDzf/3TC3ukfqU1E/8BqyMQdfkSolV+IHsBFDMij4yuZUG1HJjEo5Zhx7OrQMyPj1UiV0YN@vger.kernel.org
X-Gm-Message-State: APuU4Z+mGf/xWM+LfVATbMKOKED4qKxRPrLBP+GtKjCHfDcf4FD01bD6
	tQvqQeHZ2mJfchIt4Zf/YBhMF8EgDlTmh73bcrNVHZFTKjqTKo0t2H121brsVyNys0op6CL4Xwf
	/jh0LNXjXb5YWGSMe3e2A0y9fpxXmWtCvRfigmFiM1+lvQExJgfxxrRLNT30zzHVm
X-Gm-Gg: AZFdTZem1KurgKVZvwx3+QKydwHIPpSRtsajtE9/IY7uw67Cj/0jDSykcAVn/sLGkN+
	N9eN44hHA0Pucl4Mn5Xaf6Fh92X49Eco3CMBm6flrYL1nwDy+m3DVTXR1yhpXPFwQWKw5jTv+PL
	LBw0X3Mwd71h+hYs77dgmRWEME8vouneuQmhNHRQrXGQSvcT9c0LdKYdXCeUekRJ652jX0Mvffe
	SX8LGHuxxnDsuqzh/Bf5wX4IFHDFApJ2sFGgtm6vGpJ/Bd/bXDR186au7KV5fUZbYV2zatOh39+
	FgvlAYbUSsZ919LlK0PRcxlM2HdsFpZ4/s5/PjctmiAV+s9/JS/j76GTV/9uXipPrIwRqA7VgO5
	TCndiqh6Z0SkIS3nS+/51Jkv6K0z5hfIJRu09ZPRETtIFns2GOujB/2ebqtfJpg4vH5aD1T3N7A
	==
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105375ad.5.1794981792573;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
X-Received: by 2002:a17:903:943:b0:2e9:5714:6087 with SMTP id d9443c01a7336-2eff71f7733mr15105085ad.5.1794981792074;
        Tue, 17 Nov 2026 22:03:12 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:11 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:36 +0530
Subject: [PATCH 05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-5-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-GUID: r3J6qfzLTq1ekwR1LYNCkh6n4U_tAtQ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXyT4MBlryJF58
 tNeQ00zV56q80KVb/gTa5VQ2qqLC09R+yJhf+Txxw1jbNqJFsxP3JRk3T5qXpqygxgShMFOkFWZ
 5zgN3B1qxPPAk6Lo+VaAWrXtgEw0HAQ7gEQZPXUnnJcPsqx54EvkI/U0RgFqH/SzGyzndNWdvim
 ZaCMBZiB373M0xE/lNEFc6wGxg3T106BMInMlUbrWFJOUpYPWnDngx2U7jyTvDjtxU46Hml8RYf
 D7+I68Jddx/HvPV1D8LkCObktgyDQ49muO7vnBolbMzR5R2pnHd7JykMDFsAWlAf47PAoTVQYq+
 lVeJuHIrHngIDqYJKt7SG5wakHWASbGTY5f8IW7dkCMtcIg8QNnQooskGrA9LQWAq0h1JBvAEBU
 bPwhNWDY5e/UIhgqcNWkAU6AFEFAm3xcu3POxHhcz5+gdK00NAJSJ8D89Ds+dkW3xxAwAUaU3g4
 d1H+bRe5cjxD3cwy2iA==
X-Proofpoint-ORIG-GUID: r3J6qfzLTq1ekwR1LYNCkh6n4U_tAtQ7
X-Authority-Analysis: v=2.4 cv=H8xOUOYi c=1 sm=1 tr=0 ts=6afd3fa1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rOX_z413SjggttUJAysA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX44ZUp1LsTYn3
 7UFLP+tmv7quKq7ifIcG3IcPQABrotuWrQ5N3YdDbIHVRZNa6xNwQg2RtRZm36SYGOSzfW2LKXG
 Frq8MjpSg8691qkAn2Y9YEnFi3LnM6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the SC7280 TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio60.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index 5329fe2a439789ca1466577db26f56bc4c779d65..9ae7183976d3713affe2b798ff8e6ecb93f877db 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -75,7 +75,7 @@ $defs:
                 cmu_rng2, cmu_rng3, coex_uart1, cri_trng, cri_trng0,
                 cri_trng1, dbg_out, ddr_bist, ddr_pxi0, ddr_pxi1, dp_hot,
                 dp_lcd, edp_hot, edp_lcd, gcc_gp1, gcc_gp2, gcc_gp3,
-                gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
+                gp_mn, gpio, host2wlan_sol, ibi_i3c, jitter_bist, lpass_slimbus,
                 mdp_vsync, mdp_vsync0, mdp_vsync1, mdp_vsync2, mdp_vsync3,
                 mdp_vsync4, mdp_vsync5, mi2s0_data0, mi2s0_data1, mi2s0_sck,
                 mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,

-- 
2.34.1

