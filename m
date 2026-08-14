Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3314229C6
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693813; cv=none; b=jTfsH/+PPtiu18Od28xjLM5Bta3t6/j5PxmYF04TQofskly/S3OKKCqjudP8yh138E6XdvjHysCCvxcY0xRKlRzSrtqJ2orcSF3LSlDzs/qEGURsdW8wfR3zJrLM51E7J4NUi/8FU//DInxRBY++lGDT+rTDyo3jKzJoUwdcv7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693813; c=relaxed/simple;
	bh=WMqqcG7JGr/BQoXr4E81PEy0Q4abR4uomof6eiGH+88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bSdEngKMAWksXhzkCF0MZNvf1nrGuZbsJ5d35Ac20Q7xrf6exZN9X8+d+ELdxVZdt64yM7FaUOlnEaIcCL1mp5j0uyZKloHoHMMF3bmla79mvAe6NNTCXZ7vBI0Kv/osLelOvvJpoGZfiDYZGDyH+oBVHFi/6BcYIAaakrlhYaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYHDky8T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a2rIeCP7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYHDky8T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a2rIeCP7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E7ffLF1100176
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=; b=VYHDky8THo+Vt03h
	DRkYpeCti43xy/zyL2/XxSNbXAmcvYLUDDiuZ08BkGNvHIveFyN6NSgxncQOcVW9
	peg+MT6+8goc0JGSmGXpW1QK2zqS8iPrHeZVndzbVwt6wjK1zJMPlC0iS9l4IyH/
	LDgHUhcrGgPL8NUE3ty6R7WWHXVJJz6AQawpeJwxgJRKM+eG9jDY6EhMaPAm3nsG
	qI1OuHtvPB/Dvbzy6gHZLFVGYsor6FpfhN893pUgBMixJHCkdBP5I9YqQAZcbY1O
	tvzUakEJE+8koIdkUWyRvov5okCSiJx1p2DvBw+fWY3bUuGA2J/MOch+b5W4VdkT
	N3/IGQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h1uucs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:50:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa55c9430so8786545ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786693806; x=1787298606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=a2rIeCP7Gfwy3dOGsQJ3eoW4rNlOCQYVnCAA2M55Kpqk3gBSL8y/TkAPGDJFxNtLWL
         draOouOOSWNwrt2+DbuP1erRNWLawmUONbKbq29gNeXC8GTV5p2q+lRz+S9KaBmakTcV
         VItyeyaEOh+Y2cXgGyQneq8JLmzqTFjjYNL0a79bGjH2QFG18uQmOgJLfHhgotqBuTXE
         gSD3dEMcyDBpZEhrtzXd0yR8/oxGNd/CqDFD0pN00a0A9K5VDdws/6wLP1h+x8LEa5eL
         GQ6s07Kwe5PYYf00Ah9VZXU3TVBI2XSP9iedbPaouAtqsQS5W2/qNBOm/1MEO3KVpA7b
         JIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693806; x=1787298606;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujj/m7aXNpjl5wtp/SJXi3OSqkC0iFNSKgCN1hD+fTg=;
        b=LxxtcKmM3zYU7kmLh/7es+P3Hfa35fI0Zgk5bn7tJdo9E8c0Tlw2iooObqf3ONCbvy
         ltD9CtfULD9le0nUAmDKiuF42FvgPxib6flYMHdjBeuMDF02UhLGxIRXkdAWOEkoWG1Y
         7Rcqmu3SMsndXMy+vbDdnU56IwppfRV2k/ktdIJeJN9iI6FbPiu07rGFes3B7JjUFBzU
         RVh9bJjb23+SHIvFAUtpg/VUY17Dwsm3Y5Yv3YITgRLDVVPfLw/DrewkmXNYEw9dYiHR
         cW6Mi3MsCRMmMXCECE57OmBlGy4gxSPzpgbmS7+oOtTq47F30Qze5wRBrZBXKMIWZ4fV
         H/hQ==
X-Forwarded-Encrypted: i=1; AHgh+RodOC1Em/WkZH1YvETz247eynp0PHjMbJrBKqzcqTdOalzqokns+8LCQdE6hUXYheFrZbkWtmPz5+ZN@vger.kernel.org
X-Gm-Message-State: AOJu0YywUe7o23CO3yMn7ERkhou+2P9EZtwPZlxTzksN93aUMp1025ce
	8NLwFcCVHal1f8qzus4HWY/OBI44BkVtoGcdZfPbNMFa+B4BVbNshcpYrTGRpywVvIyT/W3pvEa
	KFnYg4VLHtgiHabRPEqVN9Vh61OTsPtw2EtO5mckrmXJYYSBEtlGjRikbILPmoaME
X-Gm-Gg: AR+sD10kq8OQtPe1RbbIRw2lJJNOoxdooZ0aJ2vECeNuzR9kg3/JZa8MarLJxanGGcH
	FVCTaCPr3Gs1PqPZkiDajn80nWVN2lrYarJFUiDC75ADcjdV6zg8/xjW9Ge7CPfYlQJBpghX2i0
	yFoYlYyc182jpydApGjyj9NRvHb88JpLrE5XS+u53dJAU6Py1p0ASY/WI9ZLpt/PlW7obegTSKM
	cqtHchdl/YQlauAntTxQ7urzqvtYIalDnfWxhl5XfGi9d2jCZ1aJp/+L1NbKBLY9Uwu9ZiU4OFj
	fbS+/35nppzoj6eJAO5xrn3lJB4bPylHIwu6SeYx8twUxQCjdusVWY7RedJ6EvI+mzTrd052Epl
	S9nB4oFjY0uOE9B8j7yecNhGqxoPFjS/j5wVuV5tjGegIYvTLnQKjugMV6XbjQrlTslpx9WI94s
	nRQ7iuFa7qBQGB4ZdQnGw=
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356227a91.19.1786693806097;
        Fri, 14 Aug 2026 00:50:06 -0700 (PDT)
X-Received: by 2002:a17:90b:52cd:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3933bad2bf5mr4356160a91.19.1786693805582;
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394eb752fe2sm1578288a91.14.2026.08.14.00.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 00:50:05 -0700 (PDT)
Message-ID: <23162a62-b499-4223-bab8-aaa5b575dab3@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:19:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
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
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-10-5e0ede4a0c72@oss.qualcomm.com>
 <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260813-glorious-secret-mantis-dcc083@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QIGy_5uSraSJucVu1pX1wfWVvxkSttZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX3lgNzjgk95+k
 KksvbsOgFM0ISmD5B5HZUj9PS+rHX1XQYF4o119meMWGpq3w1eZ5NAiqNCpSSxvS7xcq6tY/uuS
 D6GFhYbL91u3a/lltZmda28eQj3YdpbxSX10g+xe9L3gLjjv51fNbiDV3IR3MHMrSTh8Z4MwEpK
 EH7OKOc8KRsaBSyGU1fobSaAFt/84lpvYbzrf6PpKNIhS2EncUFBSqX46HPQ86C8cEuJjY4fOGY
 J+Qx9RkjUg2kJLN01xV5Il9glu5U7QSeBaREARux2q1QFD0av9PCGz5vS0l1/sfIRZ60Gm+Ual/
 +s0R+yOzyMCPgPR9ofqTjgGCMzBocxAz9vHJRIfOV+/Pwnul0EsuqeIl1e32bJizvlLfdHgFfFW
 U/fO8Zq1AhJ0nSTfOyy9l/W5V/nxJKmCflesXj5nTYuVV/Uxj0RcP4/EeRb8LAxAPK9GW9D+wSu
 pgK6tAeZgvk4HrlUlAg==
X-Proofpoint-ORIG-GUID: QIGy_5uSraSJucVu1pX1wfWVvxkSttZD
X-Authority-Analysis: v=2.4 cv=HMjz0Itv c=1 sm=1 tr=0 ts=6a7ec8af cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tqvfEU5OP8eIFZPyU8cA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OSBTYWx0ZWRfX8FTQgd8Mtf0r
 HPg7SXHaUdMRDOKtRyp+nXZG1N33kKcNge7kgkaHg/IO8A6HwR+ef2hwL+vBBPtxPRkoAqlVhps
 r4rASqs9f6xTWprKQDm+durhmDS7Kq0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140059


On 8/13/2026 3:10 PM, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:57:09PM +0530, Hardeep Sharma wrote:
>> Add the device tree binding and clock/reset IDs for the global clock
>> controller (GCC) on the Qualcomm Kuno SoC so its device trees can
>> describe the GCC block and reference the clocks and resets it provides.
> Almost each of your bindings commit has different style. I would assume
> this you would write once and copy-paste.
>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/clock/qcom,kuno-gcc.yaml   | 56 +++++++++++++
>>   include/dt-bindings/clock/qcom,kuno-gcc.h          | 95 ++++++++++++++++++++++
>>   2 files changed, 151 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> new file mode 100644
>> index 000000000000..ff01ff31c2e2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,kuno-gcc.yaml
>> @@ -0,0 +1,56 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,kuno-gcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller on Kuno
>> +
>> +maintainers:
>> +  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module provides the clocks and resets on Kuno.
>> +
>> +  See also: include/dt-bindings/clock/qcom,kuno-gcc.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,kuno-gcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Board active-only XO source
>> +      - description: Sleep clock source
>> +      - description: PCIe pipe clock source
>> +
>> +  power-domains:
>> +    items:
>> +      - description: CX domain
>> +
>> +required:
>> +  - compatible
>> +  - clocks
> Not a power domain provider? Then it should not be allowed or explain
> oddities in the commit msg.
>
>
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
> Best regards,
> Krzysztof

Thanks for review.

Done in v2 : 
https://lore.kernel.org/all/20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com/ 


Best Wishes
Hardeep Sharma

