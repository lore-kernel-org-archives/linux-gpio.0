Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271440;
	b=Mku+tLcT9KQACaRI/o+y1eg+i/4tJB9VMoPo4R2grkvMBodkN2xjMsndGor2oIambOu4
	 fctS24ojWYQAi6PkaA7J1GNrug46SWaDkyAkY1vXqJt9JYbZRN7wfdTuBf7ayHRbi7QNQ
	 jUNyxG78SdiJEe7NgmiHgti67cuojwe8ZHO11+1+nv1WxuQRaEM8MkQxbRm7yMAuKXRcY
	 VwLq5CAyqSiU4Rn7CIhSshVDy8ZHbfSBpsFgiBNWbQZpeBYsEXFy3Ig5BU+QXpDibdRcs
	 5JnXJCqF40pLIxvx1nITNXzFjN5LTMENRWMCTAZHeX1NfBnKyKRds3OJcS26NZYEV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
	b=q8k7GTmyR+2KGsiJF3HZVHJcdySPNQmTDspJLnHXAI0ic1pXKgMxuPoX9eCiQQGIsI3X
	 otGYhHydobpt3O8jJkRMZzmNqufFNNuc20e7Lf3Yh0HO8fcIWlo4z9A2+yT/h0v1LS11m
	 yLLgNNeD3By8rtnnWR/YUSS7SEt+V8lCPkUWXR5Q2kIxd+1SskU7fnbA/SxXHyprgAmVj
	 eozEjQb+1RgI1XMOjQrWoagbPq18iH6JGL/BxPCILrGpCeTHG8m5I8mTJb+YMvogjqOEs
	 vTthe2DWcLgYAmqXEaIZLaJhR8B20ZzWE71A0k3xeJcwnqtuCLrTWSO5xwZANjSlNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2MZuy2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511BC606A323
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 511BC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2MZuy2/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vF3Q3765975
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=; b=i2MZuy2/yK96cTff
	Tb89mgWGzwkD/bIkDe/ptWarvCjxPg71VlfwLNYa2tJkpmSYU125ypVl9vbjNhht
	OgkynYu3i13PLqDWVtEwzxyHubcM27fz7cCRigLbcb9aYe8Xi2+fGLzgk+xTdOes
	teBhzNrs1FyvGEt/zfBXJiDP2dQ+lqk8Qb2BKEcnptVeVYFjQ9ixaGmmDJ0+XhJB
	jfZIuHJKcd8wf+epUhVimG4Ch7ymfslIP6Ffq8ie9hDSovae7RJ55PsdzVaHxqBf
	Np/K3JfbsVTgu7CWRYy6+bQH8egrBeXFV61BDDEMkLqaVI/qxe3MV7ZfN3vJ5uXi
	H7gFZQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpu84e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 10:57:18 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2135854c88.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793271438; x=1793876238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=A4yLlYON7sXgJCjE37zIQmykFs7pnYaUCMusZ4R7nvJ5IDLlKbYEJ51nzqWS3Ji1P/
         BtvgwYu59MZj6u/emQofn3Y0/jcHC5RJrX8s5a1olhuhrLPQmwcNnPRV/Iyrns28h9K6
         T3hHalSVBgZK3sfFOAjyfBeImnEZbyLRb21Dtx6ZmFYxCzLbPgNjaEj/yl6pT2M2q2UN
         enhNutdido0UYGBbpDCG+vojXekVa6cLyvet7nryaF1ymulQY7cvIggTbfzHWIQmcnpC
         9gVnITPMWGlYuxBdsoSjyBbmi3p6U9q+j3G5BF4t9bDSqSXR7K6tjcS+tlFIQcTUg7XK
         YB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271438; x=1793876238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=UfXGgHZteOUCjX4LA5HVMLWTcLiKMHLTYQDnAXJPYDO6rEdbxc/eVDSGV4or5DBbO3
         nFLkvazkOJQfzLmaX+zavHpMGsl4CF9EUMia3JWOWPBlb1XUMwt7ePGF+6H8xASA7wBj
         mKtqyzN/LuL7hNXA3JPktYmjJAZ9ymW2sIFp9yn/o5OzV8xxYl+m9LpXYspOa2Gf9DIr
         VoNTDMvlBZxC/QQjBVeTHiu5Zf9Jg4BP77N1deelMAO4XvVKIp72N93VeCKUbL5Wu3MQ
         jI8xR+NoPzTRFedEkARwITNC4AHXwOYpaeuZbEu90aR9YWRSQSVKa3XvBvYfKu1HbEzR
         TcoQ==
X-Forwarded-Encrypted: i=1; AKwUvByr5xo9sejtIENNHme1xFk9gH7/qXAxVrlGdmuZBBhxaQubFdyqGKbQb/e/qsQDKwJ8wn8vTW4+DnFP@vger.kernel.org
X-Gm-Message-State: AFq9FYKRBLzK6jDMozo8dyHGw/3gPDR7yDF5e2f3x7u0/gbaVgpJ9ts7
	q4TQCLg0isNRr+kw7E9qxGWNFUbcqS8wikrgAC4Y30dYJkKA9VRNrJUuKdvF44CNpacCtbDdZjL
	BXvZKnOC7BHjODYQV84VWtuO//NOaG1GuFOKCGc56BF8tAm1hkfN4bS8ZnGEF+I2/
X-Gm-Gg: AYBFou2LWZ0v2aEpKmf0RTUGuI5sNnwikc+4AoZ0EmiMY3HB9yqBBcPA/nwVyQr8mQt
	CMg2b3DrvXPtPa2EjHqBzzPPeaCvRqRrf9nO4BIdvgFmEc8XlUgGLin3+ib/8Gb2D6CG2WWOaHX
	IQyDFdisRtduCSlJZAMTPWFeQwxlM59dpRr9pOrW5S6UCXXsDatny+ofMFMIrkGPbStMIpINSae
	7eIGYISWrAmXQq1yH15nWLz8ji0Kk35uw7bTumOkzUxNeDFwPzMdseGl7PVN3e+nucjAD6ZkUDU
	vQZvAflsU1yurdrkUOByiWwy0WcKLM87YoHQnlvB0ukgbvXYaWumzTdg31FMJRNz8Hnm7i3eudZ
	VvPlR+x9T9In4L5QQ47c5li+RgcWnh4DrHEfqOQVNb+BELvn/TYXGD6NB0HyDYU5RIsd4rUT83+
	pFFg==
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591294c88.42.1793271437508;
        Thu, 29 Oct 2026 03:57:17 -0700 (PDT)
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591244c88.42.1793271436760;
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm20562986c88.21.2026.10.29.03.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Message-ID: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:27:08 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX3hhPTq/IPiOl
 t2KzSJdKVWhU4nXbpZ9UyuJqZ6gu9Gs4HW23nV1+MLq3iM5KdMFucgwGpJJM96cvqbxkBnUYaV3
 YgTED8lyigdNd6pVd4nSyqKKUYguRTsm3z4ytb/AO9NnBjw7FCw1rAYlq0o2597pG6pBjHWpMC0
 UBLzyYZE40oz8uivRbigRgDxCH7rEIicFriP/u/IyFK7CTjaAmVgJLalfohynKu6RHOeH0htPQ3
 MOsM86V+o0QXM3FM4igVRDxXeatOpEQhL0pXcZYZOSycbDai+D+uym3ZTwYxMkKSWSg/fm3ZBkx
 GPZvyubSYRHSQUBVpxgiOzgmof4+1sZB437WOk5wF5w0bYBadxCDRelDmd0v/xJl1TlgCJfgwBK
 wfbOIcEKg5BcgVhIE4dGxDW124FsLOxvmI7FSUXp3KjM3UACn8xvf7lS9lDgo5HMkOw4dk+vvPU
 igdAhAj/ir4Bl32hHaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX2vR+elx+jB1F
 Vaxt1/ZhZMtz8499jW1mUh7kjl4cIBH+pY2fYaJLB+6GEgUxys+jpiGDQ1tiDglTbY41fTt1F9J
 zP1RAJmKsbke5jzRe+M1WYe86aS9CcI=
X-Proofpoint-ORIG-GUID: wXRkUQk6UGaUJf-tBvgwKL8-pvCqn5HA
X-Proofpoint-GUID: wXRkUQk6UGaUJf-tBvgwKL8-pvCqn5HA
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae3268e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=LB2yG9bKkngd5w-dMicA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290042



On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> 
> Use fallback as filename, so qcom,sc7280-gp-mnd.yaml

Sorry my bad, should have renamed it.

> 
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
>> +  (TCXO4) with frequency Fin and generates an output clock with
>> +  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
>> +  and routed over a gpio pin.
>> +
>> +  The divider is configured using three registers:
>> +
>> +  - GP_MN_CLK_MDIV: holds the M value.
>> +  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
>> +  - GP_MN_CLK_DUTY: holds the D value.
>> +
>> +  For every N input clock cycles the GP_MN produces M output clock
>> +  cycles. D is the number of native clock cycles in which the GP_MN
>> +  output is low, counted over 2^13 native clock cycles.
>> +
>> +  Hardware constraints:
>> +
>> +    M <= 511
>> +    N <= 8191
>> +    N > 2 * M
>> +    M < D < (N - M)
>> +    M and N must be coprime (no common divisor)
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
>> +      - items:
>> +          - enum:
>> +              - qcom,sa8775p-gp-mnd
>> +              - qcom,qcs8300-gp-mnd
>> +              - qcom,qcs615-gp-mnd
>> +          - const: qcom,sc7280-gp-mnd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: PDM XO4 source clock
>> +      - description: PDM AHB bus clock for register access
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pdm_clk
> 
> pdm
> 
>> +      - const: ahb_clk
> 
> ahb
> 

will drop _clk suffix.

>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Neither assigned-clocks nor assigned-clock-rates should be needed.
> Parent clock is outside of scope of this binding.
> 

Sure I will remove, but the parent clock input is a requirement of the
Hardware and the output of this module entirely depends on the above
ranges of frequencies mentioned and that is the reason to keep the rates
specifically. I will capture it in the description and hope that should
be fine.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - assigned-clocks
>> +  - assigned-clock-rates
> 
> And these two should not be required, either.

Will remove.


-- 
Thanks,
Taniya Das

