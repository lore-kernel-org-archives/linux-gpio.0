Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780247;
	b=UKgF2VFVkXTY27nmT/pQGdgPM0rnH05ZAfqHk8aZHH3oK8q9KSRPG0M8WPO+r7bIPDsV
	 tC0mCaIqDw95moGckwtVht0SzM6r4ZCXRNRkkbyu151PFHSNNYimQ1sOICF1iK7YX6vt0
	 3Dqsd59g+6anQvrI8Biwpnj0V3HVPKoyW/tw8YvkAL2VE5cp7p008PIETVPle3PzNAewg
	 Egg6OTIae3HWqtPQCc12hOX7O2O7y2pYMKwrvPSjbA3x4LLatN/1KUVq03eV42J7ToMiM
	 Jq+Jls6KMjL6n5e2Aim8bhnl74AWqHWveBcLpBkt1uZ2TRvaxQ3vlosCFL9m+BsImFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
	b=RnAdWCd1F53zGgzqT3LJ3Z4SUFPwNXDvONHp/5lQ1Zf03k/m0hg00q9/Wi0vvJ9xe7tD
	 kHNVV9mMh2ae3NX7DMn94Jbo3Brkn4gdx2JBc4zys4K7vqJjqlS8WcL/5Ae3cViuOozmW
	 GEHHvr/xc4eP85XfcuGbt0rXOUlcTWHooKmdHVJPJ8SDGgOT9jB3NTGjZh5qTuLJ8UfzI
	 pEEBlM1VrKDaGcKJQFzHJF0pT+iwdT2uBJjNsvMmQL/Q9NlSEVq61Va67G05ZMQwtRXTJ
	 bjgS5lyECKsDqVR+dtUjcSVmttsUMoMHsU3UNKtaQhoaSFgjcAIISvLq9vz869+xgsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F5C606A331
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 08:17:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44F5C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZjPaLixx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHOhW9S4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47QvbI3335558
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 08:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=; b=ZjPaLixxKZWZPP8X
	8kyd36Uu3KY4HkNGJOalvoY7Wd/omIKyQidf087yBX4mMa1VZOaiIPLvExnzuSjS
	PXXPtcT2X2dT6G9cFwxXu3v/XOwFG7XOynrzXK+rZZppVOgu3BiBpmydeBZYXTwJ
	GlkB+EK15D0NYv1ICHAS25DmSvlxAXSBxxTUri1R9CRJgFHPggEsNa/Ya9K244jo
	OIOIPofyMccH422nQNVG0I8D4Gl/l5ugO2ol4psuscX2vLL4jCqfKp+4KnmnmCWl
	3LAj73E7jlrtUXKs5rozQX9aryLev4wWMxvC5V66KaCxt2CpEM5c3RKT2JWRSuv9
	T3aLxA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbtyqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 08:17:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so11424685a.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 00:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793780244; x=1794385044; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=eHOhW9S41ZMX9fUeIteXJknWzjZu+1QPCVKNzhwlk/z8qHtrKsPYPllGJi5ePzhxP6
         jytsgofXy02/Ng0dIibw74mqjYpvH0siWcUAp+WEWWL7e+2Uqk5ZA0flwfCwd4HuExvC
         3WyN7WBlnYTHrgP3l/IvF0TveyItsxcBPvai2ESYjYjnPTwEDN4wOAWlb1MobPqpI3FP
         v2y8K3Og1w7wVyHzmmkPbpSbAFHYZbO86gOuO/Qg3G5H8bFScn2DXTmr/AqdPC4Q7H1H
         XDlcWqF+ymL+U+yYih4T9Ul3W1gZjkg8jJHVZiPoM4FXHZtr0UWGkvnR1G/GH4sfcECm
         uxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780244; x=1794385044;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IdHy8wNPHVQzU0a8sO+LjN2NQHUa37ZPDyoHc/zCyw=;
        b=zMZ7HuWo0kcmTis2sDtS00hfst2xSxjRqt0lwYhG2MWmDAf//SkBFAisWG4r3Ec/9P
         QyoJ6bx8SWxB3disCtUAcxKi/MbNAKBgWQC3PtEXXERHMm0jL9CwL8y35uUwy6MKBry4
         yaFZzczitsmBqLIt66V52ZzYhIIpLfV4dtk5IvucBJULCJULUZHwWgL3srkn/fS7RArf
         /vse75BpYetq2ZJY955gM/PIg6yV4dt+70LFql0IqHEGm2H9nAKvfCATZDdD3Rf7BHue
         1UzHeL7chdfFZIVmcD38AmjUUaCejgxYkedqWL0G4KjrjlufG7YdshlIXfuSfg9I9nkG
         J6Ew==
X-Forwarded-Encrypted: i=1; AKwUvBzXVO1n6/NP6FCju4iX/xb17ofwTYcLV189FJhill3DVj+KhUi7rq2NEpTZ5CIA4c74sXPL2SBFnMWT@vger.kernel.org
X-Gm-Message-State: APuU4Z9R1GlLZYb6NlWaVYNyY4RxTIki07bgc4zDQ1vTBiztcenxIaJl
	UBSL5IX3fRqfuNpmEZLfS5tEeguZNCI2pPNYYRfp4ERo1j97YEDB+NacVyHnEEqdCOXX+Tg0bUI
	Ffkmc4mV0D99ud1oLB4CwxiUQFqtTu8Phyo1fN/upfgH4hhaaQwURWY0n8ekmZrJ7WP81BXXO
X-Gm-Gg: AYBFou0FTrpUF0y8cSQQALC7NNvZUVab58l7mEyU8xUk7aoSjtuWzeNP+k8cxM5jk4q
	iTex1zAAFEllckLQwQDqEsWag5hmK9UyiOEFs9B9rX2gnOcEWeW5T+NSiA8rQBpUO5n7QPcFpLy
	3dhy2B7Dc6io2+I+u/TSZTHL+8VgAfHxwJALwAYztGHKz/Nr5e2aeFpDp1bSEv1JGIsxDZ86uzX
	gyck0ypo3YXRGOuoXYfVCULJ1q1hRcD4akX620HNgaFtfPkPTA66h+zhEKooTJ4eMpeQSScuP8r
	W5Ty5pFoUv1wXzpf1Ob6jWTPwPl0GuzfG6V+1GlyG9EmWM1b96A+uFuRhZpL4x4R8zVRPNiM/ll
	ufdfSIzKTweRvOttyfEuG/dyUJkOKA+Lb9CE0M889cmmf73Np1BlG8Xqc3jQNKz0aU1Kb
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23610885a.6.1793780244277;
        Wed, 04 Nov 2026 00:17:24 -0800 (PST)
X-Received: by 2002:a05:620a:414b:b0:945:dc04:c4b6 with SMTP id af79cd13be357-945dc04c858mr23607485a.6.1793780243794;
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0ddcfa78sm46641766b.0.2026.11.04.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:17:23 -0800 (PST)
Message-ID: <8eac300e-ef21-4dd1-88c0-63e798afae2b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:17:21 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] pinctrl: qcom: Check qcom_scm_io_readl() return
 value in msm_gpio_irq_set_type()
To: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Ajay Kishore <akisho@codeaurora.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261103213002.1673560-1-lee@kernel.org>
 <20261103213002.1673560-11-lee@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261103213002.1673560-11-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tfpgartwHQZAdRtC8qNMzxBVqcvWvrqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfXyXXm3yyBA8e2
 3+gjppZ8uO4iy0j/NZ/uF76MdLasQ4vTNnwfnQFCIfeVzuiXSGMvwLv8R/NGgCiNMyGvwxCcg4a
 YprPUhU5FmmSJAaYNy5+jAc72kkt4oNR7JbI5Pr4e30IG0kYu8FtEviaIIKrsKgC6SswMsKnUV8
 aYhHKXp8Sn791gMmlQTfcqkfvXTnupNLuz8afAO8gd3sNpMzu3ihFVyDQH9sYKA7bfSZdlUhZ/q
 BOyvIRd63W0dECHzJ1mjdze2IZ57j+mxZS0xTyDrNFoYHFU2r0l3J0v2TKyqcNEmjPYHJJ0H1Ft
 C9CkfqQEz2TtTzQqtkirGu3ceNsbE3+2E2BASSx461088uabBNkhlfucvKfYjd90FnZ9fc7NC6q
 N8WBtu468spd2Zw0nIgiSgmKTZdVjCWIbDXd7MjqUZgRqsnkTYp7/wJtAM2NDlJF+gcDK40iYwK
 WWMlYM82enZrU1ZNx/g==
X-Proofpoint-ORIG-GUID: tfpgartwHQZAdRtC8qNMzxBVqcvWvrqW
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aeaea14 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-MbjPq3b4U0PC_0A3OAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMiBTYWx0ZWRfX6pLeDIOYsw6z
 mINWljVSwnq0npUgy4yCIPX+4hjSsxD0kxh30mu1l7KQ9piBrRDW+C4kkRBtDHqv/QYENibgl6g
 D5UZTshoSyEZ9XSlrey+UgVgQAHlBYw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040032

On 11/3/26 10:29 PM, Lee Jones wrote:
> In msm_gpio_irq_set_type(), when pctrl->intr_target_use_scm is set, the
> return value of qcom_scm_io_readl(addr, &val) is ignored.  If the SCM read
> fails, val remains uninitialised and its stack contents are modified and
> written back to the hardware register via qcom_scm_io_writel().
> 
> Check the return value of qcom_scm_io_readl() before modifying and writing
> back val.
> 
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 27f06bbc113c..1b46735fc4bc 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1105,11 +1105,13 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> -		val &= ~(intr_target_mask << g->intr_target_bit);
> -		val |= g->intr_target_kpss_val << g->intr_target_bit;
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (!ret) {
> +			val &= ~(intr_target_mask << g->intr_target_bit);
> +			val |= g->intr_target_kpss_val << g->intr_target_bit;
>  
> -		ret = qcom_scm_io_writel(addr, val);
> +			ret = qcom_scm_io_writel(addr, val);
> +		}
>  		if (ret)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
