Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793610320;
	b=yFB4b0dW97LWqXbMaq9OZmA2hugqUdqeYrk/EDYgS1nBLI1FqAU6eYrXV8qFmzFvSxh2
	 ftjlAakPomNUJoH1VPBC9iP01N+bmQa9tIwBjpGr5x/GHH8E65tI77YEr7WzGNL3xANJM
	 PPP9M2pIZNZQlQPVmyZf8On/eTa6pzgpHpk3eTCiv5ru3CZSS44SfUyP4V4UIGAIJZRFu
	 JJ67dv+aWQIjdSAx0zF354lU8+ZYp0zILHd5YHUn8bBKz5PYVYgNMMZILRGI93S8YhMO7
	 bqWrQBvhPqOYfLRD4ZRjBo26hgxHERaz4nFGSVijZ4kKvtIR7JsTJeNh6s9rz0EUkEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
	b=1/WpXeNCDfgofkFOMd18u4fC8rCRxaH04cvcpu1e9/xYocDCR22Dqs/TlAoka0PhTe0K
	 6FIUfX18m6VBmOpPq2TuotjyRAUaeAjuSTS+TSBaBL4r3B/11TEc6496YojDr434e2xne
	 opjs9cJzCrtfbmzI9g62wyzh9lf3xODSBZEy+53yPJ6VsJ9B73+oIY69sM3JfhUGWAc/F
	 jnOyd8DB/yVfJgWuB+x8p8XDr2lp7+gLlkWbabDjZXD49uLasqKlM7Y0qGsu1cnmQUtKp
	 EjPifz0JZ90lu2zZOTByF88B/3APGyKKqpMOgfX5vGhEDKAoxeH5kZhUo+EmJFsdDEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JOgZyrX3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvZn5LCc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6483606A32C
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6483606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JOgZyrX3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VvZn5LCc
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26phn73121059
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=; b=JOgZyrX3kdzENdnY
	09o1M+edz1ifIjHAGM8YozU8LJoaf3KblK/ncsGi3cyVN1DXFREWyq5akJRnsHRQ
	v0pqhYXVzdWUjMYSUigDfL9o6xg5XpvCfBZkt/+jbP0J2MG1SM+qPn9sUh90oARQ
	JbPqa7KkWtQ89UqDSwoc1JGhr3wUU7qhm4IZFG3mUkwb/KV9JgnDMKfjuf41at/r
	SirCjG+EaOLKJu2w+q4C10odpUtsurUQglFCfqAZgp6X5SLmpGMq79fFJd6u24LW
	UQkyDElsOw9YJKDuUSTwWW4wDXZa3R8IYDd+yOTFHnahd8CEj2yonTVvK2gqQhvN
	+QXArw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmergmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:05:18 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc3a482af7so2673728137.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610318; x=1794215118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
        b=VvZn5LCcoAuw5MJVsn+hgrEXTumM0BJkppJfKAdIulwE4eYrO5A5Ssdw2jBo9nKmfR
         y96Azy3vKF/hikZTK+LvQdfSQ6h7KpoIRo+9VAl0SVmpDRQpqW46Aq0xyctXnaY5Xvr5
         zpARz2m+Hph8PAE5Croi5TkZGk2vSJ6GGgDT78dDkEVyUY8cqhY5JzUobCysmjBs5xTh
         BUYng9mde0gMm/Xv7Tu4D8n2pNv84ic5DN5JkLKh5TTtdvzrXynl8YdARYQO3OQ2wJwQ
         pOGK92J5WG1jbkiRTdr8DSI2QS9pf49cjwjF5sf97jU4tWWjAL58zj7pa8DDDTbWcA84
         WhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610318; x=1794215118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KqZw1WH+DyzLOfDxynaV8G+/nM6Cn6K0hPM/clAcslc=;
        b=mbwq+MCdeCFODOgrPIwLBk1Y9lXLkhWihh6fATR/N7fRmiYhZpKPEsXS2vkLTwgtOo
         IH13K8OFR6zZE2C10GKoN7hfAWvCKGsvloDTNKbkB9WZPQqcKwYuoutb+upkaWce0rBR
         Fk3u9FBncOAf7J0tSBuXQLjUQf0rlxk0kq2dXuxTW/T/dmNU9VRp+n3ZAWJtE1aoKcog
         g4oQLhXc6PltwyNB4uLLEhsLOoq82hcDTtx/PjK6THHyAAHMGbR3o5MwqzgodUDhwqJU
         OMf7OCVgrETySBhfO1WMY7GEUKq1+QjybvejXqY5Jxm7X6Gt82ZyUnP1WcFuu3R5KoAq
         13Tg==
X-Gm-Message-State: APuU4Z8Ccj++50aijflWK5S7cl4Mqj1ImZkLWUoEGgVEbq9go3UrkME7
	bFcYcb+3ga+cGi1Ct+9vu8B8L6+jiwIH+lLi6H0GU1RwcQrC87E61LThmUJn0DBoTJL4kBbeDZk
	K7KBw9e9CqScBn2J9tAY9aWaAXapqWCDhNOds0xthkEOKD27OQ03DPfUkwPw+ACPaSYOs72F+
X-Gm-Gg: AYBFou1d8hftroeI/K5DzjIoyb2g0awOtACnXruEubLUFVizrVqaxJusmK46DuMcr34
	qwwIXTVh6IvFN6IxvqCrpm7jmv4MNfO6akOn/LmHdcZO9nUnrLvzbwm68bqA1CNg5cjsFCvy2va
	1sY7cQ+nqrIeemsDfKZnhrThm+Gb9US3imQvUcKP4uP3w9caXCZOpPdXHjsioJ2bW/R2J0GuopJ
	daKJ8HxvMfp+meSHjllcd/F3OBkMvtszddIOUyAsUTzig1N1kKRnXiLqz/4N5k1qgg4+cjUjfJ6
	sd7ZltAMkN04htsWTVulY4zCeDG9chfaqKIxgl/SncqiLW9fsObhUwwVYrrmTH4mHbisO9nK82V
	1rR8ugT1wZPf6+YD7vzXm06yeLx7FYKV2DBEL/exlcOuXFcqqADQhJZns9SAjT/s/In7UfEYdpk
	oz
X-Received: by 2002:a05:6102:809e:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d07269b132mr4235202137.18.1793610318049;
        Mon, 02 Nov 2026 01:05:18 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7d0:6cf3:d8f0 with SMTP id ada2fe7eead31-7d07269b132mr4235190137.18.1793610317584;
        Mon, 02 Nov 2026 01:05:17 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm17342081f8f.28.2026.11.02.01.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Date: Mon,  2 Nov 2026 10:05:11 +0100
Message-ID: <179361030997.39187.2222619455151380219.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8524e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wRwPfHjqSs-fDICwijwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8FbWFF+ltCHk
 SyMI5Og12+QSYavhvzON+PmgcOBILnMNbqFFji2Ec0ypz2t62+hw5wyRBxptQ/2+/UF9UEObk2G
 wEpliwEqY0ElJlb5m8cyaDFDxShrutufaFgn801f2lToACRSUvhu70BV1M3LixhEyEwrZszeGD/
 kSkpElOs5lqZLnQcM3leu6kiN43+5YsElLA6WuBmHY+HOGNyKbFUlINXE9sl8pN9eNvDPpUATnR
 EcfGcCTWUFKsAoJkSrBS40cQWbArqpo8uOfv/xNABEI2pQqGt53lxQ6PecOAZFCRFQJQaOIxOAu
 IIMJNnpNAzGQbtJ9N/gNpoFC3OdJvEtplboRhGb0hYAxAzcTblJqmHqbekZ2B+ywXnqgDWkWCSz
 8WKOdYW7pLSmgwLz/csgyRJEsuofssyTdRVuD/PR34R2r/a3ALKZVsKAnEySXpsuMcaG5sgUPxH
 ReKTLq1OwUAa0I4Yhxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX6hKI9tPaZ0+p
 zr3ifbbF7oQWYAedY7qnZZr7MFTGXzXQS3I+83D1VEkRIW95d1TvUsOzPAtmLtFN5n+gERpfpdb
 RuT9MVx60S8Wl5yVhEYDoUCYT2LSpHA=
X-Proofpoint-ORIG-GUID: ycoRyemATnnbEDXHKhaFh_QLFim8G4wL
X-Proofpoint-GUID: ycoRyemATnnbEDXHKhaFh_QLFim8G4wL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020036


On Wed, 21 Oct 2026 14:31:41 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/5d82da6d3b86301de5b13d7ab4edd9f0a1f6dc5f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
