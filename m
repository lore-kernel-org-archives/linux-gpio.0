Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3833D39DBE5
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jul 2026 09:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416147; cv=none; b=GxarqKIV6IdjwWctwGmNZxLdBIgCrKBwCqHH3FQDs8fIb02Co78kzCVec5VlzAnvPE9yFgp6eJzsgx9fCskXl9BRxy8yjbrhHNeR+4KrwcahUon+Qkl8+JUwwxFlnzyjpLhnZTxtqMsulFEx7lRS41UNm3JlxiWNfHQa3XnQTws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416147; c=relaxed/simple;
	bh=+zdxqnUzVVwVmPfgJdWophcivI4Bna3lX7GI6iIVmS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E0pBxRZlRpGp1AETHRScaMPMA8024epcAO/a1JqqTavu8O+Y1/51YIHBETfCFiyM0mZiaUOpKUX2FofMO5aD24Uf5zETu+otnxOlDhbaDJ8x8B3obJ6752TZbVMBpOsJBn0aNHqeiL2LtUG7vBQfzXDDSzMqS5bSwFsyP50KOA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A33hAdDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E89PIy9o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A33hAdDo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E89PIy9o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DlWF3182185
	for <linux-gpio@vger.kernel.org>; Tue, 7 Jul 2026 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=; b=A33hAdDowc5NJqpP
	5DMWGKTipMGFwnMnHmobAOrE1GdzQYaoJRsrJdAni7cxegsj+0X/Oa4z8Ur1WJXa
	u70KIwVjomQksDC/SW7BKeJOeqetz5QpuzqgImrD47X8pvIAlRPBJghDoHlwepOJ
	xzWBlYXMG2rA+QAySdQ3JPkxh+63Js5xBL22e3ldbERmDtgU4uasvBzJ8UYwuOST
	wP2urGPim269/uWYzAJPnjhWFNxGQvmm+6xFHmUbPeNYfB/DKQb5PeqnGcjOWfTn
	5bNo80HNJhMs8GmPRUHWjzrh9hrlrPqiJBpDhFcv0vhCfVEcbNtT7w0Jkdk9fap8
	owkBYw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8v3t8qv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 09:22:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6737536a12.0
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jul 2026 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416143; x=1784020943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=;
        b=E89PIy9oYLBOyWXqBjqRkE4vhd51QKJm7EFNslGwbi33BJLywvBDFqzoy8zNztUUlx
         a/lxVSFUWtgOQiIT9Vdj576r6BN1ou1DQ+ONRhkeOQAPTkN3vdKYu3sLF2y7xq4ndjEW
         NiPctDC61xCv0xdvEZoZ+YuefhzPu1vIjHTvVQg4BBZVg30sXHIBzD2f6V0OT0BtxTpY
         n1NUqFtkspDcZ9C8bHUCO2jK8CfJD9eJKMdDxJD4EhDmgeEfACJ4OxF95E50IN8Rmj49
         BAjKZgP8zzwF54mNodNqExA8LiXtRIxkhcBl5JnPPzzJGErt10joGWL3Kp9zummGiMtb
         zV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416143; x=1784020943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=;
        b=nwRrrMA8xCJgBATAcBL8V1vuVWNFey8CYLZGSJM5QNciXbYFCqpSOtCmzBiFR90PmQ
         Lxz7mhK0i2IOOR2jP/dkP+iagBzqMucBiX8a63xRmNMxmK3liaUbGOCoLHIRvfHzw+GM
         dpMnxIHTBfGWxwtscgLTHQ9Z+WcSpi2+58kVXIe6dvyz2KbUd4dzhaSW2R+oQkDhBAzJ
         efflmbGzGfl8CjdPRT/4OI6FkmoG7UmuENrcrXeeeLhdksTbkF1nGAoLPs9h0/d5abHf
         NUTWQakAEkrZVekVqIGpP1Di6STxjwnHXJ1Bw0DkZvFxliBT/C+7wEF19JSk6sHdwsz+
         RaYA==
X-Forwarded-Encrypted: i=1; AHgh+Rr97Wi8x4dRrYkEYUkkb4Qg+wIRrs/SatXui7o264SYZRd+ve7duzZMUVCfF1zqZgbqOJUgK4WZXgzQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkbDpec7lREr7idgDWb656yhG+TsFyG+1E2mDOikywmFW2U4X
	OKIRp+RyseMHNZ5Gnrtsb1GD70dxoaX88m/UO79ous/OdUTh/3er0eV+slskx9ieJWMPkAugoLC
	x7O8PsdDYEA6RYI7UbPvlaszyOIRnj1DEOq4wQoLgevG0s/laR6wyOsx+BV46cXqu
X-Gm-Gg: AfdE7cloZDODjw5eF3I9LlmzJ9l4+kGHsGWNfxX1xxqS1OybV/kGzAVx/AvXTriEzwF
	/xfcDt16zzjHPIg8JVmdezv2qXteC69amaM1HjkH7Llc+DDRAhIB8XDBCObqA8mQNdoFXvcrBXo
	FLijim4PB248u0E3ItRWSR50J9x2YSz3QffRL9CyCYvuXPkl4sVGk0+sD6i+g/C6/+N2aDrc1tN
	NfVWmqMuHoq5Inyemycg/yCEDtbCQXWmdzq5rXhnAZ1eqWik7IY+ckXELKwfXyH8os683Ob0mvY
	mxOgv9Xe9ER0QJsmXYlz04V02f9RsVYukSrVR8WdrkZ/kaKjxjFj5SfAH++I/iUSoJ9xAvq1EQw
	GnSRZu9Gl8jzMazrCODH9Ji6ioYQC099bcfMh+vw=
X-Received: by 2002:a05:6a20:487:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c08ee13572mr5474918637.26.1783416143048;
        Tue, 07 Jul 2026 02:22:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:487:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c08ee13572mr5474885637.26.1783416142596;
        Tue, 07 Jul 2026 02:22:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:37 +0530
Subject: [PATCH v4 5/7] pinctrl: qcom: Acknowledge IRQs for PDC interrupt
 controller
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-5-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1888;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Xo9LwQyN6492e6baEolgxF50nz7oZmFdMw6rVOnungI=;
 b=e8SKCz7P48edlfgjlYrzGJwaAHSaI4qxc9lZX+OEUCmJiWwK/wuakCuUYZMsAq1BStrHrMCB4
 bME6pspuSRQA793dBZii9SapHsFT3R+bAhvwXE4AVrJNK0Pr75F/zpP
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: rE4CgBmgLgQcX2PHfVB6_UiwMmWdGLFA
X-Proofpoint-ORIG-GUID: rE4CgBmgLgQcX2PHfVB6_UiwMmWdGLFA
X-Authority-Analysis: v=2.4 cv=HqVG3UTS c=1 sm=1 tr=0 ts=6a4cc550 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6yEXv96CkH8QcgWKpTkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX5x3kgeuWJgJu
 5bTN6fVRZLFSSDvLQJuWrhh4bJ6P09mwU8BBc8BPC4bYfgoCeE2RuWyL5kj0sSQuGvhC23pQ6fU
 scnduZ0uoQQEg3wAf4qgs38cH+Y/SS4gzUN0yP+BdDGHqwgAajukAuoCv4ftJtmIjUBjPexsDNT
 QpXQZEBMNWBkCL3RICcBDqm0MVhse7riq5GXSM6C86pa1Ch0pJ5sfJHPRKwqetVeyo4uq8XgLuY
 h0+qBJ2AfjoHluIgP02drxDA4MQu4rnYX4RUf0aFFgc4OhdFUbhMu9BxRZxAbYTS/j25Ij2Ziye
 bRYynOv4BOXbIieggFr1ubQ7CQBKKE7+dih/OP1+Qe2q+R5RFkJIBm5wskxnI3l9v3NNLF5usZe
 akGcJ2Q68hhKCR4B5YjqpvS1Yt2mzqkGVqxql6KmPW7C/pgYyGidK2v1dwzwv6GBu9wQ3rXGBXS
 ZvZLgJPG0Z/SwrqNY6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX6yeUXpA/TQ/h
 PdHL3gGmqKq9LffbOlV4O531sQbaKLGsoY6T09qMC7P34guNVrZYVh+lJ/7BRkgd2YPU8s/Z9pJ
 SOR7VPZR9coNKS4hs1PiGRyhcxIuYK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090

From: Stephan Gerhold <stephan.gerhold@linaro.org>

PDC needs to acknowledge incoming GPIO interrupts to clear the latched
interrupt status in secondary mode of PDC. For level-triggered IRQs this
happens automatically in irq_eoi() but for edge-triggered IRQs this needs
to happen as early as possible in the IRQ handler.

Implement this by using handle_fasteoi_ack_irq() as IRQ handler in this
situation and forward the irq_ack() callback to the parent IRQ chip.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index fe94ce5f9b81..9c720f49465b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -994,6 +994,16 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 			msm_gpio_update_dual_edge_parent(d);
+
+		/*
+		 * During early initialization of the IRQ hierarchy,
+		 * irq_ack() is called by __irq_set_handler() before
+		 * the parent IRQ chip has been set up. This is why
+		 * we additionally need to check for d->parent_data->chip.
+		 */
+
+		if (d->parent_data->chip && d->parent_data->chip->irq_ack)
+			irq_chip_ack_parent(d);
 		return;
 	}
 
@@ -1064,7 +1074,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
-		irq_set_handler_locked(d, handle_fasteoi_irq);
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			irq_set_handler_locked(d, handle_fasteoi_irq);
+		else
+			irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		return 0;
 	}
 

-- 
2.43.0

