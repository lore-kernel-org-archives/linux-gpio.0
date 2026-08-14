Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C942AF83
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 08:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786696783; cv=none; b=IYsuPcKXTVmuHIHS0kC9HHQQTEpnv3Ici2V5NKsbyG4DE+XW/v8YMyQDKSYZvdcaUizRf77b6vBq1q7qyAi2XV28TOZbc0EO97054GJuLC8xQ54AiVDWrnoPjddctl9GdB+wtSLZXm3c7ZfPW68YyAt7o3K+D5TeBq2h2AjZqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786696783; c=relaxed/simple;
	bh=e05F9ezF4PKO3QWRxGecNfgjkdRbxg6z9NAmRbFVpKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlJXxeWabJ/lAJUXST7XD3g5hvW7A+VHygXLj7/NCT0si4elPYgs+a2DXBEkXWSa04O9w8sb4aY29qzdYoFKLJv1wIBsFtzEU15GIil/jDy2FJoqttm0CGDMX/YmVM/aKrbtUHVMXtwwmDfoQI7UOVKSjP/YdJqefH7yFdd6pUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MNJv3nfM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CbmaBRd9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MNJv3nfM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CbmaBRd9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7ft3V939329
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 08:39:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ea5w2Lqty5Yt5//TNzt0Du9L4M/1RYPtE6BB0ik7PAU=; b=MNJv3nfMEBeeeFcF
	IWyur0HcemvAYI6S5QEC/7PfYTTelv+LckFmkG2ZUewWRM4REnKJOyX0iZn5avw7
	djG9oEytA5tP+nXvYc/3nzArzQwWwnmYu1i9iENDO0ePq943X2IVOi5dKKmPpCkc
	wqRHtr8iWEYbLLfMawRXh3DXrcBhH3k8lD3KSq0qJ9qo9Rwkc6Uoey5yZcMzTo1p
	Zb8GZ4imxhPn5BWUQjhNeZ+M9OcIPp9jd1SkEI2eVgMFe2N8VIjNr4moXL9fGZ3p
	kn9SW2FYu8UOoZBbt3pCf+DIs4j+7eA7K+LK9mVjTif9yqJh7AHVwqeK0QF1rg/+
	7gkGrg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1fg3v287-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 08:39:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so10716395ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786696770; x=1787301570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ea5w2Lqty5Yt5//TNzt0Du9L4M/1RYPtE6BB0ik7PAU=;
        b=CbmaBRd9uIcUlUoYH3oKcTbVnVSzjn6xD/Icr+GaZDO0WTTDLKacaYeyODi3K1YhiY
         CKAi5x4A6C+KjqLu7VQr63s7crNgLuCBKbSFh7llboIDIxwjRV/zStBYMj8r3GegLFZY
         +8KOo1FgfdigHqdNgTJtOyEBUA8+zPqqVHI/XRnuatlE9zu3yirjZBlZcQtSCTdaU9sy
         luQA7p0Zq2E9f9PcVD/2v8JfcoCLwL7+BSohX3yucVLDWcM+V7o03k57TuuasdQevE1A
         J9PVUn6dMj3CLiiPInIWKemrQhEtVTCnU/SW3OY824l1ALXcc8jpcF8a3mgeQZ8hScGB
         PYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786696770; x=1787301570;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ea5w2Lqty5Yt5//TNzt0Du9L4M/1RYPtE6BB0ik7PAU=;
        b=gD+5ZqwmyEglya0QOt7YASo6nacPnCX5kFZBnrhK6gNeIdrZkHFZIto/Jbvzf9UT0P
         wBiYgzO0PIF5WDWBESyPOi+y+d3KmD4RWz/uvYmqUYBMnMdnk53evw3cHa6pmlvNvZrn
         WYzBkRih9jXKaqKe/d11rEn3Ill6K8egI1OQqEIDHzOD0o2kHEJcpAO004nZIiYDVKdM
         /I/55SdW5ozax0y45HrjFGHFKcokC0dRj746JAAif4tNyPMHGBfy/CXk617pTqpzTn2z
         hhm87/MdPe4Lva0fR+QBBlRS85s2GKbaAYXsYtkCkqHawDDYo93pWWE4IQIdK+ss2WJ2
         GjMw==
X-Forwarded-Encrypted: i=1; AHgh+RptlEo3qF6zk9f08uFc7owYKQzgWB8Pacfw3UmiauU3z742ixYv9YoluyXZ6OPz3Os3EmoUUn0ZgQN2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8rCI0FctY/g7JSG1EpHxEPmnAHBvoDU3HZXQ1SStyU50DyJH3
	zI4xOg1/qL4LEx09ShMJZBgA17SQzT9a2ecIz4npEzsKw+Sj0HJYEbLxdWq2CBU3bu7KLUXYu3s
	DVdXqCKIXjlJ0upH0xiRCPDAlkesr3fBx3ujvMNOKQKO79BHA16kLYLwt/jEPjUKN
X-Gm-Gg: AR+sD11HnceVWV4Jyd838RrZoVo7SayIRZLBF97HqdiGSs3nq+FnBpb31ByznR0cP0j
	MYcw/XZ/ceruJFHSkIfec91bBfpBnsIYxkzu3pKJ6Ce8ZtwuyFPhAK1NXXmXzgsj5+SIJwOjAbx
	n09SiiA4kWinIbM0nImJe6i8yANlw086eGwPRUQuBFrAMcNvFrML2F2GVSbzI6CXQNgtWyqXqED
	sejCiFc//vSVJFCgagMfCMxWRBuqJgNPEsNHtu67H3MZR1zP1vCaPr4PK+VSLElCaVnAetwrceM
	pIDSoq2rkBtMhJCmWyCc+Sy6D2G+aJkIAPVpZx27lg3FljqRI6FCemwvVq9D3yLPefG+HHKZwz7
	KbohURy6iejSYArojr3hsYjoahLbZ3tyUxOkT+TcHxoaNbOqziPcuMRuDtYV2m9rIQmDlGZF7/M
	QCqQQ8F7/v59jMREDf3mk=
X-Received: by 2002:a17:903:28f:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d37f5cdcebmr138080835ad.2.1786696770279;
        Fri, 14 Aug 2026 01:39:30 -0700 (PDT)
X-Received: by 2002:a17:903:28f:b0:2cc:db7a:251 with SMTP id d9443c01a7336-2d37f5cdcebmr138080385ad.2.1786696769795;
        Fri, 14 Aug 2026 01:39:29 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3ae7ea4cbsm6518765ad.32.2026.08.14.01.39.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:39:29 -0700 (PDT)
Message-ID: <b0f96877-a48d-4b19-9904-426b5993d8b8@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 14:09:19 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-6-5e0ede4a0c72@oss.qualcomm.com>
 <vexqghyxtf5ntmu5mpijgql7atlzhci5fhde2j7gyrw4f2tpdn@pm2qzwtefmrv>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <vexqghyxtf5ntmu5mpijgql7atlzhci5fhde2j7gyrw4f2tpdn@pm2qzwtefmrv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NsfhtcdJ c=1 sm=1 tr=0 ts=6a7ed443 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4JL2KtdrCnkvdebHkfEA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA2NSBTYWx0ZWRfX/3cAGoKR2Zhq
 tTECMczivvWtT7mSE1l+uXPW21mVFVvp/OxmxLEHplnYjIN3gLjdob6eN6rKf2qf2JqVmoG3FQD
 ZPi9+Wj8GmOC22YMqy2XIe1sijse+OqNKVGgMGR5pk2Jv4XzWUsiFIPlD3D63AJKRVt+ydxV9vj
 4ecKspZJoDrrr6z0w9dvEz9e/robyP+qsZLx16kpieTgUVf/3VtZ7UXZgM2FJnBQU10dIRbx5EC
 39OfKmYKoLHCYDFh2ifYNMg26H5yXvsd60OhPxFWirkUpcjneX9+3ssci/8L9V9ww4zMFS36C4z
 FzIEaG/KBx1LqKND3Ns4K/T38J+r4EM1/osKNgZc98VjC9+NsQXBEp5ug1G/t85yj5HFdEg/C8i
 T53L5KKZVv8fjkOoPv3upie0W1PogTCuq+WePqLtUY9SbEAFKHvdGc16362k33BJKhRYBPam/sv
 YJubGt7yA0KerbSRVkw==
X-Proofpoint-ORIG-GUID: x8At1Z5lLOshzUsJZ9JO9TqI825uofkN
X-Proofpoint-GUID: x8At1Z5lLOshzUsJZ9JO9TqI825uofkN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA2NSBTYWx0ZWRfXxRBJEFLDPoDU
 YG8oxJMJxCAzxvKf5I0l9R4JJj8LcuX3XESHqsnx6/HH26z03d6LtZzOMceY6kEkcQ3T5CygJle
 K4aY8NlV9lvbI6Tj57TVlqtGpX0s2Ko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140065


On 8/11/2026 6:29 AM, Dmitry Baryshkov wrote:
> On Sun, Aug 09, 2026 at 12:57:05PM +0530, Hardeep Sharma wrote:
>> Add the Devicetree bindings and node-ID definitions for the RPMh-based
>> Network-on-Chip interconnect providers on the Qualcomm Kuno SoC,
>> enabling DT validation and interconnect bandwidth voting.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 72 +++++++++++++++++
>>   include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
>>   2 files changed, 161 insertions(+)
> Are there no clocks requires for QoS?

I've addressed the binding-side follow-up in this v2:

https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/


qcom,kuno-rpmh.yaml now permits up to 4 QoS AHB clocks
(clocks/clock-names: minItems: 1, maxItems: 4) matching sdx75/glymur,
so consumers can wire them if they choose. The Kuno DTS itself lands
with no clocks= on the interconnect nodes since RPMh BCM covers the
paths — same shape as sdx75.

