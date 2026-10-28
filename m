Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180379;
	b=t11jTy/UY8GmLsa59t2zLZTk7U9E9nadooml+70vkEfWHX1vXOea0XFiq/xugC6J8ssE
	 xGBIGtXNmIVHvgkhrjrvRTD3qSsjgJEJNOparBmt3ot4D4/UTqS5FjJl0cgpKVhxbWVxl
	 0ycLzLw2WR96oVH1GfAOWdVkxXzun4ItO3KHQekgFYrMueOqD36fmTnHUJv3NrrGT8EDs
	 Cfn8d9oaAyEEWzS/cUv6hgKCSvavTapE9TeFhHCPKMRHA/SC7qFJfQZx3ut+DDc9adwnB
	 PMEuHU2CVVOXdH40pA80zdnrsebWyCOwxlIaABLG6oyZAQ5BCoTuLAkPmbDj87z/opA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
	b=hk9oBFYpOjV2r8ZfF8MIwFVlfp2/RmcasivuPZXJKmIZW5HVA9Z5MTpfE2BR56YDnzqg
	 8Cvk9wedQ9hjXEvjVocPGbv5/rJTLmyvUA8lZnCLLOnaXoTEowSL6O+jMfYwgWkZmuRrN
	 UAAV14WZCSuRR3H+BMX65duUzigLjpDq78RTxP5RaykZIQTm9GyIa/wlUtVkxXvfIYnNS
	 B8Ez1TntJ1pLSWkhYYxUP0AaWVt93t8lBx0UIZoAvnyJGV1Dew+vqVIgL3Z+ZCA0d1Njw
	 mOJudm1zolDWYK8n6hFd90umZloOXyZP8jkDi7bADjZtfnT1D6Uors8WrtVzEYrbyOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmUEFxRZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="beT/k+Jl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE8A606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE8A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmUEFxRZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beT/k+Jl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8JsEF611817
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=; b=nmUEFxRZfcgRWKQT
	hzPWlWy4ZfVWACjIRCj3F7h6Rmw7hihb6JB3a+ka1dPuZIhBPfHPJ7Pdkk2aqHgF
	RDu+AdyeOjNNOqZOjwkSdJoI+JWD6RWuMIUYDLJ6imCJPPNPLyJh9yNw3vHITHaB
	VuW67xoiJGEtHAbY5OfKZ7hHdAp9g2on6Biain6QUXAjIfTzD4+urFr5yiyVoY/+
	v6E9QKnNfnSoZ34y6fzTg9C5I1noppCsLUJPG9RqLKM8bhlYi3K5G5DaFHOj5mAJ
	bXLaS0VE4MN73QDlO6PXKgy9AzYPv8SKU5lCrXQQ5nCWRS7RjCCVs5gIk4FmJsp0
	fM25/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8re2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:39:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f37c94ceeso374649585a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180377; x=1793785177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
        b=beT/k+Jl79CUEkA/3ZelMynit0UL9dYB8aBVupHWD9ZJ3bOEyWVvTSSdqyAhunMgw4
         kCVd+W+L2iHa/hb1WH5b7xhu29hscaVXFex9xQYf0u/g0mmLN91oMZZGtUhvf0zByqmF
         DpiAu97EZ93qMtvEE8W8mAYIkhTzcBGSHOj50ajE6d+XMhrP/ZGxExprUSTESPzdfsy6
         9qDUVJ8NTy7dszflFbp2COt9W1QPzNL5rSflUt2n7cM1tSskiWAjUTqOyn2fuIVLscTH
         LPE+LsQn//LFApdGDLrrch13BQQVKVp1EjuP70Gnp0dWgQoJslHWCVdZUmAg6K6F41Fw
         KZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180377; x=1793785177;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
        b=M9SKtVxE/P64oEVT1xf3vfjoPFN4+wryjjN8ECWw0wK1yzpCQDU65N3ttqYMxBuhqK
         q/xwBcAYkGEE91IH7DHgJVWi+uVwTgYv3w29DqxmW/1GSuhvZTfzLromSWf1jNQMQqyV
         WFE4yQUEm6GSHyypIlC/F778N0D53IdiBmac93xfjjBggRmJ7ru52QdxNYZZl7tfVBmi
         Lx2uKHQ5iGLDSAGuNCOVXmBGdf8C5RT6eV3V73y2E3raxk8CS+M0UATrY6Wtvd//6GkQ
         qjvBy/WMUVipsKsEz2C9TIRpSo7WzYj3Aeqlpu23mxULFprJawBK1kAqnlm8svWPCwS6
         FNjA==
X-Forwarded-Encrypted: i=1; AKwUvByBD8cIvVR2p5NLu3FcTTyZWhhRGXtsLVi+7waXsJFhpJANR8eDn1t9fjjkA6cIBdf+7iYq6os18q03@vger.kernel.org
X-Gm-Message-State: AFq9FYIDNMv7MT59D6tfH4CjhD+8hNEcxfoEHVOsPu7x5YKFBfvTStP6
	qG07580k64gQcGyIj8qJNx53s3a9q6mQdNwTvFFhdPaqQXMsCbebiuacF9O23w9UVBn6X5zlVV+
	v70f+cSZfKhRzgNQux2Q2Fu4Tm+yCu4c4f3bqfdUItvKcPYru4uuZy7JiI1wo1YNu
X-Gm-Gg: AYBFou0At2AAFtGVvBeQci/LmQ4W/Z9cw9uswikge4d0mJ1AXlJysLMBBFAl8campQO
	eqXugjLtZlorvIsm4HzZqnzKz0pUEp2i1xKqt4mflmnfUhMNHVPRdTiS25rn5Z7lyUxN5KMOGg3
	ImbD1ZcqvbAEMPerRJHQOvFVSWk6TIwPvHsS3qx3opWCrSxzfRquYKhDu6v/J+iPUgES3sbahjL
	oF50VxxFCKpcKAapsDocwlyLohuRjjJvtBfO18OQ4CuX7xIOFl1dmnmiQB3LMxUu9hSkA4IWnS2
	dPpkHcGBhSsR0lJ0/i4JHUyduk/nkTe/770EMWeEsTwWC+c1mqsn5wiCd+kNClFeC43EvENlFWr
	8JBwlQbcsJ7ibqy7dOaH3wgrJ9pyeAiKZM7CCbH0VZLTtJniA1zWn72qu5xms7bLP5IZva3d3Hi
	7t
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr841485385a.11.1793180376617;
        Wed, 28 Oct 2026 02:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr841483385a.11.1793180376205;
        Wed, 28 Oct 2026 02:39:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97a093e7bsm32246735e9.2.2026.10.28.02.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:39:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Francesco Valla <francesco@valla.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtio: convert to immutable irq_chip
Date: Wed, 28 Oct 2026 10:39:33 +0100
Message-ID: <179318037067.12114.9317144412817671928.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
References: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
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
X-Proofpoint-GUID: Iw8CoEoPweE7SzOf6pathF2Eo6U3uIIU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX7IYV4rfkFyPX
 n/o02VxXr2jFBg2dZFZ9DUqBK6UW47ImeyFqKvPB6EYHJpCHwHb8DAv7QzJ6vbTC9LaGOgR2wOy
 e0/FWs2ZsDLqu1vKgbV3uYvcr+fh+Hg=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1c2d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Swp7RsIVSdNva39kMz4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Iw8CoEoPweE7SzOf6pathF2Eo6U3uIIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX/NFNFnKnBG+9
 /YtF/lKtUjIq8z4Bj63OqC9hZJ3s4+uxA+zKU2NkGKTe1771idfNSTr9VrxZWGy0Ws2C8Szab0M
 RoFGaDlcI94/el06bIYB5KdNSRbONL60XJ6ByaHozv1UZSpaOqtlzd0PObf2UXEv9pFBUAuiwvj
 zDSWUCT4ixQiaOYi96uzMPx45i37sU1aaPEclMb221I7vuBQ3W26qsXyh72YmlAfY0oqubCcdU7
 M9BBkz9S40i5F+YlwgCrGKZJT/ekoowC90JqrGu6F9n1frUi5XVU+Yx9nLEkVlBv0AOp6CSYckO
 5SMWqDdaBvmpPE92t8vRhIL0urlxy6de6wQNYORQptieiVYK9Cpmz3rHQ3sFvZIREaNJ6qGJ977
 LT/tbnYVAMfm8eXBjO5uDBtvs8TaohgqbUlmHpixB6i9oGnI1DimJ5zDaJ368x6EfAZkPY11M9s
 Isniv3O9YNiIROYmWeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Tue, 27 Oct 2026 13:55:24 +0100, Francesco Valla wrote:
> The kernel has been warning about non-immutable irq_chips for quite some
> time, printing messages such as the following one during initialization:
> 
>   gpio gpiochip6: (virtio2): not an immutable chip, please consider fixing it!
> 
> Convert the gpio-virtio irq_chip to immutable and add the relevant
> helpers. The exposed name is kept the same as before through the
> .irq_print_chip callback.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtio: convert to immutable irq_chip
      https://git.kernel.org/brgl/c/c3b94486f0c07562eb894ec6c666656f8cb6eaf0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
