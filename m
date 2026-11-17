Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794900397;
	b=nLX1EvdpmDaxO/v85A2Zqc0R9siO/4lGAadICYHoqqdxkhDDg9BgCu14oULMnDN/1imc
	 9fF1nvb4CE6uFoCqDvtak6q3Bb6F22lCxC6n5XZVSvlX/5/WJDkDG+WDlTJ7DTDC8XDp2
	 dRXQlJa522aVmjLzy9sB8TAx9h7pAxSFA2NIYYf/E7Tla9TWctdDIpg2wxn0iRjVvTxwI
	 0W5eTEs9RIi3Dh4A7gQyefyy9uqExZDXC4kntBHrNB0TIAKIbpQoIEnFEp55aeJPDbdVD
	 /rPc6MzoOXpmLRQfKNaTHY314Hh2/3rSYUf4VxebIIy4WygRcN1uhJD1YhEbEXdU1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900397;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
	b=H1lmiBg1GIZN8f+LYiRhyn6YC3RDEvxm+NGEMqFz3/+XHdcbzDmwdFrHLBlE4WBvT8cP
	 z2MOBUT6JGmCRZ3IVGeBEGuT22WhKBfGx/2Mw8baMSwvfPPBFB9W9DczCaQ1oWEYF5nMN
	 iDjT9vWDTFKS4nb1IVUbXOk2rhrYGexUZeSQkUvxQhFlgA86Qq6EfcqcH/sYVlx3Q0KFC
	 sliKGszNmpFPnBhtPlPThg8/OMNAH0Nt3Fq6fFADaLGJBIXalGpf2q4kEgDI1s6uFo6BC
	 kcJtpyPL20mYAYNXEamoeArYsThWQgj2WmHAxs0/8D1LrRc7WAlBm0eyjxMtnIL67vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EFA606A329
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EFA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lwBI+vib;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QHZX8XTf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aXs24146979
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 07:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=; b=lwBI+vibggJsAHUf
	TCibgt8UJOSKTM9ZWDAoXdJG0eTAAwN+BZs2Zfqr3dl2WZWedkfVjyOfA3EinHVn
	7bchx+Z/R3g8uOEhAqcCgXUbLziRN0fwiN6TEzQhLLXbKw4WJ54GyZ0NTu0iKJuW
	TXmCGPXJFioMr+f/kIbaxGHV2YuKhzv34o80FsQY8REGgDdgFK9WtsUgIVY8zKCm
	vTpRHHcNXtlAvgyrszEI5zySfJbUUzi08aoRjpEsfWC55yRUJ3T56dReAwULA0Jo
	iSJgJtF5UNS6JSsKG5emFVcH2GfFcvaOOm91zowj96zUKltq8OpoJjaYfb+j0MMO
	kXWBnw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfma0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 07:26:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so2793741a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 23:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794900395; x=1795505195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=QHZX8XTfy//y9AHjo5mjbBuzMVOo8P9v139xj0dLBmLqOTv9FVumUmBNom56MPtmhe
         axIugMLN/Rb19QPVvv7Jd1k0KU+ZFF2G7wf79E6TApllfP4ocPpiyJPAARj2WYBXqmG2
         vYMyrVGt2kvY88UiZOPBAWI/fWZIqTnM7J5qKIaUbe+BjhlGJ9Kujg4eX85xfzkwko5V
         oS9vWygNTME9Z2RvLxg2uURNlZMkBUS4KLajwbO8NDnzZ2N+7o3w2snuGBditZ0xslx/
         cIMSGGcbDnOS8DiM09eurIP/C54fe7nMnaoVGSydPAJB7aWjdYk9uyXGW0okRq7AH7cy
         XrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794900395; x=1795505195;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QrbbZCqP3ihDtAGAG9o7RbF+W2pJk7/a/uB4EJHrbw=;
        b=pOwWkCdbDVFp/0aRopqTSR3qaWYHxTcc8yfNeAj2Uk8uP/vcB22aE7w0kpuA+5Nbka
         +aHZoP1gVVjmecJnpWlsC1/cCND+58pn9OpH6AX0Ut4B4a1Kg2rwdVcx9lkpiQUa0C4z
         Sx0562QqcxlW6k7cpq4Ohj0NDFgvyVIP6uE4kzk8HZyegN8XkAXx8sNIIiBUsO7Yx3+A
         GTlugTbVcKJb9KX9OOPXk1G52lMOC+fx9G3GTmjNNnc49EkMNre2nD9HRSj9vlpJ8pOj
         gINd6imWaLj7GO/mYIzcvxiurRg2IRknEOo+We+ztDAqxO53BQ48MEg83Qx0zPEoJv7M
         aOOA==
X-Forwarded-Encrypted: i=1; AL+hErFOOES8ZNvFXcYLlp1ajHd8urevO3MZbQVyoSH7BKRg77+/bPqoMSxXc3SlpAyud8MBCzzhvb6oMz25@vger.kernel.org
X-Gm-Message-State: APuU4Z9cOzbss15jpUJ49fPGPoUZj7GacBKsXbZRZEeimStgrfbnX3n4
	aStNl+mFWZfPdnQbrmUui/8EJMUk8WFBOejKGh7uWDFEzL78v0N7Bn5JMeaTHjv/S5IZErjwH3y
	1SuaMOwiqXQn11y7EZJRwMH/yrOqiTjzik1FTtiV2fpgf0iq6SNMlyOVpTzZY+mpz
X-Gm-Gg: AZFdTZfjV/TTdvT2QntkAkBsRHKqkuz6ancRzyrW0dqEsvUaWmlyAE8Egp5o5SJpWdE
	hDkeRe2tvo6l7K1tPzYag4NaRgs6+DYKS7lwQ7lMEBlG/Cxz+YwSlEJEDy1UIP80oNrd/SHJZHX
	jn6p++6JQasHb6dH5yFmknPDKctotkmHwGfGZxp1kdSmE9KlDelomFZ/mcf0QjpvDrGuAvrF8e/
	fd4RrQZ+ofVdjTYLtovJp80dJ6Rjcr1mefDQpraV0PqZI7XkYS44ksiuYZHcGHLnjd4zODcyZgm
	omdFWgqRdao1nfbX5m1cjn++5nAkP61xLu/zF7qdkE5P/H/SN5JfcMpg7xrsBRnGpsXFO/Hx5ME
	xa9MpBgY4paWs06OD6ll+IEYeE/C1o2BujqKMzzD8L6GZCqH67Uh4JIuDzHo4PMV97PjfqkKr
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117636a91.35.1794900395007;
        Mon, 16 Nov 2026 23:26:35 -0800 (PST)
X-Received: by 2002:a17:90b:53c5:b0:3b3:bf8f:9cce with SMTP id 98e67ed59e1d1-3b3bf8fa1admr117617a91.35.1794900394563;
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Received: from [10.219.2.72] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abe78930sm2697549a91.12.2026.11.16.23.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:26:34 -0800 (PST)
Message-ID: <d880b084-ed36-488c-98bf-fe9acf757464@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 12:56:29 +0530
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
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afc01ab cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=SKk0sALQ5wlVL1HxRVsA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX79qBD5WDSKPW
 wCDmro6pT7WPqx0BIGMPOpr1nn6Mb9QMYA2FpqhMuq90sKwkkum3ltKp2cygF6JVGCGi6RabnVg
 laOd0BZkYv89Sl/tTeBz8uY+ui5uoCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyOSBTYWx0ZWRfX8nafNwNTsJ8F
 fEmNyYLAhy0xgITufsT+SsQ1KOaB2gqc9AqW2WnuUEusgtC/1Uu7tWz3AFJvlVy9tw1GEqub/94
 oegUJVMmffMtjLL/nZjiQCGTNiW9+9DQDC9kbAADhBrp/oaLeTNhtolZmxqvONqKLssPioMgNIQ
 2EES+N9bcKetJYNLNjacJDz8I5M0iJR+ubhVCO4qlVbZntLC1Y5+JUViDeqgLDBg79Lb9V4yusm
 GmdYXFuAPDu4XVXfsUqs9etFou3l67d3zDVV5+IuOR5znsjZMWW38OEEG3j9K6x/bNL1xn+m0oI
 iRDU1AJTkf+RUS2DIZRL3kYefKCZpkb8aYYMpvriBFpQIu1ZJCnQTV0ZS1p5wkCVmNUls5iwf4/
 jQ87d9sPclfRlwgbQ4xdMXXFo1x5wqCCxmFnsVsU5yJm+sl7HUZSit67F1V2Avw0PvY6k3FU8J8
 LnqL/OI71cg3/me00BQ==
X-Proofpoint-ORIG-GUID: 1N9XWTDU6k1Nsja9zQ2iZV9mX_4fZyG0
X-Proofpoint-GUID: 1N9XWTDU6k1Nsja9zQ2iZV9mX_4fZyG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170029



On 9/8/2026 6:32 PM, Konrad Dybcio wrote:
> This patch produces dozens of compile warnings and is not split properly per
> subsystem.
> 
> Also, it looks like the data you provided here is a subset of
> pinctrl-sdm670-lpass-lpi.c - is there a chance that the block is directly
> copy-pasted between these SoCs? Are the extra functions present on 670 also
> present on QCS615?

Hi Konrad,

Initially the i2s1 functionality seem to be similar between this new 
pinctrl driver and sdm670, but now for further implementation upon 
further inspection , there seems to be differences between the 
functionality of this new pinctrl driver and sdm670 for example : i2s2 
functions from LPI GPIO 23-28, will send v2 with new functions, hence we 
will prefer going with this new pinctrl driver

Thanks,
Karthik S
