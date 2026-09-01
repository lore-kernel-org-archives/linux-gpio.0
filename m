Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34187331EB5
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788256094; cv=none; b=mKeYXWjzr0XUr2EmrT5ll6aGSaenVwD1fw2FU8xOsk3Rjqk5EbuxmCWEYXRXmdpr+Kabn4pZ+LV7B7Bof553XauAUJ06ohVKcsMdy/z+dNGbshhXO5etV06E658nX8UhbyNnMsDfvP2gp3RWsdtopDKgPmkQwNUKZojNHu4dk6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788256094; c=relaxed/simple;
	bh=csDK1asu+J99UxcUD2zs1IVeLt1lcmHdJd6E9VSfNXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig64MfsT27R85Rk5fGvwasLEtQhA62xsnosPDiz63bOjtPMMvLTtz376F1uoC2bGULjGB/UcoIILBXy/XMaaM39X4sOhsN2wvtaUMWtBGKBS5Y/KRIIdKXLMeRZAZHfnip5Bfd1dFNv7HQbQWqPBh7LAVJuV9UMqDYmuwJcfAgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WCC3njFL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O7r2JecG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WCC3njFL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O7r2JecG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179MPF1709631
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 09:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhS+QGab7xfzSqgIoLvDCDDrYeGT7IjzokHtqkg4lrU=; b=WCC3njFLqLW3i5Jv
	9NBVbDViHxwdVxRkoD+Wz710nIf+1RbkamjKcRobGQAKWA2xl80l3Q3A93qA1CYt
	GeVaIGH4O7o3pZ1vJzAUIwGWG162xpqKn2aeBNkj1rdj/aKYCwcDZS+EquLYMZ4I
	1fgusuRVYU7ruiezn2nJ/7EIYgCQjcXSDv40lj3D9qbjs66LYGV+woZlAmUZlcVa
	pylq/wPX0jlC+zHORn4J9hNVK+5XG1eewmmOUh/kdwIoi+sx9ep872G12WkRdziu
	85N/JPAHgrR/SmdhRqZRAIhuDgKptrIJZgxygRbU6PaIl3oeA5uwxDLXObcikPQh
	+a/Tfg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fsm8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 09:48:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93821883e26so93587785a.2
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 02:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788256090; x=1788860890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhS+QGab7xfzSqgIoLvDCDDrYeGT7IjzokHtqkg4lrU=;
        b=O7r2JecGJ2QTi95GiXEEqo1F3IYChnXOyO1XQjl9yRJeDM1Ybtkjy8SCtUm8RWIFsK
         NrZxlXIRV447vjwqk81J4dMcmQBj+JnbpY/zUZw8hBiz0Orbcguw4Rnc8kzBg1Vm8xH3
         2oyOY2O3HuKM0XpajC+onlC5c4ex1RSdg/nGzu7Cg8QfDuKj1ItOlXfgDgJwElwaZxlH
         dAOKjrl7pu01/6ja7VjDbrqo0VGO1dWWJYjmAxexTTZWGNFjujoruV7UIkzLUl6H0qRS
         d9zTSwPQFsv4poCV3zBsGxfaROovaYtNQ0Z/7WvL3qu+Mj/7GXBYW3xpqnCM7BIfcWpc
         GJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788256090; x=1788860890;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhS+QGab7xfzSqgIoLvDCDDrYeGT7IjzokHtqkg4lrU=;
        b=ZFxvJaRPjjq8CJ6ELEDaG4hnn0n8cRPfgL73vcXvbgnZId2zwH/rIY5OAabKCSqc7V
         cF+s2mrarsNXNmqE3PODx++o7Gq276ciZCQxTFeJBeOC1xTdeVdeDrFipxtcBqEDXj9E
         V4QcmH63vSEOvGdx2YBRyohHNOAYnPciEsmLyHJfPHzIvgh9IDtmR0xs9OzrS14KCejL
         ddcLlLg2tcEIvZNOSbDPYnCPbc0aJg2t6CFhKppGKqSJwrlMlKWyqcWhKKdb7I+1bors
         c1/QZNrLXn4033q3p0+Wm1ydMG59DVlfmeL00LR+FGPAc9UGV9ORV9xZAvc4fIDBlBJ0
         tjxA==
X-Forwarded-Encrypted: i=1; AHgh+RpV6nI3iEgYdJacEAtodzM0Gs/Tdq1+Ap/VRdgenNzCgxbgDgIp+O4xEIsSts409//5tfofWW7EiM80@vger.kernel.org
X-Gm-Message-State: AFuF++n5A64dQqrTbSKmTwz11yXGw54fGmv2lAvYzvutf3DUI0qRp+2+
	HfmCaQUOWIAARIs/Mu6ctchSbj63j25vt3b68aJDHNu6Sh7SapxxItrzGfuCYCiCdaPB4JnftBp
	WYPsvMQGxsVuonnRRtSq6OQKiXSzlj2zaInkCj/Nf2And1NIzrMyC6URkqo4BxUf5
X-Gm-Gg: AR+sD10C3QLuMRzDTII7musjOvd8WvszdM0n0gzdxDWsH4PTAlo+/9MimCrh+8c6zUe
	T1YV7nMtq2zQXKrQiXC/G3BY2uWR8kuMdNfD69S+pzQVWcm8ZDUXcpFkGlzKDFAHwA+w2WqHHn8
	FNNMPHU64sc5VvxUsfl+N4wXfnoxGX62byO94dtRgeFtKYorPqgzAsZ3npMq/QS/8Q9OFkd9AW1
	o5klB6sJDrje7wgFmoHSvCKDfBuLv6bxNtmJV2l3yA+yToK5hp2wiz7IGK1MHqjzAS8/luLrveu
	1V0nXY2iiLMkksCVrkfhJIt2oV63skQgLJ7wTMT6/HWD6Shy64yMtUb8S4The3j5pzKpkeVtn3+
	Xpiro6/occ2f/bPYECF1DpA==
X-Received: by 2002:a05:620a:1989:b0:939:4a24:4de4 with SMTP id af79cd13be357-9394a244ecemr463035885a.5.1788256090248;
        Tue, 01 Sep 2026 02:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1989:b0:939:4a24:4de4 with SMTP id af79cd13be357-9394a244ecemr463031785a.5.1788256089635;
        Tue, 01 Sep 2026 02:48:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee0b330sm547429266b.1.2026.09.01.02.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 02:48:08 -0700 (PDT)
Message-ID: <558d9ec7-e5dc-4257-9ef4-c0433a4177c2@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 11:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pinctrl: qcom: nord: Split QUP1 SE2/SE3 into lane-pair
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
References: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260830030201.135637-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BC90tB9ckatdInZjbmnBv6amNeOWb3Rv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfX7DbQnO5J3E+W
 cpoo8zWzwunCklAN2db4UC3KFqBqqxp+sPziSYXebT3Lw9LcQtLRg0KvYq5jhyN7E50+1e2eX40
 JO4UtP61VCVcft5lQuLjgHy6czctOqo=
X-Proofpoint-ORIG-GUID: BC90tB9ckatdInZjbmnBv6amNeOWb3Rv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4NiBTYWx0ZWRfXw7115wMLpTV3
 9Ev8fvhtUyHguyZHahDNjeIcnnU5iLqyCdYHrasgY+ZFZyDL8YxUgjr/6mpN7y4629o3q5KfrXe
 NOZ7vgPEJJtz3yCVdw7MLr1MzUK1oo1P0/qHd21o91Qzqwc8Mzg5dSt5O+GQLfCftXBvGlz1+oA
 o8dTEmJ0SVKMZReu9LCb69hiTzDGzjIbJY9LSAehGk3JHmhZMC8SydgONh+w6AF8CvAIwnGWPdY
 QEfkq3rGHMDwO2E0nX1L2l29SxqIuTVlZK9pgDj7/kODzQbi5vuI3CuibdFpuwxl1dKWd5/ZC3w
 C4iXvC1NPZaHpxwQ7O3dvfmqGdDKmXJrX6Dy9rZIVE/oPJ5wzI3EV5WG+7Hmh/n8o/YoCbpehG3
 GFbybDkazLsdgFve28MozvNnvzDWGzLGBPxEWYMbcx6ofzn3PqsDT98iJF067i2A2iNuO8GZx2e
 dd5eq5upq4HMZS8s84A==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a969f5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2HO_7AbmPCLmE9qJQqQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010086

On 8/30/26 5:02 AM, Shawn Guo wrote:
> QUP1 SE2 and SE3 pack all four of their lanes pair-wise onto only two
> pins each: lanes 0/1 (I2C SDA/SCL) at mux value 2 and lanes 2/3 (UART
> TX/RX) at mux value 1, on gpio127/gpio128 and gpio129/gpio130
> respectively.
> 
> Both mux values were named "qup1_se2" (respectively "qup1_se3"), so the
> two distinct lane pairs became indistinguishable. msm_pinmux_set_mux()
> stops at the first entry matching the requested function, which means
> mux value 1 was always selected and the I2C lanes could never be muxed
> out. In practice i2c9 and i2c10 got the UART lanes and did not work,
> while uart9 and uart10 happened to be muxed correctly.
> 
> Give each lane pair its own function, following the _01/_23 naming
> already used for the same hardware arrangement by the shikra, eliza,
> hawi and maili TLMM drivers. Both functions still cover the full pin
> pair, so a single pinctrl state per protocol remains sufficient.
> 
> Drop gpio129/gpio130 from the SE2 group list, since those pins
> belong to SE3 and were never reachable through the SE2 function.
> 
> Also rename QUP1 SE2/SE3 functions in the binding doc accordingly.
> 
> While at it, add missing "gpio", "qup3_se0_mira" and "qup3_se0_mirb"
> to the binding function enum to get the list complete.
> 
> Fixes: c24dd0826f06 ("pinctrl: qcom: add the TLMM driver for the Nord platforms")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
