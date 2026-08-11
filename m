Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664A32F6188
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786410430; cv=none; b=pHvf4lvHecGJDhvGhxjPZWJE/o89sMgk2lU0NSJtseOFMfB9wRyFfoAxgguOyea0vi3n44uFh20flxojTr8O0ttUJUGYOItSConDZwRlpa19KidyRreaWYyHXGeYmPqsW26tn69puOxMxa3UUpq1HgGHwWet2hU6ugSStzZop4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786410430; c=relaxed/simple;
	bh=0a7KrwckELD0BSsVz1sZpospsBXzH5+wJ3BdAHmVwqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wf19+Ot7Dtqxf+PgQWFYqjS5KHRqtqUm6KPfjZ6F2YN25jDN1YTs6GIx7Og95gOrKa9ddcIEeg67R8GyTz/uPwOMwbq8O41mHrHMWk2dfGv4xlAfbUne+88GnHz+6Pncp+u02yiCXryOh2ChkkmzquRuwJn3GLGo5z9Jm5a4a5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jxza7oXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IpzkapH7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jxza7oXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IpzkapH7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqAkH2996509
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LKWM64w9B/428ZZASotTcAv1
	uE/KA59H6TXr868LmeA=; b=Jxza7oXMVn41cVQ2wPrP6IG7+Jprdl5vaVU5gRkS
	oAuW0QFGmJ/vSh0jMw9FVQtlciDTIzMa0oILUlC7rcG0AjDtynG8RF0bbfnUq6Tu
	7bQ1Rg2NrAxsVomj1YkifV8eGFk9OWoHtm3r7oBmcr1mSsSuOeJvzGLdUbGqwyfC
	45F0FL7tSET3vpxmGwrKEhfCN7E9S687OS9cvMsafC4bF0ydMpasYX+vX02geDn6
	N91xnz7b6R+3X+hl262fLHmb8D36bgNFixHCmFePrhbE7u5nqdCGhiq55e8xLla+
	LX+DV4CUkFPuE+oaFhNIPjH9OPmra0SQKd7Iif4q7P1NZg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyf1n99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 01:07:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso48246841cf.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 18:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786410425; x=1787015225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LKWM64w9B/428ZZASotTcAv1uE/KA59H6TXr868LmeA=;
        b=IpzkapH71zb9u/4SQtfQRTQ+qwkjcx71kU+dZ222JvjdAI5y0bnwvjSd8LcTwfQdrs
         oN5MWLUCoDzsLD/J9XUlv+rB673l2Wb+TohfLL08WGBYitQQjxvUqiSg8Hv/5dEqaHN7
         c989zA3z+NHeen3MCYzd2LK6EI432tV9ahUKuEQakXabDiI+G2D4H9L3mqsXPK05Vd5g
         c0jm4H1CH0xrAUP3z8EwftpMFsd0+vDg/zGWp9bh9ezmyjxDzTnZF0jPwv6eTSNt2M6Z
         7oCjd7wjKu44v2kw926+o16jyIX2JJZiAWumUuUz77XKZY2uDamHNbkWJur22+8ijqf2
         NAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786410425; x=1787015225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LKWM64w9B/428ZZASotTcAv1uE/KA59H6TXr868LmeA=;
        b=JnJcLRWVZrGd0qzdkJ5JlZK+uDir7sJnRaPceAjIDubshOWOOlYSrX+3TwdzDzCQAa
         1GEQOPpkoi39TnWQVb1ae2xMuhjk+uCoceu2GOGdCdA9QcbzB21K+IVVWCvKGZQkssC5
         Ti0q0u3buOsUz0Xb+dJAYrqo/ckKsaJY/MCUkQl+ZL6MUaq4vK/SL/GZe8lbRwcLYigV
         +bLTS6/XZ5NHxqkLuWN4aS8iVg67mANF7nLf/JGb+7qEpA+Lupe+9+E9j/MompddbKEy
         slyEjQcLAILqoap22DWiwg2Gc0QzdosvyG684GZNs4OPumvv/G0PG0Ew4tGruuUl6Xbj
         OFAA==
X-Forwarded-Encrypted: i=1; AHgh+RraIOkcHYUBgUpco/M8oW5uNc7Gs4H63KcT1X3tWlfR5sIkDsRHcgTBszgkq+pE2Jsw3NBLL8QzugO0@vger.kernel.org
X-Gm-Message-State: AOJu0YxzozMZ3sUgiTZglUnHT2ML0kSmPHLf49UUbEddHdPVO8x8Y7sP
	H1Hmymsx89O/cBS14+TRFaLuMO/cHhJ0N0DsUzZoZbVef2l1KXm9bT0qlsLz30XbEjqrkIpgIaC
	jOqiThLoe2wAwivYdb/hom2XD9kRrxFz4RC8siFI5CjJORTCRa1PzJF6CcUyItxk1
X-Gm-Gg: AR+sD12DMh8YTUsv5/cMlRJqWlyebBgpMdnH64Qw5Ec0/5sT20x9j3ZXKior8a+lA4g
	z7OMQFlW3Wvl/bIwsDrltEMs3xCUB7jTzLfbU5o84x3cxohZnIj7wrKhHAMGwowoUaPxIZBBGQD
	hk8Jy0RhCVY84pxBk3d5fTE6J6hMZ9E3y4qtyyZIgVV6jwwCO2WP8xebXX7L1tmxM63/XTFc/KP
	z5p2+wvinq5xMnaVk0XNJAwIAA+KxLq5eZtNFGFk3Qbkw4Ape1+sFVRPuckUO09YURxeO8yJSrK
	gqCDew425vtXlbxia13ku5Uw8TV+6sre7Tn20//oIEn8VTRH6Ks8moRWvEXEENuhoT7CfejahMD
	lZ8vHnN5caIBElJUGejhi64Kw3W+pTl/1NjankE+z99MQrGe6ApDSQedM2e5fTWv8Yt3DsP7rWd
	svIySXDLOySuTntA==
X-Received: by 2002:ac8:5c84:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52d4bb52da7mr76245001cf.8.1786410425699;
        Mon, 10 Aug 2026 18:07:05 -0700 (PDT)
X-Received: by 2002:ac8:5c84:0:b0:51a:8bc9:2915 with SMTP id d75a77b69052e-52d4bb52da7mr76244441cf.8.1786410425284;
        Mon, 10 Aug 2026 18:07:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm26841741fa.9.2026.08.10.18.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 18:07:02 -0700 (PDT)
Date: Tue, 11 Aug 2026 04:06:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/15] clk: qcom: Add Global Clock Controller driver for
 Kuno
Message-ID: <h3mptj7zar6lev6qqsuz6q4gqkywu5djadjglzsjztzqystabz@555y7a4xd6ux>
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-11-5e0ede4a0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-kuno-soc-support-v1-11-5e0ede4a0c72@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ss91sZnJrwpwVXSC9wpL1w9jWylV3q0W
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfXzzDMyFRReFVc
 jvLxGRKCHf4WJHNFnLdhQLKX3aZ+JDt5RaWrsgwnd3utamXiU6i0Tse5VozlbYyIFqUXifRau7O
 w3y1itYElhHjni9xvMBMSU6WflMXQiQ=
X-Proofpoint-GUID: ss91sZnJrwpwVXSC9wpL1w9jWylV3q0W
X-Authority-Analysis: v=2.4 cv=NqnhtcdJ c=1 sm=1 tr=0 ts=6a7a75ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=AtW9uK5K-k73WlJJaeAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAwNyBTYWx0ZWRfXy/41TXPljuhx
 wI5hMa2Hi7aGcu37eXOjkQ8+6PV/dU6CFXgEZ1o4DNmMoefMRyN1Pc9RrbEPUREfiyuYeEVTu5I
 sKVgrRAyD+0cqiLFmyBkwE6ZYgw/Sm8o8nBrGKJX0iIjXOctJKnDizSbn3TwgOm7cOqChHkVYCJ
 A6W2A8FR575BYUceqOutvsRL9jS/rdU6j7HVCZRfzPG4GXSmStNn1HJ5Is+fde+mOo/1QY4Ox8D
 2+ucVLWD+aqDhIhQySIUTYuJDVxTKykFA5AGyiJIcwR5jvHeDpeIkTAm75p9bxO0vNELOwiQ7rd
 qww83q4sKKn4OsrZqLxXS7dfqDWWF3/mVWyzsTjhwHK3DirVi+noRFsvDS0IBQ+q60QW4XM1jKk
 jPLtn3LTVw4UrajWGaQceSYG9n3OwOl+ZKdsgbKykkYjQNxV9PZK3ueBbtxAgTrAZKBKISWAkRP
 l8i0PVfv8LgV0BTQLoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110007

On Sun, Aug 09, 2026 at 12:57:10PM +0530, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig    |   10 +
>  drivers/clk/qcom/Makefile   |    1 +
>  drivers/clk/qcom/gcc-kuno.c | 1438 +++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1449 insertions(+)
> 
> +static struct clk_alpha_pll gpll0 = {
> +	.offset = 0x0,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> +	.clkr = {
> +		.enable_reg = 0x7d000,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data){
> +			.name = "gpll0",
> +			.parent_data = &(const struct clk_parent_data){

Whitespace between ) and { (through all the file).

> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_lucid_evo_ops,
> +		},
> +	},
> +};
> +
-- 
With best wishes
Dmitry
