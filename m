Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227941B362
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693558; cv=none; b=J8/Xr9A5NLzTFH11oEcCpfeLZdbgaiMXd9fnAq+wMggaE5q+Wi7l1P0YFqXIxNhldmyrMe+0wu8hsbIoAPbbSz9C6ABHWaT7T0dcAF1R8WAFNeff5s+jfb/jxKwym6uyqi6lBI2RyGVpNNXN39x6noSa1FrKBTj7QIvhxrOUUjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693558; c=relaxed/simple;
	bh=odhvjEz0uGc5n8RkpwlKDWDtDSKuyDnnEDBwtJ8W3tI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DLwJQknA2ULvLaPBA0qC+5lIrh0JDN99kUjDxryOVGSQbhhVFSZL7+V4a2hwYNwrFY55BKyBVS/wdBGe5FoER3de2sUFtax09MqttmCWYJWHb76XFb0amg6ZcYNXMojLvLZ5Q6IGt/CVKJYkH9o2XGKj6sf6Ot4bP4VMFBXn9Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RInTndO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ewQ7uzCh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RInTndO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ewQ7uzCh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fvbq274888
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=; b=RInTndO5652zutsi
	uL6WzNzZ57vg6GtW6Jv1ldEVYC0s1++YbS3JcVb/isfmlwL2wDwoYrTqI8exRUre
	ndB3EIH2wRm8i/SLNERLdHUONKioi0HEThYcZQue8Vtd81P1ITp9sgnRu7NFP6Ga
	jJMHdvVJrf/ZLVzil0LBw4Nveu81RBikaoC4F2mLrO+5mvnISHXicU4fye2VeADp
	r9qRiQMHBb5vGWn9XbiJQ5Rwowtd509/2QvOUoNVzgaKx4OCBHj0DmPzcKFAK55s
	1D2GtW3zhoGkYqvLF5YHWdsFZANMWpikDwlUUK8IQDEIea91s2nsH+ZFb9PM8qL1
	N7kf3w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j9kh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1121368a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693546; x=1787298346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=ewQ7uzCh9PseWeEnaMv80LcqVNy0NbamlsjzLOACaevLy5OQcNGGJwfFtmM9Ny2n84
         DRMNfU3ldVKjNH5Hzk0gi/pMCaDplxI/M0eZ0o96ICtZteJq6ZnIrdrO+8Sf+dQvsXrl
         JcdEpqqEMfPsrzru7666Leou9SXS8kqL+KAIK87sjXNOS38ftRawCRVjeJgedLquJIh8
         quMkAo6sQOf9mLR5fE2lPND9B6HmbECBINofTKIE6h92yCwNQJAWp2IUCcZO5P9F5hfx
         dZMnrRePsso0deY+domLYtVTe9w5Tn41AN4w/O6pmfSKr5I/iGrQhLJ9XeatL02QmY8E
         jfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693546; x=1787298346;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7kZ2avGnMlg8Z6PBbfqxwFl8yWl21AGMezmqeMHyqZM=;
        b=IbPu3lnV3YC6waRY0j2exEO+Lt8/1eRJeumoDrhwwNWo5MTBCGSFFBFpnag8DKl20I
         2UnKWYLCb/MYVGXy1HBGRuOxY9F5p1R5X1TAfx1L3CbS5fNXdxBYaJfnh85fuPb1VCzb
         D/pq63sPNTKdlnBicFeW9jk2CI19XeQPceOLBR6Dfl0ZqOi/3ZeRz74xcBbpkMJTfawt
         Cb2VJbhRIiaEB0V5Q8XbuORYtcCVbkpw7N25EYxtb+5vpmfZHWC4PQNgicNVTRKXxwDO
         ADik0Ma+vr5xGbHwpnffYdkSOVaxpNy4FLgMDO7ahrPj+x6fKzyahxjR9nBnTCh194cQ
         B3WA==
X-Forwarded-Encrypted: i=1; AHgh+RpPN9+Yd+tQ0CBvrrl7YC7Ac7al7wtx0NxZOqvXirpv75ossMO4Nq+xrxA9WY8PY9ZhE3JyZ8SdwVjZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwAK6UoXynvouRKCS8arS3HyxIS5SrPmcYk/vsNI/+GRTibIqAE
	UoMnIwaJdEAJMP21DH4lcbGISSozOjKDNEIhJmhERlQLdNz29vN+W7ClubopwKzaXbI9QISFhWa
	DFbnd1xDZ5jGTOTjQvZIX3Gqi3pucZ/MPJNeUc/VYpN8CYDlLc4Z0hZJoReoxqwxs
X-Gm-Gg: AR+sD113NUTqvLnccbjPieMiYVKIKkHXOzkZwxiXzJWJEWLCK7DQzktFONyxMukRKjC
	LwgZtAafIYJFH2WObbgTMYgvdv3W1MGpzpuu3u0XwfSuTU7a8f90O0eOrIzR6qaT1V3Q6BGcR5q
	HGMHhG9jpot+F4nRcp8opdMyfMylZnNTUoH/lx1HbUOL4TJPP3iF/9epo0dxVa7huRDlU2iOoys
	qB88w1YzRbGIam93aa9gNKuSteEpK6ofZRBTwGRV7Ar0jFg6UbW725g9GOJjgmlqtD0DXflathz
	E2ENCrOmVo1td/XVLGnPWtWUZJ0wrL3OD3qhPtFaN6idFh9UCa8JqxbDVyDLBVY2MaDpsZa2Jys
	75GGMrbyhLX9lFPyMh05X+mwwbfL7Ug05ym0oHXuGQMZu6gKdn1kIe7FGDRPY7pC1pd6QK5Sohu
	VU/9+1lKb3GxjHypsym5Y=
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470084a91.9.1786693545533;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
X-Received: by 2002:a17:90b:268c:b0:38f:2168:b9cb with SMTP id 98e67ed59e1d1-3933b84be0cmr4470024a91.9.1786693545103;
        Fri, 14 Aug 2026 00:45:45 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3933b688035sm772468a91.3.2026.08.14.00.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:45:44 -0700 (PDT)
Message-ID: <3941f29d-3da7-4576-a852-9922b94007df@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:15:36 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Linus Walleij <linusw@kernel.org>
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
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-15-5e0ede4a0c72@oss.qualcomm.com>
 <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <CAD++jL=M1E+Bvfe9tHw3FaSTFgR1Nfzyn==xoLETvARLZHPrMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ec7aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EUvog4zVDZIPAgcz-YkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: QHoKsWcnAzp3bq6YcoANBZUty0b_gdNx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX3vNa0nKKAVQo
 rX/ZstuJoAmBOcVl8oup0bQW3BUh5Bp3I10iLmiuhYcQTBS4k/dr+ZPszHwrRl1cDnW+20HiJRg
 PiVzSg0QU0zCuOtJbXVHovUwSkthHf5SkTs4VoRlz9+AOLlnxTEGeaUuBcrPDfqUTFezBX0edlD
 eWVEVEud8Yg4Jjtn3YAhTiE6VOm6sxczuh+FQ9MupdswRgUCC21sVKzQNPfRfrhqqWYSsDVoFGd
 pfs+EcGs00VNKNjTbY1o+vgbhhu5Znc5Fu8RK7v9cZtB7Cg0j2VFYttQ2oszqGfnmBi/ZTj/6gj
 3ekiQ9LkfM32gB+lTfwZWWL3THez9UrWpQDm4juEy971xn8CJVJaB9bwjwVAwTlLoYgaWBoPeM1
 QUOysiUD6pKXVXjx/BN3aX8r0THGoXsY8pDcOPlV4ZGaHOONBsPtq0SZz1Glm7nx/aP3fRkBpe+
 wQffMomst9pgcAHBLKQ==
X-Proofpoint-GUID: QHoKsWcnAzp3bq6YcoANBZUty0b_gdNx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX5Bs5k8SjRMRF
 0uZiqOJX0O2NxZiPjxzY4u/MXMChXcqZ6JZymfSS/VwWp0r9G/VsP7if50RSxCXxVuZ6sUop1mZ
 wsrjb01ctTwOxzWHpeO6Jrl3iE1LXfM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140059


On 8/11/2026 1:33 AM, Linus Walleij wrote:
> Hi Hardeep,
>
> thanks for your patch!
>
> On Sun, Aug 9, 2026 at 9:29 AM Hardeep Sharma
> <hardeep.sharma@oss.qualcomm.com> wrote:
>
>> +       memory {
>> +               device_type = "memory";
>> +               reg = <0x0 0x0>;
>> +       };
> Since this is clearly intended to be filled in by the boot loader, then
> write that in a comment.
>
> Other than that is looks good to me!
>
> Yours,
> Linus Walleij

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

