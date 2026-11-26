Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688498;
	b=3+9GdYOlZOM6BT+vNUcxPHFD7HovzjbiRakEOB7T3LgGi7qkL8SPCXh0DiS0vutIgZfM
	 aj3+sMVPwXCje9MKSRsmzC3GKNfFYzfVVQOh1W0LE4Jr1kLvGWlf/s234DY+e7A8prGRb
	 OrKGAa4wMIzFSrSEhAprFrxAJEayHkA1qOHqeBVNXwdpBck/ATK3e1VkUdMz8jsI1cvdR
	 DDz1SDVVCEsHO3JLRdjKq+SmZ4kLyUhnHyvC8z7FPSeVB2/K0NFROcT5ZCwmXkdM0isGp
	 NUpYbLRETFxF6Bt87q0NkrK1gtFID15yYIG6aCRjLese3vc+L0YblVw6c0Q3Mirk2Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
	b=vk0so0aVTbWClf2kngXGwgzcKR3PEgydHKz0vhB8OiY09xJ2IjThRDwMlxcQKvAxB65a
	 uahzQvaFLUAingQT7MOyudGEjFGfmONDNo3yUtSI/765koJpbqFzAgUmD/Adlsu4pED2q
	 JLQI7AaLgZ+7g3rH1uJEvOmcNvy/YYjRnD1MYwGsUU1UVzLop1V0KiRGxqkXHvyFCuToa
	 sndGnbW8SD4VUADnE0c0bg2eUsXPwKNN3r7yrvNB/d9WozPCtozeFdywNl3NmpQcoq9J3
	 GHS3ze1BES9oHt32Z5j1ARHaBDp2CvkmBYqq6WcBVw5CsHWZDWSQdeeFln62LahexcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C83606A327
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72C83606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MtKophfD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2Ui7lw3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AwrO2175591
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=; b=MtKophfD/5Z3lMMU
	r8YJ9EnDaDBPeuhGUDvY4hAmeFJ8m71b3qLt2Ji047XP1j8t8ev+0Tlpnl6pOD7W
	Fen2nhNwtYJpxS6hSQFp4MbdqjMz4C5phrpETqUB5+z4WNeJbau5DlOeQnoycfa7
	onF+eGonEOh7zaietG49+3WK5R89Xoh0E1bJ3YKWlGpeU+2YT7HrTwMWtLqiLYHX
	GksMy2G+9Nx3yNNI1ZDgPFwlR1aPhJQzy6VdnBdoUklghmYxv+ocn4MufJQPLBmH
	9bD84buRfIqT0wVswv2o4LY/diZR6DtpMCR37EbMMxa+niuM60KX3U8sS+CJFa6Z
	ne7G8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuyws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94961ed97d6so1147167585a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688497; x=1796293297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=J2Ui7lw3iwxOELnr/3FqRghwlN7R9LnNHNEL7Lbs7W4e2Go/GWMwM5vZc6EoxHngH6
         v4qQ2KorucLxpQPzCgxN/nqWDdua34PPSziAa42ZWAUicjfYGgPxV6uxUHHkpJMxv/cn
         3N1K+9KM+CtJNzC03MML6Bvp4GOCShSgrN5M2yjL4NXWQhsIICYNX9+1Eys4PiIRu3dl
         x9Q2yJYP6AYRSjR9Ngq8pPc5IL3nqrABAVPzcdwas68H+YN4ViEE/qeFBckebhp7omPC
         2uPvaPWLhgw6i5gAiBqHvFnNRWoYl0WhOUOOdhIC3wRBcVMLgp2FjH0kvOJT7AFUms6U
         B6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688497; x=1796293297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoLacu/d0T3T9dlA2chQ6qu01RnmW4rF5Z8YGrsmTEg=;
        b=jxNa+1QKX93uMU+5lHSxXMJu/5c6G71lcwj2/EZUJTyHiwsjU2hA3seJK9If7xJFqI
         x3xXm9s9Q2EpNcQ4CYqtewVM/TvmQ9wTjDWoC04OloPtED4IA5fhdYqAhmKg+uiSgRQt
         SjsB6PtWZi7uJJlGDQrIMLs7btyDGLenMYZRnVrXuu2/J3LhI9jKYuOrMbSD+9iquuDG
         eLaUVzpb8mXlsAAdn3iS9rRQpAqY5tB7jxepl+D1PnJzUG6RPAQmuhQknsUaQ4YeQxNT
         gykShHVvCNhQuMLzNdEvBSq5vaQR8sHJsb/qy1A/L47y4sGmJ5OUmXDZi8+IOKn8z6vq
         wqUQ==
X-Forwarded-Encrypted: i=1; AL+hErGTcFfnsE9NzcX1gcCA/G3wk9JCaiYNhPwQswQmUF2anGdqixEV1MPTknUD0rBLoOiF3KYuDx15fdp8@vger.kernel.org
X-Gm-Message-State: APuU4Z/yfiVqTGGkaBr7z4W19re8/CHftDH8Viliq7WhEVZvwWBoCYJj
	Hh4C/oS2m9itd/YZwAVOugsrpsjkL/cZYqvGrak1XpdTFyt6hhhRucEiZ+wabXEVcbbqapdgk9Q
	7LuzFkk+0jxkFf1i/KkpP5ZZHzlVfL32ZdwpBW34R3CRfqs9gwfANf4lGDF9PlYUe
X-Gm-Gg: AZFdTZfeiYmoULs7siw9hEa0k1y4Sh0ycR40DsP/KFGcVrTmIdxp4MrPEklQgBN22UL
	Ohz5IejbHKxasQ5i0LrD78XwBdVqarJOl01g1740r8M/2MSDJygLhYQ4V/TV6iQnveuVWHQv0kP
	evg8J46bH6XYt1J3foprbHBk92enFBgAFYxbqKZro8ATddUtuwVmKya2xkvnKaXzEHX+2vSW/jl
	rENlDYLEA1r1xUBiZx9jSREnxjTUSmAsVqpyFDjDrdiDGKGyP9Z2bzS0q5+qHeT/d+k1ZhujvWI
	6SwLwTBNSJi/eZyC4MzadUaOskxjNPKoTne7ME542vXWp3z7tWDPcoddRW5aPrScDDR/y+TJpin
	40mdCHOXPqAUAeFl6mJOj6qkLsF2GoIYqb4PEbwcPsEBrIxQRAl+lGIj1YEckZyRUUQatsVp3x4
	kWD93xGhsXxB7EiXS76SUmmX6l1ekHZb4V1Ypxu52yYL9Hoy3Id4x40GPW0WXKc4Q=
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114311785a.41.1795688496663;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
X-Received: by 2002:a05:620a:a982:20b0:949:ca77:6d7a with SMTP id af79cd13be357-949ca7774a5mr2114310285a.41.1795688496267;
        Thu, 26 Nov 2026 02:21:36 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:14 +0100
Subject: [PATCH v2 10/11] dt-bindings: pinctrl: qcom,sm8550-tlmm: add the
 egpio function
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-10-521fb057d3bd@oss.qualcomm.com>
References: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
In-Reply-To: <20261126-qcom-pinctrl-egpio-v2-0-521fb057d3bd@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/dsb1sgncorSisEr/533isCV/S/Q67kIN+W0RZxWI0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgUAfXCXUk9JKWIX+PPxot4wrr3TyLnqq2gp
 3c2iCK1XrmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIFAAKCRAFnS7L/zaE
 w8JqD/4tlVYPJ2epuNXfctx2OeLhA+8n/0hN8gk7xHPrYnmErai47qkAOv21DFbkngCalRfgWfn
 MP26F86xxYngJtDUn7yHwUjWko6h2RqACiFdTKkLbLVHKfPp4z3anfhsgp0bADlFPUIhK0OSY0a
 KLyMZwFaHjqX+p0FBSSRDw/e2bFZYjrf43IH6k+RLN0pDOJa6IwN/Z5e3IYVIn+JaJiDYOsF2Ab
 6aYbgKPRg8vevcyy/C2E3PcaR7/CDUvZ0rCXAgrMFIYa63WV1DZIbaOhQLJB2V6cJoM9WrW4tFF
 6gQrXnwjZ+svOPKEE0pHhJrogMIRA5GGoJkqdZyEtWSp2KHxm0OnJTS2/ro4GsvfV+p+27iRR7m
 AnMU1H7koEhXCKdBbMYdV3tbBVoKVpsVEkUcyTRsIHg+93pWGz85FTZ1M38thHGhC4FiOW/Ckgh
 hSInK755Av0mGIj7s5+29omNXJlvBE1IVwU+M3O3c4Tq3/+iD9nDg1XZH2NGDrDzFFRIOvzBgoq
 RDffSRDvGzcTlkzanN016NtNscNC/aTlrXKcsEIH0iBGc6qTeaias9XT6lq0SvutWaCf8k782MC
 Sdwvs/TdpD/mLRTlCg3woOY/u1mW/6HJgrn9pO/f5St6mN9Eng2CnyWTHGq96wqnjJxAFvYF9sc
 6TYc9sTD7/JBtKQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: dKNpJLKFD6Z-k3c0CNlTwhkFJHFLe5QN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX1QDuwocKLxXE
 qn3Xoqi06+3LEhDdeRicDKff4tWiwuXIx2GACBuwOe50h7MASBTkevJRkBpI5z2yv1eYPtBHH8j
 +InX+NMXUfdyiAiaoCSQJ8eeMtOqvVo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3OwAFSvOl75E
 8epEe9Ah5TN0U0guqTNfqf57koAI9yRX8Fi6+fiNnqRyfrB8JlZtgvJKj1UurTamUL0z5Cla1ZT
 Z/C2NHtpIMlNthS3kUVw3/VyKQA/1AOzHfP6itUp9OXQLo/Voq7MQ19Ct3JmbB/Ba2MvTx7JT5X
 K9wfc2dJiWmJdfZLhE7WqgEPYOdyk26u5VUJguezid9xGcNVt4wPVgGxoWeJHHdV9aMjABO/hvt
 1vsbkPvKQX5B9YZkbNHuENAiqLJkj01xOdDdEdH6rpUpVPo3jIkhugdKDzfUAz0pNemaQn84f0p
 bDhMx5A52r/OW1N6ex2h/ViR56oS5EOSGyO4v+IkYGvksR0vf5rN6vpGAUvkWhWPuguazfa3P8M
 T78ClYruYORRzr2f6M1oXHuWzBemx0z55gYZwK4oQr+vT2bX3/Mty9v6Ql5XseHX3RwBwMIKMOk
 aRnIH+VpxzJ6nrpHicA==
X-Proofpoint-ORIG-GUID: dKNpJLKFD6Z-k3c0CNlTwhkFJHFLe5QN
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080831 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nBsi83mCGTvHtYwPD4MA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

GPIO 120 and GPIOs 165-209 on sm8550 can be handed over to the LPASS or
SSC island using the egpio function. Add it to the binding.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
index c2ae79df424fda1be7f8be2b2c3d304df9040c60..8c0c677d7fd7f51de62d4cacfbd429789e04878d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml
@@ -74,7 +74,7 @@ $defs:
                 cri_trng, dbg_out_clk, ddr_bist_complete,
                 ddr_bist_fail, ddr_bist_start, ddr_bist_stop,
                 ddr_pxi0, ddr_pxi1, ddr_pxi2, ddr_pxi3, dp_hot,
-                gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
+                egpio, gcc_gp1, gcc_gp2, gcc_gp3, gpio, i2chub0_se0,
                 i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4,
                 i2chub0_se5, i2chub0_se6, i2chub0_se7, i2chub0_se8,
                 i2chub0_se9, i2s0_data0, i2s0_data1, i2s0_sck,

-- 
2.47.3

