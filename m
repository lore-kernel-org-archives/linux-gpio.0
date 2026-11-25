Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605839;
	b=ntjbLqFh3NhqQ1FRckGVpTrzp/6yk2lBD+wJc5LKlUUBsscxgBC8rhKAdDTxWFXLN0Wq
	 hyuBaDOuEnaSgv2T7QNU8fW6YAl1V5SyuNVSU1Mq3scnJbcJ9qmwG3B4aQLBwOiBI1SzI
	 zKRigb7weKVfln38Pm2riSRUAnOdAdlz1lyVMn144jOKr6p4YMrTaR4maTBrWs2fyQ3md
	 gIP8ghkh0ePTDpiSBnNviThuU4u42cAtGnVe4g9BDlnDXTDoFzQmd/adTH6PWVcB3ZmSG
	 9U8UfnyfFVlBkUG5MmtSnxzaMaEQMYHiYX0p1mGZSxAK+kj0H+vx5I94WvTlCKAEvHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
	b=vAAhNi788ky4gP1Aczbgcgo0ucD+zt0wj1UWDkFK6flCt3TKkWPVakeTztCLKm3P2m6H
	 Q6z/b2TIiAKpkr1GYpQALU092rzEs40NjjYOS7XY/RVFig3MAwqzODwdOFfb1BpMk82td
	 e5MJ5rlWddcQSMIyoVodLmvehovTmRDspKSi6BycjXahqFWElHJQ6rTo8rkE8vocOx9Sy
	 sO0U8QKhfYKh9Ngd7z0KM/r37XMrjUeJibRFCKIklbLlBh4m459p0g1KDiNeek3jcCZv/
	 OyaYaNpBtPoxNbi3nUj3RbdL6ScvX6WnKdLjM7mrFgRXQQ4Wnshlfa8JDeQgCyFggkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB0606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABFB0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nL4ewuhA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia+BShyl
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mMUC3126905
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=; b=nL4ewuhAv9oyScHu
	e+ClnbT2414Iwn52QoUbnT9u3D32UAd3+XVCe7sMMh3E9BzW+1yWdSu8tiDiLWmv
	uWG1EbsKKI8BR8XwdHpEXv7Jw5v//8kau8jr070/U8W2A7Y51dGPcg4ZuMVvfpxf
	j4r0mfzBhizlcq3EVt7ZgupJQxCwmORBLrvEDVBnI0PppaiFLcQgGQ4d6eX3VQN8
	1hTKMShfesk98FYX0kkpmQt8YEhW/Cx2ormbw6NjFHpGfWRVAy4rgDZRPp/bMiMV
	/I2HNIkL+EYjujndRxemOMqUajJZrdkWp/CUsYBlctWD6/1IamvhDsurGokb80JQ
	cFzugg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbwa6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:23:57 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso5295866a12.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 03:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795605837; x=1796210637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=ia+BShylIKbIPCrYOM1gtCiA7ht57v6tLSiguVvK21cFPrItLN6NulzPhovkB8RLu0
         D6PXlgze7CgGYsCyjjxuzAvMgBZAXnjcxtmU57q/Jlo7cO5ElY9QzIxXqn+zbuyTSqUz
         XLlLGjfmPTrOPTlm7sT4mNUWLCNAPNAbqyaBuFjNjKCKe5UqOa6EFiM9UBod6/CVUXeU
         ToYMcaa0QDZuC/uJIMkCGH+YAd89XP57mm3ZoaaKh6oGU9tcLUl3a7ZszKkO77Z0KU75
         1y17DuKnlWfiwwZvZjJv4j6t81VxEwhLJx1HXrasxrjZaaAjtrmymlF0EhypttiZsmdc
         VA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605837; x=1796210637;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqyE+XGTWOgC2A3mi7+hrJBzXMkQ44TzEigxTeE2xT8=;
        b=JFJu/SyXaG3RQ527ZoGpXUs7VP038EIQ7f/1eKjcdle8jMWvx9twyS/BlaO4BachFP
         UxC9qKvwPvtYBqc4v/5pxjiiv9KJL7B/Fg2UAkmQ8wj3Rex7nLJtklwW0THqjFEOOJwX
         WUdmOjb9VYEf4W7f0NHota19ShWvCJbwZviQ763aSQY49oD6wQeqOwRD6O7QnHG7+yn/
         /FnJ3+cocGjD4QoNrJJEPg5O90aaQIKbv4I2Ncx4r6tbKz0HGd8+6v8yiIpozDdFXTmn
         6IycbfZ68uZWtPN4wh8xmZk7TM++sTVT39LjHdJ8S3opncgL5tSLZySIC4TvXNimrEea
         4K9w==
X-Forwarded-Encrypted: i=1; AL+hErGfjnEXKDzy59DqMZm81fCOhWYQad1MF4CB1UEknU/rV+qSbwXPnR4KnmGyh3TZM5xW+pYZFcmoTGD7@vger.kernel.org
X-Gm-Message-State: APuU4Z8yELOvIcWOsFkqMzX+pUXf5GuVWpaUCLtCQ1bVTlFuImYhMtxJ
	f3fsGeONR9qImH0ux26IqkuWPc4KZBOEvTMw0GkJRaNyg8EEYYUuAZpUUacovoQxuRwf9er07Uo
	29WdYuENsur9E0hw9E9vLbtXAn8MzCk1lmXCVGsGiSruoPt2/vHPqxH9uAZ0evIkz
X-Gm-Gg: AZFdTZeTfPaR4+cXDNLI7r2LxQ8rylzK7dOIZeEFFBrtGObxXeygyQabv/SJbcJPFf7
	ORc0I/dp3J6SXyP9l6fHSlMzficZoknRJUZpqXdnbwa6xeNzdF4tqfPVUz+J9F9wLVsnrFJdt6Q
	jmLWKVtfe1yEZaRwGD9umjDQX2DnV8FDmKZiavF8z7BpfGpySOqPuyihYf0c1elnJ1wgavfWS16
	EWzmp7oNekcq9y89CHZV67J+OcuAdLQ9S46UcnstayCjug3lGvuh1TlnLI8SR9nmGwUaz21wBsB
	5yI65K1+vug29HRvDR5vu/VrPK4M3cJCON/sPqSfhI8qGjW37OpXyrEd/mZivOdZ+0Wxo/M2gH9
	VzoktY7TgapWayc3mMW4YPs0JGoJznENydRv7hPlDhalIoIpLYD7SX2fNLnn4w5UukkivDdbPzw
	ck/rcsU5ZL7vJJVHQ2ocvy8RD9QoypIK9u+Kj36+nd4UrnNcOLSoDCrQNWKHids7uw1Q==
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326632a91.0.1795605837178;
        Wed, 25 Nov 2026 03:23:57 -0800 (PST)
X-Received: by 2002:a17:90b:388c:b0:3ac:e6a:1b2b with SMTP id 98e67ed59e1d1-3b41c5585femr17326617a91.0.1795605836738;
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a34asm26985027a91.3.2026.11.25.03.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:23:56 -0800 (PST)
Message-ID: <6493f02a-5880-4245-86f4-1e1bf00da017@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:53:50 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
 <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX79j3KGPj05C5
 WcFX3EnLgzZ7KpXldOWC1sU/2M4KnowgpQpdXv35KvdAJjKRnFzKHG/d4us+LM3nzX1ncKPq36j
 g0oYqxguhHwLrqQLo7NGu9nQ1izU3tM=
X-Proofpoint-ORIG-GUID: orwg3T7U754SW66wm2aoB1eF9kogv-yt
X-Proofpoint-GUID: orwg3T7U754SW66wm2aoB1eF9kogv-yt
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06c54d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=oGwIKRxBBWau_mrDdCwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfXy/dPE9I0HXr4
 +6dbx4SuxcX2nVTUIBSeJw2npzN8di7/jmynDy5T5CdoHVaxUWdxWo9OHdH9RhWaR1xWt28YNtF
 4eJ5U4ldi/52O4at1sWG5Gm0nE9Oc9RGRFGFhK9C3vocrAw0RFfWNy2iM3M5FwhVeY2jJ3bU64e
 8AJbiXMvsjqPHX08A05m5MzkUtyoMBsi8TsS0gQk6/hyWrLdY19ak0RpCWD4OeoIK7vSjsmc9qy
 e/GOA50exNjQA9zZHKOqfiQGgKhzmJMeaGsDubPySpsmd+BYj1KDnhgZtAkBsu6QQwHpcMTrEcg
 8b5Un2cyp/5F8CPbBwfJbIQ56qnRFzCnx/u5Kwr37vFNcLvSrEzYU9lI6KkUCQCk1MJ3vLBgAm7
 JJgBIBjg8IiX37uWdANEl83nE7HHT8xaJppcpKUbWNjat4/y4OHlVxHPHi9EWzKExXYDTT87fuv
 l/bloIhlg31HCXgj3Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/22/2026 2:16 AM, Linus Walleij wrote:
> On Tue, Nov 10, 2026 at 2:28 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
> 
>>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>>> be owned by remote island io independently of the selected mux function
>>> even if function is non-egpio.
>>>
>>> Presently egpio is treated as a mux function level decision where as
>>> hardware programming guide(hpg) specifies it as pin conf level decision
>>> i.e setting egpio bit is independent of selected mux function, the
>>> driver/apps claims the ownership of the pin if it's egpio capable in
>>> case of mux function being specified as anything other than egpio.
>>
>> I don't understand this. If the pin is not owned by Linux, then simply
>> do not list it. What is the point of listing a pin configuration which
>> should be skipped?
> 
> We have instances of device trees which are maintained in Linux
> being used by e.g. secure world, U-Boot...
> So something else is using it perhaps?
> 
> But I don't think the device tree should decide system partitioning
> like that. I think the boot loader should set gpio-reserved-ranges = ...
> before passing the devicetree to Linux instead, then pass
> other reserved ranges to other operating systems in the
> same physical system etc.
> 
> Yours,
> Linus Walleij

It's being used by a downstream driver which cannot update the pin
muxing in any way and starts accessing the gpio's assuming the
configuration to be as expected and the property is set in the dt node
in overlay. More dt nodes will start using this property as the
upstreaming of those drivers begins.

TLMM is a reconfigurable block and the bootloader is common across
multiple soc's hence it can't be responsible for platform dependent
peripherals enabled in kernel device tree.

