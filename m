Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180780;
	b=EI1c//GisOsn1bsNrZs6XC6DdALWFVpgkDgjRgfdfR4N+qZ3AQmJynC7zcGKc7HJcjIt
	 effC1Buwfwj3q1OIsC0FiATngaZG61Q/CK52Nbg0xTKmpFRoE3i1noZfegxv8gGKpEvBD
	 NehfFKFDr0luhOsiA7DvsEjf4FA7nQiS/lL9HC6aitmpaTn7pIM3QqvvOnQce554cs+da
	 RYLtr52uuwg92XAF8nqzjDm//kznZDvUMfagkNkCLprqVtMjPiBg3gsLFrGZjziK038OB
	 eYYElcgkrf6BllZkNgexc2SHyUZvRC65eeVQh+BRIm7LL9Wz9oI9tuY+SSFTxKPGHMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
	b=mXlN92ZCb0YZZnWTCGiL6boQsNAThn8oECkrLfz4uhc4WLrrtgaM57Nwr029+j3SstNz
	 +dr8+s/9afUoKroAYvDdMl+liEZzVCMUcc2ngtecXraFugA8x4tGCqHrltsA+4EtdIhOO
	 zeT0SB9DoaCJ5iTrften3EZAA0BLUEC8LNSuVwUVVtifxN40owGQUmZ/UmOgNFCWpN8+q
	 JL9M59LGwmlMO9VLRFj2RDzXNjKEG0RInCzD/mAub9nCIKxZna8tiaq0STFV15NEpw+m7
	 5pS2xryA2RGlE6Ama4SEdWvmjWSKwt9t/f6Tha/ZlD5P1+iznGwOw6Mn6zsbhCwXPQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POvrRvz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw0gS1jk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEDE606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EEDE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=POvrRvz4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fw0gS1jk
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3gu557123
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=; b=POvrRvz41W9uThg0
	GNb2eSltDIZ4tAbRUDcekQ/rOoqJIoXChAw4eu1Q/LI17G92gb9Wj6lcirYmxdmp
	b3NVhb1Cr1eA9qhLcoWjC0m6hIZBTSsyTi6WVMIKW05Mzqy2CeGE6VDdKXNZwi20
	s81mcapVW49ByfDbm/zMGYRZQCHvSbUmGnfJOgymQPQV+gO8ZWNkRKzb8/VrCWog
	1IEdnFU2WgFo9raGVwb7bYFWFD1Ywa0vWM/JFdIazYf2vadYhmXiAF5KcAqyvGt3
	XLaYVnuLTKGJxV2ZTfjdm+t6D81D8YzQxk35GC+bNEyTBblp62RO23yqb9MnmY8H
	ZieSww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsf3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:46:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c84af45c8so3913026d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180778; x=1793785578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
        b=Fw0gS1jkOwkR3M4exwNXb5vamIBa56jLco4yIHiJAo8MLefN4dHWxPfo3TaNizYL1Q
         vDH4D2Wxift1HnW5SqGJs0mrkxz0D2486Ug+4g9wkKlkoUugYDh6ccBonbEYLeX1X44z
         1ZepPdzA0+QyVi+Aot06VYOoiwqVdF4Wdzp91acPUs228E2gOrt+mLNwwr7w8QTqjtPB
         SGYMQi4REmscyJl+uZkef3Xu6raUTdczzNEQQNOvJiFegB5y1a3GgpRuML6J7rinTC5O
         o8G61ZGFUvzx7AxbnHRMAXZzzMBzi+pQLVUVfwNxq2rmQbltACZ/shwjvaGbY33QMmY/
         RiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180778; x=1793785578;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A7sCrPf5XBmefcPTnQWdbsYupGHp+WgEFWYi+0+UaM=;
        b=WiUGv02lpx/LPh7yEYo9Q1orv641013OfJeZAbwei/bIEE4ci8uwzfXyDdPAIBegCF
         cgX83i5Idl/+FgDTfnitVA0NFyR0WwQ0nxJKmO+N1Av+JFXbo86EG2LX70KgaCKCFTFJ
         +oaPRap0Xmzk1pxRvPOOOHVrsQ/V6Oy0TcXQCzLk6X5odAjmAGliV+OLGto/08tJc+TG
         1IGCvN1pLjW6s6hdM2bpigJUZMzm7pa0uvU/s79hFggsxkJgSAWzyeCL2yJPP4a2oagr
         kABhBBlW6BZdg/nXSCd/iVR4jj4z6QY6qghG1Cn2AKLUZOwMSPgKQztEGscWCimzwyC0
         ShSA==
X-Forwarded-Encrypted: i=1; AKwUvBzc8Dcvypxl9/XTg+XlxY/lG4oAmDgMuj3Xya7rFV7ICySfc+nzPOZIC2QTIKy6SftmbVJ/IZsRPGuE@vger.kernel.org
X-Gm-Message-State: AFq9FYKxoX4W0Z8uM08zvghBXtyauqMVdFIa3+1jMxHLZStn1EGJPN59
	wJdC2j2jnLoWeusvUIX3Tzzcd9l6dObDd3fZXZi0dBxxuHllFd0V4RshIF7oj0AjoK56J8j/V9A
	OEVXtVPF5wIeXT2kGwkEMxcdG1zYmmTyFQ9D2Fvv+oCjJQGPlNISsaHQL3lml1KFE
X-Gm-Gg: AYBFou2gGjmHw55JUhDP0yEmjkgwIp85OSxzYJDkapXPC7TCV2C8M5y99ku4/180mbw
	H7PfBhMeg2QWrh1zNGYbZ7klqwstklRDHsjEj4+/KMIp7s/YFpzNDKsWuSR8UKdKdHzF/IGPnmq
	Q4aVkuwlaQbeWnh0QmMpn+kEepJ3SuIiT6C6yaU8MNydQuX7byqju+8/RTSZB5F0N7sEqqH5Ut2
	hD6jXml5vzwQR6Q90atp0ob4F3PsfaXhMJpFMDUDfYMg1rbnT9bQyQzavfzjPLh7oeKd8ICXtbN
	qw4FjJ9IMn83S4BIwyyFVRNGb+gc8REq0+pygKBjM39W3zcWMTbsdW7a1y5J1jUcO8CUyyrDoqB
	QSm7bBNRXHFTt6LsmzKtmy4kkiVukFAqWWC5X7EeIoD2GXt/LjvLj9uPnLIsxkrXZ7JfJhFENqd
	YC
X-Received: by 2002:a05:620a:46a6:b0:93a:82a:71e5 with SMTP id af79cd13be357-94408aa271amr236648685a.19.1793180778418;
        Wed, 28 Oct 2026 02:46:18 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:93a:82a:71e5 with SMTP id af79cd13be357-94408aa271amr236646685a.19.1793180777987;
        Wed, 28 Oct 2026 02:46:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a969e61f9bsm20311365e9.2.2026.10.28.02.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:46:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, Orgad Shaneh <orgads@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: octeon: allocate the GPIO base dynamically
Date: Wed, 28 Oct 2026 10:46:14 +0100
Message-ID: <179318077288.13137.6470160689389731507.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027060221.2687941-1-orgads@gmail.com>
References: <20261027060221.2687941-1-orgads@gmail.com>
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
X-Proofpoint-GUID: qafVJ-QGGPQruqFwLPB-Dz6NWzg5lhnR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX8ROkKrBIAD7d
 4vHPZYY/N5q7fXg35IHO8BQVJOE+YYgunUpEYnHk5zdiNjW0Fk7G7EZfu+TVGyScopAiySoQ68y
 531WAbth508hN0abHabzY6mY5RWJgCg=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1c46a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=feGN3rDt8dsL0tduLgkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: qafVJ-QGGPQruqFwLPB-Dz6NWzg5lhnR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX0xeRGIPKN058
 my6mWvg5jqI+T5samiVoGNzX2+/hZthxont951VWMirHdJ3+zPoc+O7VTE4ewrjZoulDkDX1KgQ
 EKkNlEq/whcoEtC5SrzxaEN0y3TgfQTS3Y/9kPZmJlW8RSEa6JYjMqZV5isT9axwRZ4aURrR+F9
 j9U3/HZsxTLxE7omu+t/LzhPhN6gJj2TpRjKEVb1VxDq7gMPDynW9Y0s4/MCzEWWm51jjS50MIS
 IM9vYRy6shyu7ncb8zwdfecWvvT9J1ZjBRUlQjRVR9cyOnul+zemVrGk/eIUX4QsA8PlDKgBscO
 EnGEdisr0hLK/5FQthNKRGpDQyBEBh6QJYYmfUO+0885WKDOlTPC8nrhDLcsPG5e280SvLqug6b
 9dtwW01Ig8w0UmkEHepVDYIdJue7IdrsuwGrybtV5fIprr6Afw8+RAShcRgnW/LOOhEHZi1p6uG
 kfYSUjgetgx9h/PTOYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Tue, 27 Oct 2026 06:02:21 +0000, Orgad Shaneh wrote:
> The driver registers its chip with base 0, which gpiolib reports on
> every boot:
> 
>   gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.
> 
> Nothing needs the fixed numbers. The only in-tree consumers, the
> gpio-leds nodes of the D-Link DSR boards, reference the controller by
> phandle; the GPIO interrupts go through the octeon-irq domain; and no
> board code uses the legacy integer API. Let gpiolib pick the base. Only
> the chip's number in the deprecated sysfs interface changes.
> 
> [...]

Applied, thanks!

[1/1] gpio: octeon: allocate the GPIO base dynamically
      https://git.kernel.org/brgl/c/dd2ad62e78990087bb62864ae76e7c2251fe5b90

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
