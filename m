Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958062;
	b=to4ws+mdAfvO8znuJQ2TyBTzhSB4FSrnd7zDRoSNayDu2jI8EsgVLW64LsHHGIYJ0eI+
	 a37QpnSLK181GnKMieMxSRxSlaVBiZfNRbUWxtgbB5CCLa2zBzOEEOmd/VoRnyyuA4Ycs
	 +mk5EZjYuir6MAq4Tlpl8ZcEMSnhZM2ROWOvoNEGHCreQpW+NSSscSq8UgjGZn88Gnsrw
	 7jhX9INbfXT+cFwImvJ62srL0PzPMhQguZ+mzWiIPFZy9z4EmCVn65axywfkSbmjw3Z9H
	 tpv4cqlDgp/9i+fQP1RRn4bq3aBaDqyX1UXxRUawOObZCNm9KHSoqRib3IdpHZj4PCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958062;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W9dTCoyuf+cbHEk20Y1bEv5Tbx9Cur32vNeHXn7deF8=;
	b=LnV34faDpMrm2FgAexizSmKQ5wT4RscwoKhc+JZ3kmR+Eckh3MCkNX5ABGNxjw9S//Cx
	 clXOFgc6/6y8wm6n4LIy3YkAaytCoZt5cDVsU0uZAPxJeNl4j1/jIdDJvgWGakGWlJ7lh
	 2ZvSkqDon5peBapWbttVYwY4EltMxsBLVrCYweQ7OGyX2pRv+b7mcxitzXfz7a4U8AfOo
	 zp3i1c9BpdxrkJzG5MUOf/AsKAj61gfeUQoHAxl/kM4QZcgWpq0qsEZUgOiHYqxWwZ/JN
	 U0pCNJw2rQn/hgR46z3ncqP5SQ0PjvzS4qaEWLZX+cLwuJgesvQcf6BUrqoZihoXVNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGVIw2vE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDCBX9ah;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E147606A32F
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 09:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E147606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mGVIw2vE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LDCBX9ah
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RkEd3883418
	for <linux-gpio@vger.kernel.org>; Fri, 6 Nov 2026 09:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9dTCoyuf+cbHEk20Y1bEv5Tbx9Cur32vNeHXn7deF8=; b=mGVIw2vEHbHnj8Nr
	C4jQWes/IJydGigPk5p/vhP2L2s54OdDvDoXa4/ygnHaO3i7Jewe3oiOxexEgyo9
	HgAG9nbsR04WAqFkaXL2z08GaY7pGb0FyxUvwkHfVWosbq+8v0uhnjVO9JVtUV2Z
	ASHgT/cHEr89WVrZnKoTrfER2E7s/m6kmNMsp3ZNC7BhZVsjX0VfBmqz+cQqblbC
	SnWZFaXGh7Y16nTzwcGvMvC7rAUnGmn5wgleCDXSQVFfJqv8u69mpB2q2zq9jWZq
	X1PNkqe+ZsBEq3MR/sc6UF5sAhUtgZDZCKP4ofmNV6t2bOIsk0nhzDSgq0H0tZnZ
	uiZPkg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pb26b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:41:00 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc3a482af7so425988137.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 01:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793958060; x=1794562860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9dTCoyuf+cbHEk20Y1bEv5Tbx9Cur32vNeHXn7deF8=;
        b=LDCBX9ahQFfOsM0vJa8w/bLQ8K1OST7FKqmhuJfvgNH/PrGljA9zo3r8fnL28i7Dto
         lM1WFh+hv8ukax09FLixgYzRtWxiE/A8v2P8FQ04jIQsOjzEbvoLTKNwthi4GNvHAJiW
         6g3lW1f9OloyCX70brBfC1hciKw8zPtP7jg/jqF/vyYiP2Q3nnTvY/uXtHm27rbWog/D
         JH+5x1O+G6212P0vqtsBoIh+kOUu2VWPoxA3JzK/K0G6pjmT7y1vmrUBe+0gxHhQOBAh
         df9S1xXu0JsP8GxFRuP+yPuUx437YNpSKhQPhXKEv6mhbOsn4y90QcSh+IisdoyoBNBA
         FDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958060; x=1794562860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9dTCoyuf+cbHEk20Y1bEv5Tbx9Cur32vNeHXn7deF8=;
        b=oIAd0R7B2boL82ivb1E1G3aYABMQAvI1KPKIRdtIe89tGSAHYzmmD60sx+VaOvUMZI
         sHCzjoqU/jJPXFDr84AZ583G08eVx7fUmMx5k/R7OMJ5EVr9IIJ6NZoYFQebzLJYtP4O
         0lGU046Ij2K8PWuFifETy75gcuXFp/afaQnpS1Laps+DCnjPzA2UkzADliPb2HPrspZY
         QYjZwH0nVQPzpZZuP8oyfiev6UPfmpGsruwU7OEbdaxAC/GDl/Zry65EoyY95kvzaw62
         o+gJedUHZPVGzQIl77Q+SjJvg8PybReqowBECSrskqOdbwDMqayzM3HddVAk1noi7ggv
         wfdw==
X-Forwarded-Encrypted: i=1; AKwUvBxGINpiE9FvQbAReqmcQ26o3Enro31wVkKATXNI4zgqBChDdZEIX0hZsW7EWlijEq+pmUPCes6GNc/1@vger.kernel.org
X-Gm-Message-State: APuU4Z8eYKFtXjE7XbtTkRreq8n/ACp7npkUpDf0g0ywbLMeDew33g3T
	fSZGyURsfVz3f4SHqxMhuuZvaM549nBzVk0GXOTlm3SJrRezGjQIND/q8WoqQ3PI5v1WPbsv+VU
	0vDsto/XBxGGioqggEZe6bQhqJn9XlkncnVTgS3DvcR+Xt6v3IWSPTYivYvgnpwFa
X-Gm-Gg: AYBFou2JXMy3oU0p6krCFnZ9P7s2DtChuWMbcddS9Dlw2blFFOwgiF3ekrpbXdPyuHS
	vbEsY3P5bHX7SKZSyEc6I3hmhbjKd0fZuG8u9lta4yPn6+zQIqdVe3amj9RyJL4N2K+lGpGnGjX
	+zHwri+5MtZTxaU11idGr0k6TgLKKnyVh/2YucuKz32JTu+o4uWSSBtmGH0lscBn18xLwNi4qcc
	/cCiaBdJJTIkG2A1a6w8om9vcQvC+DACgU31N2Mi6b8wXCJCcyN1z2Ft7qwYGJtbyUFvVw0/9IZ
	d4GDwW1lrBA8eE543Uq8pdH4F+/CmfMSU0AtEOeYpG/ThQB33BvRsKg8pzCqISZ0FvHJExFBjlW
	ReLFKT15SeR3eP5O5X51/upjyIlDW5qB5oMNIFD9qb7HSyl1JKRNxFaEH2OmY5/5PDbgPY2XQo1
	y7
X-Received: by 2002:a05:6102:160c:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d2a15428d1mr1177065137.11.1793958059978;
        Fri, 06 Nov 2026 01:40:59 -0800 (PST)
X-Received: by 2002:a05:6102:160c:b0:7cc:3eb0:6ef5 with SMTP id ada2fe7eead31-7d2a15428d1mr1177057137.11.1793958059464;
        Fri, 06 Nov 2026 01:40:59 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7232832sm2628214f8f.25.2026.11.06.01.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:40:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Wentao Liang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: keep the chip reference when deferred setup fails
Date: Fri,  6 Nov 2026 10:40:56 +0100
Message-ID: <179395802621.6519.3548535615880624966.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104025345.1527526-1-vulab@iscas.ac.cn>
References: <20261104025345.1527526-1-vulab@iscas.ac.cn>
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
X-Proofpoint-GUID: UKlLwQGvfWhOpMGN0K0pXf6tCEr8cgZ7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX8Ce0BgCBonmm
 XC2OzgTIugM/wzNcVv8uJCPP9QeHSaRbU3w+cx26h5WCE0TZGZiIlaiK2t5OPJbYkWdOQfLPOLe
 M0FXDzBIYV8q1K39lBdwRfN6D1EGda0=
X-Authority-Analysis: v=2.4 cv=LIrz05W9 c=1 sm=1 tr=0 ts=6aeda0ac cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=m509mD-o-6PLSkqzvUEA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: UKlLwQGvfWhOpMGN0K0pXf6tCEr8cgZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzOCBTYWx0ZWRfX5ufvALVouWAr
 N2UkmcRU7V9IRg87QMCgTRmS8yhLb1YQZ0BYWuP6MRtEltqYPA9Sk+MEqd3qSuQXQlTrwN4TNsm
 5J6wQPIpUwZQiD/l/eChB3xInRn0BJjpU+FQGxnNYVGEuCvWarTwFv69kIo182tjjUfQxbYZO4R
 B7ol2VaF0EMHYf73/NLxGBiUx/xNgYusE81dkeew4um4EE8ckfKpI/YkZdT3zIk+15R2Iwn6O2+
 Wc0BulbVMwHptTG7+XsGOUg24C0Q3EQ6LQhlHqPKP6cEfwc6eOyVmaQLgFI1V2Vg3AOFdRy0Myk
 9/DTaObRvL7mrJ14Lj9jx6P+YvY4rcwrY59gg3gi79iCCo8wWGi1rDKOxfMyyocYK5hcMaXjgdA
 ixd8JYnT2QmMkjuNsxIhG/kP7QMAOccbjhSGYxrDpDkKelMY6DT8XvadOtG08ysnNJdrriuJqTg
 AxRQuzOLOl2o9WRMYkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060038


On Wed, 04 Nov 2026 02:53:45 +0000, Wentao Liang wrote:
> gpiochip_setup_devs() runs once gpiolib has been initialized and
> finishes the registration of the chips that were added before that.
> When the registration of such a chip fails, the function drops the
> reference taken in gpiochip_add_data_with_key() with
> gpio_device_put(), and only then logs the error through &gdev->dev.
> 
> For these chips that reference is the last one, so gpiodev_release()
> frees gdev: the dev_err() dereferences freed memory, and the chip is
> still linked in gpio_devices, so the next lookup walks into the freed
> object as well.  Here the registration cannot be undone the way
> gpiochip_add_data_with_key() does it, as the driver already got success
> from gpiochip_add_data() and will call gpiochip_remove(), which unlinks
> the chip and drops the reference.
> 
> [...]

I understand Krzysztof's concerns about the bug is real and the fix is correct,
so I'm queueing it for fixes.

[1/1] gpio: keep the chip reference when deferred setup fails
      https://git.kernel.org/brgl/c/7e899fe007d2ffc753e6aa5bc8f2ae0a802b9e07

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
