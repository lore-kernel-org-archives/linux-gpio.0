Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795009086;
	b=PXNIUtGXHktQ2pVRaA5ZHE/uXtAzq7YmB6JSEaYLo7i4tzbwdjqflqSD2/FFWh3UlDKS
	 ID/YdgOpTP/jMNtH9HKj3q1cV8CTID+mztDx++sFf0m+rke5QLZX+huKXbCoHpKjcPj8f
	 Me3LXw7H2BCn5JHXhU7jaYC8c8ScbZCUOgyRzX8Cc/QmFzgj+7F7GeohmWkrspovUu0HB
	 3WGP3siOmonbVE19TlX3Zo+btvB8VEcVGdQdfh6oUM6AcFWlE5EmoAZxRkUwEB/XbNpG5
	 KC3AeyWwZr48ifePlgXQpC02ad1XQmTJ7OEUQ5xAmUwnbqKE8DX/3UglIgkpVOkYYOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
	b=GLirIVusvZpJwVuvbTWFcbi2NIE/cyrKjYZZOJDMEOk9aLhWfm1MRDnyWNxSLMGq+gtT
	 oKA6MWm4yM43fIvWrlzf0JZZOXllVRc2w3IY9LlHttNyHAYwXZ4irbh46jccODU69Bsx0
	 G4XOnT/z0GcKa/3m9TwYJJvKRuaZTPk+T3/HMFMe0mo48+ImMs74bz/YJ0dKjo99yboP7
	 j1g9lNnXzR71L0VvHskL9vfi8lzsQ7AFhPpHDQ8yEvoXgjEq2Bw6peHK11OgQYta4hdq+
	 0FWR60JcPB6RdD/4ZVN2SD/hyFVVxF7/5mvXuCYpfN5s0DjvyoT69dgsz5fg1RwCriw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="HnMhp/bj";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16BC9606A32A
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16BC9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iqZ6TJKC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HnMhp/bj
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQ4143846384
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=; b=iqZ6TJKCTh/qnM18
	RwwQDjB6rYObtNJUCtw9348pqp/uqSsR0nkkGv6w8sFgRks2fbvBYcQnOtsTGRC+
	je0Nk7LJvGKH/xOxI5faov/jsvUAeEbT3j8vKjDeWczQpqpgUYeGLvjd79+jsLsj
	El3zmIlfOQq5MPhAshKYi8wxanyvv+HDeskrfB9mGC5ZMew4PQRnjaEvt1o0ZINb
	TQIpg6HFXU9J7ayZzU4dQxoX03TGTyNtrOQQuEttmDnu2gEPds+KND6i3+l5ZoMY
	lpIYxVuIh/Hfb+S/hkAgh2F9Ww0iAxEt0qf16EIIBEvpGqG5ofALL3+6zsQzHy7e
	NurNIQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvau7sh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:38:05 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2deae0bbcso177856137.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 05:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795009084; x=1795613884; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=HnMhp/bj9cI/N4CzPfB3jHwnwII9o7YZGAT7hb1Oik8Rmqeqi4CDmJBf7whFmsza8z
         odKincnWYjp4zUwl5oyCYMvwnpXIRzqtWiuh6x2oE88MBN+rhKjYu2Z/DcQaS45pDHt3
         78rCee2vt3bctmo/OA1fj2Huf9b3KG3PZVfRl+wKRGPM9rdYT24R3Gw3wg3bB0jwgiAC
         pgnUCYxlERhH/Z2NLeq+3LPj2UCj8rIpAw+Zfki4f3ekWPf/MY1ahOJTwVB0uRUrL+Se
         JJn/rnQkmkSz5MAE3EjQpMcXcCl6+jIZIul1aV5ngCMut9J70JfnbANi+9BmIAivgK7o
         DtoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009084; x=1795613884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jmhWy+WQRuCKo2Tjc57zADzpzLLO2qlhH7Slwf7b5N0=;
        b=tmZextj3RuCchYnv0tO+0NjqPNmzmXaF1hw1ZyASFJB4sAl7WxH0eZzwmuhQIWmN78
         3DULAAoC0gSXxdo72t2AC5Gs7i+DOUScO7g6vKZiLr20CcpCoDRP9D/43hrfFZMgUW3O
         ZwQpR/uWLi0AM2kvS1zEjoR2J3gb8oMh2dMolY4lh834dTZfCk9YtLvX/3ZLIKF54u2O
         2bRPJAzivNUTk0OgKaO2M9iys5HVgCcd0JEWaSiQ13b68tRodkWHuk59h27afX06m46W
         7j3U23E4fkZnNizFjcf68iQlOpRLjLZwhkwEmPn2DFSJQPgVB7lQPM0etGJJs9GVzg8m
         gWgw==
X-Forwarded-Encrypted: i=1; AL+hErEHurqAg8/1LhEI8zu42H48iDZrCfeVSebQZkJyaR7CK1DiTNnVaIdHQ6aPZI8D37VH9A3clu8gV8+9@vger.kernel.org
X-Gm-Message-State: APuU4Z/Dcancg603F5Wj2IB7KW37fUpmZva3NBsldy42qT3UoLJ9/q1N
	62ThRIPxDHvh4/xKWzhD+PZPjq+uqyZPMoGbahq5uefUIltiYbmSjdgA7e5QIkGl51CHnpf9c13
	coZGFn8W30vp0FP9Z+ECrlpiMV+mkb0RYAct8bgip9mczH8y7LCx0AZWqsL3ezqXR
X-Gm-Gg: AYBFou3YHHNgSOTgyjXvIu4dOnDT8ANl+WNp6nBMtIdRv77mN7O32PThHUQr3iYIFyb
	208s9QANfSMpHi9Thb1yqNyqzCfQkkqguXkqVg5ouJ7Y1EzChB1Ns8I9QP2I/QX1jEiS80CRQWA
	r/mkoe6dQOqAyCcTlkNomWj/YlJ4Ec7qizyKZ+eiP2UClJOSsys+9J1sNs+JbtHHwOl3RCySQ+v
	XhnupewkF215d1Izubitu3Kq/5dlw24tNchg7y4fkkojifTI+7EQViiwNk2IvY+EDk2BDH7P2FA
	+3MtCPBsv20lE0KcCekXKh9197Mqk1QRf7/N7MFIBXToV1jcpvw3PCAowY2Ug/F79/xcEm2RBTb
	lYpHZSUsLSydiwfwFq+j6R6SM94Mdpbslc/6nfUVuoLvSDD2YXEXb9FZjEIHXaVF/vtfZ2YPYq2
	61db4=
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748737137.37.1795009084326;
        Wed, 18 Nov 2026 05:38:04 -0800 (PST)
X-Received: by 2002:a67:e7c6:0:b0:7b3:6079:1900 with SMTP id ada2fe7eead31-7d6ba4af66fmr748716137.37.1795009083820;
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
Received: from hyd-e160-a52-3.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e4a1b61eesm1809090241.3.2026.11.18.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:38:03 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 19:07:31 +0530
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: Force runtime suspend on
 system sleep
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
Message-Id: <20261118-lpass-lpi-system-sleep-v2-2-a6ec7f2ba424@oss.qualcomm.com>
References: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
In-Reply-To: <20261118-lpass-lpi-system-sleep-v2-0-a6ec7f2ba424@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795009070; l=1591;
 i=gopi.kanala@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=lDn5poKt3ysTuETVGTT4YGl451c5NuKPmmjtEKR/+IM=;
 b=Q0JHIHwGWcVQxFXb8JpOXQ+BpXkPF4Sz0hk3T73DkXD3wVl9a/QtNd6Zo7xdsaxshoA9zq9Az
 sKRiZbvYzBADA5EomgMLnr4M4SRyhJXB6+cTM8ValrtU5GSYxP7m1AY
X-Developer-Key: i=gopi.kanala@oss.qualcomm.com; a=ed25519;
 pk=4bCmbkbT6dfZt13k29qAL6yx8zUQ6p+yOdkRBH8lzXQ=
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afdaa3d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JB7U5Tp15nFzE9-rj4MA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: X-80ffjYFtLsxHTna-cKVUKjQq8lVExZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfXxaVMpGs6MzFt
 fjmV2+rXH127hMkZhEzxqbjsyXgI/3yHqwhz9c/5hLlLf0Nxh3F902QLMwfcAwq0fnAKr0tAwMz
 tOlW0pV1zOvXPOHYBDsyqNUKZjjhmWxzZ++sPp4t8FgC46s6m6qaXlSegZxkrbv5ohpGtSVcbjD
 ZcjN/dKUcHP2SRqKMjwCODyhOLffgOYPllcHuTZayePCuecfRIjlXENr2PUJ9xHcO4JhxBYjCbS
 DMIaySKSywF8lz3Bhi+kPfJgHd7cqmHb6kOtlFe7Ik/in7p7imBNRJUT3gQbkqwVVFOpF5rSv4+
 FYPcEdk76YLmT6ZZpKx1XXBlUR8Qy8zyGKGFhZBuL39lRK/Xs6cluCaZl7vl/THZZsmd8+c9WMy
 v/Bz68JM4VJO93q0h+PbsR8UC//DkC4VKTXBlhoP8g1tj3Wasno2ldj931QRRMjAw9vatQV/vMA
 XMh3gj3w/o8V4Pzv9qA==
X-Proofpoint-ORIG-GUID: X-80ffjYFtLsxHTna-cKVUKjQq8lVExZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1NCBTYWx0ZWRfXwN/XVvCUEZD2
 lMdL7DYju8bJEqRIZcBtrcTTFoRv86kTXr60j7FK6bamsCDIxHMyvs0kxcSbhgAEArVwiA492Uo
 3FOanfh242dyRJbiCYHci1JW/JiD7oo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180054

The LPASS LPI pin controllers vote for their LPASS clocks through pm_clk
and only implement runtime PM callbacks. Their consumers, such as the
SoundWire controllers, keep them runtime active through their device
links. If a consumer is active when system suspend starts, or is resumed
during it, the runtime PM usage count the PM core holds from the prepare
phase keeps the pin controller from runtime suspending, and its clock
votes are held for the whole suspend. On Glymur CRD this keeps CX and
DDR from collapsing in s2idle.

Use pm_runtime_force_suspend() and pm_runtime_force_resume() as the
system sleep callbacks in the common dev_pm_ops, so the clocks are
always released at system suspend for all the SoC-specific drivers.
Consumers are suspended before their suppliers, so the pin controller
goes down after them and comes back before them.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 1f1635ec53d7..f693e5101a7b 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -612,6 +612,7 @@ void lpi_pinctrl_remove(struct platform_device *pdev)
 EXPORT_SYMBOL_GPL(lpi_pinctrl_remove);
 
 EXPORT_GPL_DEV_PM_OPS(lpi_pinctrl_pm_ops) = {
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
 };
 

-- 
2.43.0

