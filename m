Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D4423EAE
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664910; cv=none; b=ZupWncRrkxUFTa/RROyu6/y68/fVBmFcCoPaflgw+c8oDRIDR2T0+ASfATabC6j7n0hjMgZQLrqAGKYVLsaOOmU4TOf16/3lY83YI8yyQ7RUQOlSVLMB38/Itok798+CgFM5+dz7jAZ5EEPKBJd6hvJxDQpCRD2KkK6aLWsbWr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664910; c=relaxed/simple;
	bh=F7/0IZeeOkzFjM7LZzyFzgxagNv0Sd5Yz+Yx/xeaSUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZfRVL7k1L51NRxaAJN72YOPQwzdgAZuzr1f4nR+tU/xIfbqDJ/3pIjqCeUA9Vk/kA5xhJC3EEzeFktVHj9yzUf8m+iXdlwHev3NDZ8liF19BqfX4YylZBvZFPAm1CgP4cYf02PFcZp3a0X/n8QHMAPr/Ju4FX2C9Lep3s2AOLwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZfI66UMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I4dXK5oX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZfI66UMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4dXK5oX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47hDV3654914
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=; b=ZfI66UMaKQJVqu0h
	3MOfB7OdWNiJXGesysBezRcUcr/Dd9HNYZrgrFVc8XgWj01cMlwKEq9BACjWnFQG
	KSkWr8KnbzK0uezN0EkMQgR3C3189kUg+zGjY7AtL7EVKax0d9ByGleDrY7fbGUE
	vRihdbd+yV2xo+xwKDj7OGFXXaJtAogDRlo/RB2NR6FydDVCeQnaKL0LVWyKCrP/
	dmZCadBHuiA87oBBtiz+qsDhS4KXT/3Mc56lfDVWtnw0Hpqa4d4KG7YpdLT2mqtQ
	zAmIOeMnKfTlT/uKNTfoWtWMO8L7rwvg2yZ8izI7j7+gJThFITGiksb6hntM2szC
	iIjU5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew141d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:55:07 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1bbd7d6e6so2684660a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 23:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664907; x=1791269707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=I4dXK5oX5MyuhwpDawoo91/R5cAnAS5mcVqo3ZWfuSVCjXAA16n33lCxZiUG59+GHi
         526js/viSU1fsTQ6vDzugq9JG1717h8MlrIe1i04e37JlIYF6Pq5me2OOcZlSp4U6QQg
         ATdGut8IrZZYIYzEcxmxnWmMUeLpXmTwKh9RrNZc5DoUlX9RPgkWCmbJKWuRMpnpbGGJ
         BedtANYZ/bgTrJ/sDtuyw8WCN0PHKJV2/JCQ2MXqdnCwYEmhujuL1XsViVqnOAuYonh+
         3KugepAsr9BhEkGOuPp9+YYfm3aEOSWLk+jd6GmfqDHtlDRJXfW/xXQ2/Ej7wklQF+eJ
         qXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664907; x=1791269707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSsa/ltcDiL56w1jFFIrM8y7FhlwxFJZTIphcSdJpr8=;
        b=Xv0fuoG7p++XZ0QAY+5FdDdAlZoNonh1jVQKOw4F8rinpa52ywfiBJPky7F5lJalEi
         aDK5VEPybdnfRYLJi25/HJGeL9leJEhAWH+b8Vy9P1AuSKDuOPy7EylN8k+t2wD9r3mS
         6L3eIWQFMuy46hbjyuQFYx64XBPmX5ptCWI48zIM13I/Nmb7PzVFklEFLO/MHWUbp0pE
         /2yJGarohX8BXpCSy1e5P6WZYg1EjpibshTohXZVo7CZDSYSE9uwstHtgRSKReWlvuUv
         PA57yv1b3Fre93u8rw2crOIQEPA0SZl0moBmOFUEiOONtkp2rUe456aKgWqbQzAs9Z2G
         Lfuw==
X-Forwarded-Encrypted: i=1; AKwUvBxhgAEqE1lcJYauNnOeH6eTS+PlPQrjzrUKyd+U+kjlIoS/9+uLxK5l1nZzy59F/GZ99K0zoDtG6P9U@vger.kernel.org
X-Gm-Message-State: AFq9FYI2f4ZMhCT4P77tsWKtb3fJ64rbVwIm9+qI7XynHhy0hZ5iyYAw
	mIccriZysS6hvFJeDyn+JxLGLAkoSgnuNXgaKPN5PdfVTXbTn5391ThHHUbrpaNKRYinAOeanQR
	LRPTI235+DGqrnbAVM1Y7HxcXjJqAIXvIvvmF+uIdfV3CfM+IP7eWvP79zo651QAu
X-Gm-Gg: AYBFou22LfMSuqYOeF0I73oQ7micJEaKrdOff1NR7fLwKcUJHnby0xhJiPuADJIOjge
	cwLLeGFKUhV6PWmBAjTmZGKQ1D3cGYdrVAm0bkSpPiua9onv7HTtpK+2ijrEsuZcCqPpQ38MvZp
	PHaW13fp0KfSSxYWBhIgG+fruVzY30iecQSjDzvkYlzY24Ms80kcmHSjpAdviAJ7bNDjIgRmOPY
	U+yzNnlKaN/QIJnspA6aSDTrKbhtQQ3PG0DczA7rUJI50VaOf/HCpzW2dXMpP1BG2Uky2RswIAU
	PzDYr9oAmLJox//lQ4+INKS0uJlmg0JV6GCaukoC/8pLBY94gnwUYpuAtj4xmo4U/O8tdrpGL9I
	BOu9uK+msV7Nue9IR+RuOn4BbYLlXlugoi/YC9OV4elikUFJMM8IwFn30IE5cUQnX6fYBeUs7Qh
	CxhfVT1sOTnl1V9rFERY6R
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560103a91.30.1790664906903;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
X-Received: by 2002:a17:90b:288c:b0:3a0:d651:3958 with SMTP id 98e67ed59e1d1-3a0d65147dcmr7560071a91.30.1790664906414;
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Received: from [10.79.116.189] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49804220fsm3713170a91.12.2026.09.28.23.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:55:06 -0700 (PDT)
Message-ID: <ef5bc89d-3915-45ac-ae7e-da0aa1976c96@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:24:57 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/15] ARM: dts: qcom: Add initial device tree for Kuno
 SoC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-15-6d47636a8f09@oss.qualcomm.com>
 <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <97fd5a30-9469-482b-be0c-0ed6da6424e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXzzzX/Q/quN+H
 Hg7lstBTp8JtqcZg8+F7yl6uqIklVAoQJDW4m992Rw2KAETWlaKMt2b1D6q5Ja0ClrHyGaCZG+R
 Gq7bKDyVNCa25AA+SmnY0FBUf1P8UpA=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb60cb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PaPtSKYIirbzHVDMbN0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfXxqij3kMQYSKD
 A6yNrBhqMWJyRNt++EwYWU9aM7mxw9ufPqKzr0zpph5S76tax7xprKXg3ayJVgdKJzf6E7zDDZO
 kpyTCZFHHjjpTDehhZQxMK/qJacTZyk4mZREr/QKH2gya4QrAtvNIyIldallaaf7k28BwypX6LX
 T2y1UJa8un3gnBiLO5SgdgEpbHcFTkoDnoloQRIRBWyQs/Ilg4XyOasANW2U1gyTaERPL0UC5Lx
 ZlMvN+gkEcKYl7TUUwuUBbfSUKa82b36ay2be4TxgViTIRgKUG/5dxBWy3/5jE8Q6YZ7A96rXca
 rqdaq/nCuE30I63IwotCzpP/Zxcu1rXrJWMoKLhGCGzXgyVp0C577c0gCM2PT6CiE45o5lQc2Fe
 80BSJIf6UVCHMRPOvC7sbMtJTFFb+zQh3c83rFB0zJO3RSAa2p2hUhVz+S5PnFN71Ayk8u0VXip
 K2RPsCXWlMixyvTrKLA==
X-Proofpoint-GUID: p5RE0UYdyThoEzRGP7sqPlG1bLsx6nyl
X-Proofpoint-ORIG-GUID: p5RE0UYdyThoEzRGP7sqPlG1bLsx6nyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290027


On 9/3/2026 4:27 PM, Konrad Dybcio wrote:
> On 8/27/26 7:51 PM, Hardeep Sharma wrote:
>> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
>> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
>>
>> Peripherals included in this initial set:
>>    - Single Cortex-A7 CPU with PSCI idle states
>>    - RPMh RSC with clock controller, power domains, and BCM voter
>>    - GCC (Global Clock Controller)
>>    - TLMM pin controller (110 GPIOs)
>>    - Interconnect (aggre-noc, cnoc-main)
>>    - GENI UART console (QUP SE3)
>>    - SMEM, hardware spinlocks (TCSR mutex)
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
>> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>> ---
> [...]
>
>> +	soc: soc@0 {
>> +		compatible = "simple-bus";
>> +		#address-cells = <1>;
>> +		#size-cells = <1>;
>> +		ranges = <0 0 0xffffffff>;
> that's just "ranges;"
>
> [...]
>
>> +		qup0: geniqup@9c0000 {
>> +			compatible = "qcom,geni-se-qup";
>> +			reg = <0x009c0000 0x2000>;
>> +			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
>> +				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
>> +			clock-names = "m-ahb", "s-ahb";
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges = <0x0 0x0 0x0 0x0 0x1000000>;
> likewise here, you don't need to precisely limit this.
>
> Konrad

Thanks Konrad for review.

fixed in v6 : 
https://lore.kernel.org/all/20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com/

Best Wishes

Hardeep Sharma

