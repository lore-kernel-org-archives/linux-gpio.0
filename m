Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958213;
	b=Siuj+erl0y6vc2IvABAFXkBc+Htqeyy/HlKpHeYeA12/bjcN0oLtT9RrsO02HWW3BI22
	 30TUtvTJOf2GQB2RDG7J1EhCUDg/LuJVbSDSAibZs9n+6chzTP69q8q051YgtTELXqFfW
	 dpLNrvgFjdbMXjSFvIbhHvxAfA75toKnW1Ihy4ws+peoDCJTEyigxn2fPcLAIwYLT/p9a
	 reeXGr+odDmWyXpJxQaTgycCouShGX/oNLHLCarj63FxrsNFWOP8UQxz0c7vClhAQzJxM
	 oNb+P6ivf2n4yG7xv4C9gwLQ2QBfdR195F0ZQ/9a8fXFNHC58hXPGR245bZgH/Etufw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
	b=pEXfYQYGB1Mh/4MDfMEP8gYxI1Elp2rbgPnh/0UeUdciB6ffLhXIbzThOEISOihOyZAt
	 PJfR8phicDNHJkc2nWCvQNj+u2O+HmM4scFrNQjrniqAQbBIyWHS8gHiufS+cO6Hmkoyf
	 y17Gb2JYd0qPfEWP/tymjEkWbWt8OQgEH9Rng9+86VLML0F8O0s14jBO9gbugNn4a3vF7
	 69M06veGP+Nq4eCmfVqATzzj8A4sh//bRGQtgFVGuH8jic3ls7q4IG3nnmuqAdY2SQySI
	 D4ay+CfPmALXMgvA6XvDr7fjhx9wo8qujUYyDnN+V+Y+2QmzWm3NBIe47VLhQMoMF1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Djh+AL/+";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OhvJ4FX7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E26606D806
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 09:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2E26606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Djh+AL/+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OhvJ4FX7
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R6213243860
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 09:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=; b=Djh+AL/+2B4ZApp5
	yOwfqn6TlwAScj+d/ugY0FXMbUgR5g1+1rMHR6RvMAOf+hJ+Pttm/UrErNDHFHDR
	qOtM8Wz7A3XlGzghzTJzQMqdWfDHxkwp1WDVthuV7/Ff75La540KRE0FciQU3lfZ
	sTZT5grtLChD1vzby7iSkYInHjgOzAtG5NBGUR+C8DXmcTHDy/nVbLUhgF//OwnZ
	DXl4YjsCjlQKErrNql4OQs28tb3jGUiWLi+LQPxREIGjHMPr/0rS7CeWlJwyRHnk
	JpHcanVHutOof1g8hfUqKFfehC87yP2NNbKrc+dH/ObaL86I0deabSRSmD/jeG5U
	NC1P+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa250t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:43:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so104069185a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958211; x=1794563011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=OhvJ4FX7LG+WpvGluyN2NDNGy6p/RL8XW7NM13JYzS9+8MEvgAZyuA8kPovD6e88/Q
         RzUAWFG05nR2I569LzBZPcYZCYFD09f+N7JyZH3VrMCbapWfF+fl1b2I7p6HBuQPqmkl
         Mz0YTIU/q9hwRa1P0jg3yGT6A76mzyRlerO9Ex/Xr+Ruy4xOHrVYg6W3ZCRfuiKyoozQ
         /zMxtNgA1Qrgz7hWcjT5EDmZAKATMBnv35Uc50ktpPUyVuwsmpEfAt6tlbry3G+GdjZg
         rlU+R7fWsVi5usvcjPRZT5ytwI6b8Z5CYHambiWBax1LwKBXjVQQClKEc9mf8wToqsb+
         MPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958211; x=1794563011;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZXYuUJlq0DIs/ZhnbnzwAKYCaaO0O+UtNup8mIm1co=;
        b=Umy81od/plOIxWTYCi7prtD471omyLbIioaMxtFL363bxf8mKWuhTNne7D1/YrA2Pa
         iYfie1/hRMm5YPs3Iy9djX3/yey3C4yZ8tSgM5EWqje1Tuk2z2xtX1Ckr4Si+lh785rh
         5CnpmHhah2L/65bkLO2TgUy99ldpN2afPZV54N13TFQaxI/JddJORT01V0XJ5SaAzhx6
         qqUjz0rtCZ9QbF3rXWyjfmbW/GBJ4auYsmvf1ldpwlaWwyl+XqZZzK0kirfD8o3nLNLe
         SDCeCUR9zGyJtvTkKFuv/EjjRzpGCzKcrF2K578b7Hw50FVIT4EHsg1yhZyDofzBZ9qA
         HnZg==
X-Forwarded-Encrypted: i=1; AKwUvBy7A70/pF5pZ52uwMKIXSyPcCDPD+nZVfVmsAYbYoyfuFX7D0nOwXoYrqNYq3ahpiG8yWh1kQaJoDFr@vger.kernel.org
X-Gm-Message-State: APuU4Z/GXqscenzbvKZv3F+P2LyrukUeEeGlhBjV+3d1aY54WnGenrTh
	1Zkm6wAnO4G+VP3OZxlxnIdqlvBZyPkvSbRu1pPRR8RNcjsFUqTyUOkYV+GPnQdtFjowwgKZ6kH
	z44F9oKxMhNsvh2XEz94AvgjQ+e21PVZoiE79UpBSOh+w3oWkcilENUSdf3WgvEUO
X-Gm-Gg: AYBFou12YSzbAYecmUrG+wwRpp9Qv6HVhWVpHFwU5shlDujKNmXihkLRMwIJIRlE2Sb
	f+NqEApmebZcjxB5NULfUgwkQ5R4638XBn/ZflreN4ktX3beWNKgwoinYu4RwMSYYT9bQcYW/o4
	PBLpxbUtL9HInSCUysmmlWrFVo6ZfxtvEVuqSAzDWbLwFICsSIm7OibFy4wR+2nCHDRjDwZlKil
	OWdAVZ/AP0C2NcAZqNnJns5FnmrQKmJCdpQQjCO53rtHtfpNV9f/ioN3chkp8T3CnRGK+80Aa//
	bu5a8ScDYs1tr+65EnGtu5Pn+ijDKn3VSQrpP8j+e614mr/fcPyp6GEc/8C1snGk8Zqavysz0oq
	vizUEun19qvQWpne1ZbHYYUb36f8+FvM3nguiS4otliAHvz1ezsb0+/FEycJlbsnYJEBNtoL9rv
	uf
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244268285a.83.1793958211191;
        Fri, 06 Nov 2026 01:43:31 -0800 (PST)
X-Received: by 2002:a05:620a:1794:b0:93e:e1fd:b87f with SMTP id af79cd13be357-945f368b0e7mr244266685a.83.1793958210720;
        Fri, 06 Nov 2026 01:43:30 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm41299075e9.2.2026.11.06.01.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:43:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Conor Dooley <conor.dooley@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Isaac Adjei <code@isaacadjei.me>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpio: mpfs: reject unsupported interrupt types
Date: Fri,  6 Nov 2026 10:43:28 +0100
Message-ID: <179395820571.6762.15630695302653081248.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
References: <20261105-gpio-mpfs-irq-type-v1-1-cbb2b0b2a807@isaacadjei.me>
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
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aeda144 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=kmRQxf5D32N2tAlX4cYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX1I60r8PHlKeA
 ykSfTYJR1W21WvBBgrI8496m518x4sNMyguH8+MIP7R4L9WqqQxxLzHILfl8A2R3h4NrejqtyN/
 PaAKrIigSdQnFpk7OOrp8ZkaC2PqVXc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX9N0Q0eRzsqls
 swiFkg7HOZIaUq+SD2nfolsgq4TT+y99egBcU7x1WqWgOJ12G1Z+EaW+xSKJj3Nq6JR+KHLXv8v
 dgUyQ8CaAC3IPvIKFK1Weur6ab+WPJXHPt9UiI9YFTre1abdzQk8mDAe4v/4hsZChrx3kDWTEtH
 gTYm6xHvqa3+4XZgv18WDPOhGBm9V93ZRTLAo8s1GdXYkkovHT1jqheZGj7BS4tUEw7UhMCiDQl
 +M4O90FxIuBp9FpCWLb5oXm29VKXqyaHWvOpdp83MYVW/+CYRQ3xE/2zj6cMIhn4rZU/3BTT/vf
 6dooIPX2fux4J/yFD1VppWUYfxk9SaYAsk4nTvZnNYqJAvrnlUAFdI+vnJFNM0HDKeYuo88UG4w
 cCiyiqmcBDUzEbBqGER5JQvbqs5RYMTjvSpAcxQFcSYMKKzFe83hYGTSN5riZU/ChKtYx8lrQw1
 u7vwpLfVV/Jyu/KVipA==
X-Proofpoint-GUID: m8NXTwPD67VxdL48gwvEDXUjTypsjmAP
X-Proofpoint-ORIG-GUID: m8NXTwPD67VxdL48gwvEDXUjTypsjmAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060038


On Thu, 05 Nov 2026 08:16:51 +0000, Isaac Adjei wrote:
> The switch statement in mpfs_gpio_irq_set_type() does not handle
> unsupported interrupt types. For example, IRQ_TYPE_NONE is not listed.
> 
> When an unsupported type is passed, interrupt_type remains
> uninitialised. Its undefined value is then written to the GPIO control
> register. The function still returns 0, making the caller believe the
> operation succeeded.
> 
> [...]

Applied, thanks!

[1/1] gpio: mpfs: reject unsupported interrupt types
      https://git.kernel.org/brgl/c/cfbd01eddaf5bfdd4f53560013fe830571a186e9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
