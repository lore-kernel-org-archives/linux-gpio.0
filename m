Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702275;
	b=aHoqyNmlWWjQQFSL66jOBfC6G6zRr3w6n8PFxI9ognEll1B3z7CfuCzOsJzsJFxlsH8X
	 guNVayHrMab5sqg2PHGGt8Eh1SIAo4RfUpvDQ6yrIRfhuiQSIPKJiATgrF6OmxTt14+Rt
	 ImxXB1lmaP2u/s6Bp49ocpfEQJdL30ALVouekwA5t7TA/Dlbm33Gtrp7duCnl3olsYcWR
	 ZSvDuE1Inw2KDzEE5lX5hLvH/S2JphVdwHF+yT3XA01Zq/oDB6kgv9w+7CXLc/VIm+puS
	 Fee9g2Zv6MPBRpoylXyasYYWukxv6SFOGAt9VAM/f87eriQ+KZZxoEynL8HHjr27NzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
	b=dPUJ+vZefCMgRIUqMMiwuD2A1WmczkckP344iYT+QTj/gsYsCAwnEBaQzBGQggytianN
	 PaW+8JOE0jtfsz1wm5pZXw+8d3XaXzAyVjGAqTRZYMKCwn/UtIjCzt3cPEBjTA7OnxCPA
	 odQZZL0bLfZ9RIiAK3Zmj2RYQSlbarN/0Cu2DUQhCTt9xUJ4PyiOh4eNoNORP0Cpi0bhq
	 sQplrdt1j2QxhaSfDp07eqxCVFy+7bop3fnBYrPa7IaDo4hvEoq2UzH0eV2a2ESjQztl3
	 vemOrY7m+DqCYO3LhLvea7UH48vcZX4/nZI19y7Bv831ku4BmSN3bvZw+eJlNhnA6tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrjLyzQb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjWFp1I5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215BF606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YrjLyzQb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjWFp1I5
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVRaR3893667
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=; b=YrjLyzQbPQuqAF13
	fLqFZi0YYUDLach/z+WWj8mJg/W+n5athvKnEyI9CHfbsjKmmOqTqaXzkk80+iCG
	rTweA0qcoZvgRjLPgMoQL6kxZR3/yYbTtYTv6Vopyox86SWAcbW3ZAa6iuByCBhz
	c0WVYOZZTeKEZtyqLjd40ceb3chelKE4TlGObJXbtCgrn0C1Jz1ryuQU5ZeVKwd1
	6+edBF/CTISzVEEy4qaflp02Ji+Ogm74MuZaNRK+KX+hnfT/OMHUivSNdEnEuUTN
	vLPbK3Sd9YEqLhAIaIW798IJxrObK6Wlp5yJCbEQCaSU7JHBVEFiLN5ai/L4uT4F
	jSxj0g==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm814r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:11:13 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b37869f851so106340527b3.2
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702272; x=1796307072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=YjWFp1I58/mqA91rEGT1Lmu041a3W4FfTDKTOy3LG/46I+WBHjG4M/ihqpyMEL94P4
         zWfOkMup7PuxWN9WXrUPTpHETrjUS0KkGbojmrBo03FONWxfDsceS2Pqqr6RbfuEl0wK
         JoIFsET6LdQ067Ns8DLsPU4jw9wc4rY8etGWcrVXzTfjsLi4ReD520n+ljQi5Aa7e9WU
         pN1YmGj+UzemiTrxO3KAZv1Gohlk2q+gCU2FlXGnhgs5bDmelPSB0MYzraQHV2nzeZR9
         dUzoe4uhbo07zgmjrdlO4sE6tq+fNTa0C7HyU/W4WAzwpZZLByFVNlKQtoQpkcNtQ1e9
         RYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702272; x=1796307072;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbQv9VmMv519RrDxoB3V8STwBIfdnMTFREJPjfzwsyI=;
        b=SBU1R5W1Hs+Qbz4Lf8QOaiN1ItsMmCTzupG//U9gBZBkAQq4KafToFPTpecMlUWyPx
         ziyjsAdQivhlAybeMK+w5vqZdfA99meEgG1Id7aibpL0qCiPRpEJe+VsWkSWzvGyekLj
         +WqALr5BgHzgVFqHykOLB+tL03fFJxtkaZhNuXOvo9g817HRa7VfePDBK4Cwy+zcHT0b
         GjmFoy+O0M9/MVMkvMf49POd1N4K4H4IhlMtC+Un2SAZGTkCo0DQ/ljwyluMuYIMTGTB
         GMNezOd46NmEcedtxXktEIsW3gvxLS71Ha0ZMFU81bGFMajBpOtoZTWZFwXAjqKqPxbA
         VtEQ==
X-Forwarded-Encrypted: i=1; AL+hErH9Nhwy1HcBjqvFqRqw41SLvySCqx+I/lY17qMrVF3HfBxbkGgazErhgGlXEuDFNLQdmfvOUhviyJOl@vger.kernel.org
X-Gm-Message-State: APuU4Z+6uUkaBlYSnfjtH+N1fqQMSYGfO89UVlEquTLu4O7wasRAsKK9
	KMS3eVYCjedPhSH4Lh//POSeVtaFZP+zdLdqQJO9xRlUTtJ1K/iOqMJXllENemU+UjYOfHHkKDk
	OMgi+7BnEtfGRWpQSBpuk5lnlMrJVUsyxSSwTcSouGB4IfaqUe2M3x6HtFF5GZ9BD
X-Gm-Gg: AZFdTZfbAcTnJoB7sqqbgBrGgxk5zBCilsTg8fSrX5EUzpNpV9YLwJ3AaPzW17Wm31I
	LCGxnl2MpAOXraV3peEaFD3rbtC28h3wf4jDu4odI47vODzGCGVtZ5/B9lOB2SZ5U4w4Pi7Ec43
	Iowb4MwWukmmOFro76z0VO/NOcUk8ZavosfWDc1W4XoC9783Z2vcghrHTpNAKomrsbgTIpBoAr0
	FyZVawlOTnT1rG0vsMRUndzh12niylrErQMz/lqEtLln91JoqDQgSML0hZONsCiomQbyV5GZhlD
	zj+e4D62X3Oq8jQFVKogmhyILkb6/9RloeXsr2YT/pkOskfQTdZpaaB3SI/hazfED5WnLfBNmUl
	F91R6aEGx6hWhbya69PC7Y2Hh7bSavjqLMnP2hvhKBVrnX66TFdgUcp8vchLuOgscOtAIUSZuPU
	SVPIqobRJGc4sgW1TryCdxRjrTXSrTBdUlDqkzS2Uh8Ktd7kTdb1qX46R8Dlmngw==
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918287b3.63.1795702272488;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
X-Received: by 2002:a05:690c:9a8f:b0:8b4:dc8e:2e6f with SMTP id 00721157ae682-8b520514f25mr71918127b3.63.1795702272013;
        Thu, 26 Nov 2026 06:11:12 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm42005648f8f.2.2026.11.26.06.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:11:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: aspeed: Fix potential coprocessor bank map leak
Date: Thu, 26 Nov 2026 15:11:09 +0100
Message-ID: <179570226688.21819.14587859111511548697.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
References: <20261124135833.2275409-1-liguangshuo@mail.sdu.edu.cn>
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
X-Proofpoint-ORIG-GUID: rESLQwwl66m0YAbMnoPKVtkC3MFmvvdb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX/7XVH2VWbt0Z
 8P3YBlOfHukawdJx11YDydPCniTMmmi906n98Ybx7kIbg99/ec53QwgQc+YXTbBPKE730Fd5oMd
 NsBv5evlLregT+vUoJZH9fZO6ExDBMQ=
X-Proofpoint-GUID: rESLQwwl66m0YAbMnoPKVtkC3MFmvvdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX7guVineLg6rk
 hor1lZtZenFokLWJ+MaBYTHvRN1ecNDW6rFFMVahzQiFl07mM/RpGCa9vqpto9COWE53oAqogXc
 J5Apzu0y3YDtqo+WeJviM0ZKL0Wu9OmHkJjBCiNTHzknT9M8pFit2rnLZUg20xY9m/Cm581fuvI
 SgYDKGGiPCLppsSeSWxX6EVIhY0WEgTBt0dgHH1udWRxrnUfq+yKxIXhQNh/0oNTLIICbzrVqY9
 +LPzfbu3L9r8H39unYzTO5YkYmFYAznP6MUf+C2miVzErG2k9o7AeXCFf2yeiMzu6I3+AgjFQ9h
 OJQwyCvDQRzDcJ+QtehyacuVOXtADqXfG+Q7Z41n5fO8veeGBYaqPbqnVhS6orj7DpmATe0SQrx
 NspCEOACqSNzbt5JVYiKKRicGx9x6ypBQxnDYYNbPTnOC2eQ6GK4Ly0Y/9jbd5pCqm4ys9W4xcb
 d7OUKNNVn0QqWkC4/uQ==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b083e01 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TMjF35BhI2Zkm1y86xwA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Tue, 24 Nov 2026 21:58:32 +0800, Guangshuo Li wrote:
> The coprocessor bank map is allocated lazily but is never freed when
> the GPIO controller is removed. Its only owner is the device-managed
> GPIO private data.
> 
> Allocate the map with the controller's managed resources before
> registering the GPIO chip, so chip removal finishes before the map
> is freed. Round up the bank count to cover a partial last bank.
> 
> [...]

Applied, thanks!

[1/1] gpio: aspeed: Fix potential coprocessor bank map leak
      https://git.kernel.org/brgl/c/f18a4698b0124f77549c23600fa5105bac2951f2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
