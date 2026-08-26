Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CDD3C9EE0
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751372; cv=none; b=cevNuB/1UdoznAgHvjMj7OZDR6rTJXEF9MX9yc3Ztn458KqEK4Zmnx53vbrRjSQpmu1efJpGjDaweW0q8GcxNRGnH7nXxtbSxmn936qpwAirz0+5lu3z40crM1iELenflJP7A4x6kt3++m+pv89puDy3V2DbbHKC5WksNqUtJ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751372; c=relaxed/simple;
	bh=g0vIRFZ80M/7Aqn5Y+uhzQ6mtA72Oy9rCw1aq2Vo/Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ei9njXDLndYphSYpV0SivOf5nVuVxK1fliAyOK16q0BgjaagTgGc9eOY5/hsm4RuOXFwvzwrLvZ4SIO4L/upICcj7zRFLtJxIRX3aXHTfrpJ/yPdXotXyiTnOOz5ADT/0f9lKy9UQc0p9QAKqy2ErxyS8jGvqYFf+rE3iXkEzFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwhlANK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YktJzSSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwhlANK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YktJzSSe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCHJf374858
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=; b=hwhlANK1ipTc5iDF
	6fgVs47lmhLnpgJSxk23XWWeCN3uex0eBFp/brpsEmuVZhXDFTt5cowxz8ni8Pp7
	kX9G48NA55ByG5R5JWFX2U1xR6NmK2Nso1aD2yhyLSLG/dllapnKAdruECRdoprz
	IM6JYJJKvoBiOgDmPbnv2zeloS6pqyLKpZcH9bddzHhpgPkphUwOak/Ht6aSjqRa
	N/R0LYCimXW8WWwFKl5Ysm4O/fm1UKKGBQ4MZlUlCs8uP1ZSNoqB0R+6fSh6riI/
	JIE7+xxzAJyQL5ntDhMcAdFU2p+nUwpxcukMfPdcw+/WIPbNkG2UaUS7ZVznYId4
	ISZgeg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smxa1jr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 13:36:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d30035dso6910671cf.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 06:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751367; x=1788356167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=;
        b=YktJzSSeKGHrQ3hVZSoZIMGYzwVQvFWlITO0YOJGVZJ6EF/0uj++XboYnbdnf4UW+P
         ckYdfQx9PXcoQJWwP0R4rKQLOw35zP+6Rs7y7sE1Nz+a3U0TojlNrkuS4U44wJR7bGoq
         x4otRykBB0cWEgQiAIDecfrImlcjFacyN+gKJ/TXkRd1XZ55813IegsrYHAAIGDFtQEF
         tA9iP1fTEywXcxMpKOdvIXVun06f4jeOZEGe0zBvDpEyTlKe/Ol9TmDGm23MOsGgjBCE
         I8DIIIF0j2N0VxmJa1YYPcyfaZTt4WFoOTULOsFT4zjM8IynHPMhFB83yFRDoRuXMI8o
         0Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751367; x=1788356167;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=;
        b=SGdRKaM6NqZNJ/CgC6nqSHi7A1kfQx7K6LbwgMZWDSYGhaVr/exAk5/e1SOPuLnSZ+
         X27q1gp0YvMNEjBE0gQktfx4YZxjbAcfrhx5rUGT4Ssi/4dAPvXjE2BZBJ9GMOEGP762
         1pooDCss8+2mB2j9VxWX8d8FF5jt7ZBLZanpqanqnX+r8iU5w83EtjSxOS7h0ffuzvzo
         fMF6TidruCNA5stSf7z0eoPIPtJ+sGpQeMl8RTOXEA/2fFGup66lUcrqCIy7rwZ28HUg
         thm/VvDeldjQ8aNsjqn77Kl74bTr0qTRxcH62THvf+ErZjLPsuy/ay1ftTajpXw2gSvT
         IjDg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+ZQVNgxi6t3ucNgzRvxVvfnWQ/mjEiCSWB4SQTYTT9qoBgBtlhB+GHpkuqDFRbu0PgmoEj9AY8BaH@vger.kernel.org
X-Gm-Message-State: AFuF++m2mqS1Pn6N7QY1w4Nrxh4yBXDqRplW0oCdbJ3UI7ZJXJm1B7fp
	NLzpWzT9QcTXNT3mVlR9RbwzYXpIemRVv5ICYJZ+dxtBz7khVNe7iVuhkehewLMQwX/E19Vz5eo
	B1EgTUOR4YH9K9fWfn7MqRs5W4hsqD10eh6nL5q7KaP0t6l7wd0Mr5wiw4FkRTf3t
X-Gm-Gg: AR+sD126kgGkal3AUCZHdq8I7rtQUfLVZvaU/fQUlZe/M7Nxq3obXX1ZLgDr3wiMiZj
	0YcgMLVquSuYkH/EM9k7mFcj50pM7XbfwLJdfu3wF29JStydCl/NLLqEFa3OCPY1VwSH/tJH77J
	7XpTqDfWjlPtAjU3u7VTV5cn6EhWyn+SBSIT+sPWW0YHJH5reE58LJWWT4WL9y2uNchkwqS7mjf
	4PCtng8+2lI2v2zsoQGK0Ul3ujkgYAUooBvMe3RHUYXpnptO/O7gc4/w3oTOta6j8gdh1OG9CEL
	2lGOsgZYBljw68rq8Q2WLRLRO7NLTxXXiWN19j/EC86KxTcVNI3m+6Ey3otPGwV9zRP8Wye1XYf
	MddgYea4bHH0weu0uZkOz4KOLlD/H
X-Received: by 2002:a05:622a:6086:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52e4234d80fmr71366031cf.27.1787751366948;
        Wed, 26 Aug 2026 06:36:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6086:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52e4234d80fmr71365001cf.27.1787751366459;
        Wed, 26 Aug 2026 06:36:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac6848sm4241597a12.24.2026.08.26.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:36:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] gpio: pcf857x: implement get_direction()
Date: Wed, 26 Aug 2026 15:36:02 +0200
Message-ID: <178775135168.59974.6231225772608724999.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825-b4-gpio-pcf857x-get-direction-v1-1-de15996ae354@vaisala.com>
References: <20260825-b4-gpio-pcf857x-get-direction-v1-1-de15996ae354@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8eebc8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jwPMpVOCRKw_XXTssd4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: rUYfq-ZPMj_0bZ2MuFWehqp4PIwIquI4
X-Proofpoint-ORIG-GUID: rUYfq-ZPMj_0bZ2MuFWehqp4PIwIquI4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX8Fo9sP4R1LUE
 fV3/US/6I2zBgGbGUjOxtk39ak10cfjfV4EYdg3cZJ4ExJ7YPhqA2qpLm52L+QP3GSmiTdRMO5K
 bqj+Mc2gONIOsngI1NEBPh+qAa1v/BedCUYYpsYO7x93jrIgfrNSYTSboeCcB8c9rD29GyBnCJy
 iJb+8YX7PN8dj2O8k1b89Z5LlbgZY5T0swYSuL3ZK/qeJlRrg7yZjKwpJzBU3Z4L+FDyVcKhqKg
 InBI+Iiv8+tLGrlRcPlyKfpbnToT9kUa8EeUjTV3lkBQv/RmCRWN7g7QZTiD5NZ9F9I04X4ILOU
 1K7M+1VcTIoye+UEBBwq6/7d6PjA66LX9PuTw6T52e7wSriJvwTYW1pSmtQIpESDGlWbB0Kc1Fi
 wccwPWqPIDidmbuoM81mfJQal3Ua6u+bmBKWmKBO1ANbrEd5O7cIheV5+NSnB9o+bkCx4Z38uPC
 Ncf11VwTmWRQ9kHZQNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX5ljNWkxWKp5d
 7ZxqqUSlIuSd3VM/gn5cNDexD5e2+CV1uB6WeoO6zyS7kLKPlXd5QCUXmA5BOeRzen0FzaUx/o+
 +dgUWYoSTUj/LhJ3DMk3K3p6Q9yqv28=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260112


On Tue, 25 Aug 2026 04:15:57 +0000, Tapio Reijonen wrote:
> The GPIO core warns (and taints the kernel) when a gpiochip lacks
> .get_direction() and a consumer queries a line's direction, for example
> via /sys/kernel/debug/gpio. pcf857x provided direction_input/output but
> no get_direction.
> 
> These quasi-bidirectional expanders cannot report direction in hardware,
> and the 'out' software latch alone is ambiguous - a released (input)
> line and an output driven high both read back as a set bit. Track the
> direction explicitly in a 'dir' latch updated by the direction_input(),
> direction_output() and set_multiple() paths, and return it from
> get_direction(). Initialise it from the same reset state as 'out':
> released lines are inputs, lines flagged in the power-on latch are
> driven-low outputs.
> 
> [...]

Applied, thanks!

[1/1] gpio: pcf857x: implement get_direction()
      https://git.kernel.org/brgl/c/ed14364ae8c310cc3f3f649ffcbc7f82befe1579

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
