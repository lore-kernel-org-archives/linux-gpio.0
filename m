Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225023DB634
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785486780; cv=none; b=dfS7nBpaWM/OEgn7VreShRf8R0crBza5bn3hQRmtghI7gKB8khnM2SBIVCWvlzn32TVPahE5m3EF+3ZSz2qaouFlWKqnkNpKMF5HMl+XJAsuczmDa37FFG81rWJTOK72VKfZ4M0aBqRWqOz8csVxRuI/3hAwFhZXtO19JgclYe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785486780; c=relaxed/simple;
	bh=U1LozG4rZEEjWVwQ3I7ZFVikTNJQv6vZJq2l659olmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rHdLLY/mPXC6qbS7MZK1paI0r879aKXcXqz31+GrOFjI+WWhc+cVx69LiqDpYUM93DPHlYPsjnDePi+KMAacBIk7cX6Q5B1JPOq9IEKwaVKjEXphxKqZempk3osCbnD2uikeb0urS8CwhGiioqFTgvwe9cjUjcoRJ43DvOF5+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChjfycUc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksEvyWR7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChjfycUc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksEvyWR7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8W9FW3959210
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6EGfAxtNNH/KIZ1TzK6fLYayMFk1+xfs+0d3KiAm9GU=; b=ChjfycUc9iL4SIrP
	4qoSSUu6u/m2kgOu5+cYUNDxYeqnmqgvOVCjdyL7ChAuEKViLqHAccBRy0WPuPbL
	gCYpo7dLiKYw1iw+YiTxoy5jOYbxvxwIecwXnf4nPnogn+/3zmAdxPIcXuSaFFcr
	fbIK01FwPBCFRIfRgdItD1H9CmXAgGu0oxxCWD1uHqU6yhYgVoDJsIg1UjPE8YR5
	/hC3kdiVn/GJZuUv4I89g8+WQNRKWuofE1A/m+cd1r64kdls12ZnyK8Hhl9JD/Me
	CDQlEopNtuWRUbIomfXrtNfQU1eAbCIoe+su51K1rlVu1PQQe6B/75TYgRsCW1KT
	oGrRLw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frr9e8030-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 08:32:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c12e43b98so6369091cf.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 Jul 2026 01:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785486777; x=1786091577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6EGfAxtNNH/KIZ1TzK6fLYayMFk1+xfs+0d3KiAm9GU=;
        b=ksEvyWR78ry0QaPd6B3nvBv6EZyrom0lop09n9Ht9EjQ+xr9yyKJQLOtQPJXZMatNY
         ovKMXafAbwPE8M9c6Lenijws7kyJOm0mvbuXNTEzGUEDTSWoo1YnO0y+bkAy0WoEbXK5
         adnTEDDh/9Blk1lApkA9iTxEBobqeTlxcaoGDG0EmDL2bodMMjNWcP35wKg5eVCL1XwR
         mzyBn5Hls3SDZSfsmy6cmWCcUXfugCgFZILOqRdepb3l5MJJp1V8rIMhC3sqlMoIO8K6
         DDOl0UFAveyPT0W3E6tbbwEiEBBRZWka/hFk96HdS/kpO0/OYas3Dsn+eEKzJsr12xbk
         GQUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785486777; x=1786091577;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EGfAxtNNH/KIZ1TzK6fLYayMFk1+xfs+0d3KiAm9GU=;
        b=i9OxYXIn8kJXR2E+PekhbHFUklY3T11+zS18Os0cLMsQmPYvQqu68pNG0tziheeQzD
         8EdGjtt8GyYB3LsT1roxZ+fJ56rKxV5jJh8kyrIJ+8yerXDTD0dV8Bi0c89F12OgUrXF
         wvyoLTqYiklGjGD/uofHzBZC00zKe5yulObBQbzM6HWo4eIauMsejB8X33G16aRmTNY5
         6hmKzbYPfVPIG2QLeCdcNJ95cvvL5MhxYplD/LxGztNlTi6UZzT3wFf7Kvn5Sqz0unh0
         gOp5P5SR2RTVSqocbJo3345Weq75gRG2B6Rewk4xXJmSUYLwhawlCX6hPnTa27AvoE57
         k/Ag==
X-Forwarded-Encrypted: i=1; AHgh+RoAGNxwEC7DOO0WCu9dKJYAuGIxYGnDc3wf9uJnjKucguDbzA+T/25n+adEV3F6gDJuxrmImggko/Xr@vger.kernel.org
X-Gm-Message-State: AOJu0Yz21wwgKKvYuUXi7ZS5i7D06lIpkM/SR71ezIhBmI2QQbl5Ewuh
	0maLPEfHTocTPZSrZF0X6YCfZmXHlPEDTmB6J1m0/FZ7j9bpLkHoyb4HyIDrzLZHC9tfZrP+W6e
	kk5fnz92VRGvIK7oXVW1KldXBAf548EPZkTIE7P/4u0dlUVtNlgLNDNAAKL+4EmbJiiK2Todl
X-Gm-Gg: AR+sD13EmMEXj4wK+uSGzJ9gL7Bgza67FyA9SLTGYP3R8kG46I+3svTEDPsiTULLLx+
	wRoGL5j1t6RYQI/zMsC4xZ2X0nqJ3oEFHwYQpwQa2LizCp4bFnIvVDcWmgi1rIqrAdFLwRp9TbO
	ddHfShoZ3/N65ENPHtL7GrsZi73e72ct1afBAfzQgH7DwA9u3hRZa2XxN1e+kSOC2OhFU3lKDnC
	5fvGQZyFykTkkoUm2YZBxHxl38qryEvsaySp/dLVskieaiNuFGXi8pvtkW0i1YOnq/HdgTDNsNz
	tqw/Jn5V6fMyGzPEs4F9PX9UP0mEftxIpKjVe7CtZYoEQeQ9mksTmGwyeMPwR1nWeRVWa1pkRCF
	2T9hUfyxSqgzb6hf1Qo/A0og7sNkJ
X-Received: by 2002:ac8:58c4:0:b0:51c:22c5:daee with SMTP id d75a77b69052e-52b4af4ffddmr11381531cf.29.1785486777177;
        Fri, 31 Jul 2026 01:32:57 -0700 (PDT)
X-Received: by 2002:ac8:58c4:0:b0:51c:22c5:daee with SMTP id d75a77b69052e-52b4af4ffddmr11381411cf.29.1785486776791;
        Fri, 31 Jul 2026 01:32:56 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:40fa:e8e6:4785:ce70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b4d4sm68887466b.3.2026.07.31.01.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:32:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: RAGUENES Jean Noel <jean-noel.raguenes2@cs-soprasteria.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Check gc->get_direction() before calling gpiod_get_direction()
Date: Fri, 31 Jul 2026 10:32:53 +0200
Message-ID: <178548677168.77960.15544843581885268419.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ad89f92f91d004e63dd5599bb58e9581f373a601.1785318183.git.chleroy@kernel.org>
References: <ad89f92f91d004e63dd5599bb58e9581f373a601.1785318183.git.chleroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfXy53qp1IdEc7e
 FU5FxgwMIfCg+puhldAuilnMud3JGglOTXM2kzmJlhVK4fc6U9YU5yySFc9JI7NixtFpfB1y2gp
 6TYY/EH00/3mLUQ6dVhMnVncyFHyQBA=
X-Proofpoint-GUID: WjfhRinpGwC7EBAyMLprXS2rGm9mlPfZ
X-Proofpoint-ORIG-GUID: WjfhRinpGwC7EBAyMLprXS2rGm9mlPfZ
X-Authority-Analysis: v=2.4 cv=XNgAjwhE c=1 sm=1 tr=0 ts=6a6c5dba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=6wOr4KMY0LgiFmB2x94A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MSBTYWx0ZWRfX2ky2pDx0GID/
 MeTQA87WSwlEsR5mZMLBWu7ziBt3+MpEhY1msDTJFD5K4Po+Wlw+ZsVHSL+jmgH6ufnsbt0LFY9
 uNAyL7sDsqmXdORBVUOxmuyUkdiARFAc2fd1TNX+CLaKiHVlS6Z9aQsDpSmj/rinB6Ev4p9UUz0
 0TTmMEQVNdZvCRQYJXT/1ZI7S/IAsPe4f2TK4KnA1sfyqM5KbVPiRF5oxS2HVN3320NHHBSId2G
 3Eh4EU79AXn+lWXzoxkeTgYBi6qd4gbsSY5z0oA6bPAjrqRrgxJdwIY6+MNsbqvwQftsAaj/nc7
 kV0vCX8FK0tM0ZUhp9m3lfGotJdlawnp3mnRuJJimvnWtTtICPkrJHPwkmsB+n1xs8V28KGYoYV
 SucqWMNs89cJsR4VfIH8qUe0f/TOU6OvaXm7g8PZoDIuOPRbE+brl4bWrSApP9aOtd/mcviKl0C
 0omoJgQtjJUA0oDB0Vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310061


On Wed, 29 Jul 2026 11:47:20 +0200, Christophe Leroy (CS GROUP) wrote:
> According to 'struct gpio_chip' documentation in linux/gpio/driver.h,
> implementing .get_direction() is recommended but not mandatory.
> Most places verify that gc->get_direction() exists before calling
> gpiod_get_direction(), but gpiolib_dbg_show() doesn't.
> 
> Until commit 471e998c0e31 ("gpiolib: remove redundant callback check")
> it was also verified by gpiod_get_direction() itself so calling it at
> all time from gpiolib_dbg_show() was not an issue. But after the check
> in gpiod_get_direction() has been removed, calling it inconditionaly
> leads to a big fat warning in gpiochip_get_direction().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Check gc->get_direction() before calling gpiod_get_direction()
      https://git.kernel.org/brgl/c/d761c7e38a000603a9d16270a1af770a0e8efb5e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
