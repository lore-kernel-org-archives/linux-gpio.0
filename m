Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C643CF1FB
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784536191; cv=none; b=cqftRnDf4GGId/5stV59iDcZk1LlkEV3e6JVjxeOYh2pMEOn+cyOpBhF3riwbhuTdVucHxyvvyzba+dYXIqfVnXDD1ujvLCttlRKdtPOz1EcrnRxTxR1sl1dUm4GecPdSkbzabkrAdVfWt7CN2pFq93a8LC3RQM93VLELRHyn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784536191; c=relaxed/simple;
	bh=HI2Kle/O/7od0kN24XinLjdCJprWHronJHrirEXxHWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6MYLVahq1ilZKCgP12TT1+2B/GwAfKVMfjcDb/mbDCOf+/nPZ53pjFwzNfqh5/b4zdQnwdGkCtUYzdok2/7nojkYBNF8kKc//Yrx3/8FgAlxa4xUNYiIrTCyqfrykhKWUqQgBdeqn74Mla3Uqr0ELpQlH+avumZ4FoZtFyqtWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq1bfko5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSAo5YUH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq1bfko5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSAo5YUH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RjFS1713706
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=; b=cq1bfko5ALB7iqcJ
	d5rLXlUFnpgUruVa/tx4dG9gl/RDZDVDiYivn6ebgnNX45PEn40vB5Jg9ai+XrCv
	naTJKF8FO7Dnd0StU7CmzkhUBr1zamkCN4hejbxB+bhEYpTdIig0dIyZCs9ojfu3
	gmcsbOl7aobCmEx4VswjLXcumkzvsua4IrFFpeNQqifq+q9+BBpNYtMd2sQpoA+o
	qLDvy7M4VP9qGen1JW7kKpzmnRfLRlwZHOuUkMVsiNZrZOL7FoMtAZJEI3t1pXeG
	vzVDz458OvExKfL/N6ErnttqoSt/MTImGvnZRRQfTE4HYWazgxMWnp27NBEqec9Z
	uZZQAA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc57ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 08:29:49 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c08e9c344so21911481cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784536189; x=1785140989; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=;
        b=CSAo5YUHQNE3JqmdUmOIDTOvE9lAJWr041aN3KPA2WOx939T73MXwnUnKnADVm5lib
         LlFqYlE54dPD+gURFcLmmDSUr5zbRmJ5t3L957MvMvDIkoHrDSaIXWwHCZiOvRr2jRkv
         Zg2hFq58DU1CbrR1fiQvfe2LqTT+PofJ/d6bAT1Zttkn9KNeUv9h7UnYGHDSttoPD9zM
         U4SP8JycInSHqYF1d4X1ZxKmfRJmyBZTjnmztdTK9Yi7MVjV6mABTQZXrSUgC8ZEpZ8q
         XjO1l8EloL5OZkpnfRcfaZOKLhG21419elajuz4b+O2y/BqP6guzsA2yt943jEm/Otqi
         z5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536189; x=1785140989;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rikuGpGfzrAX7InZWl2qF4GcA2A0r2MSevuAd9tWZOU=;
        b=bwhSZIU2kRInnFxjeywsIUS50EIfQ2q19EI1/js+pS+HQ+vMvae8VMe9Bj8IQpHXiZ
         8EQ0bOkcDviYxOnp4NiQZk4fQmL9jklbSRxO9G5Zv3nTUN+tCdWDQ+DxvgLjy+8AH21d
         u780taKRA5tTCGUG4NwZ+GJyNypvvGrmCSXDB42UjJcI5QlP2E4jPi9OSZGWdAJSrV1E
         vKHqhL9fBk9t9oncH4EuhqtOlnN1TvfktDteaoYOo1SmqhDaMvszAP8bz/VghAJzgoxz
         lXT6PlWbPoqkumqYpPy+MJ6rkZ0RNkJG4jr8L8IYcVubNIEarecWAkK+z1nHr+6sQXDM
         KZvw==
X-Forwarded-Encrypted: i=1; AHgh+RoB0JLlsIAIjHTLurM9NXz6Y2OLNytyJ/UU+Dr4IGehqJUYvuGu6yBnnkRa2AYenqyY6UsVKH6EfptS@vger.kernel.org
X-Gm-Message-State: AOJu0YyNyC+hU1PXa3L49aY70jSXKRvuGzPZtYI3qspqKmsKlAhLEb+m
	jB71dI8/vPsdEZOPVUnf+lXw8FAYcduaIHLZOKofKHZFeIhS+1nN7DnEPVVcXF7H2AuZDPcz+VY
	eknha4Zk0CRokqzki/MnutBOTerHQhk2eKgTrgbcS77i3e9O53eBS22etnjTvVqh3
X-Gm-Gg: AfdE7cmrt6U+Oo4dBOxFs+5lHGyqEl5jGjM/OZbSe0v+Hjs53NGGmJRcP1QklHOGN87
	9Z+v1zrzVbV7tr79Jp0Zca8MWr7W/EAu+D5o0R11R7TSFHgJuq1F++kk/Tyjkfk6UjLIOxDhWPD
	btOB7s2IgluOyUlHMigdR8M8TVFAOd7NrM+Dot3ZQnSPShKSky4waLXc1i5VKcqQwX2160PngvI
	wgicvKCIuhE1F0DfJhzRchBELzpe4iocUdT8ZKyV+Qyh4NsPoiElA8RCQVnTj9+6cTAA7otU+8f
	ymvW4qUYwUSQ2NK+02INdY6/pDpEVjFlv+VW+q4ogB/jYIketuR4R1A0Y7vUdZTJqxcXEKgYaYk
	xPNbg0+KScEYbVLFGqe5YM0dR
X-Received: by 2002:a05:622a:791a:10b0:51a:8d32:f796 with SMTP id d75a77b69052e-52138ec38fbmr75708631cf.0.1784536188878;
        Mon, 20 Jul 2026 01:29:48 -0700 (PDT)
X-Received: by 2002:a05:622a:791a:10b0:51a:8d32:f796 with SMTP id d75a77b69052e-52138ec38fbmr75708511cf.0.1784536188467;
        Mon, 20 Jul 2026 01:29:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfffsm425952366b.11.2026.07.20.01.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:29:47 -0700 (PDT)
Message-ID: <9ca46685-cd1c-40d3-9de5-65e57621bfae@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:29:46 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: qcom: ipq806x: mark gpio as a GPIO pin
 function
To: Hans Ulli Kroll <linux@ulli-kroll.de>, Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260719134548.8830-1-linux@ulli-kroll.de>
 <20260719134548.8830-2-linux@ulli-kroll.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719134548.8830-2-linux@ulli-kroll.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX2mmy4ZveVQfY
 EZF49Vb1P7FhzBZvP1uCwfofsNGbtuqx/D2rxl4R5DqiFvXNsWN6afPl5Nv7i1lxGr7+a5imX7y
 MqTt+/LCzK1c+pFfOOVvSkWr5zSnRAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX9J1uDf4j2hUH
 0LW/7lSiWo4krieBXDRE4GrzDtwVrYP729sjtD0mltoVrrmbb+SOR0csKebKsAscHT7t3SvSwDT
 +PW7ZzoudPIS2O2U9b+OPqVFnQ6bfKMht8kNgxq8jJpROi9DvDYYGFoVBqg/JpWp+O559CyFbJs
 DQ3cQUXlhxmWRmVeTX7d9Jhh1nrKHkfjzNO9zgzPIjV0F1jWitUeDdG62ybkSpNLVyL2ou9wXQ7
 7dWvISCJTZqne70HvIco/68sJRLFBcaU96VLrn6NhjC4JecjzgNnyOpj3hPMC2XjBVZ9QeW5bVN
 yt8TMfyY48SXyG/8dVR/VMnEWRPiwGpFOgVqJ60qrp44d/wzR33LBIEorMvZfo6ceVChb6P91I3
 MSvZD1NrcDzoId4wLSh6jicqctVDFoM+PiMvHtgAUR3SmFVGU6lvZVCKob7x2bTKMVS9P7vM+B9
 OjPiJZBovOHPip6tdlw==
X-Proofpoint-ORIG-GUID: MQb8nVrEi6Shwl8jpHYB7ex12FKsD2IH
X-Proofpoint-GUID: MQb8nVrEi6Shwl8jpHYB7ex12FKsD2IH
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5ddc7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=xhfSZxL3de18q6pc5_wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093

On 7/19/26 3:35 PM, Hans Ulli Kroll wrote:
> The qcom pinctrl core supports marking functions that represent GPIO mode
> via PINCTRL_GPIO_PINFUNCTION(), so that strict pinmuxing does not reject
> GPIO requests for pins that are muxed to the GPIO function.
> 
> Add a IPQ_GPIO_PIN_FUNCTION() helper and use it for the ipq806x gpio
> function, matching how the msm-based qcom drivers handle this.
> 
> This allows ipq806x to keep the GPIO-related configuration in DTS
> without tripping over strict pinmux ownership
> checks.
> 
> Fixes: cc85cb96e2e4 ("pinctrl: qcom: make the pinmuxing strict")
> Signed-off-by: Hans Ulli Kroll <linux@ulli-kroll.de>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
