Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214643;
	b=b66Be0NZPN7GXtyoGwSeq3RihGG0H0xDQDc+AAHvtqS3laM9/T/ZaqvHUMu9qOdO8UEv
	 ja5Nb+hXHDYYIbq5cvCtrqHvISkpx2Q/jkdl5xBt2o1PuB8oEgkOpI8JAbxXOWOqZYfxI
	 bS0U7BQhGD3k4ZMbphBmueN1OaN36rqWwtSlqCMprWAbjFh32lCcjGaHPUjxh4QBOIW0S
	 e2b1kxPc5T1cyda9MZmydzv8ihYhYqRSgsFn+zbP4Qi1FMOuzJ+VWn3it4q+oLL9bx/pA
	 UpGHTx73HHbM1aBJVKCxOPlKBFoF1Z7PiWj4Wx9HB8797OE7u4bsNLKQDw/k4VYF19A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
	b=mg+o3sVi/AIa4vz5xJzWMxDmXtKfYZvcTSxMxXG7lOlLyTpoYhWBIjYrksT+gIfJAUo2
	 AKqbyasOK6jLCYIyr+QQn9QJdveyNA6usHSXI9kpl2Aj8MPaCXQ8IQEe3ewul1shWkMj4
	 4zDrXHwl8rYJJUJ5hDDuF0rYs6jD2QabKmzRFrmynWqgQcvWSP/IoYO4q6nvq/k+cI3pe
	 APHQY9KrRsFZgmyrYgfdn5TpwykucscwjLt0jhsu0NBDq2pUMIjns8dxz8koTlpGDkxPY
	 PI87GU+tHSvHUI733TM9pj2LmvZZAExO5aSwSz4ka9JpekBg03quc2xKI9Hx/f/zrAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qi51nJHP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VeFy6aM3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1842B606A323
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 08:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1842B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qi51nJHP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VeFy6aM3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A96A27A481139
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 08:57:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=; b=Qi51nJHPDFbJ7q8n
	qXkhTkmLCX/0LKCsplGWLTa1YMVJ3RwOt9AsTDmtZxJF62wlaCj3zv2Ze8Est1aa
	580pukGyxUUlTtAc8xrMQzhh/GOoI2A4URoEJL+LMW9hkiSg3154okCev2fGp00b
	vXkH87SlXdmdYv38+2XRSmP6FVSWZjBLfFRovyeJSZT9qb3mMyipvzS/O9hClenr
	2dHkQm6Elrvpwp71fNarlQIDxOvNn+ieCYjrAQGylXPpanmlz+Bn5OKKknMDbuDv
	/NQ2viBqKaC33FiMSFCOuqqWOvb2Q/aBWksxnXWh2w4lUQcv4jFEtrTqXdpsV8rM
	rWsEJA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsdnab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 08:57:22 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9987bffdecdso694488241.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 00:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214641; x=1794819441; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
        b=VeFy6aM3M2DUbgHAo/GOqbpk9ncqOFx5dD+e1aYRK0Q2Fxoti7uLbz7kV/6Ka2XWMx
         Ws37jKObk+ZQd+ZkKNzLS+VZMNckFJu9O+1hWC/yxJ1O72A4639vF7ZwI8O2zx4T0/vR
         7nRVlvBOP11Uh4M3/IBsBOmxdpg9aE9Ye2FC2t98fGbWwS5DrrUfKmJGRvzdVXd8YHMn
         HKuRYDH3OsrcccEoEayJ90TS/xZauzdfb17nL90es/bVRAzHMyEDHJ7LGu1Ya7Xkdtrl
         lQZ3Cf+o7cq3CDmDIArPLdFtgtstcJYcSUeDER3T4bA9xtTfxj6IIOaa4zXJWNG5xUkr
         d2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214641; x=1794819441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzEGE3tZdC7w1G3PUODyH7sAeFFJNDrzFSsizGE/Oiw=;
        b=E6ZeXV361YnM07BCZbYmkbGp0Q9luXqfDdeRS3LxlD8etz3cL0UaX4F4w5YD1Pi4P8
         o3ExRyyh7/Dqj/x6f0d0bYBG2OzQnIc7TGyLl3J/+oX3qEGCJGVRSY8Z2mauA7M7rl79
         zwCsoKXI4RwNCNTP/1o0pi0+Y9ZeUPVgRSJezwD54K9LpBgq5/74X4w9wp2Mp/OXmGYW
         SiLu600XByO25JP8SxbNn6V4IvRGW1OpeMtLcm/PvijKkMrhrsXpuKVOe9fJpGz+zZ9B
         LEPIKH+QlMEPJRsvM9gakdRuqxPGuXuM3Uq+g06P9t3tgvKLMokYmG1aTcZ/6V9ZiyLe
         JkMA==
X-Gm-Message-State: APuU4Z+G4WL6on4iMd/rcVQkQobM8ER6J+p1Gr6QYbDn4cITY1+TnXr8
	Nmx9c0R1cr77rx2CtblKMJHpmVN4vqzvtKvK6BJkFNYBtrYT/eldnxzgdC9ADpwTOhKWq6s8eYI
	o5bwouqHclziPnYfoOV53CdyhrQBYvThqA4NZlowF2X36/z+/GUk3DR3RtPMX1Lb8H+HN6P7h
X-Gm-Gg: AYBFou3Wg9zb/R26XMULiojnA7PVs5zn1O0I3GdI0IcZ5YRAUNSv2rd4eMpFRfFBesN
	igzdDdrswxzrdbtVKVfpUxFosOEVZpdiUDg8NH5MWxoUy0oQFHFKDN9H8zpEtDaNz3YULycBqpR
	bndNOB0CtDu9CxJm+ppWsLdqmU9oMbbGH9kBp2xzMQFR75w3eGt5IdiT7X9r25QWyVgLQ7mQWYj
	iQiXCwoEESiPC32M3D36/PlA3cIAqlgU7gVGNOsBE0Qe15yaLtdYHgxG1/WYtDG6cWaBYrhFxsU
	mpLF0aaemf1CiNejODce5AKxHlcT5Vf6vUP9kYZekCUOxmvwnOPOf3twVe9QTjhOkbZ9IzrjBLM
	rlUJjIwZSzZAcgo8y7XeHOIkUcPk3ZZek50aGOQy8sWWDzPxKc/dZdRGcLQ05QLjdwicvR/uP8h
	qMI5q84mPW2ew+fpGRg2b2AZmdaztMF85hCH8XWKwhZ6oIUGWQ00VzyRCt/EtaBw==
X-Received: by 2002:a05:6102:3ed4:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d2db195765mr1024633137.30.1794214641142;
        Mon, 09 Nov 2026 00:57:21 -0800 (PST)
X-Received: by 2002:a05:6102:3ed4:b0:7cc:1045:604 with SMTP id ada2fe7eead31-7d2db195765mr1024622137.30.1794214640680;
        Mon, 09 Nov 2026 00:57:20 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f38e55sm9001442f8f.4.2026.11.09.00.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:57:19 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: of: fix potential misconfiguration of hogged lines
Date: Mon,  9 Nov 2026 09:57:18 +0100
Message-ID: <179421463614.21176.6551038527438941872.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
References: <20261105-gpiolib-of-hog-uninitialized-v1-1-fcaeaccefab6@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: J0WpMf-xrXC5ieZeutRQa6VYgANH19p8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX3+VnPtuUQSef
 hvs68RW7iAQIjlN/e+X2hmBd29jF0BCdcKj8CuKXMq7Q1dz2FnYW/MF3nnMgVwReZJE5W56T1jT
 FJ35szPv5XwSUc+JplZo0JhWQrQvzbI=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6af18af2 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ePiHbNq-gTG-vOfASXAA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNSBTYWx0ZWRfX67qit8wARYTz
 kzEuuCguFJbj2s3BesUO6qG2YYOOW7qZctEGsnCfQ2yiNh7Uc9es27pObCxuDM6E6XLKFmm+pTf
 VOWfTkuXK87ocZ3ATJo3+VrRp39BhrkIQgh13xvRyhx0ZF/g+JXeN6R34XtKugRuxuKTOlxwi05
 xDQoe15+nvZl1NrBsxm7epAfNDER2Zavd0CSf29pQRGntOQpZK5XbqnK+Po8LDKdXOZf0lZDhZq
 mSZIW5UWg15+bOheLWumOBKHRJk4c/kXWMZnxLQXQuAtXdwj73MPY30LWWuGGtlWfG7JYsIP/gb
 SImT1nf5E99fFdb7L6E5feX6u45VcZQs+QBDOcCP4IHlG0C8W4y+2fppb9JNvViJ1VruYgq7FbQ
 ANurtYXWFfNCWv+Xnaa7OF8HvRVRfNT1zLYQfLidQucXzBTKhf5/MYxJlu8MXHAHIVrTABFD6hO
 BWkRfGfgP4C8QENcFEg==
X-Proofpoint-GUID: J0WpMf-xrXC5ieZeutRQa6VYgANH19p8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090035


On Thu, 05 Nov 2026 14:37:52 +0100, Bartosz Golaszewski wrote:
> In of_gpiochip_get_lflags() the local variable xlate_flags is declared
> without being initialized before its address is passed to
> of_xlate_and_get_gpiod_flags() when processing a devicetree gpio-hog
> child node. If a driver uses an of_xlate() callback that doesn't update
> the flags argument (like gpiochip_fwd_delay_of_xlate()) we'll end up
> passing that uninitialized value to of_convert_gpio_flags(), potentially
> misconfiguring the hogged GPIO.
> 
> [...]

Applied, thanks!

[1/1] gpio: of: fix potential misconfiguration of hogged lines
      https://git.kernel.org/brgl/c/c62364eeac0f123478fca2f2d8e2424fdcd55032

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
