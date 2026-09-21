Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18C48F01E
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991708; cv=none; b=Ex1QtCPN3ACPKOCnRiJD9KUVQYi2Emiu2EvwyevUVeTfNQ/Cfsv6fELA7aJy9uA/7woQcihmmw8vzhlcAHljEyaiAgqvI5G93rfadMYod682EOoc8VWPfNFmf8jMqu7eNsPifz7FExxb5LggSxLH5SmUFHFj18dvtJ+mAkKfWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991708; c=relaxed/simple;
	bh=m1yYYjjRdySRSDwEYNVomy4f7mN8aEu6wrcxnuTly8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tLsdRdff5uW0FyCrenSymg5JfuVmQA+ga1s3zcWGwi6Ds984bNruOsgLWoe/tBxWY+x9LfVGpbFNUqEl2ELfctzmwrCqwPoHIZZ0ThJ8wQliwGzgus/ME7b5PEm3w6MxhXKQHETgQHiZLrudW8RQWvTt7T06vSM+qVeapy9W+ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPAToCVb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgc+4Dgr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPAToCVb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgc+4Dgr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdqNY227946
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1l0xGPYmjoerQ7fYBq7N03N9
	7e+UsH48mWxRklhvRXc=; b=lPAToCVbrR6NQaR38Y7MMHgk6FK/dqiIL3H1biw1
	LoR5JAKmmOIlgedMNolxFbEpEYtUdvlTHya8ia0c+mb95Pfxm7uEuZ1lFF3bISjK
	MuR/5KnN6y+L7Y4vIn9TOJJ9TeKI/7EnwotqsJIKbj2hd5o2+lfz4GiawIL65tbq
	UnaSUdc/mlvOFjNvHtIAG5EiFOMKWVtXONnOaZlLjEFlWkJlbKSMlnCQEDh4ewbh
	qUPOY5rubJasD7v3ycksZZJ3RR5KoTfsCkio0wLc3hnJXnPi0ef1LZx3mzCcX7dv
	/EDhe+erj0y0A/2k3b44+qe8fdd19+ukt9+JKJmQZKqcRg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17grs9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 11:55:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso233569685a.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991705; x=1790596505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1l0xGPYmjoerQ7fYBq7N03N97e+UsH48mWxRklhvRXc=;
        b=fgc+4DgrEq8j5CpLNmF3Vzhu6S4pck4xC2w7nH1bBxZQyRZedHtQecyjC5JUFm1tHm
         DJcvOgCLL6joelkaR9U59729NUTDUcFJvy7gqRnypnSjdMk+P+1tBPJY8fguEvUMUJxY
         7OeilQNFDpO1pzxSWeznrrMIrjGrsxAhtdeLZ8nKzeHVKDUguO5T3nnoX64Bj62ayiRf
         WDuyiUxiUq/KOVnSVqUltDP9nHiZNfobyIUH9POJ26blecJ0Qpkh+gR8v1Mb9Fi+KMqb
         EAAKheLk1/zYBfZw4ZO2iwBPLOZ69QvVfVvBr2TM6ZrUog9XxIpGBxDH0TRoUZzCjCwO
         IqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991705; x=1790596505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1l0xGPYmjoerQ7fYBq7N03N97e+UsH48mWxRklhvRXc=;
        b=Q7nQ7WlaH9EV3bykiklqz+R9jFZsokAgb/tNsmYSJlHaPxfT1g8uBXYSQWCuNGG5eS
         uenMPrvhRAey5i5pFGVdG1GsH2tH0DgJtw6xbtuuw7ytA1swfKMKuAvAhxjq+GBDrUko
         x22ki/F9fTP2z+gxnk63BS6uS5nBopQ/gY7MHM6LX4ppRX+E8Nla/FRwL1Ok2wnBaeZp
         MxXWlXsrLMCgfDmtEkj1ndNtzIFDvoVEu1VtfWfNut+HKPLjBhvXDdm5L0SjR2Y5ZBgt
         iUO/Nn1euc6S8A37C/Zfh/ANlZsL0KHWa5bJVY9bss1+GDsfNKZQAu/XRCtqBQgEqn2y
         nCcw==
X-Forwarded-Encrypted: i=1; AKwUvBznuV0r+vw06icoJkoEtESA10SAbfkkfhXuwZHZvpyABQYipV7M//zI0pBTkOWAh854Rl2yO/xP7f9R@vger.kernel.org
X-Gm-Message-State: AFuF++kiXvmlS0XzIj915E2z7Q2xq+FtEOHuU4WOpGIb767lvK5QiP9u
	gr9JTM0DtXmCloQrkfdMUbFy3FBjIgiPYu6m5ich5B95NedAnFLUY6yU7TMWRnGy1WADGeZQfxC
	9cBRWDBA4jsbByD4uRtZTxS0AOeRM5cmBzgtxtotoPy17WnH89Cs86ZlD+0dFInqF
X-Gm-Gg: AYBFou1MU75pL88U2SCBV5RlUb4UyFGEyj66iVPhC1NJ0MXiY1W5Insza8XNpTOJ3PI
	6TX92WrYSGMOVJ+xZ/XRIf8z0TqD07QGxUJJyZr8TYT80Tgbuu8t3wIDnpXFcCdnhRjvwIxAUVB
	ZXXm3/yMBFqlVXdbx4743ymngxW6KDfhI2cHcsdP2HZ4DmhZEBbdxtAhIiib74d/ju1tkC7chK8
	LhiWy0buK5iexdKV3vORbxkd64oS6bU508UcskRbkq6m1rH6dw4aNYHNNy/b8DolX3tMl114qwR
	iYQiveNyok+bjGOsKCPTlMpNfgGvuRNU2D791nK5luNFadh3VEeZI2WvwaIR9bJuGAZ6YpUmew/
	EdJAfcs86udGQzg==
X-Received: by 2002:a05:620a:4454:b0:93b:c07d:a6bb with SMTP id af79cd13be357-93c15dbc8acmr22556385a.16.1789991704726;
        Mon, 21 Sep 2026 04:55:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4454:b0:93b:c07d:a6bb with SMTP id af79cd13be357-93c15dbc8acmr22550685a.16.1789991704070;
        Mon, 21 Sep 2026 04:55:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm235056795e9.5.2026.09.21.04.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:55:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:55:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535
 interrupt pin
Message-ID: <ezqh4tzvgns4i3i6zodx3h46xbd2qxkqoifzelihw62gamlb2o@6ps7bn6oloh5>
References: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-ifc6560-adv-v1-1-89b1435d00c2@oss.qualcomm.com>
X-Proofpoint-GUID: i_ey9tJCKJxF0oHDFMr7ecN00qpmlGLN
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab11b19 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ajiliMmGaEjDzu8pHK0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX83oI30L+piNG
 SEZbOk3GFFH77W7zugqTVAW01HOLo3f6Jp99dB0lh9pjs5IRi7jkvfZnClBYCmGkZlSaYtzozRX
 Q3RDF2/VB7eHqKwA8corwqc0nn7wKNylYfUOow2ThmfW+gWkunj63a0mjy37Ta/7YVTP08f7ITz
 Xn30cruVoFx+E/d58hKEvE9nrEehjincyr6gbD5mSLyM2WqYYl1SGin5EfX/y56HFhodAAfVFn9
 M4NdkHrZP9hU9g8i7JC1RNntMGcTeqcnlIP8vjVfv/A/oUVE5yb5nWZJYsmq3y9fzVb4+EB3agr
 9lrMrnvj7PetijKlgHjgCPIw09O3JuvAHk8B2whoH/h16G0UHsDGS+YgJlQm4/7WH1bZjY0QXvY
 788NkvCovRuILaBfBB/m842sBWlEXO1So5hlqTC0pp1Fp4oOS/mtY8e36id9l5v38njGDiq989W
 o0PfupArvkklMGuvizw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MiBTYWx0ZWRfX0bBic6dUrYF/
 KFs5jstyxsZCGPnT3NjDdSo07oMNjVIfT8AmKk/LIGtsZrPrblIUecBUmFk209E/pxlfuNupiVl
 fj24bgImU5TbXj1nqa6iwB0hwwlVX48=
X-Proofpoint-ORIG-GUID: i_ey9tJCKJxF0oHDFMr7ecN00qpmlGLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210172

On 26-09-20 14:11:09, Dmitry Baryshkov wrote:
> Probing the ADV7535 HDMI bridge fails on the IFC6560:
> 
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): gpiochip_lock_as_irq: tried to flag a GPIO set as output for IRQ
>   gpio gpiochip3: (800f000.spmi:pmic@2:gpio@c000): unable to lock HW IRQ 10 for IRQ
> 
> The bridge's interrupt line is PM660L GPIO11, but the board never
> configures that pad. pmic_gpio_populate() reads back the state left by
> the bootloader, which is PMIC_GPIO_MODE_DIGITAL_OUTPUT, so
> pmic_gpio_get_direction() reports GPIO_LINE_DIRECTION_OUT and
> gpiochip_lock_as_irq() refuses the line. Requesting the interrupt then
> fails and the bridge does not probe.
> 
> Add a default pinctrl state switching the pad to digital input, applied
> by pinctrl_bind_pins() before the driver requests the interrupt. The
> ADV7535 INT pin is open-drain and pulled up on the board, so leave the
> internal bias disabled.
> 
> Fixes: 34279d6e3f32 ("arm64: dts: qcom: sdm660: Add initial Inforce IFC6560 board support")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
