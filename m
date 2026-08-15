Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143DC10F2
	for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2026 00:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786752332; cv=none; b=Ic+ViSOWIbNdGH9VyCfpns/wmZB4jskXvtfGya/s/GgTHtG90I5QdYe3gW9DuTUQfcRMKLhBIUwBrO6wcV/9WozQmw6kvRAoqlq+k1wWFlA3vzMIp3oY+Dte3JQepBP72JMzMikFVqKYwg0yFDalcV+R1aJO2dl07kykB0m1wdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786752332; c=relaxed/simple;
	bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y56/ceiaMWn+R5tFD2RTz2lO68cDQK74e2eqZChKkTFY8FzOPJJGgZgpYyAjy2R4SY2T/5kjNdJYEBRdsOR4/4VR3+4LMM1CMdPN1uwDFGLeV9BJzNMKS9pe1slrYxhD9qSYxhOrf7e9ViRQlIAdfiQjWv1OYy9YzscKdjoyRf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nuFpVb8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vc6gdo6H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nuFpVb8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vc6gdo6H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ENBQKt3106042
	for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2026 00:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=; b=nuFpVb8CQWDeyhlA
	pAP2xpJr1+3+OjI7sIeieVMfYiJS+3Ocqf+IGGwKmeDd3xXDfvLnG7ObH0+XRnjz
	AOq7WGSmj/ueMbJDFJJJqxPD/CQXZ4WfdcKt/xfgIYoicBF5PYKFUmKxAXcEhAOZ
	GLzY89HnwSdHNYZjHdxPX75iObP06fXDayZASjhikV8SkJ1eqqyI1rDw3rJtwQLT
	WwMPDMzZq2MRZaoaMlAC4BAKdBLaiYCSNLOcP7HLcPXFhKQPTMAfjFvZ57C2KsrV
	e1ik3K9NRhdF3DRa2r6dHepGkkMuu3yNpQ1+w3iVZgRk/20F5wizrog3aUDNVWZT
	Dc62xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g29fx8vq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2026 00:05:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so2991459a91.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 17:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786752330; x=1787357130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=;
        b=Vc6gdo6HnzmfqaVI96WKRgkI89yOUyS4vl6PmhhZPQ9DUbuI+ns+hb86RN+xKoo/G2
         0VoMkNwfSZhv6lby4EsElkLf0NuDipueMvqgGVOvJnJGAos5GmhpoPFsYRbtAor/00K9
         kcvZlgOJ5V+krlHOpoaRgZWboq9OCfLgqOtBIrqUZTtYTZZjtGx3qCER8DqC6bekNhGM
         sjt016OgirEjHVXu8V0tQwFd+xzFViWyosDlkUN4SRw0/fJMMv4McMMSnWHQlVnIP3ma
         cHbuubDqWq1AgE+sZGVQg8bkVMH+ApNVZ3wBGqHL3woxyWb9xj5Et0OBXahJktCBPGq+
         92uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786752330; x=1787357130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wm38srSWvKn2bZKU8bOM9GSw2Dzk+DbCISm+8uNzNSs=;
        b=FxOxNCdq4dwPoY7ZM2ijhofglzUDsz337Hyv1fUJmD/EJ8TaeOdWEVxlJEnBuO1Vg1
         mA6BcPf/GrcAgc6NlVm0Vk+Qjxjm3xjqp2npnBQ1zD9DYqGZjbsmuirMusQ2mVXnBryE
         AmTt1xOhwmIG/x2mpEJHYSEONBrq0fgip5HDSm+kQqZc7RLXa1yvgyWLJT3WvqJ1uV2c
         vAL5e0oJ0QQcZ7ZrOfAJ4jm88qeEuv9PNY0gRQBg2uaZuzM06FQ5u3YUIGir3zwFmG/V
         NGHVtlEDR5erSpDiMseBEoo0WUW+3BCW+WseqAcuzeVZZ/Z0AxMSNFouwtumXYgz6yhr
         E1sA==
X-Forwarded-Encrypted: i=1; AHgh+Rpf9Nazlx7Ua1WDSTGl7SBppeWlIcOOH0jOb5KIpWuE+v84NDVYO0dU7OQFbk4a7VmhR43AbAPFHN8H@vger.kernel.org
X-Gm-Message-State: AOJu0YwqYeex4IvdTO4VsdpxTgFEOjmnN3dF99KxNPtjxqEv0FFF9X3F
	HM/n+QGhD59JtcKK+MK7i5BBd9aIru7KeXSDImfJARxEUSaSt8St7SnqvzhhqP3Mx2lz6luYSij
	UbN0DrZ0crse1KnRD9t/OPbmIP8gagZy5rv1YZ2ucMNvrkfvOdcKsf6h1D+lb/vQNyoI1pAMf
X-Gm-Gg: AR+sD12/temybp675O3T+UouEFoR4cS/xplVe4mL1bKGmBn1SSV2VgAgoEyMBjTeOkr
	hsZba1h/D617jawKpNH7vP1GpOBQROqDaC3LjS+udD3ZKSXene+lSplIK1rXVZeCNJuKTyJbVkI
	J/J8BKdB6SohoXnV6d111Qq3zmAGeunrrSwFwG6n+YBNrscMnEpk2iXEQOm9tVqBIwe9GGFfbd1
	7KJb+CX+lvz/ImDAAgU4r4IfbjlYm2H0ho62WPlawTCUwSFSkq+eLa0RD+F0RhSYowk4zcnPSAg
	vqNZHCJY3JiqFZ4SverABpbiApZ4lZeP7di0OKS5XTHFp0ghD55rLSKSbVNJRBrAMgB66IFmA0A
	SQ5xSMQ5CoiGppJNc1kveSVISVqllQP1B
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr11780609a91.0.1786752329675;
        Fri, 14 Aug 2026 17:05:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4f:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-3933b833613mr11780507a91.0.1786752329180;
        Fri, 14 Aug 2026 17:05:29 -0700 (PDT)
Received: from [192.168.4.152] ([172.59.161.148])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ed5b1sm21430800c88.8.2026.08.14.17.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 17:05:28 -0700 (PDT)
Message-ID: <56107a6d-962d-4508-a1d3-7a6e9e2af887@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 17:05:27 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Linus Walleij
 <linusw@kernel.org>,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260731-scmi-pinctrl-generics-v1-0-8affd2b79a6b@oss.qualcomm.com>
 <an7RL_mTsznZjeIQ@pluto>
Content-Language: en-US
From: Alex Tran <alex.tran@oss.qualcomm.com>
In-Reply-To: <an7RL_mTsznZjeIQ@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jXi0ZXZAzFoiyxFDL4aKn1sShGLCSZ5x
X-Proofpoint-ORIG-GUID: jXi0ZXZAzFoiyxFDL4aKn1sShGLCSZ5x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE4NSBTYWx0ZWRfX9vrDcGj+rYJv
 MS93eJlYQ9G591lXiR1774dzrArQ8L+U2jGLyR3Z+wz3QECarLnjvmTNy1QW8+BW+ZYgu1+TB3O
 HKzu+EVQi/MqZxh8+cx8NEvloabvZSR7POOl4ZMIUZaSkXXQ7eGDOZ271PNZNThDzAhP1bBLTRn
 EJqSXD/myNdlcKaMVsSZUVzkJDZTIshXrEmE9jc6zyqyIsBQqBwD7UFTaFjxJ9p13CRcIuWi/qL
 4lBeNNslhhQdCfZ5hHzO3/QVLz7+GBUuylMSRed2cgzxWc7PDcr8WoR94OJCULWAQk3o8TyU1gs
 eviT1RRP3eAaby3vWniUbwAc5gHW2LoriTHLipSddaxjTVjGxTriN5hqKC+cxx0FI/uiml4VpZg
 t5+36QPM2dI+lCaT6vudxJaSyOdxMfZtd/wenftoIcTNN26sq8f+lyFtml2+IGm0aF4OqpzYP2O
 Q9WjRTjmJYxkkdIRfwg==
X-Authority-Analysis: v=2.4 cv=J/WaKgnS c=1 sm=1 tr=0 ts=6a7fad4a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=QQ+fG4gAsU/2tVdSCsf/ug==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2icmqZXXVlfet6DyCXwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE4NSBTYWx0ZWRfX3z4uxqaLwIEx
 qkJGCgDZuuMdl8OBCJOVBI9+iJpYn5Z2HPHSXMR70+Vjvmr0tA931weNqGSE2D+iU4mpk4cQm8D
 HV0PRcc2VkayngLT7r37Clq9AVGVRU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_08,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140185

> Hi Alex,
>
> I gave it a go at this series on an emulated setup and with these
> changes I get:
>
> root@deb-guest:~# modprobe pinctrl-scmi
> [   15.329932] scmi-pinctrl scmi_dev.4: error -EINVAL: Failed to register functions
> [   15.330259] scmi-pinctrl scmi_dev.4: probe with driver scmi-pinctrl failed with error -22
>
> ...not debugged any further.
>
> Thanks,
> Cristian
Hi Cristian,

I've tested this series on sa8797p hardware and did not experience any issues

with registering functions during probe. Can you provide me with the pin

topology of your emulated setup? I have a hunch that the topology may

contain a function with 0 groups which is why -EINVAL is being returned.

The previous pinctrl_scmi_get_function_groups callback considered a function

with no groups invalid.

Best,
Alex

