Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981832;
	b=lV4ObEJiVOpEGBsdwzK9q3/wM/vtNIPWMevyu3lkqDF1y3NOKkPlJwg2N76gIEgdagXd
	 IKZVDRQvl/gxlSVpdcIMT2pI1fJvLKJrEff+h5Vk+nOfTyeDiUTgs594XyfnunwpHERS8
	 lcVJCw5RTYUkdSMJS0aTDUpvkWtH1wf92yRUKjYn6LHXLNMcDAaJq1dyfRtTWdq4U/UXv
	 VbxcuSywhqAQm7D8DGj3nUKSbzLND0f36MVJTvxXSaYFq1pAhty9qTe/T0i2bMNevA8S5
	 OZl9xJ9wM8mv04Nv1Pf3DOFcClio+62nQoaGnnsMi5+jqtlR9rAdDdlev2nhm4ED9PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
	b=KXBv3tutwCaSSu2Hm9eQY12q+xz8AWREGGHfwGXKpYvT8aPR15oT1FR/V41YXtpUrIgJ
	 XyVKdRV2GG/WJd1Rx06vDEmPU86Tyk4AeO2ke/NB64i6z3RiwDGlYk7PUgW6YBq8moN9P
	 rSU3g/xtot5FeV6pBIDYtxpcHKxJRDYx/o6oxFauvc4S8bbKhAhr8JlYsswAzsVgfK+Rs
	 cyKr8UMk7tqAuyW+ZzU1tIld6xTLRtdf29nTia0lVKytZcd99frnWPj6fBAi1UszYBDkb
	 exJV0Pb+RZOojK9eURbfBQaXBtqRlF7vpfx37e74rHv8c0nxqj9xSkGdUsYxNnIxSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C511606A337
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C511606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZYorhPEm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q7W+jj9Q
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Vfow2107748
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=; b=ZYorhPEm7sZKzcvR
	73Hi0ohJQQTWnO7B7Qm42Wt5XnrWHizxkW3JeeGlEfFrhHslC1IcbCeHtzAv2+/c
	UbtY7moUdeGrhi05bn3U86CzWvl5ih8tJ2sldslBhTY1eyseBmgy2AMnbnhPpYj5
	nOSJY6WzHgjmtn2W7s7Zoht00ZIPJ/n10xupzbdc6eDEPxciXm1V3FJyC8jM3uD7
	QTrAOyU2wjAekFjILTe+kCVCm1QBgWkqAVxaRI8hdhBLAcLGXBqA7rwXB5gUyRPH
	ZEPjWuAkejnKrYrGrqmRzxwnw49n2lLdnKDPIAMDpdrndLfa4g352YYaNOZf+lnq
	oRDujg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8seam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efdc35736bso8904525ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981830; x=1795586630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=Q7W+jj9Q3RbdGoHtjsaHSx/z+2yqQPyx+sP7JbIPIZpoI8tt2zpf7qBgLySkFLXyGG
         f4CUf1JnvKIwY7ourblEl9uIlFsKgaSR8OMxpOhIZjm4iBlj0/YuY/q3mIXWRYTU65Cm
         0Dzts+gANeaF3iTlniRd3Ct1RrskS6slN5/kGponlgRSykVlwKMJJmqNfMngx028vVT4
         x8fyM/gcf5ETmiK7Mx/UT5hlFSXFmNNpOWqpweCq/zpDD/qKR3/LBQPTibhETRG0/U8s
         4zQFbk+iD8UiCjtdt/dufB8eGiJsi8qMF8H/Y21H04la3MShbF2+ITlAT3Fg6hyiC8gA
         4w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981830; x=1795586630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nYekTVFm6d6RbHh7IFm/4vB6jiLnyemYwj+2xYZlLhQ=;
        b=UNJK5DKXxXSOE0MPn1mSLnCP1c8ywOj4AYKqzpNa46CF5OHeZ3BpcY5DQc6xw4/6v+
         I8hh9NtESJUftdSUs6eCkZt1rps/Fpuc7reJc1cUH79K7YecCjVgHIrqq04QhiKrC6CF
         Rn23UbezpdUuK+gFRq5aylEU3b6AKb8J4skFeXesb2NWgnhUTB11Vc467Fc09YXrF/d5
         zs5cR6JfOCYG5ET5Y2mtR1vrvK1sKfEAngz+qKenHQD0h86i4391uY2VHRoFCceBYjkC
         S0ywppFI8/lxYV4jRuGrdhQ/k6/qXRp4U/pu9vxlJedEDEG+5hH8rggTYNBnaercjdun
         SSQA==
X-Forwarded-Encrypted: i=1; AL+hErEeDU85r+Pp7Aqo6ojLN7zQIuWb8J9gTcS03kShFEP76vOQy8IwaAv9RFRBqPIT95mfyMt56/dLJrX6@vger.kernel.org
X-Gm-Message-State: APuU4Z+viwd+FTc36S/rECMPFbQJ/LRApOO0L40ROtZXV7hAXNwjJOQV
	6VgU3aqMwUsAnpTOwUc0lcmeho9/3QXb3mwb23LVLAdsp8MTef4a9Fg1s/9dbnw6WziiH4/ADWN
	7OnenJAx2R+76Uk4wgrxTQQWyL6eG91MJ0Y7mFIobZth9fO5Q0jDls3yTLtnA9cTn
X-Gm-Gg: AZFdTZe+OOpphcbvsW+SF9CzepjD9jKMXsL6Uplnq9tH1fKxgTYdFMD5vSWtq4gs7X0
	xeSv0wwiKW7G3Ll4HzaYnVqTBjEGhdMLUdlsJBK2nmurt+KcUqrS0UAwZPZ7jAScAI6OxedCZg7
	0GxVm4cMudUupNWiUr/2EF6nh2j/pd91MjJudH6pgl/EYgeW973CR5m5cR1dC+fK4bWE8YZ2l3X
	JJ4W+mqyYgbh202pQMP8AdW+WyqxcD5BBGa9UnDZ6HS4rEkfzVb3JWgTADxBdRthLVqwm3KbbPq
	j+v1r+mxXGfC1UKf9H72V4fxbrUQ6cZs9RcKjIsscBzbx0kg2wFH8jDw3yl9RhN4Fcjmat7jo1G
	1Yi0JY1KJCLZAsvLuncCw3Y0CUVoSVJd2FM/n9OWhX2FCRO6Dg6eWb8ovPUfRPW021ITxA+EmvQ
	==
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550525ad.61.1794981829967;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
X-Received: by 2002:a17:903:ac8:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2eff7574fbemr14550345ad.61.1794981829476;
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:49 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:42 +0530
Subject: [PATCH 11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-11-703f7badd194@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: o9gI_MNsMisgSRDglSy8Wgsc51bw6ura
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX/JlXgEP3FluY
 k8KRL9JFPabSeuli3fyxj9xPJupz87acjyOnCZPZqAfg9iinkk0+aIN4WrHnQMUC26lYH1BR9rX
 Xe3QcOLn/A9vdwurpGMk5e2ZZ7MoEyQ=
X-Proofpoint-GUID: o9gI_MNsMisgSRDglSy8Wgsc51bw6ura
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfXz+15ynnJDKPr
 hnU5m8PuZ29zLbYHRO3s0Gi7+FfIA1iQLI5l7l7Ksb6HCkAke8oC0polVlumnGpxCEpg9zw7jKQ
 3ZpjkkS6RHeur8mW6C+yywgK+vtFwe4ZUWJ6yrJLpS0nSnLhzQ1S3nQasjyu7pGqbLVx4vus1Fo
 KOCRwn9BiO7T/zzve2oKA98KOUEXC5tehq0dMZdWGLOK4Dpw1vtLvGd5LnX++pKML5PkVQY2nnE
 fRd+dHzr5T1KSmrOuFIrTPP3CYc++mzca+eNSgWjIeSOyXwZIlq+DmfppQ2b//i0xlXsYdYPxnw
 71v4SJFAmax1OTqRT/IUX0XqvicVFs5Bpn5fAp1TajO065BgR3iR19iEguSaR9CdovmQ6tBvchH
 rxBZfSjVpCrHO3NLz0Q4q3rK3lVm5n2PiJW+qsEqiaFQfu5eFWBdLQt2ZlkNBI8uZ6s8UjHRDs3
 xtjjqasjD+1VsgaWNUQ==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd3fc6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YsnPb_3J17WYr9j2Th8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function to the Kaanapali TLMM function enum. This
exposes the GP M/N divider clock output and is used on gpio53.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
index ea7d4768483df5a3b5b8fa85a686cb9f8192e673..c9406a9ddfc54746da2b38ea1f02fd117a472c5c 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kaanapali-tlmm.yaml
@@ -73,7 +73,8 @@ $defs:
                 coex_uart2_tx, dbg_out_clk, ddr_bist_complete, ddr_bist_fail,
                 ddr_bist_start, ddr_bist_stop, ddr_pxi0, ddr_pxi1, ddr_pxi2,
                 ddr_pxi3, dp_hot, egpio, gcc_gp1, gcc_gp2, gcc_gp3, gnss_adc0,
-                gnss_adc1, i2chub0_se0, i2chub0_se1, i2chub0_se2, i2chub0_se3,
+                gnss_adc1, gp_mn, i2chub0_se0, i2chub0_se1, i2chub0_se2,
+                i2chub0_se3,
                 i2chub0_se4, i2s0_data0, i2s0_data1, i2s0_sck, i2s0_ws,
                 i2s1_data0, i2s1_data1, i2s1_sck, i2s1_ws, ibi_i3c, jitter_bist,
                 mdp_esync0_out, mdp_esync1_out, mdp_vsync, mdp_vsync0_out,

-- 
2.34.1

