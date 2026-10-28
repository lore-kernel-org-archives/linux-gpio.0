Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176386;
	b=MpJNMBQBn6ne2IrHA1XhBeBY5YbmoB0pY9yp/2v6cLIvt4i0ri2PZIPVIuEWRUCUhixo
	 OUmWr77t0aKBtGm1HroKugzrftFSbfxaXUDL+ZR7YnclY1uqMOQM2gWnrKoqE4FYuXNmh
	 TKHFAJZwl5nS0M2+q+q/tAVtgMja5andiJJ0Z4TIcra+8CHqX9s1vlJb+TsVEeLPtsPDt
	 hMej/r2M7qLMfD3I33L/wb5N9hhVYJv3A+ZuKz1gqxRuBy0J6zO5szNBhkFvZPmkdE8Y7
	 K4D7ATpt0ByzkrEQF0e6zZKPB8X/8meCF7WkCaHjIzugXEU7Bhh+ruLJ5hHy0ehN77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
	b=oGL9oaGBrfviUzarPB55rfpJExMGihYP5OIXEqEkfmGudfHSZGiBDaUpsg66B7Kzz98y
	 U0CKzjG1iTdRyPZLvziRs0DYt3Neib22LQ4amuIsaFNPa6O5TTdEnkTjBekVzoltVowG1
	 3ASE+WwqjqOI8lvK4CL/Zu4Zew8FuRJ1Kp+1xmmkvyeKjnKiDYMHpTw784lq+gI5crA8a
	 ECjy/hXmbK1oHWCDoJOxzm0tNB7RwfvV/rogda2+cQBHyOwmkRBx8hBL7xKwpxcjk4OWX
	 b2W9OPoWQayC6IWyYVhe69J5dKaWPz/aMfX2wjyr7uL+ZeaavsYeFhtX1hpHXL5t6/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRqiiwO9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UAdhJmMq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DC7606A321
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78DC7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cRqiiwO9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UAdhJmMq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KHaU3718583
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=; b=cRqiiwO9Gu60KS+8
	SmrH4pGEEf+k2Tng6ZiE0GUC5w1Nid4/klDoXOasDd3/k2OUF0XOammmXW+9QIJi
	qGTOKyM5tcLHEpfhqMLipfp8Ascwb6gc0Mc3wEzZPfp+LioYKZ69gBNY+aT5aIO3
	y8umv6NN8Aps1sf0VhdMHuv+MgYTl/w97q7IVg2vF+o6C6pplO5dsjxYD+V1K7C1
	UcUEsBL59oxUOpYA8DCH3noRDbvhhvSyLMA1sOe/rUivqdZpL5yzRiMXhMW2qtJi
	Vlx9OMvGXzfpmeooqj7U4K7/uIDpsStZzczTIFfIoqf49+Uk+h+G6nKl6lsztq0M
	Ce/m4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9c77w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f37c94ceeso366476085a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176384; x=1793781184; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
        b=UAdhJmMq84zogFkGwG3a69dGAvi/WXA/SpwonQHu+7EMfmgpVBgMqlIUVJmSiM7hRk
         jfg3zxLZxniDaw8m1YtO90g+ynT2Nj8UiXlIz/TlRjFE4M/hmqH8soaPZIjiB3pbpJFG
         H15FzJzGi+IfetT94muEUKeOhkK+mgpmOHJvLqTS8y6rQmMaBALgHL8FyoFBibFT23+H
         C2ey6gcyVHVp5YV1W1XKnUXbULjxbG82TCP1dodb6f85YFBvtkSTmK+zUYRK9ZLiswIW
         CjNNO2a8qy/GaIoHhrAuhp5erAuWl57c3nqymlKZthCBQmxiL7xv3I7NjvlX569/LHdp
         alqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176384; x=1793781184;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=viqlBcGtG71a8N4wre7oeGoEXuTxbaTYX3CjvxX08Fo=;
        b=DQApHxAhwi8tN5ZXtsNHBUp9H5qYdeMfmtvuTERYODZzlh9aMnerUCNcEX2/t+og05
         OaniuHqA74r/DSbyLJyvfslf7Ksae3WEvYxgAIy3peSTVY4Sv0tWxZAcMdUI62h+FJq3
         KGoFsTna0RiD3trBWZ5+0GMhZia56ChHlxfmpUg9PMB8wxC/pPsR7A3h+WhKWw3z6eYX
         8xL8UZshmTil33kxxKqQy89MIE2K4bQdFNqVZBjehovfeFr2nXn7ys/B1KAl9pGq5AEs
         2wyBBfrcO2a+eORLFjGWeI1DTDFOm5W1sUZJLJM6xnyqqDgvECBhFycwj7ZvWl9MSG4Y
         yuFA==
X-Gm-Message-State: AFq9FYJDG9y/bp768ImSozelbHCw2IvlydRksuIGKh8fsooJZ9Fl5tx6
	xpQVWJPC5OTb2+cGJBDSVI8vIrjW4oOdcXXjsG/l1JQTC8qNwmhXVqvNHGb1aCWkaCtEA2WimaO
	DgkTa+M8sn79NJTWAuDUOZ6JLlGWVf1qUcqmC+zqKLb8BQhqCrhWZYykRY144QH4K
X-Gm-Gg: AYBFou1Sk8DwQOgbX7Emrq+4ONF2PTPbLAM+XTZUVHerLyykVrN2rv6qALntxaU11wF
	KPBTXX1wXulEki2JBrydJwgmmFG3GNxrHKVw1bSxjwlVSN6SiC3TlsR4vYIe7AqiySiB1uF6Ita
	ADkwVeJD7pyI8Vsbz0+uym1TV3s+Cf3Z9jMARRUYv982c0+PQPYb3AeCt5MIgF2pSb8Utm0wceB
	oR0mrpNYIYRruQKM93YlPOlx1Sv1ZnfDitB9Z+aCRrmT+Beb0YNCvk+Y+BZdAM1xTHkf/hnS3Pf
	INEtE7IUDJSq/jsgLauepBcfLfmrQa2/vblBt9Q8DnCPxMGedi+OxVF1JWZTjel3lkyNAJwY5dE
	kgPXQAJh0Ve/Fd9XHaDIGgFVHqtJlfmghsRWWnw8+vOItocAdRJk6lMFqrOE0L/qX05hykuP1Ue
	Fr
X-Received: by 2002:a05:620a:17a2:b0:93e:e111:2778 with SMTP id af79cd13be357-943f4b3b1bcmr884134385a.14.1793176383649;
        Wed, 28 Oct 2026 01:33:03 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93e:e111:2778 with SMTP id af79cd13be357-943f4b3b1bcmr884132685a.14.1793176383199;
        Wed, 28 Oct 2026 01:33:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:33:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: constify struct configfs_attribute
Date: Wed, 28 Oct 2026 09:32:55 +0100
Message-ID: <179317637229.6922.16842408860731140713.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
References: <20261021-gpio-virtuser-const-configfs-attrs-v1-1-bca474c9cd12@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae1b340 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vBPT46HQKAXVtv7808kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: hcRl65Qd12YRfkpBqKYx_Y0AP12FDvp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX+J7riC9khI6g
 wBY29w95wOVUsLaBZGJ8kRvOz4uJRkXLRGqzykIVk7rLPtjL0D1BF/Gj3KSxOAlnx3Gi4/G/Rqu
 07CIr0kCNExXNPDzHC/BuMoqWJ2pm7Nhhx2QKM8MfvfAlU6Y6IsWMGm6tdgtz69iLAra1t5OKs3
 j2GqzIKoWi0FWzwAA3BC/ALQ/fkt/wKqpiJfQFHURUZhjBpQwZiZ2JKksTOd9KZpD2XeImQCAwu
 1bpvaUPybDDR+bavxf/An8DTttwpqVWuZHjhGQ/BsVXP1vqBYcNxDrD4i/xs3W7NxVg5YWDBvsX
 NcERqd0Yu7H91cI8nUWbZv4XOFPVt0MDR9MQM6H2ZZxT7vpiMMbjOKUfUvP+yGpgJ9kuv4vJrip
 Xroz0qFtCA5hZZapk4EQF65OrmpEAAPDq1G67EHwxDC4I/v5Pid6NB3NrF3yYcxgK7Iuyf0RshV
 XkqQjdsMhaTI3TQO5Kw==
X-Proofpoint-GUID: hcRl65Qd12YRfkpBqKYx_Y0AP12FDvp4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX7VOdW3Z3R3Q6
 rcXccuzk4EoX0CeqwSu6RHB3bMcL7EbFtKjZiAB8gMJfa9jRWH3yZFSq9Po/jQ+TIMUMWWRqw9Q
 rw8VqfBav2NyvzrCCQ3UiYJxGq2Sacw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 14:24:29 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-virtuser const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/a67ab3994716e1bfe86b53330d1cf2f5bf6bfbad

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
