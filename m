Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176276;
	b=1ypPigPk1lMr1tqHUAlQoZFk1EYiPpHDK/XX7WGv9Wj4HH8sGv9CpMy7n/u01jhYntqx
	 91uN6+4n9qSifLVXmFCQsdbK7iGUBeUzhu7t0HR57WMgzrCOKKwTG6hVa7L0Ejbkm0gX1
	 CQt4pQ3BB1HSDbEJdBsYspe/i06W1ddsnbmLGCbY3KnE9S7c2oGKNFawLVy6vGSU4Rl47
	 ynZdqCSAy8OXyh2Lishpmmklp6qHVr8R2rzV6cFtHFQyKfHEW6OR/C/B9vFuxk5CJAowc
	 prKErzk2DPy3E8DHZzRhMoG9b6D8AcIagvoW88KUJmNO5Uqes1eWfSOXeNI1/OhDaOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
	b=rc1unUNWPi9JsQyr2eyPgtTo+xxXf8vNcztVXsVCbhASubZTSaoMyhintfRMMjPkUztr
	 liBjqOnJI0sKoStyBgKwy41yVK32NGm5yjoE3eraTvQcCqgsROOhMegvUqa2ajc5r7DSQ
	 xzWGkCk6MJri75TVcnFsxuIjOYzJJX2MqOdt29kLAAA9Aq970P+BE4KQ+BQNZol9v2O4w
	 WkW5VK4i5Pxz2MtKbk6kHsYWVl0CmXHaG00VoqkGIVFjFc98XeYCD0S0enpl1/Edkf/7q
	 +MeShIGas9S/WhGe5wLc6oiO42/PyFlC++8mYxzUNwbYHeqJwgOVTlptheleQyt1bKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XsCqMjeO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTWoLDjb;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F08606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29F08606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XsCqMjeO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WTWoLDjb
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Jxt53892470
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=; b=XsCqMjeOARE/Q/fF
	OyY9vTZM6fyCJPBHbBoSATGQoMm036lb53QSYxuj2w1mJhX7tsfHpHnR9PbE3jlt
	2+dMNaf4l+6HztixPmOymiK6lhoEBK4565lHg2QkSILOyQaSuhuFHTkuVf1kOgNT
	6Ija4ud/vzR5ZpJDe2snXqQtfSyxeLJhM0dEFEwMoJPItH+uetJYCdkZ/cZe9Ade
	A479OOrfZIQZmo3V2PUs2B8W7XW0kBoyswSI/IfvHsXH0+47ExcyQi1Z5QvMSIgy
	hUhxnhiHWYbSshrm2QUJJvt8MRlNefwiZljMH9j976s0OJfvEPcdSu+cbqNX2t1E
	5aynyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f91hay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:31:10 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e49a1d3b1so137743685a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176270; x=1793781070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
        b=WTWoLDjbSoAgQzS1EqSQkX6nguE874DfvEx8y6fbUHeC0QTiIt/fNU98PBZNGnaxiU
         GeP1KwA9/gtB4SW45mYi1SAYjWzT+C8bOa1Gf1KlD//GWBbUGQl5jzaE+rJj2WA7d7LY
         ZNQQiPF6l2Fgfa9MlgQcuUWcJNZffBXVPu/cnIJ9vpBulnQPq2g1Pt0g5TIE9xzPDuP4
         Oi+23GcGrVW3092WBl1TYOtd9RndwAZfHmXSu+x2jDwJaR6gMf2ziTVbEYYAkW4EMcWK
         SH3BzyEbUTu8tPcgJIus4J+2hoZ7lS9OYqyy2xzj9VisgTzwO7IPccPnWTKDb+CCY+Pc
         OZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176270; x=1793781070;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QnQhTQHrbekA/oQF/OOz+TgY17TbI7NZlDDcN7iFa40=;
        b=ycrC5v2YCE6ug9+FofKFIJ+6o5tyRa4oZMB/gmQyerWXn9Xj3jVt5WyA9oCBWBSmWe
         f/esn5xvxdf3EeJ+wSps65khN1sLhia4b5XPAhb48dVrzD7q+oDQpjG4oS1KPoHium0+
         WVvgXok+Xrn4GaGF71wahinspZVPbY5+2eUrhz/+9Dikp7/evSyjblxSNDj5GW1Tj09Y
         nAr79y9GO8hQPOCI2w7qT02m7OQeHY9xKnFp1i4G0U6jkFEmKEflmDPaqezo0X6PBftC
         JJTktakPqVEl6HhFpvvSRb9sgAmUXSQtsVSkVLTd2UiYxsKHFiD/vSgSTUGYSi9mf7Po
         UnRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA9K43Lioy+Wf9uJIBOuH+Y9PkB6vbd+2mc0wFTg6wp3rca0Tq3inxgM45xlCwBD0Dq2a9Qvri3wCq@vger.kernel.org
X-Gm-Message-State: AFq9FYLLmgqkdpe3Rl4gvkzSWyR/kBGsEPtVK+DgQ3A8wsYd8tnx1JEH
	xUXWVwirB8biMkEz3jGp55HjvBeig81RT1+z2NhEDDwQMS8tLF0rffANaGXB5L13govW7cvNj/U
	+3xDlGmGk+Bsqtvtr00lGDhQe4dC4dq0oHrLngLd1ORDylOM42aVsRUJDhxyl+LOo
X-Gm-Gg: AYBFou03mhjiDG/3ZbwiyfvWlwUAt8c1uVhzD4uPJfDASvz0Mc1j2VGo2Vb/E3kpGQr
	OkJA5ZCdUlxcbFmbCKj4b3qCACSFa0mMU/pkNSc482ITs0+JZYXkwQgadjtvuJ893seCGzQKAqw
	l9h/PmTKoTBBuGGhcEnEoeL+RsQHPQ6ps3cv6cZ8P5nHUN4xneYS3r2dUzmG936j2H0mbFbK+QX
	eVwn7AiL1EbozqvayUkPpQ8eCFCFNu6EqSbl2HPGpa8C0KFn4Q3itVhWApMW+C6kwJiTYcDguCm
	Pp9Lplt6DhDV03Jv1V4N7dRpCQMIHX4v0q7Jth6h+MmT8oWn80PovcbxboWEYL9XYiqvHKHvwL4
	m2IcSMUN0GncZ885onRiiUnGeN07AJvRc46zJ4EEQMne5TTnPxIIOrTHxYr9n+rkn4zIW5a6oiL
	EA
X-Received: by 2002:a05:620a:8012:b0:93f:43a4:a47e with SMTP id af79cd13be357-94408d471e7mr193362685a.43.1793176269589;
        Wed, 28 Oct 2026 01:31:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8012:b0:93f:43a4:a47e with SMTP id af79cd13be357-94408d471e7mr193355885a.43.1793176268405;
        Wed, 28 Oct 2026 01:31:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e4115f496sm26025018f8f.5.2026.10.28.01.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:31:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: kunit: add .kunitconfig
Date: Wed, 28 Oct 2026 09:31:05 +0100
Message-ID: <179317626360.6323.17510769245727251131.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
References: <20261023-gpio-kunitconfig-v1-1-0dde8d430f20@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae1b2ce cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ra0splB78y1o-YdHdy0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX4UXsC72cmb6K
 +0Q3fEDne+vHGJPGtOjBmR/kNn3smNkO40m+WMg17M0XNGcz7DUBDV2Se49BoOmC2CXIOWpLR9m
 szbrQRUNPzjA/OFSEUTwS3W7zSn6RKc=
X-Proofpoint-GUID: CNXD6CyQ2puIDhTTwgvN-327_0S5N8Im
X-Proofpoint-ORIG-GUID: CNXD6CyQ2puIDhTTwgvN-327_0S5N8Im
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX28ths9G7YxZm
 JWBS6TuVmTC/aKOuG9HZU/Ki3NXs6Wlq0gQfJjQQgLKqurPk0Eb+xwofI0Oe74NMINQYLJi6cL7
 fVRlBQ5XTzlZsSSGvlqNxBEgqp7q/mjkcT7wPjKpuVqipYGt6Nijnt7JoOQQIva8KThJT84ye+l
 XsgvoLHi9XeuiqVEKFrWj3m9H/inF9sRDMvfCZqQ/O+76Qf9dqBH1PFsLeBARxzX018zLkNq1v2
 QF1cYO2+3/akRbXlAVpvZuCX3lQlsW8NNR9PNQQjQHJP3c0pYmms9xUMkvpslsewc3H8suAw+Pl
 1qGR27/gy+X+cYR4si5vJnOpwfYpbHYYrkxVW3mdlWzSEtFjaMEaz7AgmZbP1Wp3Tf/+8grohL/
 IRSicDy+xRpNn5CBZKTZRebXyHavV1rXN8d0wisr5XeLiZaEvYcOByakLhiSztExWCbXrJolIhS
 0PDqVK4dQIl3KM4t47A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Fri, 23 Oct 2026 11:53:16 +0200, Bartosz Golaszewski wrote:
> Add the Kconfig fragment allowing to run GPIO kunit tests with kunit.py.
> 
> 

Applied, thanks!

[1/1] gpio: kunit: add .kunitconfig
      https://git.kernel.org/brgl/c/5100ab706694eb55ea9220891f4e1b0b4121925e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
