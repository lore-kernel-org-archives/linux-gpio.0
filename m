Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79FB3B9D8B
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953294; cv=none; b=ungV2Zo5LnIaZ3YZ0djiHhjO2QLBjsUJiN/Yb2Z8YNMIrslP1caoMeMpXSQd+krXSjienbToDyMKKwOZwlaq6s4HVCcOdVz6vqYwTcFJb69QXy16O4QrN7KP2RXkiLnA6Qkj82ggE2G8s4OjeBAsdGxm8IdlCLoKzGdeFYQEH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953294; c=relaxed/simple;
	bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BX64ELXKGP1ApXZz4sc+lfLI4Rx47l15ahmpnNQJBczY0ZpaaznoX7PJ+b+2qF2s8xjNpi3DCL+zg//dfY58qlgE6mWIH97cvcHK7EKMsBpYkszGu9Xfcw+SW4wkrzcxwgQBqis0Liqst8VaMG9QDwDnEkN78pfgjN5PslDk4kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD4S54eF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NXRanUXp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD4S54eF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NXRanUXp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H76Hpi2123358
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 07:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=; b=TD4S54eFkBGd2wid
	FOhbw/dyQ+WhYtOZ8/hFDbJ0uOEwnH7m5o3hFLKrJAr5us5TcOEqvUahrck0gNU0
	DAb3G5dE8tJirtVLN+xM0RtJ0RyzsCRW2A0QWDvlQbr5Ah3hThiyy1lwKn/SvIdg
	ghXBqZrrvMx2vrugZ/nXK7We4spb8Zm597p1Yf3Wo3HybER4OaDmi48OGywvpWh8
	xz5kWjVAF2VyMsrRsqfwwC4Moz804224cbofNaBE6Oa/xko75xtr8ktAQhz/QewF
	j2JMf9LVuaanOkKRwUrUfPj8F8m2TwlAbWewEyIdcffr5h6HleRAa4wtvee9LJIJ
	iJx3pQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wm7r5he-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 07:54:50 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84842381150so3333254b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953290; x=1787558090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=NXRanUXphNNKoD44uBnP/0OZHGY3XObOQSfY6tJh4RBvub9HVVJ/bSWtpmytRa8AtS
         WSKf4X0Qlh1qu35wehKntdv8hagr7yotRhnq2B1m2tdTrEIoBLlwGPpNZIDSQVMNpVHh
         gHpC4o43o6/xoFAcaqb1Xa7ZF19uJnPrcWC5Bhtn5pMvYrkldzHj1hmRIl8xIHdg1KGm
         KHGEPjfxvb46dJ9RCESEeAlanE2mVlWto6DgppmcGyfa0m11rLURHmkqjUoFpYsJMVrN
         q8H4L3lmHbQMK53gemzDWkehOlj2pWZP0hqEdnf2+2vvH22k9X2Pp+oErYPdMe+vVG3T
         0eJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953290; x=1787558090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=snYeNGlQRJpoUJQPrUllVcA30SVSXLTGcUVUd6GuO630fBW86TNr/PJ+DHl/33tx/7
         72560vdPLlr5rH9vb4cFCggMEug1AYYBc9JDUUC9+QHWv+IFu57MIdqG16RsX7RzAbMt
         9qT7BLEzZq3+jyvvKYiCF3F8N6UuZpSGJKgsRic/piyQxmrZ1BMibxcqYaCniP2ABjgo
         DIWVmYsK0qtR3N1e0DJfGwdKX/5F68mGFLGPCTAoit6X56tcV3qKKragKPOVMtBLTgQq
         DqoCx/k/R0pHGOsrIElCxDR//zLZAyUG3FEqa/QnbywnSsN0g6zwNZvtxQV61Ojfi7QW
         tvQA==
X-Forwarded-Encrypted: i=1; AHgh+RquO0QS+fsOpzvjiZ81KUQQlyRboIYZ1XOOxXo4TZPSpGHZhL7hncn6L7XHscPPjha25bWtlU8JqEDJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsg/xMUAm6yRTiQcFItglHgLQMgnyRvKnmeAQJwyRH+HF/qGos
	TdrErP6R3wmAJ3puVF/t8wu1XW+pmQFStbKDKAqWi0KEBGJ8y00aaOQGr7Ia/3HrnlizI8aojig
	nEAZqjWWLPytONUhIylH+vPA+bR8Xk9viwGqPqJGyTsm8bDZMHOMoMKo1AYHg3o77
X-Gm-Gg: AR+sD11dSRlL4Qrc2a+NpEoAEaNDkROWqcIN3sSnnYilkb7fmpXnRLOaYocCDVSPSMy
	w8nA5oBoeBwM1ojROC9w+wvgFeNt258pLYk3J+7XoT9Mh+rpUd4aZ21cu9db6gslfl3lvQBP3TJ
	bEYNtbtFI1lnw4Zq3IamuyTQb8UmvpS/DZXao4s1811MXkNjQJEbmBLdRmxsatrwB3F/KQdnt+X
	kcw2qUXpQ3vKDgCdcDmyrZq3Q+hoSC8rBrUenSsXflHA9IyL6YMoJcfNCW0vb1+3QwlhlzfhSz9
	B75E4bziMi9FwGC/yi8gseXCi9I16gm/me0WiVXR0r72VeRNVXe5eVa/ylSJssWNr31zTIBnp6x
	Mx8MlqQrAv9jcBNpU83gFp5SnVpLgBy4xPQj44qcv19Rw/CRnPFMYsbBta3oKeO/q/jxz65fFZ3
	ysqcUTiQk5rFcZpyORgmc=
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22977020b3a.33.1786953289832;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22976947b3a.33.1786953289376;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401e10bsm186190b3a.12.2026.08.17.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:54:48 -0700 (PDT)
Message-ID: <05c743a3-0111-4b80-be98-b65b3a09ce34@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:39 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
 <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zHjHSzUsn7bwdqssEsyIpdWbnWmAzWye
X-Proofpoint-ORIG-GUID: zHjHSzUsn7bwdqssEsyIpdWbnWmAzWye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX4+hZsmCGx/NL
 7Z+dE01B4EgytFINOZROWowRytYGc332El8V7UuuRTvMB1Io62G7EvnNUgRxeZ6onqxZGgb+EQ2
 gegKqiRaJeRtcX9Qds1KXqFaVYMiRUCe9Cta1943733GnGwDgBORI+UG/62qK2gqRXIYRgeB6Zj
 5TzMPlNmE8QKea2doW7UvSDg6jycxQ34Flm0+mylnxPSGGmWETR2hW9XMC9nTPuYbh88NMLHlCB
 gMAjlJhcM6bhHjE61MsU95gnr44ndtvprrHWLG7bH6UKpHE/cYoSmeM7JsA7WoDF+E31gvs87Gr
 Vi+ddvcADO3V2xmItTBJJ+giuZZX4RyJYvsWzhQ3r9YSAS2Uee3aF1zZN739U4YqV3kM/1HecbN
 cw9GSMdX4KLqge8bkTMAratmODv/qesjjCAwEdfDlm4gBeOEl2dp9po5KTuBVvoxHDYeKujCT8/
 64HapDxTyu77bsF37Nw==
X-Authority-Analysis: v=2.4 cv=YqM/gYYX c=1 sm=1 tr=0 ts=6a82be4a cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=XtOoD4hAqv4hDt3uobMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX7465204kUwZI
 KcH+tjI8azFb72bqLReIoU1QxSMzu3zGn/iO98dUVjdkJpf60HXlyDR94VsyGKS3qsHeb/gC3eZ
 Upg/dnLzMGi66fDEFnyL2l63dpHMax0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057


On 8/17/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:41PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> I do not see how you addressed my comments. I should not be needing to
> verify if each one is implemented and then say again the same.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

   Apologies — my v1 reply just said "done in v2" without detailing each
   point. Both your comments are addressed in v2 patch 10:

   1) Commit-message / binding style consistency:
      Reworded to the same form used across the series:
      "Document the Global Clock Controller (GCC) binding and associated
       clock/reset IDs for the Qualcomm Kuno SoC."

   2) "Not a power domain provider?":
      Correct — Kuno GCC has no GDSCs and takes no corner votes. I removed
      the power-domains block from the schema entirely, and dropped the
      matching power-domains = <&rpmhpd RPMHPD_CX> and
      #include <dt-bindings/power/qcom,rpmhpd.h> from the example.
      (binding 56 -> 50 lines)

Best Wishes,
Hardeep Sharma

