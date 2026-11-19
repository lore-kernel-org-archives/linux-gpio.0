Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084530;
	b=3Gxw62l3kS0gVwLA8jjSP2V/NVwW1K6utGmDerWtWLPsGnLRXLPigTYttqdRTNm6DM4D
	 QUPDNpSkpmbRIaHLykuTAJ4ok7Qhkw46fG9cqQ8c1Lrcx/Xfyr6cG+y5ndGFJIBt8+Lvh
	 9I0+k6iN/WY1ZI6GsPdsYyjZsY2oq1As/08sFJgw/Lg/zUwv49StnYaTr99hlZnF1pU42
	 0JDHuzo39SkkRNsXE1Gk3KOi/6fzoXSnU0IWNnmz57TcbLdSioFjuIKZZHlYNkD04c2nX
	 EM1+tLlysNrKg/I2pdvk4ZYQ6kr36IlGY0c6wrwan+tCQ6WEImKIfSmPPT+e8GFnH8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
	b=eMmYJH0d2V9SjH8Dds0SFD8em3W3ySEH2lEwBkK0uzyjYOI/6GFrjR4vJpEcgn+rzT+N
	 K5t65M5HBekgf8FWTIGT7rvmE8BVQxu89rR2LddhIdh9k7K0Usmm59xSi6H85XmxVozN5
	 KyhNPuSgcgUmzChWLbKS/7+k/OetU6quGBRoYLBbSsmF9lprt8mTkvsnequp+UeGMM35J
	 BOe4F7PWOvNtFwZjqwz6azbCw4ZbvwcdPU0xN79ds1FXzO/VEOSPFANWcSQzv7hmz71yi
	 40aLwo7nFI2fT9t+WvzMKIje0d5PEhU6oo7lO7OIYXmFRr7FTdG8LLIpsDbTvwtnq4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632A606A320
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4632A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcfjQf6T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WEs3TUN4
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v4sC1962345
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=; b=mcfjQf6TW5pUx3ik
	7wCEwTKM/pEtSHAzhdW41rpIfKhqj4q70h6/JeA5SWJgk6ZpSnYnVbrRx75oYPF3
	4z5kT6B9vpPg6GrVHxvN9Md/63GXQDNXlmgRtIHpHaPm9XyFe4BPkg5wTOfcVJas
	/YGBEh42IlsICnVQSN91glTcE4s6J94V2HfdjpbSrY2N9RUrNlFnSHNp6/zILFLu
	O2SFvLa8d0PnklJfX/XiCBQvz34gzWlqPSvF/e50ysT9TbekwAH391s6S0BAQ3e9
	NW1EZzIWD1HHjDK4HLJs0X1083GavdZLWya5MyrJRGc29FLCd6Jwz3cbYtUixSiU
	2jgfnw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1gxcuv72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 10:35:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so391482585a.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 02:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795084526; x=1795689326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=WEs3TUN49r7BzVVrpbPYgSUAmwgV1xmr9y5/y33hD+4EYg6iafwb6FTmPKVO8oHBeD
         zGvIwL19J870RNP6raf/In9ik+rDYBOJK7RkrW3RfgryBKkH/8k1czbAZMSTS1tLSo5c
         +C43d2ikNrTPck27fTbZe433Dw63ZlvELoHti0Ri9upfJZ8x3Z5YLjTouJg4cg9eAlM5
         Ebt2R674t8SNGkvzEfXpqwBO97Wvl7BIBNc0+npBmcOeiPRn4U4wkwoxWP4U3uXK5knx
         m51UpBqTr9NOHDMWoAs6dWM/+qcSP15DFIpYc7/zhdSjAhcG1SZ5H4t/kS9GThAUanz8
         gTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084526; x=1795689326;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cnrr4Yn7YHkbhryjrkHy7utpdkTnIjvy/NXUx3UPL3k=;
        b=rQJsEOZr2+jLNdgKA/4jr7BUuaITXygvK2ajM2OLz8EnPJbr3YRTSFLOVRYjVoNT8F
         HoMkHl17l0LBfAIVYMbJqvagaxbAOo96aAWkrqhTpYfv23DmNwoAF22bUy7OQS5+NK2s
         W4WsH7W+6y3uaDRF2Qbw6ePAc53p0FOs923P7WdgFqCGyYryL62Eo9M82vrViSBLN8LL
         9P/PXGts51lQyeLsbeUtLx54AldqKmLTMXtt5EBG9nn6nrfM0/pkzaTOxzTi9kDXbRSV
         PBoHJnnKrG3SuPJxJY9lMc1OvuPs+6k7369jgYu0wvYj5BVYnY5wi+4n07WpMvtJL0Ev
         SKbw==
X-Forwarded-Encrypted: i=1; AL+hErFQm4pRqZQ0oZFVOAyCRm7cXoyTPOQWnBNolEkbr1pgm5TbGhV4pgAHH3rocO1yCqH9GaLvgsve0a8J@vger.kernel.org
X-Gm-Message-State: APuU4Z9wV8XTBFGC1jxICJ0RjTQm37lawSmDS8SlHFN8PPfmLVY20NtT
	/+drbd/xk7D3HHHV+/WYfmAiGGLh69IF/MVm2rm5yYHOdPMSGbPi5VeY/7oqzLMuwjQ0kzpZrzy
	oNoaAxxk5kspEob8M45ikaE3g0UJ2eh/qhnK2LtKsoMgHJoQpBRVz2dfOBh2FeODy
X-Gm-Gg: AYBFou0P3NnT99SgQwcMOP2Mpkv0Bufa+1zj+TvEzEPkjU52YWaIHGYEpF7rMTiTYVG
	lLVz6p1B5yK3o6ZoqHHe9oQ0Rk1ByvtPYgseSwhWzIw77bVAY3smV6uX4v7wJHN6CJFi1r9Wyf0
	45O8DBcWnm01X7yVU0Ok+1jUjDEKcuBN/QYWmVtJ893zcu4sDdkUohJZZDr6m87C+HhGI39UoVF
	bARZM32HrYZO8Ex/wG56Xdlojs6BC8iNnSbwOFq1YcPgui51Vf+0+w1b5tryCxxyxfRNVdyFNPe
	wrRQbhuXmky2tU9gbcOp6xWc5lnVO6Ds3Fe8tKfP2gWgZIV/E/hACocxIL1KdUHOheDRIhilDPw
	nq3QIWuZVcr4160ZW2IkvjLr5hwxgH6llHOnUJONrennTEN9aWGYqNvpFxBmqQ5aCuysqzMoz+4
	Y=
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931934785a.59.1795084526323;
        Thu, 19 Nov 2026 02:35:26 -0800 (PST)
X-Received: by 2002:a05:620a:4551:b0:949:873d:3dbf with SMTP id af79cd13be357-949995e0f87mr931931185a.59.1795084525819;
        Thu, 19 Nov 2026 02:35:25 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656933956sm10237506f8f.44.2026.11.19.02.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:35:24 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Jiawen Liu <1298662399@qq.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>,
        Dan Carpenter <error27@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>,
        kernel-janitors@vger.kernel.org,
        Alexander Sverdlin <alexander.sverdlin@siemens.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle debounce clock preparation failure
Date: Thu, 19 Nov 2026 11:35:23 +0100
Message-ID: <179508449069.49049.11977204683056699145.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
References: <tencent_B4F504456790E8BA3C4EAB80F4BFB6954E08@qq.com> <tencent_D8A4B6EE90931660EB6F586543FD58110E06@qq.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LZapeTfi c=1 sm=1 tr=0 ts=6afed0f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AXu-sfnRVQekOsvvnCgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: Y5Eg5m2XAVDIDLFbLRdB0VRTgXf0YPh3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX/fR4qXtuvWP+
 moxGa0nM1wAN5MVvaa6sk5G5BkzeAC4qPD2PpJtpQcGJP5xLpgV2KPSTGs5lHFAKY+Axv23Hcgf
 LjaOlQZunWmrWrT0QTYUkRgmh68zPrjROz85nfj95vVdJDlTufyygcLF6xOPJT2voztzpsk3yne
 PUV87b2MBwZ3vm7HC3L99bjlP8NHQdy8lC+d297+i8zM7EYucy2d1SV91OL73ygOWkGwCtT2uhh
 iAhDZgVedFM7HLz9GSLJ9/VBtdDuZWTuCTJUiQ/ISModnleSMYDL1M0srrsga737qz50JrY0Ken
 BNnqwlv4l1v983txWG9woGxeBapv4edcqKgjpyZ7BcUwZN9v6/LPZ5RL6ePDWaup0P2BeyxfjWg
 3PIIS2u3bPPN8z66lungBsXYQ7M+Kyaxe58OjT1bOhS/C3oKgOPJPn18ga9V9YztOpk5T+XCMRq
 eANDH29v+/J7MgnlPyg==
X-Proofpoint-GUID: Y5Eg5m2XAVDIDLFbLRdB0VRTgXf0YPh3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MSBTYWx0ZWRfX7WBZF4M/2J8O
 BZL7V/B05BP83yYVNAcsu3A49Ae2A/LLvc88IfNpNnAUd2xEmS9ss9mfnxhEh7x0CPVO0neX/9X
 MimrjMt3sA1bTBPU5kHcRboqdUaOtPs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190041


On Mon, 09 Nov 2026 17:42:04 +0400, Jiawen Liu wrote:
> omap_gpio_probe() ignores the return value of clk_prepare() for the
> debounce clock. If preparation fails, the driver still treats debounce as
> available and may use or unprepare a clock that was not prepared.
> 
> Use devm_clk_get_prepared() and disable debounce if the clock cannot be
> obtained or prepared. This keeps the existing behavior for clock lookup
> failures. Remove both manual clk_unprepare() calls because the managed
> clock is released on probe failure and device removal.
> 
> [...]

I dropped the development history from the commit message. Next time please
don't send new revisions as replies to earlier threads.

[1/1] gpio: omap: handle debounce clock preparation failure
      https://git.kernel.org/brgl/c/9df982f1f283d2f2a9aad764dff92e36ed764e16

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
