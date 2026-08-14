Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891C73CB559
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693515; cv=none; b=Fy658HebTWHdX/SzTrZKTLVFOkYhKvbaz4e9iJ6ms2HhB5EkWOberGsGweZEfbKIVRZV9SjtnwOWvE4ZdT6YLkKmhw+Vcr5JKttFV3emt80HOVVMyFiRKSP85abUYINUJTy7Fbv3XvBYDkm+9rN80cXhbDYP3UTOtyhp43KJrvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693515; c=relaxed/simple;
	bh=43VP93M2bCuUQt4J5zmUp5pqSrHi4cXLggSwgWzuaiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G1AILa2jfE8Mky74W/jBtjF0HoaftGDRswGooLuljUw2EbrgV5AgSRdpUZKXMor87BBf9/Rgl//PABX8kNQ9kIn3yuuRiQPCYxPa1zAlGjHK9W+TfcyNZ9+pfQWqeOGykL1r4UDcxQLCJmhF63Q8xf0qz7Z3Xh+eq/VMTo03TEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Edlwjcgh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QfS3aFxQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Edlwjcgh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfS3aFxQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7fvbf274888
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=; b=Edlwjcghl7ohqAmZ
	SIgVvj1wkl4cozP0PfranZPJAploNGnv5EtekAnUxrfRHfqSIGfuIUXr6nUQEGLl
	rADfxu2iKI5A6StpNrXyMdQOcNnTnA/y7jepk2PbOKPrMUgADAprBooDFh80c+42
	Rjg7qKY5V/+/3PcZ6H41EMnd6leB2bxP00n6KTdh9hc+OeL49P6Q9qsNarGiwctY
	UcAwhDlVUDaj3xzQvANq2/KL6XdHZ0++9pH8L/nloCiJHRJr+BNRbFbsBZJSuixP
	b5xjBo3dqWpJuA1u6QN5EL+SR2yJlb7I61jdgKCpnY6m7kxFnFhsZPMEAOOmHvC5
	cLqlzA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42j9gg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:45:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so1436775a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693506; x=1787298306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=;
        b=QfS3aFxQvSy1JGV8Pwn43dB8LxwL95Gv0h5kxCu2NDAhPQjydjKv/yMg+Lc0F1mxor
         G5qhU8hN/zcKuNUPNqXQ4c8a3I7yJC984Ax5iakcTLroaGt1ttGgmT+OZHIqckOgwbjD
         wC1uBIA+3WHzL0QoPhXlPRTtddZ+7gJRKDij6Ur3aj3plHC60YAEv2D0mTUBHY84jApL
         WQtQ8HYQlSYgObxEuZzovN2/8NSijY1taXJcJN0n7+Imexggi2y395Qh/pcVU79jLyJX
         gvSPsgcCoR5PP8Oii7AfxuPBZvsWEBrU+B2Imumfal7MLsqhhAT8jAxCmQicUkV7Ao1D
         X89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693506; x=1787298306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Re82H9AabKnC5fSLI6YMte6BlqAQaCg3tkq8ao0UmjA=;
        b=KEL6TS5pnhG9novIZTgeAeUaZs1NujBWtAdh3RypHVZMZneXLdwCfw8T2TcR/gITdR
         Hi5Iq8+K8Hoj28eETKA+USwc8JtOvXUF/fp0nQS0+wL8utXAUR8wTDtigUYYInM+XX+T
         SLcvGomkP07JFF/Sxiwo89Rl5C1e/h5VGGs0kHdmGxDE4CDriEDp4UI5mTHy66nPgARE
         zHXVq4IgDMBiOm0ZHB+0AjoTlkxe8owkICqpogkNS3x6BD6l6C3r7KSqgjTPrBAiyoa5
         GrHzSin1R19yWNJAbE07QVGlh6fi1g8NLg30jpaPNuc/aHB3B3d4jHDyYQ5AkSBDSua0
         TIyA==
X-Forwarded-Encrypted: i=1; AHgh+Rpkh2hXo+Cf/uy1rwAUVoGiQlC0Uar9Yq89dL4RMU4p075n7jVmyWPS0Orep1iUCLlRrInn2cH06+Uw@vger.kernel.org
X-Gm-Message-State: AOJu0YyCQRSyhQwSURPZboD+2xPOOQNgrnbJtd+MytT3OxS12rlp+wEJ
	JkxHDmbXxcGaheVX+RTMsBq9VI+6td7pC/AZYxjvFEKGokuocM8E+BPTjd0w/6tiEotShGeUTTJ
	/D4M8swPkzwHEb0vGhoPyQB1JpyA/PZj47OEqaqoghAXDjzPj6GHMI0wzSAX8U7D8
X-Gm-Gg: AR+sD11EwnTGqG3XRqhNAR1FuWWeAwhlhXHsnjaXUtMZ/Dw+1nxqk4C2/N9VkG7DsEx
	OlEIx7IQ6HQzfdzlFTvchTUAVzrrrYx7LrXbhm6iM4chcGsVCCyYyYSKdUOsLpIZuxS2wmzM7TX
	eEtvPZb+aLSUNbJ3tgQRk5NJpX/zKTwg01+3yqrOudvDi6R0UyJu8WOZqs3pDZPfX7HryoGy2BV
	iybQWmsBxomMJrriTWZ5zRJImD6jrcZBZItZGBOARRRbSzrWxx3QEUpH59q/mUfE8+OWPiEtuVU
	fAlBE256/81CgX5USNa462Gx9SJeOn/8VRHU3XZn+Qp4Bf57kP9XsbUoIGfZkNxZ5gQNVEM4V1I
	zcQh+2BHhuAymh5gKaVRrc10f7vGwwm4ulj0/+e4V/ARNoYM9yzM5DerdGiIJ5ZHIwrfNW3FAs+
	nXn6IunpW5x5RpX17rlQo=
X-Received: by 2002:a17:90b:4cc4:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-3933b927a55mr4432361a91.18.1786693505559;
        Fri, 14 Aug 2026 00:45:05 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc4:b0:38e:101f:c867 with SMTP id 98e67ed59e1d1-3933b927a55mr4432281a91.18.1786693505033;
        Fri, 14 Aug 2026 00:45:05 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339b2c1b1sm1061663a91.0.2026.08.14.00.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:45:04 -0700 (PDT)
Message-ID: <ca6818ee-82ce-4cb5-be6f-055372cc00d4@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:14:56 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/15] dt-bindings: arm: qcom: Document Kuno IDP board
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-14-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-audacious-cockatoo-of-brotherhood-098c9d@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-audacious-cockatoo-of-brotherhood-098c9d@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7ec782 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7zRd6dj2QFuN70SSHgAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: UOtE7FTPyiv4lE6_xkA9XUigRt7W2iUT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfXxUvUd59J+YNy
 vSmksHT02IBBoe/gkqONy/eAdF4/RYQra0TPi9c5Mp4060e/MCojL/QwHRXjKt1DDZzXBWxWjMT
 wTOhRuGXGamizKhf2RlqCVnu719TCFan3sr/jP421K8ThSOyoFSxl3eMB/RP3Ihukh7TZf6zDRi
 NiYJRtGi939n9kyJ1+kNP79aKEs1UjZqb0K8HabD2z11018bNlvtjc6VfKPkJIbRf+WM/MfZR51
 2SDCV8ZLDVDy2teDY+AIfiAkhYkRKF0NTLIGiVF04R7Th8FoeyQSvEHQLeriBnRUfF28/wFiSLo
 6k2/rwgJl7A4KJ4dtkw0ZhaObECqkVv7ENF+HMwIGFFQFygmjjhKxJAar3+atA03G/XNNgzCzTu
 mdfYbHL2PAgrYharlOUI2UPqS1wAKNZLp+T0frqCyxR6Ou1Vnw6hwPKzoF/P0z/3lFiLboDEFrl
 YszkhU7VyVDKoXMD9sA==
X-Proofpoint-GUID: UOtE7FTPyiv4lE6_xkA9XUigRt7W2iUT
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX3nP6ecWKwsEK
 FIuiHkvhAMe03C4D4h3r3w6HIL3MWtkQGAwOGnZi1oFSVjgwpfslwt20bIhZuRjdnAOPwsampR4
 Rb+Rzw8AjeWTj+b2MAOzwqRDVAdqfT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140059


On 8/13/2026 3:12 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:13PM +0530, Hardeep Sharma wrote:
>> Document the Qualcomm Kuno IDP board and allow the legacy qcom,msm-id
>> and qcom,board-id properties for the qcom,kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index c7c9a9279684..f87ff5d923f8 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -174,6 +174,11 @@ properties:
>>                 - qcom,kaanapali-qrd
>>             - const: qcom,kaanapali
>>   
>> +      - items:
>> +          - enum:
>> +              - qcom,kuno-idp
>> +          - const: qcom,kuno
>> +
>>         - items:
>>             - enum:
>>                 - qcom,mahua-crd
>> @@ -1322,6 +1327,7 @@ allOf:
>>                 - qcom,apq8026
>>                 - qcom,apq8094
>>                 - qcom,apq8096
>> +              - qcom,kuno
> No, this list cannot grow.
>
> What you miss is to update qcom-soc.yaml
>
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/

Best Wishes
Hardeep Sharma

