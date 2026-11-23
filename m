Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446924;
	b=ofIO+86xU+Bu4QSz8T1cyPvU3hTtF5BTxn6JXbJVmNJttIE+tTuY+rY9ri1/+DV/HyDt
	 gx2GMN3az3PWVvD9SnPWuM2UMDnQDaa6oIYPw4cSHziO/SIMKYy91tuQ/hT4jaDwbhBJW
	 rwOhvOeCBZXdWgBYIHsPPmtaAkabI2gSjkGnMraYGiRnKfQ7iRoVkEvhnzZkzMMRepyMk
	 DzPDzGHayldEvxwequd1TMAixw14IJdKEOiC9CZEY04nUZdkB6SjkLvFVJ5UECAZhWOv4
	 0wtpWgJwiCfBkIZ/fsrQOKEgx5OoTGnw2+2MO8tvF/7hzcKj46fmDE5b+cSe29VRaiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
	b=5E9vAOulVAX/kP6RR/ycTyRqTmiEiB5eqNjSh9OY23lUTD2/+hPCqziiGN+MseEJAkPu
	 fh/XvUj1dAyf3PdohfQ3PNOCrkeaLtaNXmjBBTMwlByud+bX3qikNZNT1/E0654zeDSAu
	 guwZ0SIJ+IQd7HVnEVzWVPcoQE1LQScZALme8rLYBRtm8kcDPNf9IywUWuyZnFiPrWTIb
	 PhiMSDjC2JqSFO+Se68wbFdpxVOaSvb5K5m1wfg+9h1u4MttYlIDvbqzCgGOeMrgQnYuC
	 EVCdk+dEeOz36n+cJrBp3TRu9k4eBzE9/eiIiwe4XWUzbSyfusLLf0KDYmztIrS1GyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiQVUZX1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0dsjeZV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFC4606A32A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBFC4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UiQVUZX1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W0dsjeZV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLN0s445714
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=; b=UiQVUZX1WE5gz8nr
	73DCiv9RJNkUWpfhPPg4J1ICoxnuwC1KDHLD/CEKY4l1n5WD8IPbDuAmSPsjxVSa
	8c4wHYJ368UFQI2eNKK3/mWH2hnwg1/CY0b8DtLEIRuxhJCdv0ac1G/g9WJVJo5Y
	n2Ax0Ru9487Y/EYF+zcVFAzNhybdEatA/BMIvOGcPsMQT7whKrkbOZsYmOLUzaGk
	ILCG6km/HOeP2D2GExaSzBXtIXmxpcPA23FM2iQ+9q5Hr41k0NjAD5QEsu9pSgkQ
	b/RI9+DBxy2Hc3zW610y5zshFdEC+R0FGGWAyDIt1uQ0LwR/IXVnkvZEYJd8TqQO
	KMFJTQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g742071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:15:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d659d9d106so143840137.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446921; x=1796051721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
        b=W0dsjeZVyv9OC2Z/2kZaXKzsrpobCSZNQnRuL4genYAe93ZRZOrplj4kgMJkf4Ik40
         8OnOMIuDgrltCOYrswhgtXMDngN70ix/uEWsAdGZtvXk/7Moh97PXFt6IBHzyBEdFD5b
         r1SLvGk9njMFJx/ddvzg9fONASzqItM139UrN/HI7CvK8q8igLGTHfFkyTOfn15MdOII
         4V501ULywjDJVa/7xpEAdqPGiG+wanTvF4+KgOyvPMO0i2ElId+wXmb504wzP+V0Nz2U
         yHsSvtmwi9yE3fdfRMzPfZjXzjXTCwnmMzpd2nZ89zvUhgaYoS103sLFvasUK9dE95Ek
         5I+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446921; x=1796051721;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyubDn+Ze5V5+6xDcRgigWXsNgQLDYZY+zwLnzFNAYM=;
        b=MXuylsKnS30iytNFTfPiPe4x1vvAKyGy13IGH1sqfjxVNqKO72DX/2JlOBBhwXQKk+
         VZJIxWOqQnPA7zyJIFUZwl5bmUX2WNNVGUmQK8PaZqBEih5HWtIoeX80SjLQ2ProQiCe
         ftkq0l6O22IqFGTzviKMcrJ/smHbWJCmKOnH7fHHqvcPWkxGhkRyHh8ORyRATSfQPpIc
         czmpha/ZwW0db9T9sc/pml0UTvGU/6eNf36wm+OjWajH8cUkZpH9dlH8IBUAn7kpAAfQ
         bjqKpyOeDUzN7PgLgprbw28z54b45iIVqqtgq9FdM1+F3FjKVuDYDCOBc0PHu0m548uS
         NTCw==
X-Forwarded-Encrypted: i=1; AL+hErF4TJVaC3opvkNavgR9ihGpxDxEXb2vriVxBv4L8ZnHQjr3FyQFmL3uSnamJv356hDuxECusB5Qz7+b@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Ot/1oFeFXFBxUh+CEEjmGGl3Q8qHJIe55+WX+UZbXBxPoott
	12UgyFsA6ab3l+i21wbQsB/Hmt7SI+XdRj9Y+z7RYkY0yipdor0tWjse2u686dy306OnlnAknjp
	R6EXktkcMIRxTvNGBqEbugEdAK1cWU+Nn4efUHVT7E2lgicqYY/b5udaiU7EIwnhx
X-Gm-Gg: AZFdTZdbDI69ba+FNywSgUkfGxNo3/3p+r6va2jeUbwSaTGJgaphxWKNXU2cidr4Q2E
	km94HQNi7ah7NPaHgJiupq3T/tcbDpsokcQCLEAjpEip8r9Kvpt1KZDIrTIkt3JfakIXhh9+LEd
	+uMCdBmVFF4yMKkqFRIbhnya1w+PNrbWuqJQYUjiLg3jQa10HdThl33dRrO7Mqn1EX1BAhAfgTE
	TmPG+Pk23m0ElAkp1OjCxB7feUYMiqhZjgWi/ySU66Kfg0KX+78zAkY0OIOt2ypaKjAyU0ATUT7
	2T2OLSDACtc/U7PzYq7aldiAfwj4UNv5KXIQ2nPiYk7kcaQB7PnEAcwSnCupJu5NtdL+wNG3zLh
	c/wLaBC41UwYt/W7ldtki10q122StLlPEc+rtnd+J1ZY+dM0kd1WmQ5Gw/+iE929bc+XPyok=
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6761618e0c.2.1795446920998;
        Mon, 23 Nov 2026 07:15:20 -0800 (PST)
X-Received: by 2002:a05:6122:6107:b0:5ec:e6be:d626 with SMTP id 71dfb90a1353d-5ee8ae0f76bmr6761562e0c.2.1795446920454;
        Mon, 23 Nov 2026 07:15:20 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad026a4sm427533166b.2.2026.11.23.07.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:19 -0800 (PST)
Message-ID: <06cfb541-7c71-4046-baa5-c9e7c94ba1f1@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:18 +0100
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
Subject: Re: [PATCH 3/4] pinctrl: qcom: Consistently handle IPQ5018, MSM8953
 and others
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-3-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-3-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _O50pXAl_I1FqP49oSULcYXI_ql4SKtu
X-Proofpoint-ORIG-GUID: _O50pXAl_I1FqP49oSULcYXI_ql4SKtu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX95lebK4HE0ut
 DhRnqc0+ckO24dAvc18cXo/x0ou4/KK6lYTFuEh4J2Q7nd/EM4IusDEbfLakD+hqHIRBmP/WW62
 rLxe019nbTs0EOECpEgIXl1wOs9nrrc=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b045889 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=H8iKfCz8fMhyOcouBNYA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX4bnxOHS6dueN
 /JBhbP+dPK+8WTAG8Mdyq7abuIhTIE/98nXinVvQIrgI5Uq9pC5EZ6GOA6CQCu5jgqhEKq2j01A
 gK8N1m6tIC+fEVi+afsGKEoL221ObE9VjtFtD8Nb4xFOX+yG5vwpWK2t5lG3daN1ZuYEYv6B+xj
 cTCBz4tAankxOMGgYTWUjINGoJ09zRXy6LTtQ1HkUFcMrNjGB35X+LyolH4LS2cPqAHh9IPQ62U
 sHY+WA7zB6lzBENPRwOSgzF76iqcuW/pnElR0oS5fNSwxAmdPgFy6Lf1V4c6MC/PLmmEAD5RZe1
 /PTF6pexiTB036an6LhkErGgsqdTvYsgqaxXrJxdbOFT7uiefv1MZ8/QLpMc/tsZMK2ipZCfFKo
 Tr+CJnKW4C5yWWGeuR4ke9jkMUrIPeYmWISt/dSsr1PV+ZRuYf4Br2BEwWApt5jp56abNIrqJsF
 kvxijwBZijaAa7O8y1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> Other critical drivers, like clock and interconnect, for Qualcomm
> IPQ5018, MSM8953, MSM8976 MSM8994, MSM8996, MSM8998, QCS404 and SDX75
> are allowed for 32-bit ARM builds, so pin controller drivers should
> follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
