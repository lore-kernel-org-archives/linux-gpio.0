Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89212D7DD8
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061079; cv=none; b=pWyYnJtRqAfidoGrMewpJs8ELi6PfV0kGTDvs5dt1PGcXYwzZVd5ji/r46ZnRmRqenI9MOnGlx083SJ1co76LSWz37nJTYLiphyNm+KBAB6FUBSaOOwSXVgm1JbTCgbv31Dp6CUzWTvjQzh8xQsVM1Nl78IOrryo/IYPpZHf+18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061079; c=relaxed/simple;
	bh=pjmB0KZlmblBqUhkEx3AkMCixjS/J+z8FmoDfp/UB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MMMgMjLUaFgMAkLJsW9RhRCR6grM0Dpq0TUPE3HjSGBNRWqdIlIwRDRkBbPm7tvLg58Ie80V+bsq/TMQD0CMCJwZ0QGjxN0oTlwXqPqInb3BKMEdj8b4HdyxanHCuPkvfPeWgbdwzL7Ymdn4ZM2kQC9VaVfUkRcWjy4P6QRpQoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chKRnG5Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F8VgVAlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chKRnG5Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F8VgVAlM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQ3tN1596571
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=; b=chKRnG5ZAvs4UbHN
	fE7gXArvvnJfVCAcXdqPVAkqozgTYu/5pTFUljvjqq5YU1qfakhtvue7QSD9Wt/m
	uyxtUGXIXgBV+p+7rX06Ax3S0L+X9iD0pIhrPt9dLcL4GgpnzwMhBvEZOnnP6tGj
	8uzSNNbcM8+qCn92LMrFzVfmXjPSrjPq2db1e2+BYWWupH0MmJLWVN6mW1XFSo+b
	E5PPL6wqiIAwrx8F5foxc6S6mR6bYVeZrXML5AZAENh9osUHzCqdVK3x1C/yyWLg
	BWR7dmD88bRwxYZOXEfXII012rP2icJ4glvo8/LvhBFEXBKV/6TwcJWeHB6LeeBK
	NsqG0w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v824r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 10:44:36 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-357e2bc3b1bso8127736eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061076; x=1792665876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=F8VgVAlMkA9XSY4Tm5bI4sKJmmebfslRPddRI9n2LoPD1tceawlRNyggpMN60QjhKC
         CGMhHw9UKd28U9hmAR4W81zu/47KNWCSo9OgPRxmpO0HtXTA8CTsbCeR159FixulhXPX
         qzMOUlBbW0C0yLFQ2/HC/uJuTf6hHs0TXpTX6mUM0QAylKbmWmFMjzKods9aAo90TNlf
         IObuNmMNYGhrXvpG0XNPzr+cEQGjFaCtZKyzK/xOC0/qMWBhlc3ro+kuWXYuQcJcZp6F
         fgP44m4k3FQPJqP/HtQV2z3ssn7/1ISI7aOk5iiQWWwBKvSYemRlP+IJspik9/rICeI8
         MD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061076; x=1792665876;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UV8/G108mR4v3gw/+4S4AzipXX3LyGtjtzx1JP9fmfs=;
        b=Y0IRuI+KaeRk2tZn1vN+xQC+6Wz4UcBHZZ1xuPBRtUCDPedj0Ew94EyVV/TXDgJZgt
         x4OhRym6qRrrwuWvgt8YtKXeKZ9yB/ff4/tvLBbGwhIe3l1V6oiH5gzt8B8+x8U0bCqv
         887ntTU/cck3SBTSCZrioFNg+n+m60XdM6ITE3bIMpyIb3ciskF5c8/K9SC32hOivC1X
         JyH+8D+WSPISeng4U3+OoILfcLcizEWoDg9MnscJDUm0kMbaWRf8dXlDcbCGS4Ol0Ges
         uZ9pYVAdGXUgNpDDmNWZpuEyyKBZNVIPVtJK6qb6TSRPHLbO2ZJ+CTO4N/rLqDPwDjV5
         16iA==
X-Forwarded-Encrypted: i=1; AKwUvBx3WQewwjBLZxS/HvgvdQgM9VnZIKTK6xCljav6Z48RO6fjEiVUT2/+oNCsOvbVnr0h/McP6tuEpvsE@vger.kernel.org
X-Gm-Message-State: AFq9FYKjeiRtnpKjLPx0KwFeG/x75yuAthO29JsmKmB703JbI0zRXTy6
	0y73JkY6P6Ha4AW5L4fb288uF29UZHgw4sGqgoorslSFD+6kHNIyASiDN5y1NQ6IR+QBrNhPU/G
	j8z8czdJLn/9T3Tpgji+8WDppKx3v+Gx6N7+HI7U0IMip9Lw4rkKn1VOJn7XA48Z+
X-Gm-Gg: AYBFou0TC3E5Gthw28ptpmLMwpOf0Y6BsJ8jpnTiZyLAzWLk58ew73D+Icnw6gkrgeA
	kPCv6rk2Ceeg+oSL6Jw0uD9F6J+YsiQLd4vGGQPEIMOKCgFmUUOt2ZE2xsLHEDAculXfmFE28N3
	oH/graO3UCIwIySVZ/7xyjBuPrDLT3YfWvmKnuE44L5nN/gdmjvC3D8/lTE+HZoRCTWrnNcB1gp
	a3CxRJjX9MeoHu/Y4zd4tULNySHJl+CagUAttCQa8bvmqiV8eUoPhQhcUCGiejBlrotdMYgJEs6
	fG82TCDDgSGZxSn4BtlfpfLhIN6yJe+72V0+9lWkFaFC9BK0inUf8aN+Kupzwpl8/szOvb9vm5M
	nP+HEX3xcXatC9w+NsyI+lv4YBKo=
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299381eec.11.1792061076284;
        Thu, 15 Oct 2026 03:44:36 -0700 (PDT)
X-Received: by 2002:a05:7301:e0c5:b0:359:ef9:9be3 with SMTP id 5a478bee46e88-3590f090316mr19299334eec.11.1792061075690;
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm26096247eec.23.2026.10.15.03.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:44:35 -0700 (PDT)
Message-ID: <e65dc4cc-b080-4af7-a443-d837fa596adf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:14:28 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add gp_mn pin state for GP M/N
 clock output
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-4-1522662b6c53@oss.qualcomm.com>
 <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <DJ3HJRYX3CJG.JURHJ0YAMA4W@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX/mworW8QxfO0
 GxovgbvPS+noKzHGLVRwT8nGRDXB+3gUloOYIvI3uXxCRBD2iTAXO+4Wrl64icCyIrIVPCOp0uA
 pPSqJt5FTrORIuhVf1TDIYu0+i5Kbnac3Qsv9orPqkDXC23NFlaw/aQsDaUhlRQeFi8ve9ax3rK
 RMLykGjeNYfjAyg/oNvxdsU4FpP992ZeU8GDg3YjslECON0yQTB7INHzzvlbV6Uf5QEotH1hNmW
 SPIjtS0+HbyP4P4EoL18bzyVlqYPlVFumiAn9WIiec24P/3ZN5Tc6X3MRtAv9NBt9TUwlOjs55T
 xWgl5fnMEHv0MRdR//qS/0NRA87mnR0tiI2/cI/zNGthZtK4S5xWKBe0ilO/sI/ckDQkMXfuDIj
 htWtaz6fgAsPhyuJU7u4UF+JJt1vF08ON9mOUhtgUCmyta3PUmjiCJyxrFq1rqPpxko1B4iNKU0
 n7OHmwUCdUggvcB8jxw==
X-Proofpoint-ORIG-GUID: MP3Dd2-AlDurSApA7HAK8JLpHCuTpHSx
X-Proofpoint-GUID: MP3Dd2-AlDurSApA7HAK8JLpHCuTpHSx
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0ae94 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Yqn-oMa6LnlrTNRXoS0A:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX2T/0lHfxB+/P
 QtneUwfvMaZZgfosK2Ejvs12ktdE7phw9wBYl9ywsNfwMB7nWELzmKZL8GCLEMSLkkAyf4m/13h
 mASvF5S1qV6WInJSQkjEbbUz1yw+Luk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042



On 6/8/2026 12:52 PM, Luca Weiss wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> index fa540d8c2615dc02d941eb16bc7253204c2750bd..1ff9e1598d00429c03b2bcae41fa370ab2c892bd 100644
>> --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
>> @@ -5908,6 +5908,13 @@ edp_hot_plug_det: edp-hot-plug-det-state {
>>  				function = "edp_hot";
>>  			};
>>  
>> +			gp_mn_active: gp_mn_active-state {
>> +				pins = "gpio35";
> gpio60?
> 
> I still find it incredible that the QCM6490 datasheet (80-20659-1 Rev.
> AJ) doesn't even mention this functionality on GPIO_60.. I wonder what
> else is hidden on these SoCs.


Thanks Luca, my bad will update this in the next patch.

-- 
Thanks,
Taniya Das

