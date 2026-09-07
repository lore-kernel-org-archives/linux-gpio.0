Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D642E410
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768251; cv=none; b=P3qij+uoPWGgA5T+nbqT+L0ERQhVsurgC2hYKIWGLvAWTkI0fM+Q7ab8Jbf2mXVQ7YeDLkAqSTMnhYGPhqnm2N9NqZPX+VY3A+zKsUhH5RYy/I9MLfBEA7JCiwfiqYNVzP04jvRDmK5ept8tmls6Xjux2TgUslv9c47Gp2V5Ebk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768251; c=relaxed/simple;
	bh=oziYxAd/m21PsjsH9JcZw2rfYlL/dO7h6Gs7rvOCtnc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sqoxbo5MYXBgJ6h7VKFMpb4uBaxPm+lERolYlWJ/BVnPrBbSZGTBrA3H7uz3Ka45j3n5wXzajB4y9ltjGc8VL2Fcz5D1Od5sUmk2RCmmmdN6vVXYwCRuJ33TKCug90Zo+/gVyrYi7kQLH+xwxEAnFPerwXY6D6k+uabbiBgQlpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+Rubs4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZRWRxEx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+Rubs4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZRWRxEx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777VvQ3269624
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=; b=a+Rubs4+SZNwG0Ac
	YBO8tt392ROtPd62Mv+rqJy9OkmmHkJybzwbj8BdyoMw6/KJb/0t4YUqHfEFLnrB
	gtsb1iKB+YjFOWtmn9/ouCWHC6QUIEFzE6nCg2krN/d+n+0iDWFi43T13iIIMkKx
	8FPwcoUq4QPwVEtYhSUUFypqrKF7SypMJ7VrqmnSc1S6Rlq8GT3hTSyvwOK6CzpP
	HmyPdGBCaL2c60inti/fwjFfx1+GQLecn1dFgjTpoqGIdrl12fLp0dbw5YNSdAYV
	F8L+HyytdKIc0WXxHFBdHOL7PMVRAfA+P2Ti53r0rqquYAwnyUY6B36ZPO6ZgvfS
	ATfsCA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggadhnvb5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:04:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8d3a2d3fso7169836d6.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788768248; x=1789373048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=EZRWRxExcpv5tZ6Z9aeVeVKrfcz4puHDMNWQ5GfTSk/Pv4lY0BrMTu33mVVVu81LBb
         NUuyQm+Y8hrutgOS6QymGfIS+/oqKcNIST/1RvpysyRtJBcaJVE3kNFcLnHUOuwI7rTs
         1lmof5mH0rhrnmeHPfuTaBJavsoq607reAFxG23t8aBXO6SSCqvlWZtcImfR81YOwMiM
         gaY2JfO+9tGb4fb1cdJchBFMMQZqPYRuV8fS+KJ9p71CH9BbRTqtRbnk7EvKtvCsqStM
         Pt15AXYw37y5m8K65LxPf9zewtc7B0x22NHVRw4b+qSZRzZrC2K2o/E2n77NyVsqYpoC
         ixig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788768248; x=1789373048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BW+sr4jN+ose11Q9LLfUbtTTJFAJTWx9828aoUckU4M=;
        b=HY8Pl5zshzmezVjfdXJ0B5IGQ+TC0nuRGp4qHJ90bGiN0jFys4olk+AQUWQkTclr0K
         cQoXdDaPxThKHrt30K4CTGv0zGKrc13XTY4KI9RDFlu0oHnfWBUgbHtZ//60QO6ykaAe
         TIMuTxwdX1GnnFiN6WWvjbfRxJWZdF/2XsHxUg7xiWsuWEvA57mwoiG5RE7mnCtulouI
         dAJnxYtyLqpR/pqNApD3a9d5o8gXhTp04zwIQQ8tFeRkHCSXcnNFp8gGgatUiDEex73B
         Cud7sCkGcPs4CxNLpbwPZVslGwh9DC7M3KjtJyynWl0toLL6Vdn3Cd8hbFeizWJHpBm2
         +DfA==
X-Forwarded-Encrypted: i=1; AKwUvBx6g6QbnnNlWZUHw6Mv+qaqLFQDvS1tDK5f6idsNOfEwLLBbCLorzdPBQmZMSynn6wsNVyP80Yi7jBK@vger.kernel.org
X-Gm-Message-State: AFuF++lvIB9nKzCVQsoWbavJN/fWUFJo+h/IrcZBRawyfPwJfa9DmC2F
	EmXY5ZuHPcmmbYIUpYwu/ItBz1f1P2/P9bOP0RI8x67UtbmqOVi9zzZJtuIKznjm4aUEPb8Gcbv
	JhskjRhWE+l+Y8eATMANtnobvW/c4MJVxf7UN00U6jK6nscA/eqbZECXyIuDaxcA8
X-Gm-Gg: AYBFou3Xlenh1jCkssLYQff4ZmMSkYM/9LXoZSVd9UedTJdhgRmtvAL3IkZDwsDyQbf
	9x8mqbF/aWm89b+5DbHBCAZCW1RAyJrbdJJ2vbZqWxXoqAES2xv4fuiPc0u/9DSBhoWkQh077Bj
	1vS1rkqEkC+0K4VwBpy4U82jsehMo5RqgANpnZx+hm9anKNrpXv1PDbDWRA/ACEgiEloCnIf+2E
	SwGMiII915EUlNwIHfBrc8IsilM5EytHALKEPjQ7sOLgJDHS4unnPKYbQAGfreIY1+erZ99MgVW
	/xROrHzcmWAp8R6RvFrnDkP2A+J6anEn7Bxk4jCGkjK9u0RmZAP66Ap3eh+7lLc1TzkZ8s3rwaS
	Onvjs7a1DWxBqUEQg3anxQQ==
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689785985a.5.1788768248610;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
X-Received: by 2002:a05:620a:7111:b0:939:9f50:fa50 with SMTP id af79cd13be357-9399f50fbb7mr689782685a.5.1788768248240;
        Mon, 07 Sep 2026 01:04:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d503f96sm423598566b.26.2026.09.07.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 01:04:07 -0700 (PDT)
Message-ID: <92aa00c5-b089-4381-af91-7bd063e13191@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:04:05 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5210: Publish the OF module alias
To: "hpp.iscas" <hppiscas@163.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
References: <20260905134340.67477-1-hppiscas@163.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905134340.67477-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Rokl75wbyV3pq6Jf1uHmY0VhKDJ1fWis
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfXwvSv0rAlOS/f
 ZuR26h70Kg/2NNuPKNob4xHuydt+jPo0V2osc5+KQP1tuVsvU+n8WMoNcxMyZrAFv0OH7oasVRv
 WooRbnxEYzmhFpHO6aQvO34Us5KG91iXh1Hp8BRcafIjZFRVbnf/gK3mjfbOdhniHE9kZRaaisf
 o3aOs3ZBEfOR6zPN+gOPdMM6gmNIXzQ+jeKk9Kgwn9Iw189z8uF/TGMldYxsoSYC8cmf8xYhmjs
 EO1alQ99BT4ufCj7ShRfwLLdlAdCsSnZ1vBFxUWCDa3a8CkA6Fuq1tKM7gVop2wmgqRuLVfRral
 TeRHZTTiLx3oIIe91PjqFEMKrfMlJuOvHbthDc8+WGEcPNcFSSpjTsDeLnFeTKewwnUAV8aQgI0
 JyhDD+TepsFfUGM4npDnEoybzBSrSoNCkSJeBGfek8CEBTraf3Tf/iSzO+lQhglkytgn9NTD8DX
 hpguitJqAuYpJ0lFsZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NiBTYWx0ZWRfX9bu/uds0iTKp
 GDuzWcxpG2GcFEUDqoSAr/1UWaSS7ufVzX2ZtPtB1upkuWZlk8nMWQuIjaRJYHvcHXopnKNHnAJ
 4uxmOYaLrfz0f868WqSDMJHFxL0nCrQ=
X-Authority-Analysis: v=2.4 cv=OceoyBTY c=1 sm=1 tr=0 ts=6a9e6ff9 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=UYzP0Bt1LNVb4JyMi9kA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Rokl75wbyV3pq6Jf1uHmY0VhKDJ1fWis
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070086

On 9/5/26 3:43 PM, hpp.iscas wrote:
> The IPQ5210 TLMM platform driver can be a module and matches through
> ipq5210_tlmm_of_match. This table is not published for OF modalias
> matching.
> 
> Publish the existing table, preserving arch_initcall ordering and
> the shared MSM pinctrl probe.
> 
> Fixes: a549fe22376f ("pinctrl: qcom: Introduce IPQ5210 TLMM driver")
> Signed-off-by: hpp.iscas <hppiscas@163.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
