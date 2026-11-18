Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981801;
	b=BRMdPln6GqfuorG1yy0m+6lldK+FNP7s3t3HXDsXi7FKCW/HSSc6BvodXIOX9c3u9oey
	 aN/vc8qCPePKmeeI1bCrYs/7VJc5WM4gm2uY0XukX79IBXpDkT8DXc9/6oNDvh1Nxu2Kb
	 a4WLKCZrbReT5kcnN6tRgFMowrmmTX1yitYySgzG7D2DJIcvArY5AUT0qf41f2d8TmPyT
	 MC0Fu6fY/GUKk8iX+syiP/JNMcCukdS39DlvyFoFRah+GSUgdjlYUwxnfO4h51kuPUhyZ
	 Z9nWelRwIiWZyZgrhGgEC7SNHe8HydfvveCTmlXkMkH/T9wbIUMQS2sLGBq/x4BfoHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=10mKyx4V3CQJ/EZ2hX72otqeDFSMIKLgAXjzCp+ueNEjh5NDpOHuZn/Pt1GPZylFhuH0
	 3hxGX14iZr+gH83BiTFqWf6q+tQ2QyqT7jSLdn5Kjr2xrqpqn6+Igx5HNRmigIeDRpqPF
	 /bcLr2VjL4saFzJzRqYqVKCxzzrE6riLm4gI+LsYQkJ/fSSUDnFGz1xx3cmt/1RuSXrc6
	 +dNXkjvs9Se7hZE1J0XA11QZq0znScoU0MlV2l1wMAqfWebR5ttwYUDcPQZQZmtse+FMY
	 XL6ou/4dy9r4I4uJz7FRI2ApvhTOg1aksblAjCSyLwlrXcCUMpPt3MhZVos52X4/muw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319E606A332
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2319E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EKygsBqE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TcVvAXao
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V33g2453769
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=EKygsBqEsQzDW286
	tT03SPglrOUIoulYqIuzHpEu5MlW20/dEf+6W+VN4/r7IuXLHFP4Hqrf3i31U+bO
	Bvnn7107/uhMixlJi6mCc32jIJCJNpc59WrXf/upDybP4rhs3pr3pCDkHI6Nib1i
	NtKairIgV/cOAmJJl/V0p4kp/XHs5RPh0M5/8blqXZLNLW/i156JMp3FEP2XGQKi
	wp0ZUbSW4/5NhD/hnQW9FvRmi3U95bnvyEeiDa3/5cn7+12WqDAuUQtm3LtU+xUe
	rJjZ3+MpaCd9jbZtG2ZlEzXx3QXYMbHiqNXwX47CSikb9cnCR5lQ6KU59gf553wU
	D/XVMQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99eqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 06:03:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2efdc35736bso8900885ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 22:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981799; x=1795586599; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=TcVvAXaocsauzxzkvx0D6ro9G6UimTqHnj57Bnlp/w9XwIKTFmDDGro6GUyM4xgc4Y
         FmQKWQ6lu04IVVF5QKsJoGTeZdicEhuaH2yraS8jmwCh9S1Jpg3tpYWVQHllF6w5WVkA
         2DTWQYfYHJv+ytQCKVmMK0xJ0cq1Z1/FeVyh/L2d+mSIiGVdLm6MrnF0UMGDHOQXDzdI
         SRqvMT7ASak89kBpSxXbyaxvyRFQ01sz++RqHUyYsloREuvHc53XvsvXmuQMvZAtfmqt
         rfCU3TUcBhXQEAorX5Q+nhtuVi6NzB0fvv1xA7PYH3Iy2K0rU0mZrnTuRi99SciMOCRK
         Yu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981799; x=1795586599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=JI7h3ZO+saeGpFXSQGJwQO306DsgEyb1XV2FjYdFw6O95Ug3JutrsQZSK3XOetZ1Q9
         hjIKY6KuFNA8ZDEXYgEUO8DNTWVlbEEguh5wbr/w9Ryjt6jEgymBloYWhoaSXAi/T7FN
         MxWjOh+C3PfRoj3Oqq5XxgIwhLr11fZblasudmhh0x5sFsOXEOT7Ar3M/EqGdXcYZ3hK
         76g5kUT7VwxJeeAUm/9wSZH3ki2pMz8GJrfohK0TVPgyxzDopba5TZPtFM7fwE0klTHv
         yM1n4AgR0Ij4kXpFVFFpL4PYzA0N+SAMgRjhfp8auaIP1Kj3SrKmXWLW6iPME2xWFxsA
         he+w==
X-Forwarded-Encrypted: i=1; AL+hErFt/nPuNrOftbEISqCeiJYuWzQdj1SQ/1SGbK+RgX6yPvTJk1dsUuSNFricz+klZ+609ebVOhue6Ig0@vger.kernel.org
X-Gm-Message-State: APuU4Z8+uBlIagc0iAoYo0qLuIWV645FhtCTGsMuaijAD+HdwmtuPAUx
	Tycex4/x6HJrvsFsUT1fAXGdUK+oll3L3EFfxwdD6ayb1rSUL1XVmQsBQBO8XgH5E0kOumUngY/
	teFMIDZ0xqBrDXhvhIHMhoJ5biAZUHzdFVbc0HiB2Cr2PHNXVLuFSSXscyng0oAZ3
X-Gm-Gg: AZFdTZf/tddRnI6R3mrrG7E3jdTZXKgAj7+u6+DF1PTIQJgn9DlWOewKRtAA5MDciIM
	UOPzs35HDYX9P9Al0pWXrxP1CRsHVtCdUWHG6bnE16DWlLg39fXilwtjpm3d4Xri45Uj6Dw8er2
	u+unvTsk+QFpFDo22n4h0+NuUlvmTdhbc8/94AEiyZ5/vPb37+5VkzsgPCoPoda3TQopKPOyiS/
	5BkvI8PFs+DzW76vI9aIVJYR6Vjfxst8Vapxk5EwoRnxvU/XA0WDwSnH+KjuXRGA5Og0vKVN1m2
	048RNItlYq5l5Am50phlwpWFSbC9KX2Vdp5vO+cajzD6ZPVpZAQCUcLYpUZnWv/GytqSNYLhVld
	eBMReNo48ck865fWSKKM8T5H9CEBc6lzbBmPydMGvq7dAXAGtJ19Y8s5BFvpOUYZxCkEkijNhtQ
	==
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388395ad.15.1794981798964;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
X-Received: by 2002:a17:902:ec91:b0:2ef:dfbe:6380 with SMTP id d9443c01a7336-2eff72f34e6mr17388155ad.15.1794981798497;
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:18 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:37 +0530
Subject: [PATCH 06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-6-703f7badd194@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX2ured8bfrQQ0
 jJj53Nydmg7F6iX+O9z5B/eUfL6BbIoQ17Yg013/zqEy5S7nR03R+yOXJDxQta4C4Qu6HgSlrzD
 21XZlkCHszSqwbxFqlQN3H0imcro3bI=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd3fa7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX8ZXu0LThHNDs
 Npq8OvvKKXtV2zuu/IyEryTTTr7DxNsZbD2WBkRoBRzVgkwFFClNWgmpkUfwTgbHgKEkmCRi7rT
 NXUBw+ErSPdHmIEKipfo2WhEN+YYBu7HinfQj3k/qqDJKhPx5LuxTq6/iQhHoN7z52yhghqhYtW
 TXlIo3WwT1Zh2xNmaEwdrYLfBMLz5kfy1Dd8dtDVHL4hvhQ1NR+Htal8A7mLZLXqvmSkDRMHjTT
 pwI6jwo5eUx0gV60Wq0eowCqPe2teS4LQC2WNNRIinebLBxcf3OkLVpzC1Cy41em02wZr6pjys4
 WzYaigeDR2Q2bKv5dVSLru4vNhTlwY7Ui1Tzw57ypVl709up2KtJLjkSwW3yAJPKte5nbR37/8X
 YC2UfZJFOBImu7E+TKfqQVY7iPIn/ppWZTo7qbu9MvuUB2hFk0wAtLQYq4ZGVHRpGNdj9FXfdE4
 r+Jc9Zl426v2Smvh0gA==
X-Proofpoint-ORIG-GUID: kWDeR2TQBNgCXGL4JbNff-ntCk7zHir5
X-Proofpoint-GUID: kWDeR2TQBNgCXGL4JbNff-ntCk7zHir5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

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

