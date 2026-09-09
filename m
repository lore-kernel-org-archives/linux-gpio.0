Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE31556BA1
	for <linux-gpio@vger.kernel.org>; Wed,  9 Sep 2026 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958177; cv=none; b=FWDOf0uogrtCQc5FGh9DgIP+SRqFrjylXmLcQbYt5GDn+8vrYxnvCJHlekzulTM5bgEGvjAJ+d3MtTaKGo6oJ32hBA6WLQuk3pqlWva/9IB8IwzJgS8DEzw8jpV6paD1yuYhaxhOMx2+Rryg8brzAiLoktyaq8aJcgOCZ3tMEdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958177; c=relaxed/simple;
	bh=UehBEV3ZMG/wciks0PfMSfgCCUljRhSKiPcGQLT654o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lf+sAZQWdnFO5xQu1zLLtTmETw2Ol6Wck/qJo8PBZjfY//ii19YJK8a6+H6+Xdj5I64BLjab72skW3AXGygr31vvoe4WpaB/1u2Fm0eKlvLQu98MxNSUgevYnoy4QM0DYZwplxLH23/l9SXiv93ChOtuOxnOFgVTMUsxt0iVFxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgVls4yu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QnAGwsVC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgVls4yu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QnAGwsVC"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU9nc2375977
	for <linux-gpio@vger.kernel.org>; Wed, 9 Sep 2026 12:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wLvGPYsZmyACMVhFtyfDeAgl8E3klYWMYJryBJpTB6I=; b=XgVls4yuaWRkqRXW
	hXnZDx3vz9KWioYdnlZgsEcIdd3qea29qkU0IQs3S6cs4Ernsq+ek/w84gNLuzCE
	k5lmoiNBmG3exNWEjxLcShscLeChxOgADR5IGNnyYgWW7x8Kbvt4UcgUOwYaZbwk
	Cuk7BWNKzHCLtxml82znx335qDgYeJp7QVU9yaoz11Ylr98jnm7pIAVfoLiUjQ3W
	h4eNxb8XBgGTs7pZxSihUejJDAash/J2IDib23fOmFqBy0KkCctHR0Yjz+JcNf85
	PfqRGiGs56YRLb/371YRvqral1LXvDs78TqAryNxNVVeDG+3UFOhm7GBKVWnwXqH
	ZlNPBA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5ru0fsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 12:49:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso1366530285a.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Sep 2026 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788958174; x=1789562974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wLvGPYsZmyACMVhFtyfDeAgl8E3klYWMYJryBJpTB6I=;
        b=QnAGwsVCtU4sCAKYdailmhWSmIN8IHPqV2JgzpsaeMaip1+mu4jtrhUqGx8TBPGuxr
         tQiou3ROZ7/e8UD8MalY3k62kx92Ad8Qw7F/ysKMW1fp9AAgpGVZONyaaYfkyKx1OkOE
         yfTVdCBYguGX82H/J0u1GCgk+K2HFF+px+d0v0wK5/F26n/Q9qnbHfG7n+/rP0mEkGUD
         bXYE6CwrUbFP7QmRiPYbCxkvF9F8xeAsGCQawTFxCgjtS1kADRM/sLDOQK4lfzDN4jdX
         ktzZhatTe7po66fu3qOm0kUDOANQwdzyoE8hdJBmPAaBaXWcB69bScQKh58vB+V0nZoQ
         am5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958174; x=1789562974;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLvGPYsZmyACMVhFtyfDeAgl8E3klYWMYJryBJpTB6I=;
        b=osy2Fx83jRrQoIbrDVE0SK8E2qZQ0uCaGjfJYY4/DAeMpLRwOaNS28xGK6bsnbcFcD
         xmPf/GvAjHQIA5+Kz+KFk2L6RqIFbMr6ZKqllRHhlLLSUw7E/mAY+CdDjG+VZrXLxcMw
         DaTiu5JGex+OZ5GBiBwE5hqaoFgernqhUtFCL7j5WeHkxVwcLG/wHKC+NksSYtwMyBwL
         +XowjihOMeDJVmr8Di6+tqm5A50EM2uiKyaRSAccQdOqXn0i4d8sEz0QtWgo1Sqd92KD
         CY7IHsPOcxIVOIpHfug5BpkvwJAmoIyEQGVovpKRT+4WIaS6m2txnauUFYRvAz5hgc1m
         mA+g==
X-Gm-Message-State: AFuF++nyLIWIT05QG4SzmzPtSMpnFL2gdrVXwFK46akH+n+vTdjW8QJ1
	CZXa/7TEER4bz0J5AWY9kJyl5VTawWohqLoSV/SlZkZCMNxnCTdhNQ9esUhmJvhGWUhE59P0isU
	jxZAMiI8OmXIh8B/Vix+nB/f4F0B8TyWR4xVTf3aiN5EMhCkAiol9S8QF2QY2c94l2xMqD0wb
X-Gm-Gg: AYBFou3G+Qqy+Dj0WujSb8qKksKOW5ofOUz7CBCKpMgnd2YEBYDkr9953Rxqb7uijTo
	mBNhoQnwGKKVy/jSYswboCGbJxZmCdiJC7ktxBMfJuiWnUGKEqw8mHRHwepuYf5DcHDnJYGYgbO
	Fb4YQfEII6H6l3S9au0+4p2Im1Bf3vpgxHHNvZH2hL/E05rsfM8kJErcMsObljFuTDO5vcgKK/C
	qikzPJZBvvcNmjP/y4UHxJ0WoC6aPp/gB4F1Ptjvu4TF5wnuwND3nPYO/BntAUNOPTsj4manDvy
	Egm5cX9lsJ01bjEy/72wVI8EZbsBL1XsF9cmDuIPflxtu12jrKI+F6Ny3f3lYhckGSGo6JDfSFE
	YU2aIaMHVAAcFErJBBTHRsn0t9rA=
X-Received: by 2002:a05:620a:164b:b0:936:af34:468e with SMTP id af79cd13be357-9396dead470mr2491478285a.4.1788958173942;
        Wed, 09 Sep 2026 05:49:33 -0700 (PDT)
X-Received: by 2002:a05:620a:164b:b0:936:af34:468e with SMTP id af79cd13be357-9396dead470mr2491441585a.4.1788958168708;
        Wed, 09 Sep 2026 05:49:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:de8b:7fd5:2738:cc2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm38324634f8f.9.2026.09.09.05.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:49:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Cosmo Chou <cosmo.chou@quantatw.com>,
        Peter Yin <Peter.Yin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
Subject: Re: [libgpiod v1.6.5][PATCH] core: gracefully handle disappearing chips during iteration
Date: Wed,  9 Sep 2026 14:49:26 +0200
Message-ID: <178895783054.21621.11722044976661998259.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260908-gpiofind-error-enodev-v1-1-c7756aab9568@gmail.com>
References: <20260908-gpiofind-error-enodev-v1-1-c7756aab9568@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M+997Sws c=1 sm=1 tr=0 ts=6aa155de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UFs3nsGskLbaCoNAOmsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: XdAWofGupiqyhvdNua6xMU0JXyD3EtRc
X-Proofpoint-ORIG-GUID: XdAWofGupiqyhvdNua6xMU0JXyD3EtRc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0MyBTYWx0ZWRfXywclClgZIyOl
 QCaQ9cPW4Xd/roVEXK+lVaoQGNgn36L6mvxaSUtlEXDO55hNp42zOOpTwetRaUChf17Llt+gMAO
 VVLs02/2DnoRemxczN1/gq+SeM3FIKU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0MyBTYWx0ZWRfX7qeRu4hZ9kzo
 9oWaV37Dnoi6SObUxuQ60i/ijV03NLYLfFg+3ZpwLf3uWXAL4S8wMZQny/8o0yPFg4Yzs/aOYXk
 JSYHBCuK+S2tbyz2pqqr8rsOwLCN1+y3gXWe171z61dBfXDoBaDMjlMZXtz9BspQDckoIlM1d8b
 uqapUSR/G2wLhFC/R2Oej2aOKzz9velamwUudDftzXlxHJ9/qk7zpGaNCLat3l+KInuX2WIyn2w
 txdFTwcywcsPyfYoEW5MilwUghkLyrjO7DeV9PuGo2WPtjkMFMWIU1GNB6ZrdYZqXCBH2sWFJ1m
 92tGz9645Z/rTFZmDiFsK7wQ3wISZH1Zc0X9yo9kT67wSBAM43BTWR8cJgk/CC1v1JD28sjvYjd
 E7hlnKaUjD3F3rX3ZAasFVqyECnJGj0Ga2zL2oaps1+/FSEbdZZhTOwjNSCHN6m1b8IL52+zdli
 wT/yCfXtlcLp0fYPeaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090143


On Tue, 08 Sep 2026 21:05:07 +0800, Potin Lai wrote:
> When hotpluggable GPIO controllers (like USB devices) are dynamically
> added or removed, a race condition can occur. A chip's device node might
> be present when iterating through /dev, but the chip could disappear by
> the time we try to open it or query its lines.
> 
> Previously, this caused tools like 'gpiofind' to incorrectly abort with
> a 'No such device' (ENODEV) error if any chip on the system vanished
> during the search.
> 
> [...]

Applied, thanks!

[1/1] core: gracefully handle disappearing chips during iteration
      https://git.kernel.org/brgl/c/40f18f16f573e6bf091d83cb1677e7386d0b8495

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
