Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115AD2931E9
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591725; cv=none; b=fH5HOqo1flpnvSeW8BLIW9uK7N27uUNEkJYgMUQDSuKjV1YWZK+aHH3El6xBoBX/qytXrx+bexARSNh8YH3nZMa0jggFtxqS3SiGHDVdTSv4DMePgSOhxv5H3AtH2apUioLX893LG39jxEAzcS0LAzLeoOSmnOKtWjVysMszZL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591725; c=relaxed/simple;
	bh=uBvJsGkwlPeJjyoA5UjXwXEsAQAqAnUC2W542XJX+Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OaxQPs+hkEa6Kusjh6OBnJbhgCPcX5wYv6lKGcQFjcjqNXaTHf+238bGFz1kMS3fu/oSrozaYRLP5Ff9/pw45K9XHAI2+e2+jzi3pX2daOKKvOn4eax7+NXVX2DvRoGEuIBpizS6S2SH7N0n1xFojUkoG7u3LY4LouXyJWW1M4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hbW3+63n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AZzVGDGf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hbW3+63n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AZzVGDGf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M6Je246041
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A36i+8Y0LPlWxU4cYfGu/QYHKhlLH1yQq9y13jnpBgU=; b=hbW3+63naVjI/ucE
	imFkU9u8JSpt4ru6eYtsidc8S+BBq20oDcOdPFZ8+/KakSMWjuDFmQWQyfqNstKD
	Fd8G4LRGtDA6u8YlZuLG2AYQiYk1ffjtWKrDFdOXOOsevoL+DSsipsgAVGvgmBZE
	bAxM65lSDiFlhT1338gBOOjAyYjf15R6CHwMqHGFc3hPjO7gCxHqD9JmC/QGFV66
	QUndrkIy/P7sr319PtwnKAx7dhBa+OogFPpdbWFkGTv1iu9Jyw2DGmikiVHNgX3y
	S5FBQ6Bf9kPfcRZRaw2OgyNu26bjdC6VcBNHVSB7o0Cz8sm+0UMbtH36HLOe5bnc
	weiRrQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10y7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:35:22 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91441f3dd4fso3659626d6.1
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 03:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591722; x=1791196522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A36i+8Y0LPlWxU4cYfGu/QYHKhlLH1yQq9y13jnpBgU=;
        b=AZzVGDGfQANjMFWfXLiGuOw3Xtlr3xcH+O/T71npuG8q0oCjxXhnvuNwzgRykgh+3P
         JPSYr62enVjsauHu3RUhCVYNaU66Zc+uBzvz/q4m6Fi0BPzUxQe4aOVgUByQ0qf4UkaC
         z3LpgW+5Q2EQYg9Ks01uPLX8Ou1DFkLeIZjNHxjwzs/njsfQlurl0niUWEbAD/75DI7M
         vqSOshWdS7OWlIE9znqMVVIbUzj+HjCZC3ARuKAxYEyLedWs9yVS2pUNGEnmICWpg8lH
         3tMavKufU1u1A1VJ+R2Vrxwh07r+iwx+9hM/jKsjIOd/yPCagpM8thAoJEK8sq3E5Qkj
         aZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591722; x=1791196522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A36i+8Y0LPlWxU4cYfGu/QYHKhlLH1yQq9y13jnpBgU=;
        b=rkBDEzPK07/Y21GyMsy+pIxGkNPsk+gHCyepPJgITs+aPFLBQw9bXa1TPdOUfJqooK
         zQgulSyxQPxix/djl8ihaEJi9YwDSddJue7abt1I4eyvc5kGrB8g0FPtd1SKkpnta50l
         rbeaJWHPYb1X61FmZ6jMOYl8+4pdT1wsJEcdqDcSzxBT2gQO9WEGvIAAvVZZP6QitET/
         41OF6AgBrym6i/b5Re+ZR1OrmlXbOmu1lVVMPpfHbGC2gCIOvXviUH7ajaN5GvmW6u/9
         0W4NOF18UrUxWaPTXf1oP1y0lKYlNvU3bjZvvBzGk9p67lDU/yMnNiGXd3PZ4i9WK8Jd
         w5PA==
X-Forwarded-Encrypted: i=1; AKwUvBxt896uxP7J6RkcXOu6yoqya+o8LtVMfgmMepTyZjI+x+/EIQ+U9b1wwUQsakLnwCZNngjctPVTfw+x@vger.kernel.org
X-Gm-Message-State: AFq9FYK2aq//ncPkNCK1cdFAyy3uwFxS1IpXzmaQbI7bPVg79XcPtqoM
	g2bNFZgkcClFVUniqe3rlmYLe5dbEgoHSYTlHW0OzyH+68ZaJGEI2tDfy9JIsGCdEHSrtA3qgsH
	RvobDpBf1yRqscU+v3bqD/tzGzCHMisdEdkccKZEXiTIyENFDy4nTiuWPhlxpk0yn
X-Gm-Gg: AYBFou3f3Hx0NX8Jv6C+g8qY9z9lK1/mzl1pTIANUmc+eD2HtiOZPwylRhqqgRUHAcY
	Rt/jKgrHRaB+iVLVCLPY4SjwkSqlrXFG0bI9wi3otwR1y7eMdwBXPhb+A8r0axCn+3VlbCge1uv
	wkNDCelN60z10KnyhOwChins35ZufNXwept+VhOGWGVVz3+VQVm9Xb/aBCQ/pDJCLvg89igWu26
	acoaz+O5tQuGJLLfpu809lcafh+6xw4becrUFuJ6Ag9GP85RCY6gkCyPuE9fJZ7jImvtSv0zrSC
	uDRtxEgtzV1NxB5gHrK7iL2c8wOr1cZA+1hYDhAahsGIbPbc4gD0hnyjLrmX8x/gzrTZ7nX9+uD
	ut//HduRf/iJod5zDkTiX3w==
X-Received: by 2002:a05:6214:5d04:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9142f767dc4mr170597496d6.2.1790591722118;
        Mon, 28 Sep 2026 03:35:22 -0700 (PDT)
X-Received: by 2002:a05:6214:5d04:b0:90e:8d21:714 with SMTP id 6a1803df08f44-9142f767dc4mr170597206d6.2.1790591721683;
        Mon, 28 Sep 2026 03:35:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dcf626b3esm172894866b.27.2026.09.28.03.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:35:20 -0700 (PDT)
Message-ID: <30d8a155-9e36-4fb0-91a8-8d95b266d30b@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 12:35:19 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: add required gpios and missing
 PWM functions
To: george.moussalem@outlook.com, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-ipq5018-pwm-functions-v1-1-8990a4e85b2f@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX52oWPjTgz9uH
 L4oGqpCowx7zLlGf6zjMJUwJhv25BSCR70le3BtFF4dB47Z/wZHnuDVgpjpZv6l3encgsUbi1gY
 Pklflzz37ld3r1xGaNmLRg+Y1zl6eW1bIsY9XXfjvquuP0VsnHnfvt1+GKIsjB+5pe0EsKnPcgY
 vAAGbOyy+uY0EcnBAJtMH+BKS7tC9s++JmHpKZvjajVLOb1n22v5YWoM23YmNYx6f+WB2HA9nxX
 +Sd+fFW1WmxTl9HLwTEJPlwpBbn3w4WX8KxholRg8Bff7BtAu2hLXx78Esekpx0WXxMCKMIW2Dz
 gsyNG0ZUolJmO1O/Gso6hZpWl4XrZJxyKGlEo7dyJlvcsXlwCnecWMEb36n5dsiDOZDi9Dd8ZWp
 /kr5KIK6I4pinvaSukO3ypE/hdypTmHW//N+0rnByvObo8q6AIbCEOZl4MLSOUQiCogglaTRxAM
 nS7oEe6wWqCRkzDMvGg==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba42ea cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=UqCG9HQmAAAA:8 a=k9Tl5aKVw7jfSEjyEx0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: 55RgZ15UQ6updULwpuhXfJ-HgRtPfO72
X-Proofpoint-GUID: 55RgZ15UQ6updULwpuhXfJ-HgRtPfO72
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MiBTYWx0ZWRfX8f7mkxsmweAH
 JS9rjEGyTRHw/770O6K2RPPH0yoXkd3pSE6e1ifOum3DZq05/YFDn9DJrUpeF84wCqassNx+BSQ
 s1359vwtqgcI3EK8Y/mdUipN3dMUb+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280042

On 9/24/26 2:22 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> On multiple Linksys routers, GPIO 1, 30, and 46 are used to drive the
> PWM led on PWM1, PWM3, and PWM0 channels respectively, so let's update
> the pwm# and pingroups accordingly.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-ipq5018.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5018.c b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> index 84392fe258c9..74fccdd5146a 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ipq5018.c
> @@ -539,7 +539,7 @@ static const char * const qdss_tracectl_b_groups[] = {
>  };
>  
>  static const char * const pwm0_groups[] = {
> -	"gpio42",
> +	"gpio42", "gpio46",
>  };
>  
>  static const char * const qdss_cti_trig_out_b0_groups[] = {
> @@ -547,7 +547,7 @@ static const char * const qdss_cti_trig_out_b0_groups[] = {
>  };
>  
>  static const char * const pwm1_groups[] = {
> -	"gpio43",
> +	"gpio43", "gpio1",

Nit: please keep the added entries sorted

Konrad
