Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688491;
	b=uxdETzwE++7lCJ+KtlINZBShYP86BjbqbQWQOov6ww3UjCMsHpRmv4SWdMERL9n1qmR5
	 /hHBhAPLLiIaLBl8rXY8zvJ3vk/FOpxXNyqnbSgfG45Q1VGP6pz442ChBuSVaMG2SA6wG
	 jBnrLGq5HGk54fervj3ilK5JwXlyF84xsevd7NSPRRQS9rwBPs1IbXughXbu4aZW9ejvE
	 SUTveYomX72R66NT+nAEGmDVYiPG42au0ZwP5dsMlbLeO3VAxlJM0EQhXrGiK8p8NV+zt
	 m5Nu2ggCL2YIcHq7CRfK+L3nlGkVUxtRaU5eJYkPBw2zrD28HdgCwRZsw7lQGCn9EsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
	b=bA6bmEJQKP/oUQNKNUgwvrxQhFSXrlEK7MpJaA8xy4B7CHASQXdlNEKcOCO2S5olueFC
	 ibFultsFkNK/na66VJiQPCvzeiIxZ9HkA7EV4m10JSvTp0jEkd2l/tZ8L1In+ujLupMOH
	 hpdTZTNd0aZ1rU8abgFWI+uGpMZzEhn676RMnek0D5htFa1KpqcD/r24PQppwqzswAAqR
	 USf+0P9fwxprcX53M8hp0YMNYv/IW1WE20kCCE4eBy8s/y5qCVd7NULTyDkk7fXd56TZm
	 KSmPnjUGhf8Dg+stLoGXwH3PlGFHtDtUqBs3Nf3ZR0GXhuIQt/sLqfz4MtqlvrY0aBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DV3catHK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8SVbsqw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A116606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A116606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DV3catHK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T8SVbsqw
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B4dX2595120
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=; b=DV3catHK2EEvyBgB
	mSBClzUFOg4wvGJKKAxxJ8MSP2C5ydtLPivZJrNt0X7gnaENWGz3bu5sRps1lkz6
	xs8/idykVHGN1WbXKUVRP0jEO2yvIA5F83hQB2FGN3Dqa9MBCnossnUnWnUtcQel
	kn73HFAV3gjZq58zYLc9tFeXoCrDK9NGGpldG6A0KauJtPmo6xreG3TfLWK7z/3v
	tA5yFqB9zAXRJ/2wIrT3uWRFrlExw0XzM/tfgpeMe35VPnjCDd1MJroms1+nfJQX
	c/25l7wGRPBCzoqFcfGhvD0NzL1P/e7YjbaBCQfECe747lssq3aPuePdwXQ7JUDQ
	Swi46w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sapax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 10:21:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1251249685a.0
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 02:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795688488; x=1796293288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
        b=T8SVbsqwrbKc5qkV+/YvmZMmQCZbKBkUr8uS2ubrONjzwrGZXf7wgPmtEpG2Rz4irq
         Cjd0TxiuPZ/6sJ7kP+2oArsn76UZi8WFbWWBsEubh+UGaU8JzcTV2LPROifage7MvutA
         IVaa1+B7ZEZuDFUdciLYvD3iaMQyw8IOybMGrIoo0OxM4gEnq6qMzdMPOSc+MujzZsfu
         GzqsPCOxxRPimaKrHZnFdFjQxk8PqdIdK5bOPUNAwcO3rWZUvOf840p1pHUdV3Nu285a
         8wa20+4Pugker+Cd/RqyaddR9HQVKMBaCdRbhp1IdrJIWJ5HTIIYwKBET5kL3XNMorWW
         5q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795688488; x=1796293288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lP+raEuWnaY6dQL0h0eVb/A+IxLsAa0Xeo8m0ojDgI=;
        b=iXvTyzMXnikv6vPF80Je452hC8XTH/S1mWs/omBsqb9UBLvzp+bvOFIgOHs9Mf/hcy
         80ZM3J23CrfjZzttsimTIv2tlpTzmnBO6EUDS8eY60Kz71/bTNZoo6FWb5DcU5XoeFJ/
         //CNXpwU5BX1w/Do/d/NLv5/bMvm1FOp5xJPUKVjTo+i/v6TFM4i+swTMB+pUP4M6qiT
         uraIcHt7xO33CNzrfX0QgcW/yOiwjgMxieA5tTq8MEQdfBahcjQ4JZN50wyPRLHF0idZ
         hFiFOK8nTmo+d1OsSymbSbIdjmQAJgkFA4ap0pikqBypXtdnRbqg0cWRGzgtXwAk/N98
         zYag==
X-Forwarded-Encrypted: i=1; AL+hErEJyX1QaQzJySjh8QPGJqPWHcrDqO8eeLNB9ssiDSLfT94aBjdufAqA8MGTyLczAtNIN61kQvZjhSsa@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z9lsB+ynFeKMnweMmLj+shH6tLATnpUJJqUgsQkCgQd/L7/jY
	wPfhHZyQMwvqPPeWzQ32lwQMf6WunGYBgfKHNcU8ihK7khoPr0D7MJxmrjHwxk9QGT53wn30rdn
	E4xRD5zXJzrSEUVTwuBQJukkRCtq4PP7glA3kignAob9a9NrVDOmz7gK7TilQCpjE
X-Gm-Gg: AZFdTZeE5Oztr1+zqZIYuVncQ5fDITfyBLouBjrdcBboeAQM+Ps1+b7Z7JG4ayRML3A
	2JyBeSYWUmNIsOuuU9Qn0pP0JWE7CNIFmiTZ7AXU0J9Sipub96U6F9H6WBMpgdhVr/ORP0m1u5v
	CpWLtIJQiJ3J4BSwX8l6c3KiOGC1ONVofoSG/NZXTK6BCnXP/yPXgAXzu718hs+B8ZvYHfdVSsv
	Z3f4lkBJhNyiMF8FW9cq3nTBcCIW7iXzlyfqcdKsvIVDraRhneQp41ssVnJoJ3t4urOggpTUxaM
	h44FPNlb0pJMLLxbAZbBsRziWT2kARRXPyuPeJrcKBt4iBEseXux/Xy3ZRa8MkCeHbwfmLEJdD8
	pd/ZL2W9xgVln8YMEe5s8ciotfeiFQ9EwNxQRGfZyDM7CsDMD2ZBUhgmotUwEkLWQlZZF+dJdxH
	KA0FLkce5Hlb9XDspSA0djiqa5ALCo4GxyR8SCLaDpWvEelDWmlf6rqKiT3Ps/daI=
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr3644085285a.35.1795688488423;
        Thu, 26 Nov 2026 02:21:28 -0800 (PST)
X-Received: by 2002:a05:620a:6605:b0:947:920d:662d with SMTP id af79cd13be357-949ba9a2e20mr3644082685a.35.1795688487999;
        Thu, 26 Nov 2026 02:21:27 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm658817885e9.10.2026.11.26.02.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 02:21:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:21:11 +0100
Subject: [PATCH v2 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
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
Message-Id: <20261126-qcom-pinctrl-egpio-v2-7-521fb057d3bd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XdvDlbCAk7iqV5eoscMe27J++gdDxDTseba9eYIiNzM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCAgTHAxokGPkdXri6mwNHZ+wvcPxZQgRAVQsz
 7nY/PRemKiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawgIEwAKCRAFnS7L/zaE
 w5NuD/wMfwUHkR/OzGsE2NsN6pjZTv/Mi3HKrUn7PpmuNhA0WPy5guPbFyWtO6k9D13JZMvT9Um
 coZ4G3CKFhV7PWbADvx3O4IOTlNZz+oJXkHvWd6YlcxoGMW+P5hnv89sNoFqLgy8Cd3lX5DrtEq
 uEMYxRc298VGxy/AVc+Ry2rDE6PGT2838lgvOmI8FLLGf2SAvajBld0eLP+k+BbQExVDSQweu4c
 R9RjTJbpP0hLn88Jj2LPyK1buuIWAT2T2NY8Uvr6qUqf6pkrAeLGoaDH/dYvvpdZYEJkMwI2d96
 opSSUqkmqlM3c+dW86Lcj0LZvFmei3ieTRUUNTQoDpRi2apxM6EA5+ngsnoo4AOobhtYG4qK52Z
 Zp5zlKM4Jvc833Bymix3t4sQb+0bdBA/PIhYSm1BrYchV5hsbsOdA/mIWPuguwHAPjQbgsLVLut
 X5Xa5utj6uKk02zuFm4yx+7RX9AxzT+2wUPNkz1ZCTmUg+SdfQuvQ0cMMo19Q4MMJrLrfixRzxF
 1aoqLuJ5rkgE/gdnqJACyHDVQdgWBe7ZGxbZUNhyM5FOhe8PSdkpjwD1o2eWjZYVQN2DdGT+g+e
 I4DSrWjd2/RpJ0EPSUsVrNETLOTqnNkXCMpByP/oHE80TgMn3ttIF8LzcNTAmu/kiRDcVQ45k2G
 VpJai6BTOByx5ag==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b080829 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=rzi1cwwMUWT7pCUy_hIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eePC6abzVXL0V3Jgclip7yLKX_vUmvHx
X-Proofpoint-ORIG-GUID: eePC6abzVXL0V3Jgclip7yLKX_vUmvHx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX3xxNcwxqWxWV
 s32CpVfgAfWg5LMWtgdWmBdeRu2XCOAMxq85IoQQd1bGqKiwmgMx6iVmWyGzttsqKxtTu1g+bYK
 XY9j7OsWKongCVIcA5uB3YzEKJR5pYfD0j4httmX0zsxRYjnJU9LogGp4cgVl/AT0imfWGAyrgb
 1H83XThwHDJX7GPmQ3KNxl1AgAUAD3jVziGL4KP6C9zrcK0f8tzHjPU4rIm5XT4HDPhTK1ZtXQ+
 VVURJXXDny2be7vG3ncG/lkFZNj13eSLYtftXeNhPLFqLTIwrK+UTGIH6ox6xAOfX1YPtLGlMZB
 oL0EkNk78NYan55AXEh1FBSsCrbieN+1miNb71VdjiCtj3ZElo1okZF9jLMO9wDR5rrWdnIBXct
 dIDd9MTBQgbY5AGTHzqKQ/HWI1RL/e81Npg+/RiM0Cses+3w3Owcn0k9tU9VLeyR8kf6tIFbbru
 Vb89OTpbrClV2CjA4Hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MCBTYWx0ZWRfX9MkTqTfzUSju
 drVj5pGP7E/KLWwBnjNAOhfih+XuboBO6sjBRtGJbg+ay92LmQsjwd89ryLezclr5RfD2aHUV8d
 2O5d9BupmexBp9tSfedjOJozrPvCelA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260040

The egpio function in the maili driver is registered as a strict pin
function. With strict pinmux, a pin muxed to egpio cannot then be
requested as a GPIO.

Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
be used as a GPIO.

Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-maili.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-maili.c b/drivers/pinctrl/qcom/pinctrl-maili.c
index b9ff0f4479410656cc73567ed494a1cfe25bb56b..5b75994134238a263856ea2c0337ac196867b767 100644
--- a/drivers/pinctrl/qcom/pinctrl-maili.c
+++ b/drivers/pinctrl/qcom/pinctrl-maili.c
@@ -1226,7 +1226,7 @@ static const struct pinfunction maili_functions[] = {
 	MSM_PIN_FUNCTION(ddr_bist),
 	MSM_PIN_FUNCTION(ddr_pxi),
 	MSM_PIN_FUNCTION(dp_hot),
-	MSM_PIN_FUNCTION(egpio),
+	MSM_GPIO_PIN_FUNCTION(egpio),
 	MSM_PIN_FUNCTION(gcc_gp),
 	MSM_PIN_FUNCTION(gnss_adc),
 	MSM_PIN_FUNCTION(host2wlan_sol),

-- 
2.47.3

