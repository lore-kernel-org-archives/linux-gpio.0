Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31E5348C6D
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195294; cv=none; b=kh091XRdV9HpMxlel+plk/2k0qrS/IX4JFNbrqjSRJZtMTLM6SdGRhdWb/HGab661rx8E0konECtQyBPuyEs0tRhmO5eXDD4CV2hnF78OLrCEswKyjuMJmvRrLNdeOrCCntV1RJ0D+PMeIAKi+etAI2rDx4a9BnYwftf4t+MNgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195294; c=relaxed/simple;
	bh=F35sIr1JtcqxmRy00QEYIX6S1fL3Pge2sdAjqNq4HIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ll/3y599NR+RNKqEZCZDMHHXF9oC2sOEbknOLscELCRV2cz/A5WAmw827BjRKsqhSVUbsLesIABclxozXX6EiRSPtJFwuc6U5LPnyHh4FdCnQ0LtfAevdeGTZ8FxVyHunab4L+tTkqLqc6uRGZch/WcYj0M2tF7SaobY/5Os84E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NoveEY/Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g++ich45; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NoveEY/Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g++ich45"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DkOP1734155
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 09:48:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=; b=NoveEY/Z6MlZSNGv
	QZEZRtX2mnQ8pcO/J9M0pwtgG17Seu5Jh15pmQcQ1NG6MlSj1W+ulDXlG0WZ+/RV
	kjjjrjUG9qjUDOECY+y/P++RZjqsRdkiqF4p+LMK6vFP+omgwWpbOT7H9jO7+EFc
	ZSQTAA0+1XdSzGBp+A0gi+zlAI7R5Reld/uHO/CS39cnEXKYJ482eTSRSar6S1nD
	5rTUpTLGnEpndc7bDh+gzExj4TmBHctHK8TVQUZ7d8czuHLUCUc9SqfszdgLC4i0
	DmwgJD1cVlBKtwLdwbdW/JIStKC0B8cW6Xh6s8/aWXxk9baluwk0Cquz46lK60Qo
	EPwVIA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed063q3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 09:48:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6cb57d25so146184985a.3
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784195287; x=1784800087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=;
        b=g++ich451m6x98eKvOxOMvot8yktyuCzWY5MQhe6BTQmeDI3QHD6DqVk1S3QGZvkTe
         2BhZ+HJTG+8Bjo2kSyIL8yIPTZyUG6LUYSOkds577jZIJnPkwTnY9TWPrGBf0Kb6XAKS
         gkEtjUiQA5oKRcbJRrYgsNIqLVlOeIyv002aEAYbx8NnJ0WAtVPRY2CHBxnTyh+Mje5i
         yAtGjl2toJ6Wuoq23+PjFlflm7bX40IvdVuj4cN2/T3ch/SPcjSe+YzLJFb3QycMyKEM
         d80ekkBlfV7dI17CS2+aeqA1TE3DwtX5gFPralLU9GjAHwYWlqqWCdpN5Hdj3N1/IMA0
         Mjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195288; x=1784800088;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4ITDIkscEKFbjEUuLssD7nN1KAUxjuBCEWf0pJFXcE=;
        b=qzTtDC988i807ebh0pgRRgiWFVZVuMZYG4EHEpZgB4RmLT2Uz3dBQConnZgRd3Onkz
         BtXdtUaFSgDFNfzyKahHkORasCXQGLmahjjeT8SbCbS4JWr3vXSXUDuBRWy2gKqi6fo0
         0sSR9mjcXeldS6R4zK8w+LzTPE9RK1ntp//m2pb6qGRzmDaWCIobJupOwE3JE4TNEY2R
         zcFK0Rvkiv6bJdYZXdRhPA4P+ghDUTHcExtKHNZGbbN6gVjoPY7s6KtcJEwPO7UNHQfH
         L0GyDKxZ30uwU8nXX7wxc5MkDB8JAXhjw0CBp6LdGy2uACLEIpsFCB0tYRTTGMMdxjnM
         gLhg==
X-Forwarded-Encrypted: i=1; AHgh+RrfXRSO7LlAFjGo7nHEthjY6DH3tYz2oBj9A5rJOruYz8he/my4fwWI+p/954L/+J3i9JqFBj7B6AXj@vger.kernel.org
X-Gm-Message-State: AOJu0YyI5RCKC5LWl+W1FLWYLE4X24ZBF5WUvDhIqLTQnoQSwpZfUbeq
	M7mPJyUTLhMVBB+ufQKThAPdNSCbQqBH8MTK5+Jcm/YfDMzzScMO4P68QKSHW9kOzOxGFUwI45w
	95MSk+NSJGLoVFHWIrjp6Y6ueztjI29TBLsftyCKaL1DhEhkKAo4svsdM7ipeXEjk
X-Gm-Gg: AfdE7ckNEsQ8biLXTixqiWA2G1LAMyxs+XhtwsXEJTUQeHLVP0OVHAt3vs8OBdJKxsF
	+n7Rvkt64Viy6kllNhi+rOvgMaqYT2oAK+BoAQJZ+H4Zt9P9idxDw9AH4jjHIYpO/M7fyUrVAlT
	x72dOM4FcquMSurkU2kLUP/cRQY7XdGQIhpB83RMGSOX0NFH5z4zDeMAClTmBBP/KjVhD+ARjSH
	n3D7VlrSRZjuUy28W7B4ITsGU6TNDAN1VEJpcRgt+L3u7yFhvumk04kVaPpjb+0J5MhAavbz9Zg
	88l/KznFefXBg+P6kAl/crbzguEMxrvmG7TEukgcnoCUc9HnFuYEexUchNFsTxw/17dzn1pFGkk
	Gcd88RW+/q6CC+tuba+WtTljI
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1822700285a.0.1784195287655;
        Thu, 16 Jul 2026 02:48:07 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:92b:55d5:ba3 with SMTP id af79cd13be357-92ef29b64f2mr1822696785a.0.1784195287124;
        Thu, 16 Jul 2026 02:48:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c16871b3dfasm178771966b.28.2026.07.16.02.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 02:48:06 -0700 (PDT)
Message-ID: <b59bb73b-d1ba-4392-9805-4d0ded011b66@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 11:48:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] pinctrl: qcom: lpass-lpi: make mutex cleanup
 devm-managed
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org
References: <20260713184549.929569-1-prasad.kumpatla@oss.qualcomm.com>
 <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713184549.929569-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEwMCBTYWx0ZWRfX0fWVIggrRTfn
 YGP3yN/qkH7sKLV9HpTDxOs6RO1bwKXMc9ACrdEyaS8Rzp1oPED3kw9RbIRzkIDMNnQJSoczQBA
 ZQmhvwGnRLIdl2Ez3Kgs6Ap+6/LOUG8=
X-Proofpoint-GUID: Zf20BAv-uZKMsCQf8YvZGSsvQiCY3t3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEwMCBTYWx0ZWRfXySab1PP5Uk5t
 bMHY7BOK7FRenAb0N6b/VsznBNwC2o/TYDciMeoDh4totGiKZGrsVpG4tl9B2KXr0U0WJSGw64a
 8gUvFkdRk+WD5qolKjRbANIlTAfzmaLXAohlZA6Qhde1k8nBtSSr8SaXlcc3uwlxn5Y2HcDCBFA
 V+hIIetUUX7nvF/ELlmVfVN+yX0DiniHysCGhExGdxuDoPg2tupzKRdswFEtNDJdyHT7Xz0N1ZS
 q6nJ6FdBkzTmxZ/Saj7rYeHg9Wp09lBS/sanNyEnHBBa46jTaWyCW3Gzyh5tp49Frs+84MtkmlY
 UrzKSTaXdXWKphUC8N8zkLxGNAJxoIIh/0XZXw3cZd8WzS8Zjh7+KoJPlEHvmKClvY4zgNc3W9f
 JgcDghLX8TO4NaHZO9ecO1E2rV4sj4Lf6ZzawyJYFmW/d4VN1etht8fQKnXAtAW6fRrLZ0P6Fo8
 lxjqpXkD60t6SBIX9Gg==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58a8d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TvLmYjrqrHd7K80V5EIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Zf20BAv-uZKMsCQf8YvZGSsvQiCY3t3C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160100

On 7/13/26 8:45 PM, Prasad Kumpatla wrote:
> The driver registers its pin controller using devm_pinctrl_register(),
> which keeps the pinctrl device alive until devres teardown, after
> .remove() returns. Explicitly destroying pctrl->lock in .remove() and
> the probe error path leaves the mutex destroyed while the pinctrl
> device is still accessible, risking a panic on concurrent debugfs
> access during unbind.
> 
> Switch to devm_mutex_init() so the mutex lifetime is automatically
> aligned with the devm-managed pinctrl device, and remove now
> redundant mutex_destroy() calls and err_pinctrl label.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> index 5fd4a4eba..b3e365470 100644
> --- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> +++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
> @@ -559,31 +559,25 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
>  	pctrl->chip.label = dev_name(dev);
>  	pctrl->chip.can_sleep = true;
>  
> -	mutex_init(&pctrl->lock);
> +	ret = devm_mutex_init(&pdev->dev, &pctrl->lock);
> +	if (ret)
> +		return ret;
>  
>  	pctrl->ctrl = devm_pinctrl_register(dev, &pctrl->desc, pctrl);
> -	if (IS_ERR(pctrl->ctrl)) {
> -		ret = PTR_ERR(pctrl->ctrl);
> -		dev_err(dev, "failed to add pin controller\n");
> -		goto err_pinctrl;
> -	}
> +	if (IS_ERR(pctrl->ctrl))
> +		return PTR_ERR(pctrl->ctrl);

You can retain the error message with 'return dev_err_probe'

Konrad
