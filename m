Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5056649E5FC
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048569; cv=none; b=FuVgPUbGPkfgcQkFdbitXIRyxlueuxSSpLRvFSfpTs82IbDemGSwdsVuVPLiFXbMF8AXEiYIR8cjROVZeu6ZkVem1DNoSP9vMmw2Fr6w5vCfsCwUuaJTTXoVxj6AhIC2sYdJh8bLPr2ecFzo7HDvmKLboV3COJOMBx9ZoYTi2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048569; c=relaxed/simple;
	bh=5hP/z2g9RhZQhceP4kiG7MEcWPAl+UFiAdLd/YUGRc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hTvXB5Pj3Kiq5FLDMIw0QLdAdzr7LB9VOJdNN7/toOsiLMGjL4h1JCXvE18Ypl3jr99bn0idLE/zJnCMacjfBuSZlixEGtsaPLBdQ6s1Q1Oxp+3Deoe8hzLhAd+d1zRtcItC2qY/oW5NYwx+h+C5bLN/8YNHPU4KmcfQPBRmc+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp8DrBzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f92HAXpW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8DrBzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f92HAXpW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F00SdU2121448
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=; b=Tp8DrBzyH98g+lpe
	tEXFGwa7+CB5rTxZj/fG/lKxrANcouNKIv/38xRqFcSKSRfVXMp0ATkb/RhaSpi9
	ZkU8VzeduxY1cxBH9UUx0uox1T1VX5ffZicOznUxi4uMmKe8h27ro5fzXvRw3Qaa
	4dLdtzsuV8kxRym2vvoJNYRjvnQfL9SMIwPCwl/ROFjkj8bs/948KjUqhsbu6gxO
	38zohW36N6xpgbjLk/dWsTGoMiOv54RrZaz0y4RmhK2PwSxznubhq72zwjA2IWZX
	kmDQuqw187Xe2Ko5TbIoMHOctGCKqCDKFmnrkweZTggZ9fo8v9iSpxIhFaSxK46C
	eqssRQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn1dad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so6540795a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048556; x=1792653356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=f92HAXpWpXmTu65+pSNFb3qJ6tCT+pXMbSmmrBMPX4du318wbFKtFXne8EvNeC0Uny
         Xy35UrYhxjyKq/MbnDoIIwoclE0GVD0m9+e1DBVkGIIOVlLEo5rvHOxjm1bGkD/mNrgM
         LDpoLoJM3AZNO6LO4KR3j7VusZxYXIzhUAn4eCrEN7FdlGzDgn50BBswHIWf4kRjOynk
         pCsy6SAtZu4Bip64M9UfP3/zzpDhASAwptDs/BTU/n9CTd1qluRDZog3a0PgWRYKLuMn
         yQ8bGA4mB9GXxMCVa3kHfY2cz1qmUep6QkVUK8rCTKgU4XiUIxbGNxGCc5UpRTjdi4Qb
         a3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048556; x=1792653356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=FKpplytMqmUkBPX+bjspYnFooocxl1neiId2IWN4Zdd0uhpbuWP598W1q1pvLWMQ6b
         /xOQjJPgW7Jz3UZXTS9tGjLiEB3w6LLGxWhmbpFtfzUd47e4I5xs15NpcVyF/53dwmnO
         +/RZLYrD2gWbuahMmzXp1wskbRaCgKovc5TxQovBjFGDqyPj07LQM8DVVvjGrXqy6jXq
         dw4knEBxuzXi2RJwz1IAA5G0iYzkfIFbR9KK+mKyJKv6ZjeZpFVDxFVcFdh+mYEZ39fG
         pGsdqvJPB8M1MbWbaUsV36vCKekCyAVdaTGQ1q83MhiI8ZhFNyDaK2lCEU+roskUbmdL
         icTA==
X-Forwarded-Encrypted: i=1; AKwUvByz3GhFhp1d63+mWeYsZC7XP7qTiXuVmql8L8cJiR1W53+2JltvpIilrqkkpZXiHf6VF+Y/Yb38jknN@vger.kernel.org
X-Gm-Message-State: AFq9FYLV6VG8WXKaQk/VwIllWA+fW0tsyEkKiTIwScO9IHCQeE58suTf
	fLRk05OUTa/S2oWIgc6Vv+zTea6vCtyC/40MA0DVrQr++5fBgUmRVJ9Ev2HzHlBWmzmbEqrw0ph
	YGp9nAfc1ZcxTnCyVRLlEq/HNNU0aBOLGolXgfhhr3K45Zb5YtMcJYkS/fZ7tXxYa
X-Gm-Gg: AYBFou0vxZpAq4clCH7ocGcB3xbRWTSadln3gnLvfFMaPpAZ+YMyqamJu0YXgnPD+Tz
	bchnQ3/l1k1swoLeffYZND0JrmHVu+61SW3QAXf7it7k+Jdgx9QpzMozGdIzZB9DpnyBuS7CZZ6
	nN6egfkwxfI3CO0Z0HaYEl73uyLLodCI4cm9qjNVEDgo+ImYU8ZN/rL0u24+fWlLpMY3TKjXS1Q
	4pVIPnBtUNL/uneRWSRkhlD1UKhiwSK4AlnrnBXQT0qrTFq7BK7iAnJl9JEPZM6vIjazIXcv6qT
	fCo3utFJjUB4f7ej5TzMRlkMe1N2qAK9KTDkVU13ig7dHqFK+BQQxyRDJjlY0yIwjB3DclSLjWr
	NXUOPGUUqVhoMlqtiPSbJl/ph2hQ=
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191855a91.27.1792048555683;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191833a91.27.1792048555149;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:54 -0700 (PDT)
Message-ID: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXw285im8m4Liw
 YfVLveAFSylEGbsP7zbroKsVRcJ8nXTPs/HXhUbg6MhiSIzMuhxHXyGwNq1w048SeR4Z4bYwulJ
 KP/o7voaEfq34vLcZyvXcWAsjdEgYIUXX3oVpOdqBaFfRMzxkhsEPeNJm/2ETeKhjjht4UcwZl0
 95pL7eete92n2hGC+D/7dxCFMMsMJ9vxt/xu2qJ3RBI4xhB+NN+m5Eea4xwOYgXHV1ooRdWIILA
 pCmVx+pyPg0dUBJHc6otuWvfoJ86bUvdZZBYivVvaU8LBja82ve8h8d7yThytLCdeLZnnsrWGsi
 CT1UjwIQlWlHmmAeEcoVxsCp+9rjtLSBr5lkyBzsBXH6I9eWBkynCd2IFEuCt2IWCeuMlmvYLw/
 c0s3pBLi38RH8Y5b+Aw1OUCmDaO0pxaqamWI7Jg4J/OsDT1E1t6QyUFGCtNEOnznqYhE1PHT9E3
 CBifkzmeJMih05LVb5Q==
X-Proofpoint-GUID: 9aqQn1pNqNugyvUMXa_QyAy8CdWqaie3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX3m7i/9N8vEkQ
 xiJ0g4/obd5YyN2gxh1u+R0sXs2X4iYwXXOZ5pzBXnfqe2Eca0e2uH/lKi35YXC1G5y7qeeUau2
 MP6EV8ISXYN9LmCyzVmHJv0VTrSle04=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad07dac cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GSbrFnjROjb0KAz-EnMA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 9aqQn1pNqNugyvUMXa_QyAy8CdWqaie3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    gp_mn: clock-controller@88d3000 {
>> +        compatible = "qcom,clk-gp-mnd";
> 
> The compatible must be SoC-specific, looking at the table, we could
> use these example socs for the versions of this block:
> 
> 8960 (v1.0.0)
> 8974 (v1.1.1)
> 8994 (v2.1.0)
> 8996 (v2.2.0)
> 

Apologies for the late response.
The GP_MND block does not have any functional differences across the
supported SoCs. To reflect this, the DT binding will use a SoC-specific
compatible followed by a generic fallback compatible that represents the
common GP_MND implementation.

compatible = "qcom,sc7280-gp-mnd",
             "qcom,gp-mnd";

>> +        reg = <0x88d3000 0xc>;
> 
> Let's map the entire 0x4000 that this block spans
> 

This region support 2 or 3 different blocks of HW and they have
different functionalities and for which I am going to add the driver
support. What I can do is map 0x88d3000 size - 0x1000. Please let me
know your comments.


-- 
Thanks,
Taniya Das

