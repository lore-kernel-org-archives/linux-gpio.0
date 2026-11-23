Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446910;
	b=GRFJQumDTk5+tRgyD2MfM5+s6c0z1t+sv76TwIQBxih1ioTQLXzt3TA19OGYJGXPqBmY
	 1e9SF4y8HI4KSJahH92bTQPb75rkimNVfRnpC4HT6vReWP7rUkR+LLwVn6ebQVrFwDOzp
	 Jw1Xe2B37u2lOvKs+J8wnibGtfXb6IXK/RvCbu4mHHeqa8UAEeWUNn2hcPWh2QPAWiCa8
	 a6qJqTuJdUyTwlw71fxFiA6k2YIsLy0EvYwUKJSxepaJSFxyploCnart6vQRe6tj5CrFa
	 UrrDE45MWB+sQyNn4/fb4irCrrtdR6VnRIc7UIz0i7WHcDKyFlppKtcFA08pSDYkF+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446910;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
	b=ppUrDsvc8rp33rfZHMiGuI+JGLL2legLQBg5hZaDaCCRhVvYqJIfrSsduHffj69Zblal
	 2d9bFc974n/R4106uaU6M5KIZOAoE8epJVK+8c4C5ayRiU2l7F9NKcOAQbGZIhfnkRjsD
	 yOz6BEYhmnz9qSIv7mnc1aH9uDd6Pm/BWULrzWKtCcXFFDtkFpB2P3Xi0uZJAkb3XHsFn
	 s2I0zwPxiRfk8Fuq2lfnDaJHiw6KbYeyNh8D/rVIBuP0GZ/lp5N5bhcBCeNdXRVb0lOmC
	 HHPHyBlkFhybau7TbWGpKONWb9Ldq9n4bhMAdU2d1WFn9MZHIT9APwq+NCapu3ToIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pAo667L5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAOhEV1G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A11606A327
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9A11606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pAo667L5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QAOhEV1G
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKrqx2369037
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=; b=pAo667L5bJFkWDs6
	dKLzFgchML5SuSMJY31N5nvNMj5C/B9Q19iHRxCBYud0s2acOOeLrEQ9eK++2zwa
	kAo9JxjaI53XAqrXhIRsj/90v+XBUMr2G8u5F2YoccLjvLQ/aziJnQ1+w649wfm+
	GmlZdcPmYldJk2dH9Mz+BHLYyna4e+UsGVQbLLieep1p9qGKmo762HZkmyJhazQT
	PVHqS50Jcotr8U5vfXrLupsNjClEi7EJg0su5I82m0ImqZps9e6PBtsN54XQnl1B
	1tnyDIRuG73cY3rn2j2/5ZAw2GbalHO1Cws3I1NptJ6TfEk0q/TbXbCtI6siX9H2
	QQyH7g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9ypd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:09 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5407322f927so142508b6e.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446908; x=1796051708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
        b=QAOhEV1G2DEtJgzpv7LpmABcfQ+PMIhA+dk+MgENTWgHKdO75z2XQtxfHExT+RXGJ/
         NfcNRrVPcF2mWT/4dVA5fmEbezJD5HjUDz2Wk6HkRhGUJZURkSLsD7WOwD5jTZbRO/Hu
         +yOK4/AMaJwp0Y3LfcpWW5xBHfnVUNvh9DIr/9pq9KLY3IUY3Ty1N6oH2Drt2mXUbhRo
         HqBtK1rXmimNImrN+ffDPGsVtWWTbWiUo26z03OEQlRjZHmJi5F09tIf5g28vcSwEUoa
         3mVCF3eJv7zVwZQOqwlXlKExMI4QSIulnSnqy4XipqpxlcoiLBaDD7LxYBwASfHvsJ/j
         VFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446908; x=1796051708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4KX29UbNtj6ASBaygB90RKi0FmH120qIk8XcUyZC7E=;
        b=ivvGtRSu1SyYrGhZa5oR4Kl/U+XUcyQaoIAJHoK4rrKmH2jo8HrOHYJs3OdOOTWnGB
         iHHrhBmWmaiBz+3ekYaMcs1FUAVzuo9CRgeDhkf45ORT5hH671I+G8U1bAReTWveIwDB
         cPZBG1wPC1j+OhlOyQGfkNLis+phXV/lRMq48olwztLhxuJrK2TTI2ZlrGCYKrk2wWkN
         cEf6Ac/CI0kdiuls03Jhtnifwk6vQpjBOSZ9ZxIjJnvvGIqeglSpVIWNZw8GcxhRfhHl
         YBGh9u8MawgbmsshgcwoN9n5cVXavbaiE2yLDK09XFCw1/H/hT7z13KJQfvYHHuQ337l
         1GBQ==
X-Forwarded-Encrypted: i=1; AL+hErE5S0xIR8ejUpXR8Pek0+87N9dm6wROlTkULWsjsZv4QIC9+tV3py+xhlD5GZ8tYiuZ72ncl5Esg1+5@vger.kernel.org
X-Gm-Message-State: APuU4Z9rivW2uXUXL4TWxh7be3Om4FJdmrBBjEPNs3KswwAonGqIR8XL
	wkuRO9+u8tgdSgcS8UDdhkzIX/WBNjmFueG0dXQxkQY/z32jfcUhfXD0CmUDV/iIm2Iyij8+z20
	x+NGNjsvrAIF86YQjFwNfh4tn1txnrrh1v53KFKvBA6rfL8WVLxmXdc+oloyiuec2
X-Gm-Gg: AZFdTZfLMZfBUUtN1xpXLkNTvY2LI4A610hV8dRat/JZovQN2ioL0d1MTNkMTzVjHiP
	PhZNDmgCBUn3NOF+waTQaF596n9Vx/QdZdjXyHOXnMu9NF+z8ZE1z+7c0b+dgPaJ6NPBA28Gd/0
	QDZAK6J8GyL+3VkFACyb6GPRelWyWlFoZAZ4XIfAav4ouw8aWqooKUx7LEJj4CTuocTH6REObDr
	MfawSQ07lT/WPghBmMwNty6qQqgQDaF/SxrO0HBelaDf4l4QedZcLqEkYFy01fe0oWW0d8PWIYv
	LLabkUkr6ezSx35DXpKN+j6kWxsJpl1M3zicJgG0OKacacbxQje86RK5UWVZ5UGebdkwRUwRCrp
	s2u1vDE1BIAGkjWNizDvSs34DmDbjUgBo/VdMRo0/QdN3a4IhffNFobNDw4FQ30DyLIpudDY=
X-Received: by 2002:a05:6808:251a:b0:574:6f37:672a with SMTP id 5614622812f47-57a094feda1mr17350793b6e.4.1795446908184;
        Mon, 23 Nov 2026 07:15:08 -0800 (PST)
X-Received: by 2002:a05:6808:251a:b0:574:6f37:672a with SMTP id 5614622812f47-57a094feda1mr17350742b6e.4.1795446907772;
        Mon, 23 Nov 2026 07:15:07 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm5294415a12.32.2026.11.23.07.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:06 -0800 (PST)
Message-ID: <278b370d-7ffe-4247-9a58-8bfa5b7e0171@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:02 +0100
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
Subject: Re: [PATCH 1/4] pinctrl: qcom: Consistently restrict MSM8917 to ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-1-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-1-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX9GA5FQtha9Zu
 /fjXcgMxfAWT6BOi8ROMl/sV8yB5estEQHK/1vZFPJashxQSSShsl2s1OlJMmFQexhs7aWt/BZf
 lcu/3Po40mmRnoIByzshQx9v7nfHFCFZ/0VLYrJuOYhM5ehpH5FuBPAFge3vPtpV9Yir82207IQ
 8ZtyEMW6bpm0te8jwyh6kTM7n6kq0A4m8LTK3p874mRGFaJqQQasCALVFb6OhZYN2vYZjxygSg9
 DzTVFjWQLdA4FBW29oEMrmEeWJyn5NDDUSwSMcNY6rwdOyqRP7ZTUXzTvLSpCgUPS0/wKjlRtqk
 r/Fx2I5632QPW8xxQCtVTjYT5Xb8GXaC3fwE1iT9Sq/dkmKJqBsiRTS/nDLGcUFN/NN82KpA+Zq
 1/qfQBhngnuI1pJ6Eyn5cChqwkTraubupY0OBuwex1qXMjneNoAPjoICC+blYL4KLBiDimsRaEo
 dFbuKUZIoucso1dUsSQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04587d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=-hlHpN5XGj_yJvU-tI8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: e7NdM_t82M4S0sCh7sYNaopFeo4wEaIl
X-Proofpoint-ORIG-GUID: e7NdM_t82M4S0sCh7sYNaopFeo4wEaIl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX3O3riEQFA2SG
 4y5EzLtQxziaGmNstuu9r5s/6vnnmFb7pCn4az9zDscgfDQftW8TJmrs2KXKcPJy/bwDNdGhIM0
 HjTbt8htkl1NFdlaJQ4WTPz99nFdlyY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Clock drivers for MSM8917 are restricted to ARM64 and there is only
> ARM64 DTS, thus consistently handle also its pin controller driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
