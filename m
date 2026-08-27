Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8026A47798E
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849090; cv=none; b=UqgXb4mBZ/psSlKD+ksW3BsGhVJy2Twh10UyUlUbKYOJ5N340T/U5xjzkid4GBtC4RFoCM6xoga7bw1xvz6q2Zl19IPYgKRm5/y8/2Rb/41d68mSYWCzrUfvqTUNByAj27ORtFLIS8pC4P32zDjkX4wJqZfewNk9FSeNuAnYlQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849090; c=relaxed/simple;
	bh=LIWudmjBuuTC7oQDej8L1/vHU4MkvFeRxy+wdt0a58A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EtVH8qJN7BVNuUuSjdJ8Iqc3ysf6cw2HqvU+HG7xcii0MuoFI+M6IHWTRefXsjTqTSrXxzJumKsWzKhIbhjdIx/TeOKiJSydilcRQFfQdfRV6MiMG9++n/zKnV7pVNJ6CUUiKxEBremuWWikEwhQX+NPB5IPOGvPQ8gxHPACgEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZInGT3E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6nHE+6Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZInGT3E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6nHE+6Y"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbh4A865952
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:44:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=; b=kZInGT3ECVzaq4wJ
	7GaKlLA5q37fgPbHoGzEu4Mzmt4ATXsuzcwsi8TES9wCtD0j1eBYIgcivZQEoZpp
	Ve2iKcWNtUEzg7InLKOjjDMCuxN5NHN4JcoAC18N88LJ9tYPljPqmcw6WcHjt2nB
	smvuMotesHkm38LDuub+IxbwDW37/PGIMn3WagVIytlAxv1uhytou1C1H/fUyxm8
	xb9CBeZHGfoZO7QpG5vxwhhpLJkDreDDgvWTRZ+U8+XPw1bsIMbyaiPs5lDJHL5l
	V3yEw9B/+2eqDvrkcY9RorKG7jV5Q3OTioMJGsFgedg62K5FQGcDe21P54hKrznC
	822rRg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gapgv8s9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 16:44:47 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b28d8d1b76so147778b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787849087; x=1788453887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=Z6nHE+6YWOlHBfJZMuLMCGsxeBwSVzNnDNU6BoV7VPEg+vvJ9zFMdFRxvx75cslKa+
         jLkz790Xc8pglkfiaTDtJZAxIpI6deV22AHtaCTnWISk0EjThyDIUkGQcW9mfokIdEBp
         U6JJdUD0mcwRYltgnV7nptD7RfGFBlxjbza3wHFstfQLXQL6nnYajYHtWisNSIfDbK92
         GOiJsa0QKjANFoo4WAW9V2vmD05WqT7so9HuPQT6s6wIKPs4rDBkLPyHsKQZB0Td9k7c
         ykXfDGu1zp/W6tBOW4teFo5KBeam3oRCUfN5lEj0wDKwFlXydA/1xLz79CwaDucDILCQ
         ZY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787849087; x=1788453887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CaEEc2AwRgBYqxtCo+TjIv+MSn3HdYNx2K80+kYCoZE=;
        b=tUG2qaV9aVoaxnmNUISTedD0dhIqpR5b0dch1ZIYV0cGkjtVj9zV6nEGR7h7IfLdhf
         /rQfXndWzOeWeo33oWUtnp9Qu+kjsTlOb3bNBVe7YBsBJpsx1YSKet5mWjGWXmzpHFBK
         t4jtSFLs4IMWF1GpUqqspNiFxXPwztpDFQQzl8dKrYDvNzY9MOW8UMxPU/uy75qCQFVy
         EtPY3obLDLl+GbW2HuJvn3D+sBIEyP7pHVHngjYZXU2MLe+1A7YinqA4r/XyM7YpBIHj
         CEbgA+CTVr9NJ2r8PrVcKgole+M9m7XTPvhoJLOiDg9fz8zpUzPxppPLAMebff/NkwaO
         xE0g==
X-Forwarded-Encrypted: i=1; AHgh+RonTaXmcipZZOWP4g+3AN4FwjFz1MnocXZ1TbiJuwR7th5ER6YZRjSPppVEAGP32hm9PDkP2vCG79lQ@vger.kernel.org
X-Gm-Message-State: AFuF++kTVcpCH+3tOiohL21cWV6JAcTKarbENIkRriWgTSbqHbDprbwf
	/fhqJgm0HEo/2AjCyAjP84LnHNSHUXN4xeocR3qH715YNtBcZwGvaN0CbMMBlMFsyoc2tniIF3D
	0GhgK+bhtLHpOpQpnKqJtmId7ZQjvLyv9vsiGh+jmCxpO67LQvL6CjE5+m4yPlWNZ
X-Gm-Gg: AR+sD10/WGbs/jHELgDwKXxvXuiWb/AYGjxNj95v8O4UYVYuk9KJK/B2Sbtimy3JQmQ
	mpEV6HZYp0OfBcwKbY9otkFN66/Or4w13AB6bn8e5UkmYf6hbdMQtFCgjUmkVmGwEqv8hsRTi0r
	3LDzRSwIb9IaEUV38Z2IJKg9+kekIZjo/P89lNmpcMAKCWeR90ztOC3aER7mD33nFeRt7ovUdon
	hZRXezYvEOSnaojNTLjKAiqwDnKRxVXZUei0Z2Ynql9kU6Ho7fOkLpTfO7P548sB8/aeFeiQ592
	6tD2C4NaCM0P0V2mqX6TBnpH7SVv5Q/YxJSg1b0CYkAvsJBu0GxUz2cWl0J0hD62orT7RX8RlG5
	fYAj7yKs494Q8iz2eqYFZvsn/yd7xrSk=
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410527eaf.22.1787849087007;
        Thu, 27 Aug 2026 09:44:47 -0700 (PDT)
X-Received: by 2002:a05:6820:83da:20b0:6b1:95fb:81e with SMTP id 006d021491bc7-6b1a049cb22mr12410471eaf.22.1787849086580;
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Received: from [192.168.1.6] ([122.171.23.69])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a253d6e7sm5112145eaf.7.2026.08.27.09.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:44:46 -0700 (PDT)
Message-ID: <67819cd4-013f-411f-8f5a-77df0e3a88df@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:14:34 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-7-196e2b306368@oss.qualcomm.com>
 <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <mhjq6szchgrgoegi7jrzmeumlhdjr2njkh5jdyjb3cjb4pd2hb@qjvx34fyo5au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aDQ4lfIcZlV4QUYHLi4nfVPviQwKUdHe
X-Proofpoint-GUID: aDQ4lfIcZlV4QUYHLi4nfVPviQwKUdHe
X-Authority-Analysis: v=2.4 cv=FpU1OWrq c=1 sm=1 tr=0 ts=6a90697f cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=WTDSa4fX56zQulHxy5BIwg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6qgGxlNUwWlbBUD903MA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX0BZqxNBsOKJF
 8tuz/w50+V3OZRgxRW/MrAAJ7wbbdnA8JIr5dOfZOCM85HEWKRXgP5XwkJjAztdNFrYz+LRixzR
 mr5Ck7QhU6spVZx7kcLluLwJR+LmuSbGT+1p8D2vv1NO5uICok4F+KadKWc5+Vv1DNaSRWeHUmj
 wmzbfWT+lbUrBpqwWMYAtTt+TP54JjUZfSKtdB2DksDwnyPXD6p/nrSAAKV9rlmJTbq8tbfshr/
 1VA0iplKltdkiF7YvJcYD4sGKzsXfykppaoyQ/ZYZ/XXWtPlpU9aKZ3I+ECavgjC0Ugxjrwdd0c
 HH2G7d/nW2Jt9dZsA8wev55594ozAL/7eryNMZb9+Bh7w1r97GcTIgJrSikXo/MAWgwkAthTeIw
 /auUKYRTdwGmsfKiI5y8JGayHkrKYS55x/QclB2umRBHDFnUZpPtF73XA4f7GYy7Kt/BXzMwHbU
 20/L3JvrBZbO2MNnHHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MSBTYWx0ZWRfX/eekhn3MWrzg
 mP1YDe40YCye1V5F0PWg69jR4EgYCzMv4VnV6HTbSWLFFeXxJ2oPl959cGynvlJScURbU/BN3k1
 KyLh7+tR6ljeuDq/67XRJ4zrjUUOB9o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270141


On 8/24/2026 1:27 PM, Abel Vesa wrote:
> drivers/interconnect/qcom/kuno.c

Thanks for review.

Corrected in v4 : 
https://lore.kernel.org/all/20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

