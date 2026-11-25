Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606508;
	b=bIhEj3YCXkAa7PAPmWarqgc33Gcm87tNxAXiZ3xSqAHbpgHRT2TW+0Q/P+OmV8uWwSO4
	 qOUygXSPcEHeFTuLy0BlXkcR2mpd2J1yI6NtLBrW/ZQz9n3oJUsBmt2BNzsyLk/2YZtOh
	 Xhma+H73Z6HxUZiGe7w42xCOGgfUyuQ9+NV9mplbbskMD+yLC70tdglTCFi+KQ5tpU/X8
	 ZvwT9TM72bepsAZ7uNRJLWrmHWBKSNf5325wdBlJ9GkghrzGYaciDegDSaSGrqUxaBFL5
	 wuEKLUmeiN2+4+Wbil65ParkEVEmTPownuOaR0ej0xJUbEY9T1EKVIDjvpZosvZ74uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
	b=RtGgCM6VmkQLn3lSlZKy8vWiDdDDyzq9y+uOeJCk34f84CYUZz20TbLva0CAAcR/gWij
	 lERDHOvBFeuX96bJIO4Ge96fhFEJfqfS1pd4BO3fjeuDwrhwv6tMI4XLi+KjSEL0wnn2Q
	 rj0UviAz5zg+OC1LV3bBh964rckIofznNnQhKaSWMEnhbH1DLdd3gZAliGJd3UGb6sx9q
	 6FBckVLnzNpWr/r8M2mboTuRSpCK1iTIrUsb0oZVYDwIsl+q22Fy6mtHksaUZQ+/3eAqC
	 w2wqklfPNWiAuemRTTgI3BCxX+jJBCZBGWNc32E5W6f76sFnXnRi2+oQ9RUOA8zM1dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DCA606A331
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36DCA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MYzmxXgK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qu6monxU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9moVI3611844
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=; b=MYzmxXgKtuRtdvoM
	2/jIcmBxMyMhwy6zWv5SbPxLcF4LOzA7R7UcO91F01sgan1ZspmnsmkGA+cOm2Dy
	HQx70G7HiSMMYB+43HbQqY8a8U/POeTe31+pJFGHQ+uMQBzvvqy9OvDk2MOq0rka
	65OhKXLYAES9TesJTJm8ZfW37louGstDu1WoOZIgDDRmRawcpZi71Z38KBqx0/bV
	C5SAKD4MrZOT12H+5NKrOfD5epxhWZWJI/VXplb3G/Fl1WUl7jbKW6L2mjnPmBZ2
	n2gnNMebn2gHiHx4DxljHsWZlQZSNJ7aGudIie9I6CFahZIJFnnqPdmLefNMs95p
	awZA6A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbd79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 11:35:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so6871111a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 03:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606506; x=1796211306; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=Qu6monxUigO1xiKQfsBrY9HiaaLURfxH4xzis3QCVarNtpaNv1KtcdiIMyx3f4SMLe
         OPuoBEQEQmuDPdNLny2rHBYiy9WF3/JyK2hkQO/Z2R8qaZN3+N3Nzq3WBX2g+Aw2zzmQ
         b6Hp+0uffZWhvCfJTjWBY/a5xd4vUVE1FkRM83Ibjez5lWlh2822wD0N6CQk7B6RmfPo
         DfT6Lxx+D3NS4j2w9kaN/l4KcNH/v+5L6j2f3ag85BIt5YOb89y96PmT+r8R2PsWNO1+
         5RzCSLNP0qRIwmrzpIuTY+ORPpXOxXU4Cug4/qaQ5cbWgDt4F9VP3qKdFjN1yx4ejbhy
         fTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606506; x=1796211306;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ+fp3JquQO0oKHcp7S7FzUHj2Ake0kZLnTu1r4JNUM=;
        b=Rtb3XPSJkS4LzLsa+jlYfHyNpFp+jlUyMwuLYebFySXFm7kcd8X3UoFaOU1ECafzBU
         UJdYSuGIuecQKvKVzYQ+k1wSSotjGXkVxilFr2OgzdM86OIrc0ngjsT94CEHKHB2uF+O
         PzLTPvnvJ/2gsQ1YVLIQ1CTT+M3o8wKXZY1ldN5gWDYR2Ur5p77536jGSdJ4SFwv+UDS
         QkSq16h7vqIvJYwnTophXJ/sn5HqSUepBa2ZMRMX6hDxmS9THHXTGImSgeK50xEShVSY
         nLn08QSKRCIWlvoht18skNPt4EFEVouCiLYB/9tXM5ev9+wj0thJvjp6sdiupGM1ucey
         yFdQ==
X-Forwarded-Encrypted: i=1; AL+hErFPjgYME694ub2v9BdQwcgRY7KGA6dJaOs7bedMXNv7uomnuDR1uVfze8Foo/UncvW5CTp/KIKTubho@vger.kernel.org
X-Gm-Message-State: APuU4Z9fNjAmvVWAA+7dqu9lMcuMeCcnbQv+Z7U81OPNfuK5Qxy6UyfS
	okQ4eu7thxUuyJmXLJMpAkR3MUGIT77qabJnHHd7E0GiZm8tZm+zuWshmLYEgclq/BJ6sNQHJxk
	3v0PHpt0TXtF6APOM15Ro1k3VVhHvNtKg8pMt7o/RuZyX7Nj8Zz3dPlubwmLHmgdg
X-Gm-Gg: AZFdTZeNRLSIquGHPjcZBl4Eb0PZWzgunVyFTiilMUiF3Zb/pcfO6qug4V1r6eiODoi
	DLjU+vD1Ci1aJGzyZULtpe0eHED44YIoo2tUGAlaBIRw0HLG/Yhz8aINbbOi+aSgAEUZmMMNc+q
	xO9GvwEpVZ7wPN0Jw8qV+QTqdn/NVpz8BR7XlegC6RrJBzlXjrPp0Wln+TJaFfAItSp0k81xzW9
	Ubr7UDx9uYUIn+SARKBVEc5KhEl6jkuuzuUsv4Dh6g8RuRj65kGO0P7dzqDldxhC7jz/pDA0Irk
	0JrpsjptyIoimYBX6+bdaXnxPRXiAtPJVVWR3QF9tLTp/V9DkVugzUsm8aZGqbHuDA6hKSzH1g4
	OfNELTOYQAaFpz5s7PcHjEueRfr896vStWvj/SBfSJE8tcAT5o5WyfZcVzdmpwMugcgo7g9Rdmb
	aWgMh33jf4huptbGVzlA9OnVINljnlZVW9iU6wOdJrEBNuoSPgSyW+EQb5/xpF4Z8uPQ==
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883189a91.22.1795606506468;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
X-Received: by 2002:a17:90b:39a7:b0:3ab:a3ee:33ad with SMTP id 98e67ed59e1d1-3b41c8d95f0mr16883157a91.22.1795606506045;
        Wed, 25 Nov 2026 03:35:06 -0800 (PST)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4dfbe54a2sm6347749a91.17.2026.11.25.03.35.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:35:05 -0800 (PST)
Message-ID: <396403af-1505-44b7-bf21-8c656c64c936@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 17:05:00 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Prasad Sodagudi <quic_psodagud@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com>
 <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MjGKXifwd2TO-slcWtS_TBrMmKMGpONM
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06c7eb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=o-GtmX4WOUCOVLFp2qcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfXxYZRwAFRvcZS
 XBR06li/orZ2es1OH3ef0lZAj/iI2dq17HqFi4VLACxqpf2JMkTCmu85lGlS0DILdC80RvT++P3
 GmAD1ZqmpZ4DXr8wcsaMpisiQ+OXsKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX7RQhC99lkg32
 BS8+bi/seWIsMnCdx8V+krKy37WeFaaxdppm9mLyidSAn5Oyzccgq2sNzQmLNi8DQiCP61yL/HE
 Tuk4yf/HyjXGK0r1vIyg/mKSzXLlvVZHYiA11reCPj2Bwr2vyTkN41zUW83/+nEwAd2xFvXrCrK
 6KE8hs1UVBfD58Cma2q1uhCGSdwodJme+4f0RlzaE7Q+AnBddLTgkf08N85ZvC0uWy9OCrkEX1a
 /a4nvyzsCBezvbpqVQ9AupbZMs0uK0GMsiJzJZllz5o41P15e2VZGsNaP8kY9fdVgLZJtWUKaTZ
 4nzLKBE7NWvhDfvV61gWT42IQCOAeVl5f1sclV1PJv9q18waD/CwrN7x0aqZ4FGHgD0Qd4ovM5T
 uCqHArPHeCH2hlmVzOuBMI9l21Rw0SykHlNu6/LAOtiH+lAhNCe8ozelwwdSDZWhVMkPiaSrvld
 hlWjlolcu2jb7/RFOJg==
X-Proofpoint-ORIG-GUID: MjGKXifwd2TO-slcWtS_TBrMmKMGpONM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/10/2026 6:58 PM, Krzysztof Kozlowski wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:
>> Add "qcom,remote-owned" boolean flag for egpio capable pins since they can
>> be owned by remote island io independently of the selected mux function
>> even if function is non-egpio.
>>
>> Presently egpio is treated as a mux function level decision where as
>> hardware programming guide(hpg) specifies it as pin conf level decision
>> i.e setting egpio bit is independent of selected mux function, the
>> driver/apps claims the ownership of the pin if it's egpio capable in
>> case of mux function being specified as anything other than egpio.
> 
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?
> 
> Best regards,
> Krzysztof
> 

The pin is not owned by linux but is still being used and driven by
linux for it's intended function specified via function= property, which
would mean the required mux config for the function selection has to be
executed in Linux
This property simply allows a second driver/peripheral to use the same
gpio since it's allowed by hardware
