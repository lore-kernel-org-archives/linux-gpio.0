Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827930;
	b=c0VFzBDYQc9K+/gucXAEYJBdPanlt1bE1gqUEv//yemD4zb+mFxzjVxs7GtDJvo+VNMc
	 7TT81OEjkkmtOG3LhHVzDoaV3UYtI0dGpBypskXA/+qHFFZRa58QOVqGJe+x2qOgiZ9yA
	 V3vIZRTfPyqjAF8vqV7Oads6fqwPicIDgEssCoC/9l1eakUvj6xLrRrx23nG92MOOFZsY
	 Ej2EnIQwx+VCDj3V6GGQ1NGdra08BlaZno0SeqaKLMSh5zIki2IPcG8AF0NTwaM0+qS94
	 AqYY7iCHUh1DfC5q9yWTla76UEane7EqREswwFh/QGj49Bo97fS8QMYy2tlsuN3CxGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
	b=H0ioFMg1qVTTOeUP4YKJQRy05nrrRFA4YaeNSNhgm7PsvkEndGdnMpi8BZ7YsU27zh9V
	 yIbuMkJzs/2CWnC30DCtdtcXwPvJwuFvq5UI/iHGgMiFNgCPSJVxwRLNIRUT7iQbL+z7v
	 sBGDFZk4S6klnAYFfLLAw9jAy/Y/5nuuNeIvu09gHr7W2es2x3KbgUE+hlutrBw82/YCA
	 qdFTWWHP4MTwrth1+6owcUpfBUXCDyYSGBIgLNaJGZZZnf3JsRerx6fTvBDX2Pt2F0mKj
	 HHsI2XMSMkUAm1lPuqJ9gMZe7mawjfDgYWL9FycxU4My5V5aH6YIzVLZBEliR6EWThw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRKWkWRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5ZT3O5H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA10C606FDBC
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA10C606FDBC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRKWkWRT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F5ZT3O5H
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG7enaR1109781
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=; b=CRKWkWRThQ1xx1vb
	/MHR1AViHIRZO3yTTwbdNqLlnRMJVZ3itnLmZGL6FlFBs0NMm7UlHHOC+5hJVRvL
	sl+3/t15KWWPGEr620bIezcZxfp1dVS48a8WYtrfdwrh5QJG4t6ScFO1JrP5C+DI
	oBzj/5IJPh5ecBPhiic87dvnpqbO9yuazvjOngJ/0bg+zshSLVBa4+KlA+4XGwvB
	aKXxxjUXjj6VKqiwYQ4DH6/WGjdcJov/Xb4fPgMCtk8v+50PcDVrg7TLTYtVlAnL
	029iSr/lHPxgAWCf+0+FJFg2dvLLZASUM12YLw1YUhRfkmWmiqXg+ptBeE8qZD+S
	tNQhQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc1vn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 11:18:48 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2c61d4475so77850137.2
        for <linux-gpio@vger.kernel.org>; Mon, 16 Nov 2026 03:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794827928; x=1795432728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
        b=F5ZT3O5HZgXCnfdoXCx0SQIoMcaDMURznKMLPJ9RL49nE1xzWmP15MKesPk6jhSU65
         Ird7VUndRuX3AUBfZvoFwZ5IV6VBEn3pacuWfQahJF3R9fuA71DNcDo2ZANAmAIghjjH
         iDnPiI6zfHgFcszT6IYZO9h8302AujmDIF9IMt7RAiC3DDxz433dT986/eC9pq+hb8s6
         vHjCiAIX52GdFgDpxMyfQgXmLmr1U/MAzbMhqwHQp5y+NhHUF5JLGe37xrZFCt7mNQkH
         JGQxHryIIq4gkbPnsgYJGBtPD4z4p2LaJkUgojj4w/BN4mW6o5uiLxiZQ84FHHqpJfdd
         QxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827928; x=1795432728;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFIo2jKxOBvzZSYjgG6CeFTqjpqM0nrdDEdcpVyDqfc=;
        b=C0mgO9WSE2dWfbfFEXQNRGKNl16E6LW6i59feMZaJqVLO63+BEBXPP5pQpVX9Z0TXK
         qRIPLzAFXcBGUh9wKbJ84XPOYzEYwRdNqcPC1jMOvaVhHYGwDAp4Jk8OPeVTf4X8/+mI
         nxTzQWC5/CN93+hUf1XRcQjr6loFyS0fMNEsShitNX6OrZE76wgUoSTBYSiThAdP7OTQ
         D76vSYAY+6Ra+agIakiQHfIiZga8buVoQSMGba7D25vvkfObovfdkXygKx1j6RLNmkbS
         kpa1wPwimUv6CQngjNPrFZR1VBGI6qCUCIVUOT0C8pu8ckfe5fgpC8/0Oc2bvz2ZJjrp
         Ks9w==
X-Forwarded-Encrypted: i=1; AL+hErEtMu04fL8G0KUzFKxxuJNVAjzGW5itjwLL8xG9XgYOhmZbxVfZuMPyrnzDMqzru7g6A9GVg3TKxNJK@vger.kernel.org
X-Gm-Message-State: APuU4Z8f1Ie+uskn0nC3dedKTc/N1NcK8z3ROUtgL7ndZYhfb9nA0Ndn
	kOEKpPJOdd+DiGrSGjJRbGVzlDEZvQBAVP/APnTILQiZ2rZ39q7U6bGPzLSBFTMSyV9w3HPx1hD
	EJ4Ko4rfWjV1HcPqNHjZDkGmbwpVNfyQGAJjgJrY5ua/fKlgUxMLulFhAGlFGi/J6Z7k9kSKN
X-Gm-Gg: AYBFou1Z5C5TPtMWMeRue4wJ7RLn3vlKa/Es+MI3Ga0ydHZcoO6UaCBGGK8Qjxk9FgD
	lwUHuWiWwIMJ7An+d4NKu120ngaoaPxK6Nswk4wq7EtI0ZpgC92NwyKEy/U+QZgQL15EkTW5lRy
	ElCNLNjCEBFJHCuPcASEkqphsPuxwEwuWtxnAYwZQKLgZbth2JskHnrhwbGXNXLVC+pQRM20aAQ
	Z9TDM3Rj8J1I1fqqjzfp5BC7X7A+9fX8jz7R4B9dP4yTfxrYNfPjAKh2EJ0c4RRl2vEDY1D6oVb
	5zSe5wKJyT8Zm3mYtV2ATpwlTw2yt2EFKZUp5U6IXb7yhDG/8jxhWX/ka+0e3i1+fMUv4PSCm0U
	McRmSL8cdn3CZSzNJyTl6OvWg+pfxKyl0RWXdJFsR2KOr1MSEVs4/KyjENv2tSjdqCWevfVJe5E
	gzgtqtLFDdGiIvOg==
X-Received: by 2002:a67:e109:0:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7d64d134b30mr2130447137.0.1794827927882;
        Mon, 16 Nov 2026 03:18:47 -0800 (PST)
X-Received: by 2002:a67:e109:0:b0:7cb:bbcc:e52 with SMTP id ada2fe7eead31-7d64d134b30mr2130439137.0.1794827927334;
        Mon, 16 Nov 2026 03:18:47 -0800 (PST)
Received: from brgl-qcom.nice.aeroport.fr ([193.57.185.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm299378445e9.11.2026.11.16.03.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:18:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Jinseob Kim <kimjinseob88@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linusw@kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: kunit: test mixed-polarity multi-line hogs
Date: Mon, 16 Nov 2026 12:18:44 +0100
Message-ID: <179482792143.32181.18418835714550547021.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104120055.256-1-kimjinseob88@gmail.com>
References: <20261104120055.256-1-kimjinseob88@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfX8+kCm0BSqOoU
 VYeYIWq/lGS6c2Es5pE9KoCowd1k4DT4fqqKveo84Due+JhYK5QzHb2Nc44yAXpFyxmOhA02Wrp
 D8mLgxB0Wl7pqbPqEp8trB9/Y78U27I=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afae698 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=g6/0voG6I3K7UbaExJZWvQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=R1EDEDDpMdenlzZh-PgA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: DHpwUFyNmeRDY6FcSWtnayYFOZ4jHPYm
X-Proofpoint-GUID: DHpwUFyNmeRDY6FcSWtnayYFOZ4jHPYm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NCBTYWx0ZWRfXx1mDFANgcasW
 B//JQebtAefkpS9EEJbxIWhRV/oYPKFQUTFtB5LEijKQviTNhslTmq9lzBF4s3vyPzmWe0DMSzx
 1JQVudHYF+e+xIC+ivqBHH54YBvNztkIM/4ttswodK9tZxjisrlJnlYHIJYZd278FUq829DOXOC
 xIvf85GWlqHscABYwCXZYtp/Z9ing5Z0UlEkhNkCNMbwtZQFFQQB/7rtTR/llFA3ad502651kNj
 F5KwjJQQVUOBtaEvMcIfnzYrW/QcmbsyaWHbgH9OSQp2HynECDYVvFdKXnoMnAwMA+SQQisIMGJ
 ncE4aadjVNGBX34iYz8eDK43vlsbAa5ukomcuEiRkJwrJfFAVjvhPT8VJ6O8PIBh+cNTjUvFPV7
 gUSDhKyX2wcb6yHpkl0h/PE9P0lCQ+ao3JwcaHjAn1ZZgSVTmb4ZmTCpFHwf1TNdYRfLwsOLNOx
 ZIwMlxopBSEYI/An4XQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160044


On Wed, 04 Nov 2026 21:00:55 +0900, Jinseob Kim wrote:
> A single software-node GPIO hog can describe several lines with different
> polarities. Add a case with alternating active-low and active-high lines
> to verify that lookup flags do not carry over between GPIO specifiers.
> Check both descriptor polarity and the raw output level for a logical
> output-high value.
> 
> Register the additional provider and hog nodes in the existing hog node
> group and add the case to gpio_swnode_hog_tests. Reuse the existing suite
> lifecycle and test-managed GPIO device reference cleanup.
> 
> [...]

Applied, thanks!

[1/1] gpio: kunit: test mixed-polarity multi-line hogs
      https://git.kernel.org/brgl/c/e60a08613402e1fcf6e3d4df0bc80969140f7fa1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
