Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903897;
	b=fSezb7RxjGWd+tJ8tJ1kvXii9utUd4JDgGXNmL0DFoRQb2MN/RjhAxn/pSeWhOmuWF74
	 t07+hZ+gxMZb/A3aDYUPV2/qwK4bFOwJztNtH3GSBOP3lup3nqQ8mLYg/2UVc1g8DxwPm
	 ndI7rUf+6E2EEaVXkBaStsO8DpRdCtYQUm4BrJwpFUb3oUiDCpE0J+zXzN1l+fj9nztji
	 +uAc6nRc6I8hXfS23VNntcHC65Uz6S6vdhsR02s64++6OtjrDwf4RSwVkVkLEuI1b8oCf
	 bHr9lCGr/Hqcnenk9syb3mH9PAVMa8jrVPzr6gs5OxY18xt/WvXD0DFeLBA9X9CnTOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
	b=OnkgpNW9kNujUdA5q0R+zpuV86QMhyYfBKFBPTZprj5VsD7xMeGqA/pvpwJNZvvdNBG0
	 77PIZ8o9qGRldnwy0VMaoUiIwlyDmBASCn5I1UstfW39iDY2gXlHviOGvgUWuAnpM2g1t
	 LACyYggXXPsQVnC8Kl794XoXTBmXbEmH1+aJ2YNjjYRyuWjuC3H27aN62xFke6orqppCg
	 hIfeXeChlCnLanAbWCKjJu5Gig7w4mqzvBk0zNh1Jgy1AjK1GWpAfej+q+KQE3V+3zVdL
	 aKxrMrrh8zAIQNdbUEBOacCf6ILWVwnJYb+DQesqGYGDG1M8h7pxg00r4WwrpUQ18pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CcaRp/CE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O77X8iu8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215F2606A329
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 215F2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CcaRp/CE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O77X8iu8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aNUl2935297
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:24:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=; b=CcaRp/CEr2dke+E0
	5kstYP68Yv/FudXjdjfwPhpnQmQzpSW/A2fU7Kr2xt8X/SXS/8zIHI5IbfxoRa3A
	71bfo7coGXogtIMq61qYVdSbivvZxAg++p/9/BwAhmrjvVdmvGHqbP4e2KMkOO92
	AC9k3W0UG+15XWfQb3k+RKnVfB3jDXa0+HfFy4vG8faSelyX+GhAm1mEfjdZwcx2
	NZA4Ioc5WmCzpC+TCian2z7DjctJjLs1a7f5T5PwFW1tE0KS8yxMzr3aS8NVtElZ
	yae0qc4MqzopoT0HQUvlbmvGPnL6e1uCA7RIV9QjZI+tPsrD0XJhhFCMd77hTosh
	HKfE5g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a3ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:24:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94967c6d4f4so282552985a.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903895; x=1795508695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
        b=O77X8iu83LxNV7yDJR4XdQcSxDHdIzd8fAUj1EkUYb9fqZXJiXDkuZWaNpRwgO9kA6
         2vQEXGBFDqCIX0IXxoQO1bABnLl6C1ClXIKnP+eQWnk3RmnuT/xL7VbN8tR/p6r0Gise
         ZyQ7n/FaoEXLmH5jfCbJvtaODouVuWz3ThqHMQoNd7JQg6T93mZPv442dYTkcOl+OCHK
         Ov3GhOmAiJzsF30Vy1XpyybycaRnOqMKMZPuP878KLJ72g3QaHDpxbFqkeuU/5PP7K4W
         9CjTykpSJmn9a1mJwWaYR46uTJ0x4tlL7T3vZWqcXU158/fxYg+No4iHSFP9BV+FM+Ti
         mwvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903895; x=1795508695;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKpw1EgHR1aB/CQrLKrjzYM1e+jNP37ETeLTc6XVfHE=;
        b=C3BB6y/43ZACkbWVXpAwInrC+chcZmR3AL0ich2VkYQ7S2TCeCwGKf2w0eFUVbGOiO
         n+RC8kfe+EitIHBGQkU6zgJZtyi+cC7oaDp9CSSnmkBVxewsUEmofasvDl7oKRNiP+aS
         oWMHRk2osLzONvf5GDjBoqrPK8RF/yOk2dnfRoqiJdZbrpRfr1Ph51VE8y8T4gTNTjU/
         //E8o4UdbHKh0a9QjKf/geTYc0GILnxtgENJ+LpiFqqhxcoQpXZlvyH00Y5fFMmpDQKJ
         orcdVW2XKki2iQOMGJnzjCQBJ0M8robOLOEp7eJ6QxVfBNqCN7AMcNRytd+CZMCWWMxu
         J7dA==
X-Forwarded-Encrypted: i=1; AL+hErEiDNDOQUjFDi++ggGDBHTjWFxoYT9vsW+lLBfu6rPHwKIr/8V8eFeBTMenORpAEWmfLY3HE/Ph76xI@vger.kernel.org
X-Gm-Message-State: APuU4Z9uuc5T8wkrDLMCGyP/FIjbOfNzk4NP1CTaKFNGLXgJ4xtZRZ61
	qSFSW0jYa7OwWlPSopHQJtsxrUe9IFp+s9NYtwkSkMi3VGoJz1UEob3lk2S/BQL+dloTY72w2jf
	n5aRJBRTCArHi/KBe9d/cJ2Ccd7UvPc4dSbnYGhlroj62F+Ks0ESxszGH8knT+Bue
X-Gm-Gg: AYBFou0vP3Rr5D5QiZ8/I38+TDkeH5zxgi9AxmRlunD2LIVgN51ojtjm1Yxb1BLUFM8
	ibGfhgy5/o49BbcQZLjofIZPNgO6Gc7fWLQxsmeWQUcdWvvbWPhG4mg2FQVRoYudAPHogPHAyuG
	OGNchvuc2WkycTYKXF97RpF7m+WEuityWvjPagIzct8KPrlIKHKA/73CFEYwnH3ZeFKxTz/NP8/
	vBVZ11eX8MWU4LIMfq1dl+u4Z6EEZ+jy+1UlUZ4spl2AOGoE+m6boh25uesS7h3YbYOhMqvesjJ
	vMQnKLFlePC5Nkqe4LRuh+lodhAFl/B+owsZXWhUQDO+Cl/xaJTqa+H6HPTxiokVZ9PTUz/IXJH
	0ZfV71EVP8eXIS3hRlEOXcakaodua277142/4z1Y/td9cQn9Nwog8ZUvegCZcb+7GGcPSgJGGoQ
	A=
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2099312085a.16.1794903895317;
        Tue, 17 Nov 2026 00:24:55 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr2099310085a.16.1794903894864;
        Tue, 17 Nov 2026 00:24:54 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d0d430sm108041035e9.3.2026.11.17.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:53 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (subset) [PATCH v3 0/8] gpiolib: scope-based management and cleanup for GPIO descriptor arrays
Date: Tue, 17 Nov 2026 09:24:51 +0100
Message-ID: <179490388564.14898.15796530386189672600.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXwwJykAylZwe2
 jqRzCR0GBKN7beVhuWm11eMHVGGJAOagC2kYmgkhHtVBwG4EybyGJzD7LAXbop4KIAnXe13v5Il
 6puFCgAhstz7gH4RX6z1xbyP9P9sJbo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXzsgahFxhrS3D
 0tzClBwwE7Ceu/C0yb21FNdgF+L8P8+Y10jORzGmgj6aEqW3tGFsBLaSLpEjs6bb6hqCM6AxARg
 9GffFPfyNQAW1xbmW8qgjHEdcorYR8RNx14MPEwLp0rgrulclVu3yd3X3YKSmv94ZqquYw7JCKG
 zpCcyJIdeQgk5XZQ/Tof2dpG1MGrp9ED0EvrU6do7EsY6d8TxBGY+kbEGoLIs65GFUrcuDGoYib
 fDwzZqni+AnzQTUYP8uYHrIgOhApe86v/YvGHiRodrjBoj7UnXkulsWWARH2ziHPOVyu4GuPkfp
 3bJfVLtwcQv/TCET60ZRw5FTvPjpgi65H/oGB96uAXy593oKbWXXr+ZTo9IuGkLVQ021/QATRl/
 DhzFoesieB1ijKrCnNR+I0PoXYEhpHF5ToIPLvkpoypsFZ1ERCEOVW3Alo9vt8GOVxNBWnACzQW
 W+OrMj/cliNOZfWem7w==
X-Proofpoint-GUID: ra8MiFGUCDArMkXH6DpZT-jH6kE5rsu5
X-Proofpoint-ORIG-GUID: ra8MiFGUCDArMkXH6DpZT-jH6kE5rsu5
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc0f58 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8ZxHLKPBVxxFydpm5EYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170033


On Thu, 05 Nov 2026 22:30:14 -0800, Dmitry Torokhov wrote:
> This series fixes a GPIO descriptor leak and a fast-path cancellation
> bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
> of_gpio_count() to return -ENOENT instead of 0, introduces
> DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
> (gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
> them, reworks descriptor array allocation to avoid krealloc(),
> switches fastpath bitmaps in struct gpio_array to bitmap_zalloc()
> and bitmap_free(), and uses the %*pb format specifier when printing
> array masks.
> 
> [...]

Applied, thanks!

[4/8] gpiolib: add support for scope-based management of GPIO descriptors
      https://git.kernel.org/brgl/c/fea70edc18a1bd360c2f1b090662dde3d38d5357
[5/8] gpiolib: use __free(gpiod_put_array) in gpiod_get_array()
      https://git.kernel.org/brgl/c/d8e2afd9d40f7ad9514fbf7aa725558448f7d679
[6/8] gpiolib: avoid krealloc() in gpiod_get_array()
      https://git.kernel.org/brgl/c/7d930a8b28f40ed7737b49b8143fda2489732e22
[7/8] gpiolib: use bitmap_zalloc() for fastpath bitmaps
      https://git.kernel.org/brgl/c/fc5fab320c2b8bdabc0412d3f5a5d1e058a56d87
[8/8] gpiolib: use %*pb format specifier when printing array masks
      https://git.kernel.org/brgl/c/90000c03a9f6c74759f773a5078088db81514347

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
