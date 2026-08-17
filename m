Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F229439F66
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786973129; cv=none; b=EyeE++5zesN8nomtB6O7thq24zqd8VxQPSVzLbBCtFzGKW/dPZODE8LYUFooxrGLyeyUQtnew4VzIwHHGO2lFoP7/pJGpXYhVPuaK9MCISWeMDrBEMGQb8ggolnLqUmicrWiqMHffXefc80g7LhaWig2epikrWsH3oUANoGqvEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786973129; c=relaxed/simple;
	bh=GXDnqv4IufDcpMPjGsoOmnbxEx1h09J0mGjA6yUpyEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHSKs0Fa3WHz5J4uRv3KmWzRHvT/Rc3rjrr352GAah/fENX+mI2UCu5d0JFrnnsjvTh6GTEN8D22bWMyWZ2S9OauhtPzM/vvGiNYLflyn9B8g11A0Irjyy/ZFTgcCOkOtSFvAOkfxH4S9sOjETPF40XhirELjx0WVqmNi9DlNXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMmMMqJB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFS45TxV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMmMMqJB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFS45TxV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD6KJI2431695
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=; b=fMmMMqJBlYjCqfMd
	HyqpcJy5MgaoCPvIDypo2cWJ0Z350/W9xqJhAhDtiyLM7eEhOj6UQlvFA7TElTcj
	gqh9WlRQVL+6HWl4YFkxx8toHwa3JY9EX9+GHkQWeBzdv2jTvfE2EY6BXQGiFoZx
	n5DjkHjikTuOzPpfhRRLTWWov80K290qsqd4POpSctGs8awR0cenQDIu1Zufdp6u
	XfhHKnHXjYT4tC+XJ/tuQSUzDroyAfqusVYB/UNnpt9Gy19vFempvGPPZAFa2LB4
	zYOJ5s8rclBHmRuLEfjO6SAjy4SXZ0I//lH5SgpTBMul2zzHJC7RNRxSwHNXGhem
	gWrpZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wrehd75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 13:25:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d35a38fafso2786681cf.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 06:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973121; x=1787577921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=LFS45TxV71cx3baTV1UIMr1xbnjWiBitNexJ2HCNIDoeAa/APJ6obJu+txYlLeTGzK
         qR7saXpKfUc4M9jNBH8TWdwLNcQ8c2a4TSfMWcKxhaBMc9166ms4HYcRWTx1Ow8iMBmX
         slATOPbd8IstEWab/ZYi2CaQKiILCwap5Ppj90+W9g2SMk2YqE0Pfx9P8i0M2nXq7cNA
         xstg4qg+xkYcrvYsJAbZM1l7rtTS5OVpqFA8WYuzkFWJlTN8urvh/y57ylVlAZecfJPc
         ffeX3vZpQ9YmxohfZeA8dR5yRAlgKsn8uJQXOrfFPbAeVEa49CagjqIplzJC7LzbEeWE
         CZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973121; x=1787577921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mYGdTzVFMPdsqDTRpn/GM9XVeOL5og0Ffywf3aiaCxY=;
        b=U9XOvioyXMkHc1noSwOxt3Kx6e2d7eSZfAqytS5KLDrw3AlnmpHUCr1flFXqGvf+iA
         E1HM39K+OAxkOmfsUa+oAAgqDqIFShPlPC0+M2eF+G6sCEMXXIhcaotq2aWP9xZ68LeL
         +iBeUBfCVhfoxASccZUiYayba2YThWXqnh0Tt7bOFhl8dZgEH6KvDEDY+Cl3Rv9kRZBu
         H6B+YhcP0cEBIyBxtj7gkDfkGod3+l4votW2qwAry5YWQOkjoEwv1TB1holiE9s0cWoo
         Lq6Fkrb9HhLll9R/hUGlpMbbRGJ7orfc5g5Rd3QTHB3vFXEpt4sQXZj9dm8VC+KjG5fQ
         ND1A==
X-Forwarded-Encrypted: i=1; AHgh+Rr0kVUSbtb9bottgvu+xyOYjP4mlgkVHj6icGJMAz0JBtv3fGy7P7lgk5FR73VXgc8L2q3PDZ2vp9RL@vger.kernel.org
X-Gm-Message-State: AOJu0YyiMTG8aWQwMpNKSVL3gcpcKvvS0j6RFUrmP4yRgYPKu+AcAsx8
	T5Hw2YzrkeYr7E6k+mOFW77Bix00bm2dpK83Qrp4jOROxdv868kL6ZqvGyxFKpUG/eCxoFhc5bv
	o73+vML3CQcvXIf8Xtn/snACLyeQew7miPiWhC+x8TIcF3wVGD5M3sFwHVOAkktFK
X-Gm-Gg: AR+sD11+bBVMZr8+vWvqrN6OXFPR7mYCXV+RHf39cK/pgYQwjakhGD5oq2rAcA60TzY
	7bbMaTmd50Ex69eV3FQyF3VAY3RzEV5/VQVCdywt13Arb0U1CHL2wxibTTivqQw5ekna3JEDjbq
	l9h3d9gGAOkLQ6Lw3vCXG7uuLx0zRqoRnbomj08ksVRihJC17NnzymTtKbcYK6YQfKd+xeomwia
	RH8nJv8tAIeCXV39nx8TXjUqT2KtQCzR6gZ4gylTp2lFRPrUDeLnSjw2BdoPWQ+DcrT0/Dxg0zD
	nH/sTctzuMxOZMVY4UJLHhnTCa6NHq76jQZB2gXuogs5MB76HWi65jePRiYqZ/1OJyPEL2tpsD+
	3k7Gp44CpZpeHwbdfMr5ugoF8
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072821cf.3.1786973120474;
        Mon, 17 Aug 2026 06:25:20 -0700 (PDT)
X-Received: by 2002:ac8:5a8b:0:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52d8547a9e4mr190072121cf.3.1786973119817;
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b97936sm29266066b.43.2026.08.17.06.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:25:19 -0700 (PDT)
Message-ID: <57af0ad2-2afb-4951-b17c-918e9ed08ef2@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:25:15 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-11-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a830bc1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: K9pAlkG7q_spkiYJG1QFKDR6XU-bO65x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX3bza4A2Bq0p2
 1156S1UNRGRII9ubNnd8EjreZpcjf1YLawF4v0ChnVw094WV79xXiJS9CLjcnuCL0Csr/ivZhaR
 7E/cgbkHNmqueKCCBbTrgIh3Ndq5SB12kgOfbvEmdH8Wm2kf8KKNYOtKl+DLEVWQf9zb1gu78Eu
 ELYq8UyV8uMQuqQlUidzs5pChilV76I1q5vjn1lpVBYlv1gpNzyBc+f5IdG8cje/ImFqqR/dIon
 BT8HuygJ8Rosq83mqX8tXnWZJuqdwBzPi/CfocgjKCEkP1sbAfbRlIRN5uiaaszBNAAOUypJuUw
 IruPwAV7zktvuXchAgEkKxr3+P5wImwVBuwk7lv3sHoRzVvhQT5mP4vYtdE6jmgH+QkMxqkOGUx
 PzYAhQSn2a6LEqiRSFttdkdrNukJUdobLUCsVw8zaSq3XXVgW3UX5RKQ1Wqt+nVeTUl757WreaK
 Fd2ZNiIdVJM689Pj76g==
X-Proofpoint-GUID: K9pAlkG7q_spkiYJG1QFKDR6XU-bO65x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX9tog+d1Pztbr
 ZQ9weyP2xeu13SJ8BGxFnPmMMMaGgUxB1xH3LvfUeAAzDkj8zeIFYaNqABrroEL/DcrsTSbHr/j
 wghX6h2/R2W/ZurKGziQzgO6A/cA2Qc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
