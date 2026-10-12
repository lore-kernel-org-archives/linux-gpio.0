Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD917DFFA
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813679; cv=none; b=CPwFMMeRYX5zpjzh9LQiIfmjOIbOgTQqsRKFUMqe8ETEksENg+7i8440SF6MoB0W1s5oPJmjezTiyMexh7skLHRuCYgCroYO7eY1NJbJqp9H3TCAsqnCBha1bsYPL2aKirQirnH59EsaUSzTk2tRNnktcG9krZZHeAU4R/Ce0SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813679; c=relaxed/simple;
	bh=h9ZHlYBnFxfOVfJ6bovB1kxbNgqL2hLqC4HkxiAFUjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WK4HYi+4YB72I8TxgKZ5EZKlgSV4vy/nQGo3SfgeOcUPPzW22cW6R1mb0D+N4PjbI+kiUMgezrHYDk1yS/UZEg8Kgf5SprvSFbaE+tQgZFrviOYiDNY8P98lIf6gsNvIJznnly0qxdu6trpDe7s4agnEljMjx4FPbJyyOI/U4f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJc9wUbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiniXip0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJc9wUbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiniXip0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC00Ab800949
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:01:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=; b=FJc9wUbblKL6lkTo
	2aUKPxWhlauZR6Iz0thHESuvtQAiqgyV2cIqZDWwoXxzlfbVt7vH/3I90QXq2kAz
	fjkE/7gjaGiMOldclHWCw5/e/iH3yDpK8oRglBAKsWEa0VQgAFwNWeVHEuuY8Ehl
	8udZF3fpsSO6NgJqoQ9ZuvMFMGzjYPUojAfo345g23FLwQafAY7BYdDmARFpd+BC
	np5mInQLQz5yU99OhV6Jj7t4/pLf3OtHno6Xty511sA7BPKN5uZt0WAN2auyhlOe
	BmcyhU9bQ9LGpm5SlzhEFMR5z43f9L6Uapan9pt6xHKdxx8pFoSlXtaOIsK0jCFQ
	nz4hpA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wfcs0nh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 14:01:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c83124d530so3142502e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 07:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813676; x=1792418476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=FiniXip06un2xPJBm9+01qyqtT3uDqPoX/8KXgEnZmdAyKkHqlyiBG/Mg/SmggiGRy
         HL5qrTYdGJnfeV9TfdwYu9icyMqQ52hzjyrpdyzTjRWmnw/kP72PjOZwY2/tDL9TkzEj
         CEqY+AIM65CQ/kfbK6GhJTK9q/pGb49FMM6kQX5UYdKoNRzzcLBhC92nkhz9qbvk4YLS
         0PZWiNWRTln/GjcigigVEIoHq7ffui1AK/7TQFYQX04T20jghsB4eXLEVDNxelTFgZYh
         SmyHtBgfaq5E9vnEqH6shGYnXDKoJUdUOF/WuxDSPYtfFU3Xe241RMgaWLmR6ZKaZR5c
         WOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813676; x=1792418476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dro0ntwjq6UiQiLjHqLYsBYU8INoQdG/NC3mtnkTWFM=;
        b=sjwJq+93Pc1rFGAoleR4isWd8blWCgKxicMAMYeSgWd/YFKmzPRIE20mF9UBIyTye9
         98YBSJDIXikqwkwMnE3b7BgV6J6OjxJU3tr+ZnOhd9GmoS1Jc/Fm9K+EsMyXy3EyCG0p
         Wy65nMf+QLy0ihbm8wqIR8e2GtyStV1y6l1hew+JRqHI5ovqHO0Gm8W4tNdYzwMCnXpm
         u+RhpOXW6dhAuGiJbY50fCGDXLrTE/6AQ2UZVWB/nPKsLMr9cmcD12LOt/18rbsmAj4r
         Co5RY2vokqsRdudx775634Zo/3tcnoT3Zj2LCW+0s/57fJVPgYgpNppXsC9gSFeOYpUo
         6aVA==
X-Forwarded-Encrypted: i=1; AKwUvBy5eocvSrUliZwkG9Ag9It+Kat92HNLx/G+6WOIvNyJBdObe5P9OAYSKLNffGGxw6KK7AI5Vvp0m2Ub@vger.kernel.org
X-Gm-Message-State: AFq9FYLo5gCp901Xqxn3+R7fHbBNYaGRoZgB1UQEilNeTxWxhKyaz64R
	PllogZe+cX2XQZTooXQg71SBzXVFqgtUC6dDAFHzIpdIqsnCBp140nwIopZNbrM35PAU4VD/Wze
	flKVOVutmQqVu8gJ7eIy2NNb4Tc9p8lR1jvh/8P7gfVP9jbodPOdSROFJejMQa018
X-Gm-Gg: AYBFou08M84RYLQvnGaypLthzoK3P529jCzE0903T1VdqkAlMbEa5QYohs3H96/n0xH
	j5+1uH6JbfhnqnylIspTucmkaQwLTgNbDWm/uGAdSZWtSuDxZTaY9Or7QrC03QIkCQkOSssKHfq
	GNbYoxDqgURACA2Cez2HuowC/ynlqfWlYLvmTqyhWPvqq0H5cFw2JS+qzKsRHgTkOSz9LkcPtCz
	Ll6dDU0ongzul8UU7MdlmwC9cwmbqXbqhkUuDJLpCP8vlFgk94iLCXN+swECEoAp5g9nSgGkzZN
	XNvDvJRTlFmP2Vu+7lW96HyoM9HYOziQrS2ZLoE+RAVKl9y091nYUbfOrVm0UvAtmAKAS4FpY62
	RLMf2u02oc5UA16eICwo1fW+X1Ug=
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001084e0c.12.1791813676353;
        Mon, 12 Oct 2026 07:01:16 -0700 (PDT)
X-Received: by 2002:a05:6122:e14b:b0:5cd:575f:9396 with SMTP id 71dfb90a1353d-5e91f483a33mr3001028e0c.12.1791813675799;
        Mon, 12 Oct 2026 07:01:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd3aasm19101061f8f.32.2026.10.12.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:01:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Igor Velkov <iav@iav.lv>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rosen Penev <rosenp@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] Add the PCA9655E GPIO expander to Kobol Helios64
Date: Mon, 12 Oct 2026 16:01:12 +0200
Message-ID: <179181364592.7692.13657409498098359032.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RwKmIC9YzERZ4pVHM0k7EX6Xh-133mLH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX3lVOyyhEXYaX
 xecz6PJSvMIud/nstxden3XBw8vlOAT0iCDrwwy58j7VRtBUr6TCxOtWuzUZybto7FvXAry+hUA
 dgTJD7KLNLxLL7N2GdD0RUNVo8sVaAk=
X-Proofpoint-ORIG-GUID: RwKmIC9YzERZ4pVHM0k7EX6Xh-133mLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfXzBRPRbTpsTqj
 gtd1ZwFRYD0s+ar8ZGP+/FsvKYBFNjE5Bm+WF+8bqUSrz+2K8lk726C89wChr87O9SCud8w7MwO
 q4iOpmX96P0bsmybx7yTO1IW5qnjyIzkL4Jj+hs8il+2wK2ID+ykRLm7XW3eBRo6r6gJ1rGBv8i
 zzzFxqbDgSa7hgQmAxLbUdm5XNc5ZdEIcNE8YRPCowoSIQwnHTOHNlqIkbvoukBR9FrB9G+qkBz
 q2ArpqyQ1avYvsUD3t4vBDKvMViBO9tZNoX9TgCeU6Y5ulUdZSs1NpHY3tkFfz80j2iXPUWmWnI
 OmAnQ7iGMdfq+QwNr7DxK63XJGlbkPoYj7BAeZo18w9G3leu/MH+fbW/pxAu1eb40zGBNFTY/3K
 WuaCLU9NLp5Vm1URtBwN2dZD7EtxkhlsHwSU16sXeVsItx+zFVyJ+3zgdD4dGqKW+91NYtP+9mj
 W+g0e8KaYhBab7NQBgQ==
X-Authority-Analysis: v=2.4 cv=PbhqFShd c=1 sm=1 tr=0 ts=6acce82d cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=zK-fWJzOMMApgNEAF1kA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055


On Fri, 09 Oct 2026 20:45:35 +0000, Igor Velkov wrote:
> On Rosen's binding v2 Krzysztof quoted the "onnn,pca9655",
> "nxp,pca9555" form [1]. This series documents that form and adds its
> first user, the expander on Kobol Helios64. Patch 1 is for the GPIO
> tree, patch 2 for the Rockchip tree; they only meet in dtbs_check.
> 
> 6dfda7947653 ("ARM: dts: marvell: armada-388: use onnn,pca9655
> compatible") in linux-next lists "onnn,pca9655" alone on Clearfog and
> Helios4; with this binding they would need the fallback as well.
> 
> [...]

I dropped the last sentence from the commit message and the Assisted-by tag
that's going away.

[1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback
      https://git.kernel.org/brgl/c/356cab616b6f07a06c2d279fda8a9ec928fd5fff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
