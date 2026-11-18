Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981844;
	b=ISTNzGrk6BzKMzOJL3Wdd1BXMc44NmeKl6zB2+oAP0hkGSty51v6X6q+FR0nxVg55kG9
	 e5tdyEf9Bkbg7ojY4pY/ZFxIsC5mr9ds70yPeCKnrGGL/9Jktb1DG3VdpuHPdnwmMO6Vx
	 b9ulZVAJvyA+yJw3wMnOI+5VqgU3R3c25Ms6FCY3aWjsTOLgi4zy8ahyjERVRjsoiInOe
	 1YP/vqBY0U6MHLmcdbSBA3qjrziyBsji+VOQ/m6eW/EUIGcn6T1auYF42mYZIw/u2BRoT
	 qtgPAjYizHoniOPhtgiHfAE+L/Od8VMhXE9j0eazMtweTaHAu896z8+zPrjtpq3kz4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
	b=RpJu++V0s5DrmzyCceroJJutx6tqi8SooBUExB1NE+fEBqNnIL2AL9filqQJHUfmeRzZ
	 jghVyTcYfx01a6OvCcdNQQ7Kb/39r9zghuct+aYiRrDlaKB+hb/NDPD5ChRUrI7Dn//ZE
	 veQ6Ogw+ZcRfbN3YAywIBVPUqHnV/W6vd4nHzP2bOPJ6PInw9PpumSlpEiyl/hihoHl0f
	 EDkEy0HS2ALUqhIqypQcbdNrBxPQa6Wld/UaiaTeKhNDG3lAlvTHUmKLRMVQ2cbTMxhoX
	 L7fyoR3erJXecQP/g7IQlByO8qBtDwmgN1YjsEeFxI2Jqomi80f6LYZLm2QQNyzEXYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E06F606A336
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E06F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ODLzB9Nz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kKFJ1+8p
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2VH2106321
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=; b=ODLzB9NzsoR0lNEF
	ZzoB+jPo4bPp/S9ZPjHgDQfiR8lRs4YfiF6K9wgkdfE4voD+Tn5MEngRfXWG0OEe
	or1JoL3J0BO/86N4h2fmbMrFJRDgePzcDrEuq2ijOLzMqW9svSyq9lFl6lqaTEd4
	jR4pTs+yGsBh1TOg4LYOlZuaOZ+esBe/EDvHHzcg87BnYpvsJt3EphedWoFfupDD
	N/Xivm7+zxJQcIXXaUAAzHRs/DnGddEYiE5TKrO+mfUE/FLWPDc8xbD9jbOEpCJL
	syPP1P8OLo0Tx4izNSaskD+SVptgji8jo33RwaXQvZOuSeRPN16hEeN+mFvw2ITv
	6rGWCQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8sebe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:04:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2efdd509c6bso8232135ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981842; x=1795586642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=kKFJ1+8p8sfR5rqK/G824nBJF6Lwj1LHFDtBJbRxlL1Yxo7VEFIDJ5HH48iNTnqzK7
         bS6qDTcPaGHDvTwbKOd+1M/RCOujeuJzBCUkBaxNClp3SWas/mCde04S/DavsrgFAR8z
         K+ssWDPEswSu7Lhscb77VcXtfjuiMFrCFT0U8n+u5JClNSXZYOX3TGeJQaUaudDzM5cR
         WKDj4xXOQTGHTPOBbVsIroR3JVjl7J8m3lDqcawv51DmVI/8N086UHp9t6BFWjKB4Vc3
         3uEWmKwHU7VgehrYjcWshcCBU8hWI2jBlhYV4UdVkJSZjfydfV0M9RWxJx8L7KsbRg82
         AOAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981842; x=1795586642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0ZwDTIgbYaBgfjg7LiDdgZsPVxBbkeCINB2HYSUblw=;
        b=R/bssTGz8ljxFkHuME9iTtVr//grQs8y5xV8gvhzNmdCe0yY2iW05IWKQFZHKIvOfM
         m6SIjHeFpIn+uXhF7q4dbjvVdIA/x3OxZ4RKF1MyN81hE/XZTO2q3jlXis2I+u0T3Ljg
         MWxQl0b8l3J6LHIEoc5vp8FhcbfM1boOM6sjYIEaVw495TXx4jBpEwwe7JhmNV+4Pt7l
         GHAxuOcJNnPepE81TAs4dLsiQHrSK1vLnhAM0QeyRiijQa5iQnWauMmxZD2s38m61KYP
         kLGj/rBTNcyr/PpS6uddqdOEGIOJMAhS/r3tiod7k16UhUSQedHC2fDdpAyB0B5EBub5
         8mOA==
X-Forwarded-Encrypted: i=1; AL+hErEcUsy21N5NUP/2OYHwtcytrvZjOlrhUL6hC0NF1PvoRAuwdUJRbEl40YR7zK3bWzyOHs+BWTqb6F0Y@vger.kernel.org
X-Gm-Message-State: APuU4Z+uxg704st74qBBZDIXr7+j627mNWAFpLljiBIM3uslVW90lke8
	6dG/Xig6hwuYhLZ2NJkjAYgFqRK2MaswLpR79boVZXMXcyb9Degmzu7N8mUSXg1DE+sMRCJxzMn
	DvZBgeaCs0YdZOabeY1u6flMzDcxU53pl9XQTdhOLioezY6AfbBpRtOVyJXIGW0D4
X-Gm-Gg: AZFdTZf10EGmXmeJKTg3ZVppJfynNlMXBZ1SeRPLmwnS7QfZ7vr9cbdMsJ4zyFWt9O0
	7fdA1kWjAaXR3Lio3e3xdBUtSWLFXpuQOgfWz3rUMPAK8Ls2NEyRMY5RQPfxF9WtWs+fvd2cPn/
	JOty2RjQ5oTAb9LI31RFbYQ4hxKpbNbFZnjZypoaJ4a3EJLQf5Q1LgcwJPqi/s3xfBoHmvDRTtx
	kl7M9dzFyKhogCm0Rr1j3PD3CbEGFbCqD7hn3Vhjvo2zTba2WSyfGbDP6Cg9PN4N7UomL5VBVpH
	ZSnY+NY7HRtbL3iFL1pBZtac+Jqpf4MnDQdfgHMfow3DwFbevQF6Hc76OZaruV+d/b+m5H3jQIx
	jfgsqrGcMIatFLMmy008J34FV0xkD/uDog95DKxGzWEWaq4NZLQaRzrGEorwuoHMUtwQMBMocJg
	==
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415465ad.53.1794981842020;
        Tue, 17 Nov 2026 22:04:02 -0800 (PST)
X-Received: by 2002:a17:903:234e:b0:2e9:4d9f:a65b with SMTP id d9443c01a7336-2eff75424cbmr16415195ad.53.1794981841573;
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:04:01 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:44 +0530
Subject: [PATCH 13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-13-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: UjM9OiwW8ASvUxiDBfLxc5zDvCS1MJnO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXzagOPWRzuU9t
 Lw2n2cWZ/X38iDhAZ6oYPWX6mg4UsJmFIrQpsStlMiYPTw4OVxu/A9htziEP8FJeBHK6IPFDFke
 SSkh+OMTmqPV5+9eG3B73lBQCchBAKc=
X-Proofpoint-GUID: UjM9OiwW8ASvUxiDBfLxc5zDvCS1MJnO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX3RZKsEaFYtgz
 Egbx6eo885HM3TZqyYdc+ppf0nWzBx6DWuzYJcTEbbA37Y5oey7eJ17iYDgLWRu30kVKI1e0WXr
 n20AYTI0oANQeWjXRwbNA6l21+KtrTBeQPBMU/XSFS5abO+BzeWJDbLfrvRJF7PLrzKAIRy7opW
 5xani51LhPI6wV4OnXin4bk8e3h1Z9rb2rb9NvnrHIiT4HRMhQQ89Wfh/RhjLTgmnSVYsaf1X0G
 zpEYq75EmtBGnijMTWcQlXZkuY1NFypS72s/oqYHEHpIgdZLOqd1mEiSDoXlNauMqKV2Hd8ReOC
 o6czHrOLW7yZwzAVKGwNgDdNNKA4ghZo6npYTu8Z/PDwm6fleOqFnSAweJTuOjyQ9//T/USHbAg
 bjr/uJFbiqNXPj6v+bX/u5LFDqDy11xnri983qS8LVBhjUmKC06ors0xxsg9jqG7fF5ctz0ieoT
 jdZZDhCKryZZ9ZIAE2Q==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fd3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Glymur TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index 2836a1a105798a8bb5a38244f7cbf8db350b755e..6bb572640256d3cba2a6dc7571acba85dae57440 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -75,7 +75,7 @@ $defs:
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop, ddr_pxi,
                 edp0_hot, edp0_lcd, edp1_lcd, egpio, eusb0_ac_en, eusb1_ac_en,
                 eusb2_ac_en, eusb3_ac_en, eusb5_ac_en, eusb6_ac_en, gcc_gp1,
-                gcc_gp2, gcc_gp3, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
+                gcc_gp2, gcc_gp3, gp_mn, host2wlan_sol, i2c0_s_scl, i2c0_s_sda,
                 i2s0_data, i2s0_sck, i2s0_ws, i2s1_data, i2s1_sck, i2s1_ws,
                 ibi_i3c, jitter_bist, mdp_vsync_out, mdp_vsync_e, mdp_vsync_p,
                 mdp_vsync_s, pcie3a_clk, pcie3a_rst_n, pcie3b_clk,

-- 
2.34.1

