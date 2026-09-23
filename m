Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743EC46AA62
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151243; cv=none; b=aYusvJ97wdVTOJ6IdOclqf0AK6/i2LLkysAUZcIbeiWsS3rHun5f/RIBuqCeI9IAipo0/hfcasTiHzepUOMAkwzBRYrHnaeeiThqgYJJGMAndCvmTi2w0EoGktAzzrwc/WHj8caloo8thZRTVJxb6vWMSp5nVDfwbEGOdASKap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151243; c=relaxed/simple;
	bh=UC0vpk3r8udDGy5C5mG2ypH3ZjwnNmEG55Zvc9D1qJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0HQsnF4M8TEKBljJ0eaq/Ug0mRnPthgoziUpZlchZ/KF/0VQEsdT/wleuM7f/xcj4gZbHUfw8CWLReNFLp3OZs24rWGHx/82WvCOUQTaoI4yvJr6IlVVE2c9ziA+I/PfQggk97JpSPuCCKq9c6OvEEBYVWvsZw1ZAYPVdTu+eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc5nEqxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRoRdDZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc5nEqxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRoRdDZ5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79RqA2697499
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=Pc5nEqxjyffDYNoL
	tCcYpKJMosbu75RawY+Dy8ZYulqkAZflg/y6Oy7BWAHRGabEX3UExzWlyyrDKS2v
	+U0kLdTnitIgjKeznvUsuP45A7vKa+gXh21xgveKaswqj0dkQFHDKYQxcxCJ+AOO
	jRmgaF7CV9A/K5FmndAcZGU0gsocGLj5XdsnogVlLSN3XQXa7c24JaL1osIvNdiW
	MEwyDIhbhRJe2uZcNmOYVgcwA+X/26gesM5C9X6yPwywAm1cbXYvaLsQRbSgTIxx
	AesRnxzogbCvjmiVjbD7AdKR1ICPfjTBJGSkBbE5LoZ0ilWlP7IFM7PL92/0Gx5r
	db0C1w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw2v0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:13:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a00c70d28so140934385a.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151238; x=1790756038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=gRoRdDZ5FxgKEJ+IMvw9cRM7v7g48cXG4xTnR23ILRDlwzhd0pOQhS7z8sj3/9USvR
         oaGB/hMsEHTQWPtMVy5o6neSGdoOwIBpN5jKnCXDRePYXHurCHvh0dI7FAab3G3ouSkY
         21N3c4ay4qRcoVlos6dBaU/LLxfypb55B1CAZk68pDvUemgNdtpGnz7ljFJFdVHS9xWD
         oP1hNf9EHrbAaMfCqlowPwc6lUOGnnc14J+LZVSBXFPKjZIoge9n96h9fMP/IMkQtA+n
         FZ4lbk0d/piiz6kSE242AI6Y6eM30IrCq6LfNt0+luhuXVgpDrBLjERAgbV0mFJVrQr5
         YVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151238; x=1790756038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=YsdEytzcdAY3f0SBUt3McGUhv+ORT7fK1HjlPI8a79H3Adu/yew3j4EhpUl1uY1fNQ
         PpBUwVj9CmSsVMOM/NHxD6GQZ05V47VRrSRRvfDi2xK4undzYDV9kxNNbsTohc4AhWuq
         zD47yIgl1e40eJoJO7EsMbIkJQnTFeJMJ/x59fCQoYLyAW7II/8bqcVCqDviK+3h1Gsj
         QfIoj3PaY/xaZONHNThaaHEm3CgDW7IHva8e+OF2OAkJ0pZMUddo9rTbyPKmP1fFSp33
         DcG3nPjGElzV7wV1iOOuYzfLm6Qg/TLyLCjhQbens21tPRMv77RBFtsvMISiT0/tl/8e
         SmKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbmrYaqnIMpmUZFvU1jFDeO0HgQQzZ7w2J8vsrUHKPViAZNQljtMW4Ejg3VA8zdfePM5+5KA+TqAbB@vger.kernel.org
X-Gm-Message-State: AFuF++mkfoWJmP9If5Sa6BufZTUeOkXQvMJ7wWNCGt3Yw5nYp9gzigI2
	Lp9Rc4Pw9eC9c+MHBhDZU7GDR0jNb3hGcpKTAQU6Tj+x7PUh9t0M466vUfy0IRgyyfIeKcJs5yG
	XyYa9LZ5PEE0mAmmaX8yAlN3DjHjY2vsTMz4MC/JQWNyNmqh3CbyiTdH9u/BLFgWk
X-Gm-Gg: AYBFou2HtJznxVtXxNuLCF+dOyPOtgfu4uFrF3S4olXQYlOywBTMTT37lC6b7O0W9bB
	/ToQJFckZj1kKfWZ04nzUUzzr/xyrH/fFU2IBqAOIu5zs9oAY29Uej1dSjgEWy09qHCnTKimqql
	mcvmih5JQPI99VBPl5Rbi+LW/H5edMFFkLTP7CzcGLF6CKe5oY8Qaf/3Qs0acT5nmmMIGENExqn
	jhlTQX2CCO5WZ9csxne0vwpOEYJb+K7GmVUfJ16qmILw3iEdgAhkONs9FAY9syQR69so0Snkm9m
	5JaCBJ+LHksVcRWvRM9wy44i2tiL8IYDU/9uAj9eWn6Zo4F7sG4oUIRvKWbcRC0ccTT/Nk3tHOY
	Z8k0FYAxNEWyF7IrAmWZDjQW0q+E=
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279979185a.38.1790151238597;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279977485a.38.1790151238276;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm50454405e9.1.2026.09.23.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:13:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 10:13:54 +0200
Message-ID: <179015123239.7939.12868400217735279583.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
References: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX2QDeJ3hn8aoK
 FrqxFoc0qM/gWiFS6V2WMiXMndFOsaj8J1xLslJmrlXBKqw3ZEa9liYeCO8hBFXcRlxF1XN964M
 GuGqp6gEN1b0khI4xDd7zzW5LubFX85ICEW86xqFlxGbvuZ1XaGm1cB61qqDGMXlPKPy0uNrbVu
 UnOcCWvmOtEcJ2x1/ndottiC0gD/wYlDjEz5HrVgvz4hfgSfddThjLF77WXJFvfmM42E/AGKqS+
 8JpOOGom9JRLLqQWf2jvSY5Qn5GoawoqvJLpLnKThNSG/9mlgG/uNPDhVjTAqMgzgXWwDz4bHy2
 chRcEPdskiQCArFqcFSSegqoY4LoKx2jkiYJNEOXqAC6PhOSAq7Yz3wrgcx/0Vyj/cRSCiDfXv1
 RfYJYBsq0NffZciVMOhkBPutDtN5vfJtKRvFTO3ZJlnc4IXGxMjpq4aaBTsumJKi64xgw8mAK46
 ulRSpyPTvNw99UOvABA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab38a47 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZA4Iygp0GN2kJPZu5X8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: wyl2CviTLYkzikUDeY1kTF4o0JWTWsFn
X-Proofpoint-ORIG-GUID: wyl2CviTLYkzikUDeY1kTF4o0JWTWsFn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX3hDPNuqcQuAu
 T/tXqFeuCqO5nS16WwFI5RdYcTpSB7xTH5rxIyJ4rNzH/vPCeSsqkER3ZgCEHe6a/anLfFAiA48
 L0eN3h3HZzlcMYl8gQ5PEyttAEAkfao=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032


On Tue, 22 Sep 2026 09:20:58 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and zynq_gpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/e9438ab5328a177c9c0e5df87eb92a7162841e98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
