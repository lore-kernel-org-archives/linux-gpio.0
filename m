Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728923A1689
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787557832; cv=none; b=km4sfRujtHCslx7EvTOn6wpgJa5C6Pyxx6CVrZE/5tTwE+IAD1ZqMPNBCq2bmojqPmYEq8iimanh/fjBwkULoOjut9snwtT69kRO1kygq5Z8CjtFwSK7+gz3ZZTrexzO5HefDBJDXDSr0G/8w8+aMm7/bMskTp4o+QdClTzGAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787557832; c=relaxed/simple;
	bh=dlKx7BZw80w8bByuZyGb0QNm2TK8P+icaTDQTmDlsI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewrPJml36wHe3+sbWMkwtTTGqUxMKNcOBj38qtHjeQXBIfb2UfAO36Yo2hVizOChRzFbYxMLUzBzJi+hMGOq6emiT+w/4YWjrNAinbt+CZDkwWQLLmMjAgiNL2psj7Wc2dEf2ILuJPwA7Hb9CQebFjy3if//C7h9gXU/GLPv+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pi4kBKwZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTcyLMaF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pi4kBKwZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTcyLMaF"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5REdA2602043
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9HJ8w3GwKU3lFtzua7oGY3/Y
	FZTlUiCBe66lb5hQc+E=; b=Pi4kBKwZv+0DDj1vDL80B10QfAqAFdwXyk+h9BeI
	/ZO0kWes2gQwWAX6Z0h8q16zrNGYoJtujKO7xRQ84cI1z/BLjFBE1rJYZhd4U/6Y
	UnpnT06wBTxkxQFlgGQj97ds3/h7sLUUDwAnzDiotBr7EJ6sFOwlZ9JqsHmH4uxN
	SC1te349bWFJ8GuAxPPG3F7KNo2mnzY9QNPh2BMlT3AoQuAgjjnST6MTOqf7Mb9/
	HQhP/RTPemwqk0VC4ucoj9XeuwUlcmHIXaKtaBa1+ucda5qgLPR6yA2uNwz3drDF
	m8YWQe4NnqkOKwHrAXxqvZRahPNEeYhJAnc8vn/+jj3crw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wwtum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 07:50:29 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c5db8b6d03so1065743e0c.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Aug 2026 00:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557829; x=1788162629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=gTcyLMaFKiljHJJ7gpqmxsStupcS/IMIttmP1W4RfLQooXczsyU6MRSlDTpNYPzNmr
         FclyFclkTNq5gE334i49wVdxpWo3MNDZYt1RPaP+bQOtZZLml7KQ9y3VQA8D1grum+0e
         bI6y0SBVVRuSdmjWFw413Li42xABra3lH/J0VW+LzQVBBO0OPsGiOa5fzWQmMkuKOYOI
         YYaHd6KD+L0nrACkHCoa5iJqkpP3FdkTcPgnCfvWgnQ7ivxXC3EVoaqHVe3a2i/4YfMa
         5ZL51qI5fwLWq4x01CQSVfqsoPSKdudmHoGuKnVwGsw+/Ppavu3gLu9sGdszrDL7Z3/4
         wQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557829; x=1788162629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9HJ8w3GwKU3lFtzua7oGY3/YFZTlUiCBe66lb5hQc+E=;
        b=NlLlDuUxdDYXWI0kfgGBQKcMuMvi9Tm8d3+c4nQtoGGKicqZSp6G+UMxxCHRxNSoDw
         TMHrMORwI/aEQ/9kIj/h10fmjY7oOVfj4qblIRSdLLnJh34s/6775bW+q1HqIECmCQAT
         VljQQ7s1F5RUqbwEs4yNjcB8gxn9x/btLNK41JTWKmomh20L0tSb0UPvkSa6arHKnjsM
         8KrCRS8M9SHDsr9EBuzoXVyb+jGTT2iRls4HIxYj1JHaoZZl7Czzt1tVFezfLbIZNcqY
         5xsIqxMWPjmre6Y82aHzG1zpaQa68XZlSbZhOPKkQoVTwAFZTGVHYPD5m/Xm4EH9XL5x
         XSeQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5bT3mmEcDfQfnoTE2nDm2PUUax56ga6MPgUj8IJiy9b6B/F3WSg1S4GM1e6690rfoS2UeZebhWZ15@vger.kernel.org
X-Gm-Message-State: AFuF++ntV/b1zgsu7KIO1lb98WUnzTzTbO1gDqxsTCqKu1GvjhSWBtST
	VbETgKMZs68H5glSp9RiMcgiEAgsmqj76N8dPZNEr4O4G3VY8/oPFDXvPichPEQZ7VxVjBfHQ4f
	EXQPsY0Kq/g3NVBLa+8A86CeFIMLp4P90OXDOuEj3q00WMm/VayLURcfAqXWLZvrt
X-Gm-Gg: AR+sD124P57X1Nvdbm7n+4GbhOx9OYn5G3U1LpUsNEuFfQzAY7MCO4fb4prYKQTa0J6
	H35s1ltoJF/g2FPIVOpzIbY+bzAxChUYMa4WhytMmJkXSSjRYJ/AnUukdoR/lMuN5LMv0yqBMdT
	8/eeZlexq2WVrpJ0mfkrHOwPnf+rL40c7Zkv+Vty6CiMQtQN1hLKScntdA1VzEWPnCEbtQG8Faw
	lBHIm8HjFVtvNW8wueVn9US6QzN9Qe7c1iDRRJOO0NGxG+otBABLQfS6cdmmbx3sulifgKe0Zb5
	sK+CU0uHrg26gKJBQps5HsifFQo9pI25QT5uWNfmoU7AKmdz2pKyaWF0AH0sk+ChroVucn+ZIaX
	LR4r0U5YssvXbimw=
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674472137.11.1787557828520;
        Mon, 24 Aug 2026 00:50:28 -0700 (PDT)
X-Received: by 2002:a05:6102:4422:b0:737:783d:1916 with SMTP id ada2fe7eead31-77a64230d44mr7674463137.11.1787557827958;
        Mon, 24 Aug 2026 00:50:27 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1cdbe9sm7372364a12.24.2026.08.24.00.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:50:26 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:50:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/15] pinctrl: qcom: Add Kuno pinctrl driver
Message-ID: <7ywfd3hfzngejfprv5zkn65kci52q5tgiq5h3sccpz35ov5eq4@ow4edd5epaws>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-9-196e2b306368@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: q4lgG-UnoDv3RunKHjBRC5nnX1EaPGaf
X-Proofpoint-GUID: q4lgG-UnoDv3RunKHjBRC5nnX1EaPGaf
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a8bf7c5 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gSngVhONzQuCJb9LWNIA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX6q43bZR7OTpm
 pIyA0vfJDTz+fCu2AtcXe3L4vnaRsJ8tYRQ5YEL5OdBpfyCeASLTbu0mxVbY7EI2jC5cFgVAB/9
 S+LYP6xqqqz/s5aD3Sznb5vQprPOxgdqr/DgJRZtfB2g5GAN68Xp3X/FU61dJ4jRFN2rViVlfZf
 0c2BmBDkQW7CLvmw5GVzlLyVEQT5bMnVW4wMsLTjjOcIYj22gJaFSz9A9hiUqS3ggQHGULsnsVs
 iKikdpYPpwEYvdfNKblXk66knsCGkXUjcN/iXEkyfVZkzYObCIgajWMZZJh8Fl0o3gp72idQBSW
 N54z8iZ2mrVprJBzWFYFhXVWc/mdCFzhos6/TUy0n3jb5qmtyVBGGEDe4Oq/5fMMrajd3/t8sct
 RfojgE8YVZ0DEQCuxL1DD7CS9hDuharCFdL847RRTAonvD4ItyvyiRY7uxjQwTnODHphjuQuwot
 nAbaRdXi/eI4xS6aRBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NyBTYWx0ZWRfX9KvRFNirwOxE
 M/l1bmra7Qzk4NAZX0Y+XYDJsy9CAnzWGTGJa8zhWger01GZQcZGxfBv/WNMc6fX/sefU/YWkVM
 9w6IhY2uUQGXBpBFRk60LXdHrs6sitU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240067

On 26-08-21 21:39:02, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm    |  11 +
>  drivers/pinctrl/qcom/Makefile       |   1 +
>  drivers/pinctrl/qcom/pinctrl-kuno.c | 801 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 813 insertions(+)
> 

[...]

> diff --git a/drivers/pinctrl/qcom/pinctrl-kuno.c b/drivers/pinctrl/qcom/pinctrl-kuno.c
> new file mode 100644
> index 000000000000..f3f8ec3e09de
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-kuno.c
> @@ -0,0 +1,801 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-msm.h"

[...]

> +
> +static const struct pinfunction kuno_functions[] = {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(audio_ref_clk),
> +	MSM_PIN_FUNCTION(coex_uart),
> +	MSM_PIN_FUNCTION(ebi2_lcd_a),
> +	MSM_PIN_FUNCTION(ebi2_lcd_cs),
> +	MSM_PIN_FUNCTION(ebi2_lcd_reset),
> +	MSM_PIN_FUNCTION(ebi2_lcd_te),
> +	MSM_PIN_FUNCTION(emac_mdc),
> +	MSM_PIN_FUNCTION(emac_mdio),
> +	MSM_PIN_FUNCTION(emac_pps_in),
> +	MSM_PIN_FUNCTION(emac_ptp_aux),
> +	MSM_PIN_FUNCTION(emac_ptp_pps),
> +	MSM_PIN_FUNCTION(gcc_gp1_clk),
> +	MSM_PIN_FUNCTION(gcc_gp2_clk),
> +	MSM_PIN_FUNCTION(gcc_gp3_clk),
> +	MSM_PIN_FUNCTION(mi2s0_data0),
> +	MSM_PIN_FUNCTION(mi2s0_data1),
> +	MSM_PIN_FUNCTION(mi2s0_sck),
> +	MSM_PIN_FUNCTION(mi2s0_ws),
> +	MSM_PIN_FUNCTION(mi2s1_data0),
> +	MSM_PIN_FUNCTION(mi2s1_data1),
> +	MSM_PIN_FUNCTION(mi2s1_sck),
> +	MSM_PIN_FUNCTION(mi2s1_ws),
> +	MSM_PIN_FUNCTION(mi2s_mclk),
> +	MSM_PIN_FUNCTION(nav_gpio),
> +	MSM_PIN_FUNCTION(pci_e_rst),
> +	MSM_PIN_FUNCTION(pcie_clkreq_n),
> +	MSM_PIN_FUNCTION(pll_bist_sync),
> +	MSM_PIN_FUNCTION(pll_clk_aux),
> +	MSM_PIN_FUNCTION(qdss_cti_trig0),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1),
> +	MSM_PIN_FUNCTION(qdss_cti_trig1_mire),
> +	MSM_PIN_FUNCTION(qdss_gpio_traceclk),
> +	MSM_PIN_FUNCTION(qdss_gpio_tracectl),
> +	MSM_PIN_FUNCTION(qup0_se0),
> +	MSM_PIN_FUNCTION(qup0_se1),
> +	MSM_PIN_FUNCTION(qup0_se2),
> +	MSM_PIN_FUNCTION(qup0_se3_mira),
> +	MSM_PIN_FUNCTION(qup0_se3_mirb),
> +	MSM_PIN_FUNCTION(qup0_se4),
> +	MSM_PIN_FUNCTION(sdc4_clk),
> +	MSM_PIN_FUNCTION(sdc4_cmd),
> +	MSM_PIN_FUNCTION(sdc4_data),
> +	MSM_PIN_FUNCTION(sdc4_tb_trig),
> +	MSM_PIN_FUNCTION(sgmii_phy_intr),
> +	MSM_PIN_FUNCTION(spmi_coex_clk),
> +	MSM_PIN_FUNCTION(spmi_coex_data),
> +	MSM_PIN_FUNCTION(spmi_vgi_hwevent),
> +	MSM_PIN_FUNCTION(uim1_clk),
> +	MSM_PIN_FUNCTION(uim1_data),
> +	MSM_PIN_FUNCTION(uim1_present),
> +	MSM_PIN_FUNCTION(uim1_reset),
> +	MSM_PIN_FUNCTION(usb2phy_ac_en),
> +};
> +
> +/* Every pin is maintained as a single group, and missing or non-existing pin
> + * would be maintained as dummy group to synchronize pin group index with
> + * pin descriptor registered with pinctrl core.
> + * Clients would not be able to request these dummy pin groups.
> + */
> +static const struct msm_pingroup kuno_groups[] = {
> +	[0] = PINGROUP(0, uim1_data, NA, NA, NA, NA, NA, NA, NA, NA),

We use underscores instead of NA here.

Please compare to the older SoCs in upstream.
