Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661376;
	b=rpmLlI/ZCGHwcVMawxPvcwRmgC1MnaIzSVseeC7dK1VsB0/gxPPjO7NRgYabdVviGGC/
	 vdlhKrfVQfkt3qSg7zt64SuwyR2Hye+Py0MyU/gYOOJ7Jdw6iHWkyOwiqIXg6ehlvAMs+
	 iV3aH8D2MPhYgwWNcjQx7J8WH54P/mqclFW3NdTaBGY+cVjHaPn9/yIxxvCFhBWWsjm16
	 lXLoxPCc0yMSNHuzobr9YmndXPQXhOGm4MxMKNigLGgJegIvYntZOzASC1R5ls7vorTlG
	 ZvJMu4TCWXbz6MDTJQhLXghQvi9txcOU+m/bpV9WGD8bavJiHIFdqOgDHrd5hDMxpZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
	b=GX75N5SzON1jxGr/SRsi1EeeF0vF48Vg6cstq4pW5rirSwN7x2s6SlKYyyTIPwttlj3g
	 aES7s6lGr9fgcITc+G5N5UfZT3UJ26UZ/5CgocsGtMsdzsJiHtv5RspvH1VS5SK3LItTI
	 WhLnI9WmUktpHowmoQZB1uAXSc9tOwQRWJXPG5zjgsqfWcjln0ru7U6LdzwldozbyEai2
	 jwcDTSuk/uqteBwucO+WuPkPSMYy1Lkd5SEu2orO0JT7vn58gKuwLgTzCiYqm4GH/1KGr
	 rl2Q0Mx+TT3lFZ54JKfBEwUURtKTQ3yK57thV/KEDjSf6mYhT+jVE8yDE6kT5uTYUkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFACE606A31D
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFACE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aLcrDXCU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GF9pzvUW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M700L52172151
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 09:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=; b=aLcrDXCUR1JjXUR6
	pH3vOrOhX9wQJyVTB6yLshBTnlXqgYdWRavOFu08uBmsxajGWGgVWzjWTyUMHSyI
	eiUdK+lTmjUbkBuqYavMS+21sJ22tqqJ26m87E6NXlU2QC2f291Evo6cvJmzQdEn
	Prg//kZBCb8KxrqZHHM1s5/10emrzAlJ6ygkkZgrpx0O5nEygAFW6VjhmawptLPA
	3yETgMyGeTxSloGyYPbJFUFEVD74gwxaAK8MErOatvvRx9UACM+Q1vJSMFZV+oDH
	5PdALBGOrBn0j86PCB3d4A84LzzWKpVGVqZdVJF15NgD5MbReHcPFjIBit3xkp9S
	3D6Cgg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahpxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 09:29:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so46807985a.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 02:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661364; x=1793266164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=GF9pzvUWBASRRa8LqGY4AL7HJbkl/4i/uB2T8V7Xmhs1iqEtX9xmif0is2P/AMWmdo
         yIqfj2aoUYX8Iec+WSTht4k5sHIXnk/p2Yh0a3Tgzo9Jl0L2ttOH6WCxyX0UOmXvLnhw
         nq9sJ8JMW1Qhk3L08YinGecumKHkwE24kBA50opjeBEAMUa0RNG30TsZhunejc63h6pH
         sEDBap+5RI8kbCvoyMrvwB4ymcCiHMrLeo20D/CBoZV9onQwxYK2NUsOW7TCIsT/0f4V
         jg7JCfoTDKJkUbGP+AIBF7u6+xKOUNg56Y864rFKpa70YoVBCmHPQ750s4jmQJgg+PSR
         pwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661364; x=1793266164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=asHkksXryHP8fncE+DgQVjyvFM4/Pmm9WIL38dhPa2I=;
        b=dRgM0TvJpQtjplxX7wgemi9ML4LhxaHGXrARWpNfrVtTvLid3Rqb1erDRr0+y55Xzr
         URYKWnrjB5BEuTAP2PUu7bI35SRie+XkQnq/mW6BETUc6StX0KyjJ0UTl6TomYwur1UT
         N6f5J3Ar7V76jxYQ08v0IKVVlttyfbZLADC0neM1rL7dbM6lyqCU5vC8u8Dt0JncLORS
         Gk9CYMoHMtTAFVKCbPenag8px+hxFhU/bRKRD5+hc6IlN4zWSAD7cowzNtlpzs2Z0ryu
         CqcfyuiXrAZicwjJbBa7TQVS1tmqLc0B8RJZ9GcgaU7Q6eA4gw1TU1NAHJmHf61yM0B6
         0igQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE995hCue//ShYUxPqIiytHtLQmXbq4VA6PRRgJ4oMkoHOxd/77OzXuiv9L6qGAoCOjmAbRtLwIkGN@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2jk/WNvuwdfBy8x6CbRP560cs/O7lJqC0gPDCHEj3MpPH+WHw
	MTI0FET7WYPTbfMRec0yMHQxP17Byy5yxkJhnErmyj9YJVP9auMet/bXSU0oWcnAUYhktTBX+a5
	jR0JZtlffQloNw4Fw2cVZGYp2TkBp0uu+QaysaB9rTVuNKxcVzR0vwUNxQktHzoMc
X-Gm-Gg: AYBFou3okqvQTnlpT+zbo+iOYX8W3m3/qORIP5g0uvTdvNDCBLGwQzkWpC5IFmWe2uA
	tdnyuDCvWr4pzV6eSEtvZmXtPVpUoJqwVgDiF7JAjz69iLrtsg266Gv+DvC/84jZAkwZkDbmx1N
	bILhO9Caarg1JXurY4EIVwoeAINm9HQ2kc/ZK3/AISKUqM17Zyrnrbecyw63iXsaoLuORAesd9v
	KD/JmwzdkmpSpnbHCqlWcTBsjUdqTid5sXdWd9rZeMf7M1FpIYoJbLtHvAFZrL+URcO9sKCeNGZ
	XhkJWQ9X3IEb/IrStjgGlA/Jpq0+1Xan6cUgz4NNkzVbkqTntFxaX+EfBZpy/F6b/lPV7gaiNF3
	kRrI0olL1jbSRnuomOOkzKg==
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994611085a.3.1792661363752;
        Thu, 22 Oct 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93e:571e:94f0 with SMTP id af79cd13be357-93f57f23fbamr994607785a.3.1792661362985;
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm87380366b.7.2026.10.22.02.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:29:22 -0700 (PDT)
Message-ID: <bed18f22-ee37-450f-8b56-d3f21b85c3cc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:29:18 +0200
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
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc8280xp: add Radxa Dragon Q8B
To: sophon@radxa.com, Bjorn Helgaas <bhelgaas@google.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Stephen Chen <stephen@radxa.com>, Junhao Xie <bigfoot@radxa.com>,
        dragon@radxa.com, Daniele Briguglio <hello@superkali.me>
References: <20261009-q8b-dts-v2-0-eda11e5dea8b@radxa.com>
 <20261009-q8b-dts-v2-4-eda11e5dea8b@radxa.com>
 <3bb9a390-3b5e-4321-a25f-77e4f5c88f9a@oss.qualcomm.com>
 <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <C782C697D7D26A70+05200ff5-c7c6-4425-ad15-67222a2ebacc@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pAMzhqTBVMki0vCpU8xPRNi4fo_FuYu-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXwMPVsPkodsl6
 JQCVOBrtNyFuB4jWn1rum1pmzEdcJ5caalvLMZHfCK8lQzaw7X9VGO70pRCLSPtQkz8gBSU7uj3
 RorX9PWUvzidRP30la2ltq5LXc29a3g=
X-Proofpoint-ORIG-GUID: pAMzhqTBVMki0vCpU8xPRNi4fo_FuYu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX+P0P5MkmisxJ
 IOcOPoUlTO17VnDMWi4nbcIBXsouiCP8gxbEBi9vk73Hs+H6qYwzomJoxrevZPLflxFyRWtDTQ/
 0FXQzk2z38uxJDbapY9yTbQB/D9DPfpY0jOheE0Z7S3XlgYmBiA53HZswhkCh2t6i1TKb3s7xzO
 pnfU7DeNjOA7eusQxSOa9sALYmsG6jA7Vw1tm4k0qbXbDPokM56peyK1gIX78BZWDYtSCb9aUuO
 0WzI/231IHxDoxqnglpaU6iOC2X6mSSre+/1OtnZkFGmRTzyPdQQUAxT7ma1vf3Wh2lZSwkDOFO
 7Ui2nrm8JpSf8Si6W3sl8MVxiD0KUbTWdhQxmNlMhx1zccqxPfquZ9FAFnmyBUsMNiygvAfUzoY
 9xcDfzm3+x2c2M8JPmLQNf7rkvAack7DnT6pimKW2bU6eEoOG1YGz6Ms2a5sXJxoqkBjlN9JFku
 NymLG/9qRkduWeEnOYA==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d774 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=XKtpnFXEKgIDAPG5UdAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220037

On 10/20/26 11:11 AM, Xilin Wu wrote:
> On 10/20/2026 4:27 PM, Konrad Dybcio wrote:
>> On 10/9/26 9:55 AM, Xilin Wu wrote:
>>> Add initial device tree support for the Radxa Dragon Q8B,
>>> a single-board computer based on the Qualcomm Snapdragon 8cx Gen 3
>>> SC8280XP platform.

[...]

>>> +/* M-key Gen3 x4 */
>>> +&pcie2a {
>>> +    /* Place ECAM and BAR space above 4 GiB to accommodate large BARs. */
>>> +    reg = <0x0 0x01c20000 0x0 0x3000>,
>>> +          <0x0 0x3c000000 0x0 0xf1d>,
>>> +          <0x0 0x3c000f20 0x0 0xa8>,
>>> +          <0x0 0x3c001000 0x0 0x1000>,
>>> +          <0x5 0x00000000 0x0 0x10000000>, /* ECAM config */
>>> +          <0x0 0x01c23000 0x0 0x1000>;
>>> +
>>> +    ranges = /* IO (1 MiB) */
>>> +         <0x01000000 0x0 0x00000000 0x0 0x3c200000 0x0 0x100000>,
>>> +         /* 32-bit non-prefetchable memory (256 MiB) */
>>> +         <0x02000000 0x0 0x40000000 0x5 0x10000000 0x0 0x10000000>,
>>> +         /* 64-bit non-prefetchable memory (3.5 GiB) */
>>> +         <0x03000000 0x5 0x20000000 0x5 0x20000000 0x0 0xe0000000>;
>>
>> Please drop this change on the board side, this is SoC-specific.
>> Likewise for the other ports.
>>
> 
> Ack. Do you think this change can be applied to SoC DTSI?

Yes. I'm not sure about the extended ECAM thing because we seem to have
never moved forward with enabling that (oversight?) but in general:

PCIeN	|	base	|	sz	|
-----------------------------------------
pcie4	| 0x4_0000_0000	| 1024 MiB
pcie3b	| 0x4_4000_0000	| 1024 MiB
pcie3a	| 0x4_8000_0000	| 1024 MiB
pcie2b	| 0x4_c000_0000	| 1024 MiB
pcie2a	| 0x5_0000_0000	| 4096 MiB


>>> +&sdc2 {
>>> +    pinctrl-0 = <&sdc2_default_state>;
>>> +    pinctrl-1 = <&sdc2_sleep_state>;
>>> +    pinctrl-names = "default", "sleep";
>>> +
>>> +    full-pwr-cycle;
>>
>> Hm, is that something that comes from the controller itself? Should
>> we advertise it on other SoCs too?
>>
> 
> It is observed that the boot firmware can leave an inserted SD card in a state that makes the first Linux enumeration fall back to 50 MHz high-speed mode. This property allows the MMC core to fully cycle the controllable card supply after voltage selection so UHS-I voltage switching succeeds reliably.

Got it, maybe let's add a comment

Konrad
