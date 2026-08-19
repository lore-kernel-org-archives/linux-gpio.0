Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB7481253
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787153263; cv=none; b=ZhrSRYKYZsmmWQgbrRsj3iGiQOR0qoT7vORLmh37oUwdfdrPjmniOMFPplk6l/Lf35vn8KV9i+6qJg4Si3xFYM6N/WiGUDyecWWWF1rKnnXnizQSO22fOyWrTGFXnoNQ4C7LzaWOfTXIxX9LI329fLRpzjqiBvUoLoR0tRZs6pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787153263; c=relaxed/simple;
	bh=siZDHvxx3lSLS+5j62sQIDeXqihgS66odMFsdkJQn1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOA/iZvWybFOb0FVCZ+qOzLdEz4TKbFn39zUo1hPlL+BzPLnTHYuUBi1A2LYAUGwL+tOZ5kVLAaJf7kG6hQZKbIBaIznlgE6Rvi7MIJe3w+T48AxtXPRs3HbOW0ZqaqxY3Yh2QFNugRYbDfP35CwKUquLEavPXxvUuKzhhDJzkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGMP3D99; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RM6RBeI1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGMP3D99";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RM6RBeI1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JEbmWa1620778
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=; b=GGMP3D99kmrzvDWC
	X+V4qVixkFVSmUZa3sDKVGZXq0zU6zl7lrfz9n7+v7XNphreTXFGjtcPXRK5EwBd
	+8b5U3S+jDj7QFd58VyPQSuPw3/PRwgzAqwdPNtmOWWTLMb+8LAcpnryw8+9Ez0d
	v/iXjSKFwupJmBg0cV54+vBsIfghZPvtFWs3GbYgygyvrdztneuHKBpeemDhfJdE
	yfeG1rQ0+qDLMfvn+Hu6S6tvErWwZmxdrXobIcfDhxz0WckIdtnhVwIhoiKkk7X/
	bmYSjWFDgaCbtihwsp8yCq6ltlGzp1fDs0pyQsX9u7aiLF4kpBeRh9F585M47iyy
	nKfsMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5e83r9tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 15:27:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494b1e35cso23444685a.0
        for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 08:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787153259; x=1787758059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=RM6RBeI1eFTTWnLRTZk5kckExsqZ0z/QbxAKQyBmAGsiX7EyC0FOEKSSjDiQXIaFcL
         TIYwVNxZRIlUA2JuGPgwvKfmbRQJsUlg+KhJP0XeX5WoWlGqrQZCIQJ/ZpJ0e4mI89yn
         5vrhQVrmI8Aw/x5xxXp/dfrVrSk2BLdOlEQ17/QB8uZlg6lqKGbOoqD6YSJ40JYjufrW
         ioX+TXlhpTCrb19ncaYd7r5at+fIGWj5RmNucjEYFiOjW4HoJb/u4eQfsnGCko8RVKtZ
         zaX7wtPvxJQVtgpf4/99Mahjo2OIvkjChGRbakSK6UR/Ox8hzPu7FF+cP7IXdRbwkXJt
         vUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787153259; x=1787758059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21gp0vnnQuVr4hwP1gh+KbecThhCGO62g+zyyggXrP8=;
        b=T4wf0vtUqWkNMtGrIp1lAAiSv8F5eySrNt7oPhC7//e7WyvE5EPkPKLt3m43uE5fil
         lfTDPuSeiQTeVgTeobj/Ot69oe0yNZoNS3kpK1NnbL2TdhylFW+yaYm2A1LzD5PN8ajx
         SAyqHCLLnKHzCI5PT7u4c4AZEQKGpBNqfFNsQc7OmwQdd+T0fqPB0bg3oSc5YBqxFk7O
         80JEFmFM1Hrw8Q5jxjiE/uGrnQKHVJNroh+qoRNsajBNRaMbGIWWIRU9EAAtJwqO3HyS
         +G1xA5Mx6eLhkwFLVg5SCPN7EN4OYppWx1CYV6RJAUz+GBk/n7AUJkb1pmoZuhgLlVJh
         9UbA==
X-Forwarded-Encrypted: i=1; AHgh+RreljQxpGuPNZnBZOwXmSi5Ky8btiCGSMyc3CX2f27NymDRsvnl+Q3NFUcH073d+w/TShsSNdI9F6gS@vger.kernel.org
X-Gm-Message-State: AOJu0YwcAeQdsn8aXrLXhO91CWUnHMKgi1PCM1nkQ3DOFH2PTiCoCmq5
	KMXfywV2+JpihhHbNfybY23qvt7hDtknJqjexIraZS8XRBxB1tZSrNVycdVGwjFFyMT7Kou4vf8
	tEaOVIbZKbfRNJYlyaTxTTzOSJT+DtYXJ4Bi7nTFF5d8eQfOkOCwTPz49BwmZvuiG
X-Gm-Gg: AR+sD11I7EdCKiGZ3b8XJRiDZvWPRZ1XKivZQaV++MIW9vQMuRQhBR3Z17IWcDKvDSj
	6xc9/PJBHOirR1rX68Ijvpmjkri54HGY65f8BrQQMUPpR11uDeT0ZRV2FE21pfb5BXn0ltu9KWk
	IWSaf2cRtHRYNUGFIB9yHaKiKM58XEViZHJ5S4TLscWUpdwTpKYjT3wUAPLGKP/RTODr0BvnLsB
	JzzRz+M6KcQfdBH8UwAgLRf3x56KuycdbuyQ9GgXhyk8sa/fs/CsNkjLIdJPJTfhyKiRe/PXsiY
	MlsnxKmTq3u28crrOY1LJ+vgRUCzCAk0cZ5DqgjRazXhZCXRO5N6FKS26S5mYYB6vWqUoYlMA0I
	ql4qi7QPH+niWs5u6pDq5jkix
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351348785a.3.1787153259319;
        Wed, 19 Aug 2026 08:27:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2809:b0:933:9bf:cc73 with SMTP id af79cd13be357-9371e7313fcmr351345785a.3.1787153258725;
        Wed, 19 Aug 2026 08:27:38 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c3bbsm987608a12.24.2026.08.19.08.27.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:27:37 -0700 (PDT)
Message-ID: <000076bd-b3fd-42dc-bd43-96ee9492a638@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:27:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
 functions
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819152356.904023-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfX5yn5Xqjzhlxp
 /NcMwbfX+nyiP8yd/fjS5rg63uNtslNLR4z7RH3xO12zxlsMOKIgWWykXmNDUI0lsxujtiQz8EN
 tLFRRtAnzUNDQjVSXL5uF4fTxkeHWXA=
X-Proofpoint-GUID: 0AyfPMwfh8itm7mDGEqzs7D5Wo1djhRY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDEyMCBTYWx0ZWRfXyhY0psOBeKE3
 DY6+o+MUWGrgEYxM0tg+BoWliF34Ig0IDWBz3YIiAfvIFp+gq5WKBw3YVR2HrlHAz+Hab1/95Jr
 DDpvMLqxqS3jFhbjmfE6uRsypi9OH4naYWNItXGRtYz6CbR4I2S/XZTT3BgOPZ7yyOCVs4ydfHc
 uS5zWmenmF2/Xhp/8BZY+F8UdJkJvzcqlV32vgqDWagLqky8vj1yZNlbyFVcn1KAL2i4qBUFaH3
 O3FLB343+dATqPcPBt3e6TUbWzS/PRIcKS6kYcApPWEc7MevvlyrHfoljWIlQDxuleyUYAI1tOs
 xGtKMSsjwg+VVIPbJHAkSrUywphJLSDkOCKBmylCxzd4danWWVtWkWgea0CJNVO9Ur/Ul8Ogji+
 IEvfpdPL1cXc56Xo2anly4mdqvzcDShjEJJukrwoaZBWY7a/MTu6ObH0iZpS/OUD2L1nu2EUbvo
 J0Ouv0E77mV5UwfCTTw==
X-Authority-Analysis: v=2.4 cv=cvmrVV4i c=1 sm=1 tr=0 ts=6a85cb6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=9ngJe6dVrqvN9JGSoxUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 0AyfPMwfh8itm7mDGEqzs7D5Wo1djhRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190120

On 8/19/26 5:23 PM, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.

[...]

> +	msm_mux_qup1_se2_01,

other drivers where this is necessary stick an 'l' before the
lane indices, e.g. se2_l2, let's keep this 

The bindings change must be separate

Konrad
