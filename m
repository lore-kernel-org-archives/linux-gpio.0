Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501020;
	b=FrYhJ+x8IG2DEHZILqfWLSgjpKkVDhH7p0ZfwupCxzve6wt4Xxuu4OfHHRlgyTx1M5Oi
	 CG4YYGk36DjQnXBc2k3J3hwnSgZguoBEDJQ7ac7Q9OAFyC/AkxdxDSX8twzDXKtk7V8ss
	 BC3DtOHbcyeL6oidSzEk+uYkGlQ+uDK5YEURiVjL1lMFjrtX6+svTPVeU7P9P6/Sryc4V
	 JWoMYHOefXA7hIVrJ0H0HfdBeKgX13OwDVhp1448KggXksns0bBQ7yD+tPSn+ptZeW/Q7
	 3onu5HYexK7SJ8Rmdg1c/mHtaDWLGvyPRBVgtaOmkb+j6fV70ZiL4p5RvscSxEeWoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
	b=POpGPfmiJTcHszFOIU5Ypa+mb7gf+Y9tnK7qSjbzceMPawJ3Hx53Trz2qc21SbbJINho
	 SOxtxlx6wu394kU6qeIZ/XBQr2KmUJHN4Y1w7/t8QtCzOFkckNZck5vmJqGgTlmmr4a1x
	 GjHucRryBzIGK8SDADL6JJPrT5BM2Q2MLUhDRovnIFXeshljFxgGRK8o9ug8vbKoWTIJ5
	 P9yjiBY1qyTpU/xNXTWQpr0YU8blvwAir4COplZBYaJC7MKZYS6SPI0krQdDEd/2JEihb
	 5bbPJR8OTsdV6PoqEJknjSGrBnKes/hkRFCjwQJrFC8+0pl/f1oYcnxHKKEZ3DxWNdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNc6jFzo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVcWjOzB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18879606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18879606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNc6jFzo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YVcWjOzB
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxQFv420206
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=; b=LNc6jFzoSFDHmR5u
	LF8RTeGBRByVR96ClsR/T8I2QeICQ9QUmvzeU/ONongyZyNctfI5rI5g4GyG0hgE
	JNDQZZUjiddmad995aNw0TMDlpG+ZYz3dD3FKLtYgj0nB+uiE7ENG/67XyX7NCat
	vrNEosuyJscatSxhuQ6VMMZwzF2NoeXoDJuFtqKSxSmUxkXh/ZFrJ3CErMh7TfVe
	Sp62QE8LjW9e9qkUQaahNtbv6f2y2cZ/IBIpdzXuLXC7WCtwoGRV7AwkCYakFEhx
	BusWdeG7lmIMxrBmO274+mmR0A55xfA48FRO3jpYdISoSv3SMWZ3JUfXqBtPiSkH
	81vfAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stg45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:56:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so547528485a.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792501018; x=1793105818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
        b=YVcWjOzBRecQ6eKgRD3pkFNAH5SITuC8kiCv5o9ckWyaSTL/tjmv7MjNZPC8ScgNEm
         KE4Lhw5idbPXTvIx1YU1apkH0AzjlrKHf6O0ujP/ugqItCFggbgguc/hPh7eHp0yZg03
         fJBaIX3Df+8qdWTsUxFKydK1u1RcD+aK9OLmT1WeeE5bPsObljuP0sV2tAo3sAXgWf7+
         zPrfuQXayf6wEQoK/t8xgNSfrP0ct6KNtmcFDUultj6MbowUeZHYhjYtj4rW3qMT0DVU
         RhOSloxJtCY/O6wLhQZ/+Rg0d7o3ovTSj+2WZCVahQ4ywWRr7BZCghryxZXWYi2uHUuU
         fyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792501018; x=1793105818;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3/dPVcoNxcZ5FjBTEMlzDY4kjhP4HB7Aogxc305qqs=;
        b=ihWECRaGALgUgpLlTQIdPaeNakcfhE2qLxDr+n/xhbNNVe9ekoi70/JV9Wm4vXQM1N
         xd7jhgnowjtGjy0Ny3aMTxdLAMTWSDZAX9vo8kMlY8Lso7ni8Qcbnc8+BnDrYB6xhaFi
         l4YfGGdFARBbcVNf3pbO+/lMPBEATziE1jUiWqL+9t8XnyWMw1pgZ+0YHLc61N3E6p9x
         7ic2+sdiVwTf8aws44VTE1oTbMg6ntc93+93Al/cZ7sqh7iNvLOG5SwMAgY+XUgLVVv0
         EJtbBceTKbQPUu3MUxzJv0xWlah2AMhAE6G2mbUzceSBtl/4px+3qvlmm+l29aH9awVQ
         ApGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCO1tqomC6GaGnZp3EH3/6TDaCyG4dIXRIhnYqN072BlXvA8jjG3OLFjIv65uTZp6MUr3Eq7MWeOgs@vger.kernel.org
X-Gm-Message-State: AFq9FYJGzrUDN69BpVa/7jmHjj92s0Zn7rQGTX+5HJkzKUTB+qONVhV9
	9+7q4OpkyGVjxyLD+HChxzgDMWRfeT6gCb5RcQ70JW9pCkn+IMN1Vgm94WJ7tiKKjF99tOrChmi
	nUk4Ab2RkyW5Jfw0GMf3jHXtYQs445bnCpVkiZbpS8YhlaqxJZCCm6dx587rOCxXV
X-Gm-Gg: AYBFou2oDkSpfCzGxVRMk+eFJtlTQpZ1YejBCVzV/2fE+At2XkrqO9I5fCqcXJ9T93O
	+wLSLJ9qVKI2eWqeqvjkdZtfiJF1Gy6feIGL2Q7wjDFeDbmN4nzaB+Tm6jvwFmDy9yiS5NXuatf
	uOowf4Z2JfPmrNoESFjtCP8BFiMuizlNHAB3tOK2SnURgQDqqqep6Pj3uv2Dyu2cTS7ZDUEoAov
	LslM2zg+U3eZVQjgwC2hv4y+WYrQxwUkUNKcbcgZuj+6etQtAKx2ZJY1nEL+K2P2jt3Va4XPQAl
	0BWSkM+ZsDKBe0PxZeZQwrzNEzk7/o02vr18sQZwov6IZqvByRMm+FgCozRglkzwVt3hIsJd/Br
	UMQfu5bAtIelv29NFB4r0pEp2l3U=
X-Received: by 2002:a05:620a:178b:b0:93c:9eb3:9f04 with SMTP id af79cd13be357-93f29b48ba0mr1665942485a.9.1792501018268;
        Tue, 20 Oct 2026 05:56:58 -0700 (PDT)
X-Received: by 2002:a05:620a:178b:b0:93c:9eb3:9f04 with SMTP id af79cd13be357-93f29b48ba0mr1665938685a.9.1792501017746;
        Tue, 20 Oct 2026 05:56:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d823b7esm5783237f8f.40.2026.10.20.05.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:56:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: Free chip resources when allocating the label fails
Date: Tue, 20 Oct 2026 14:56:55 +0200
Message-ID: <179250101315.32144.17934365724412757683.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
References: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfXz1B5BmIPcqs0
 CM2MX2C70iY1XOF2LKz0yu3Fq7U81phoILwEQDjMsKpNtU3Q8KF6mVqmR6jv60sCUCFEDvs8jrW
 icquyKcrkb3lcdvnJq5IWLN1qiYEVOQ4r/IGOmaf+nqgz6mcnvHWshyA+BStcewlkQcYuSwnBSk
 422TwUyu3FjRlIPllkzN3U51kdq7dkW79UfurMw6lE2uyfmzh8MZMpH83hJzC7xT/MvGocvWqaR
 iqNa6TaEbQJEznxt59qoqeKheo2g83mVp6gzrrj6dh+9bE3Dd2/uhZSucFKEcsTCJ5olRZYGOxf
 rCkC0JMA32GmHj4sF8oxlWEN2helJ/334pQrDryWc718FigOyD3EBY5WDqOxDeF14riPiNXx7Fd
 Nw0T0LR9Vs4suWTd0im2ktTrzGPPKQJDIg6PYYjPM1ui5zHpyes2/hqKslDgmrY+vOJvzSiC1MY
 QSpia80eKwcEXLKvlow==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad7651a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XwMsx0wW_YWBngEHHpgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: v7nXDnWMGd48Frqxz1ciU_ePzk52QQoX
X-Proofpoint-ORIG-GUID: v7nXDnWMGd48Frqxz1ciU_ePzk52QQoX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX1w498OFRMNet
 Hk32/P8uYENEXH/cED7EZ8JWR4+CY6k9d4m/2aDbkgW1PHoEzu3fvMEjB4iI5wl8+cdMyuMPCw9
 748fa8BYu3fzBWlaBSuGGzhomjmXuFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051


On Sun, 18 Oct 2026 13:44:56 +0900, Baek Kyu, Kim wrote:
> If desc_set_label() fails after the chip's request callback succeeds,
> gpiod_request_commit() clears GPIOD_FLAG_REQUESTED without calling the
> free callback. The caller receives an error and has no GPIO to release,
> leaving resources acquired by the request callback held.
> 
> Call the chip's free callback, if present, before clearing the requested
> bit on label allocation failure. Leave request callback errors on the
> existing path to avoid freeing a failed request.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: Free chip resources when allocating the label fails
      https://git.kernel.org/brgl/c/8381e1f15e27087fcb6f07046a526ac8b9b9b2b9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
