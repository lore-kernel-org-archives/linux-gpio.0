Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C394F55A5
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 12:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956663; cv=none; b=Ugx3X88UmsR1PNKf7mt5sE/IsbHy31Bjlqz/Q1Pe8U6GJbx8/bIquo+vJIJzL8FGzAzNscL1bzSgdIaohgEwX+C+RMKdFw3NEG21xG2p7iDpmH9TCuR2WaC0bfLXLNsSyPsXBNyhSjFhl65yEKHUghRPTCcDCeOf4zXoTS9+7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956663; c=relaxed/simple;
	bh=EbKoogdJ2Y4eT4CaVQ0mg4cLDNv8tsBhT1TWv1xir3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPfJMbtcWbrjNNschDOt3SAVQnbLv07Y52P3y03p5HgAz0ZZo4wSVOu4NHQv54kUavbTGAOmSpzQEdvZ5nyRw+20aG6G5oXNcBSKQTC23lFWEhk81vZszkpyxgS8t5cchrhp1Bf8NUHUxvWteRf1p7OGdFcdL4/NTPefo6AeliI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LFvzqJdn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JTSsdmJd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LFvzqJdn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JTSsdmJd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU7JK599844
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 12:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1UMFW0j3OAmOovzEV4dOGJn9Fo9H6CXJm/GInG/OM5Q=; b=LFvzqJdnNY4tBLiA
	Gvtf4vQeuzaQjOdHQX5nL3tyCmu1VmHrCDFzSvueXW1cSPdWiTuzz4iBgiDGuPAf
	g1vA0t/jUS9jqsc9XOjCeepfEYpBqReJYYdQMQ3ndpli8jLe6dg6sD4Z37bkTnqQ
	LqGWnXKdHFlSWhlrq6bfZMHSLx5q84fKr+fGbws/r9P3krkzekSERsFgsL2+8THc
	lk93q/QGeG3GNOLwNoMpxmImyq90k+ZNSM5IUjgLJWj/Vk4VWjal3V7DFO1pfCeF
	6pOCbfTbDEFGPpExGP62UOZe6LF1ZO2CBNAsMGc+2y1s+NSGhPvuXo8mx2I+/v3I
	gCXzsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjywr1w99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 12:24:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93821883e26so114060385a.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 05:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956660; x=1789561460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UMFW0j3OAmOovzEV4dOGJn9Fo9H6CXJm/GInG/OM5Q=;
        b=JTSsdmJdXMBV/6nl6aW4PBigpCC55KjGgJts5RBAORIdUX/pPcHCwZmVXtkDrBc2Qc
         9JlpWRDUVI9niwXk/Aw9IkuhwBXTD514i5deTH6uNgOiME250jsZ3KZ+RIJF4Kafq5ki
         2RPatVLFvrEJyqZeCsvLvXjtLYw5nQGVmd17E7Bj9Nr8TTsl8MtHbcM4COjHaw+9cRzF
         Vfsnojlq1cvSJuLYXww7XT6CM/2vm6QYrNYm7NzZN4h76Qal/5VzE5oKddnu5DJndUt9
         qoQm7SsutZXJCDtw30I0i4A/ozjrZ02x7Cs4qohgMmHPmDfZGLxmjBOmASsOoGKtRSoG
         BKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956660; x=1789561460;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UMFW0j3OAmOovzEV4dOGJn9Fo9H6CXJm/GInG/OM5Q=;
        b=l2FLBSWB+5TFfn+/h5xA2Y0oKn9BoYt9uAAv+rlDLCuCPBUcU3knw+YEPn/gEEYMkw
         1IoH0yGYygwdukuH70072nbpkbNNuQRrXNFYnKGI6y/wt5HnNUVU1D5YLbCFpfv4cXNo
         HEvYydsYjhfAPTD7PD2g0HwRS2W/eE+LN6NJGAdhmcMfq4ST/b4uzdfq5nW3Hyx2cb5o
         6QSPUxalso2scWgLA4kCSRyzb+bXV7WRDt5/q8rViEyZ3WNHVjvjY9IMlXnwNVoDaumM
         gEYWJry5SNnLc7waFXw3EuatWaB9STsaUxANPsha82qmcQiHZFwn7mSqjndVPmoxGMBk
         BLWA==
X-Forwarded-Encrypted: i=1; AKwUvBwmYguS2VY7ReYNRNBqUPmeD5jtSySZnr/Y4RxEA4wNdeQIltuo7RlwOTZ5JxqxkKb53k4RtWW3IPH9@vger.kernel.org
X-Gm-Message-State: AFuF++na0rn/tF+f6UlURHuKFcdhjTBvYRM5qrwctPlVXuApTQAIMe3y
	vWDUfBR5VWbs7OgwIruQPmqHy/AA7UM3YflYo7nElA5MvZqz/DWtn+/2BqQ7brzVLjIABZRUDYd
	+/NwP4CEx84IgvvGS7Fq2AD2HUnH5XoWYXwvAxubxILk3ezYXxjauphUvfePHIMXa
X-Gm-Gg: AYBFou2N1hbryR6kTTEzq4kUPop7ckLlvL+DrY6flEHn3TuzvuxIX+yu0mRM49dfndj
	anKlAZWagzkb3SvzYixqFtD5h2ub9lp8GyLbeOggtWeyNzERr3LIN0Jz3x417U1FvftzQK0hHMD
	7tPw+u9Z/9Dxx3QHBZTwsRSK2EZitY9pzN7OpC80/oodny/MqA3D4fqcUw9RGUYMZztxiynIciJ
	Rrr1WXHR1c7V9o3JfivUsOXet4AXdwsL4K3/YZNKtJkrOxBLSoYzNHRurZ/tSSbXQ2DTOql7mNm
	4b0+A73EZI5moJLzdk3mmMgL63nf7Q5+V4tVf3pXtBtpm4JKGt0biQ/QVgRp/yGOC5sdnE5AvIc
	3yEzs8DWd5vLgSiH/4Y5HvA==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr3147130385a.4.1788956660445;
        Wed, 09 Sep 2026 05:24:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr3147126085a.4.1788956659792;
        Wed, 09 Sep 2026 05:24:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d4aa01dsm763314966b.15.2026.09.09.05.24.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 05:24:18 -0700 (PDT)
Message-ID: <0bf08484-611f-47ba-9297-22ab5aa8a0e3@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 14:24:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907-msm8952-pinctrl-v5-0-9a2d8d72ffdb@mainlining.org>
 <20260907-msm8952-pinctrl-v5-2-9a2d8d72ffdb@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907-msm8952-pinctrl-v5-2-9a2d8d72ffdb@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a4YAM0SF c=1 sm=1 tr=0 ts=6aa14ff5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=x0-Ntm4DP0gVEan9CnAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX1MMZpOxfyXcr
 kohcFFIVRT8NM3LRAyWS+uiwbg6dGzR3Vsz4iAl9B0L/vLKmfRp/6ffU21gQEP8DW5kstctvktx
 GmEJpRVL7iq2saobR4lba1wiUKerUjMHevFq1zTSTKsi2/mlvZOwmGyFYOj4YLxBWo1SbmXPQNH
 zy2PaEkZNaTkNgxdGYH6843yrllzOMi8+TY5gable/RAPpPkd648cbAIeNqINy/JcXiHuY0ORKv
 oQT3otWN8Dl9nm165lSPggb2GtxGCZlbyp5RsYsb26sY4RF4NNU/3V8XwCMVABSI2On21gvvwO6
 yiL5X06fnaU93XCRZznQ4FwGdJUa+ne4veHfiJa4UncWawUdY/b7E5tjhAcfF8lJtzN1HTFuo0U
 4dtA7b0RKd5smIrqmNFNzD2XR1ZCcB6B2gUjxgYB6AlK2g0xg3numL97EhMGqfb1oTkxrgBskIG
 s4l4t9IIR6DgnZ1/D9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX+Vu0+C5P1hk8
 ahV0lietoK6WWo1iTF8k3nIYQ0mBBd+obn/SuhA8H9LhsR24x5ZRoZa/AdopMsG5AGFEA8ChSJ7
 Xl959/LjAO8i2BKsebsLeFRHzaOmV7o=
X-Proofpoint-ORIG-GUID: 5uWbF_ojS3tMMF0v17g1VoJQsSr04j0s
X-Proofpoint-GUID: 5uWbF_ojS3tMMF0v17g1VoJQsSr04j0s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

On 9/7/26 6:05 PM, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> MSM8952 has same pin count and similar pinctrl
> functions mostly with msm8917, but some functions use different pins.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
