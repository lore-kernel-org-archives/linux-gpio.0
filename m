Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB948C400
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396879; cv=none; b=U0q8eBK2L7fGdN6S4ZbEd0w5xEqaqQQY4vD0mTN1TBMH+ZZBbDTYAbMR6oHRVpHbeWymXqruJ3qLkyxAxIBLhVOGfFBr3UT64e0oinR0kqYEKjaoWjBnOu0lz6IT3ZAfn+mALzeidQwQtwDbVQ/cDtTJJWBYeRdSTdxjKaxauV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396879; c=relaxed/simple;
	bh=BPXyO3y0fCOcGUibRvE2yPU+7/umQGRF5uEuiCIcu2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrGtaDyF3snb/3PB33UGS/0J8pBkP9MMK21niSDt9/gxGoPUjoocE162+jnvzBVK+2HAxpG28YCKoX1wLoIf5akps64QZhoIR54jF2EY+ev4G+HcefnewZQIDsBShAVRq2ofGpoh7tuhiVzAyqZun5NPTzRl1KbkQMVsjadwXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bALPuXkp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JFI+8WGq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bALPuXkp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JFI+8WGq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7kl1W2669177
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=; b=bALPuXkptDZRs+RO
	M6h4pDYan83si+mPJITP9ElBgQBERsnRO4JOfa2EDm58526e5BRmbdB0d75uXxw8
	NtSytNGKMgRrAuOG4v8E4ySVQ3uqfI2T7w3X0qxZpw4ay0DAQNd4GyBLLP00z95S
	BSZ4l+vM4WwrZx8QQUuIpty29EvjASLwfhoD2jyQ1vjLCeMK8IEm9czmbcUurFWq
	uLsxwCx3TkDc+R7b4HA3u8IdXc1CmgFrricr3M4HVAAB/2EcNIM0mskrO+iL4QR/
	RyJemayV43VupcqP93C9g5f+l944WabkRGB0zmK/erETPQRn7CIXbFiMdM3WVpe+
	zVt8HA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48g1p8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so373386085a.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 01:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396875; x=1793001675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=;
        b=JFI+8WGqSzqOSgMBPzqYG9qZYldjKViH7Z7Roz2TuSj10ThVh9L0drikq7a6+vdPvd
         zQN0tEZm3T2INNMMF1IYXVdNqPg4l7XqXlIHyz2pnnWtTE0lK2WKQE28xJZ4H3ILYt50
         ME1F94T2Z93CDm20CNQ/RZ/SaYs1MPeHsjopYxNmlgE3nSDyGVvJ931yYGjYbz6WgRp9
         vcoh0je1ZOFH63HYl7h8ff705r1aJnXwoqZH0GD4NQLwUPUOMFPDCbTK/CVO3LyECizz
         qaXbXE5ZiNkeuiR5SiovB2Iy3N5JzDoCpe4ejx/XTiwdTeVNeMnHyUPcnT6JahwBAzbp
         xpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396875; x=1793001675;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rz08knEGC2Y4thWaKvVInHnFRfmjnnaijNxijMZ8bA=;
        b=f5hc63dqmcIlR/1YyxO8YiNU+EEMlR66B2j4hhE3VV8KFMu0cGRFeKFquReHUPb6Ut
         SzNGSIg8Y6zxIoCxh3zzSjMzZzwsR84MlefzkPm8KT6/oHXJ0MD+u8nn4IXHYVhJaT5U
         KB9BtPX9kFr74q4/y/iLWaDnjoOTbFJTylueKDPsnoGY7bkfKEO35XtMk6TiYRqUteSm
         eP8UL4PsuxPtaJ3QyQKST0kNXZslLYu01Ewg6+gguOiNk/n1NiCQRXXxowdLKUf3kEIx
         zAhhsTewjS0hXBw2rqBa4RmvFVlexDkXLxZ1MBlwjPNrncJrtXYtfqn094TPaaOxsxs6
         T/ow==
X-Forwarded-Encrypted: i=1; AKwUvBzHKQ8IY4ViAFSA3JPXCQ3pF2K7+9s7Rjm5ybT5a1YIrENzBoKnzn/tSeFHoHhS9u0g4k5bjuG8A8jz@vger.kernel.org
X-Gm-Message-State: AFq9FYKrCEVU5OqWheH0xv67WPHLoUz27sxyc8FIVXXlFEtptoY1IXsG
	9bWZx7Pr9sMo45luIruBd2Cey+kAX8w2Pxkbvrk0bYzSjNf9o9XOxo/WleHmHIq0vGhnippa11Y
	mI5m+OC70wao2uBqZbv5gZmXAPwlKMyvXHfnZIqqzFzfgBMzCfyJ9Z70LDEnYBSaH
X-Gm-Gg: AYBFou1wacT1vMPMq4xgV8AHyE1TR202yo1OIt2xLk6xWe0fvmCv7yUEJfYb1INynFY
	DbI2Px+FNZ0H0J7WOPidX+iFgDhOwxP/K6TVexYOW6zrXMbjG6Wzv7BRg9JVOKv8Tdgd6yjR3rI
	qUBdO5HIR9g9b93GQGXQzWcbkGhKicUIXzL9bpabTduSyi99hYtl80Km00zCmFJVEkqiV8WhP/Y
	T5qm74m8VfNrENRsrHhuejjGtku8a75FmfDR1wP2IKFzRUp5vH0VO1RzF50tJktJTXR+fDsijBD
	O2AE6svplvP4Tvs9+2P2qQ4moCCdh+1Ao9FUU9egS3vDfRQgugKqFTXkW9ZRnNQa5uPJqXjgz6b
	HJbcGb+KJ31JYJjDgny7t53j0Hs4=
X-Received: by 2002:a05:620a:6410:b0:939:5cd5:e243 with SMTP id af79cd13be357-93f29b7e7c4mr1043125585a.6.1792396875085;
        Mon, 19 Oct 2026 01:01:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6410:b0:939:5cd5:e243 with SMTP id af79cd13be357-93f29b7e7c4mr1043121485a.6.1792396874627;
        Mon, 19 Oct 2026 01:01:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm316809685e9.12.2026.10.19.01.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:01:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Abduvaliy Abdulazizov <abduvaliy.hbai@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
        Trijan Koju <trijankoju11@gmail.com>
Subject: Re: [PATCH] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI
Date: Mon, 19 Oct 2026 10:01:08 +0200
Message-ID: <179239686600.5748.7808377662325552771.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261007120944.1705014-1-abduvaliy.hbai@gmail.com>
References: <20261007120944.1705014-1-abduvaliy.hbai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX8cqMKrSjUCpi
 MOfMN1+NZxmzGZnegXf1o4bZvEQSi6ZTAtT+CvNte/uIatU34tiCxBR3/SyuQ7psnfw4/XkMYeB
 qgP6hRlbxo4aJ16srJEnkYaNZr6EPHaDYYs3LRVCxS1n0nWvkSmbHTa6FZdQfwFPs7vXQB3mP0I
 f8YDH6c940GKHnouVTtzI9b0xAilhlThCObw4MZmdJNThPcgBtZseuDBd0rKwwY/ZtmC0U5ngcy
 epA4sjtGW5M45LWCKuSedXb4/Jxognhn3t3LE0EqI5AyRU1N6ZpGLWMAUVto1FWUoAWv4ib7+lY
 /7p5w/jOMEwiWohclfneJibbCgEhhBvPXNJELgM3XvulNzMgFJP67Tk4X5gonFjIszuTmWfvkZB
 2ceO4hJzJ981rdMSZU+uytVyyz9oGlrlvvjpll4xu3zrIGH4nhq9AB5OiTTiU9zqOP/5hVz9yPu
 +jnzCq9eqlj3+UxNkVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfXwaaUsp/9/74x
 92+X+WPSNeM2EcOFHylZRKoxoNOVaKMCfwv7WWC2S+LN52A7XrWLhbPK1X2kx48c+Ylx7zw72GB
 AvXC+xi6gwb/1behbfYa2+O5boUhVkA=
X-Proofpoint-ORIG-GUID: p6dT1Erf2lPqrQ6Xc29VHhDK7fwVjXD4
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5ce4b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0zlfp5zRlkvtqwdKQXkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: p6dT1Erf2lPqrQ6Xc29VHhDK7fwVjXD4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Wed, 07 Oct 2026 17:09:44 +0500, Abduvaliy Abdulazizov wrote:
> The Acer Nitro 16S AI (AN16S-61) has the same problem as the Acer Nitro
> V 16S AI: the firmware powers the internal USB camera (0408:4059)
> through GPIO 11 of AMDI0030, but also lists that pin in _AEI. Requesting
> it as an input cuts the power, so the camera never enumerates. On this
> model the same rail also powers the internal microphones, so they do
> not work either.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro 16S AI
      https://git.kernel.org/brgl/c/5a088d1b7266249e7701a94fc90fc829d1ad5ba1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
