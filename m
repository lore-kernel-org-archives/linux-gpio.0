Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7A2D5408
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785402329; cv=none; b=W9LQkMe3AuuDSeo6aPDpAZQXzYtmIvnhizgy0DLfkLiWuyclBg7xSAVwZocDN8EZHgEt3A/C0jXqSIANfN2/uU4dAEdRU/utTAkm17Quei0nT5bTfHbkTHNjIP9uUOxmcGqNSc2nDi57X0t1/G9CEprTl2/RngyUwWQaTJIOoaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785402329; c=relaxed/simple;
	bh=XEh+ekd3vE0qzVautD+x17opx+BJws5K7U4L95ZdReM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YeyuJPGXxqUPLatN1+xdD/xLH47CrKskqyBC8AY96vtKNRhPMGip5FPpBRFJC3sxo4BEPkjSFaTsAUkNUr+7R68jRz7LiI0dM8dM4V7ziaUCPp8pL5DxLA1q2g7NIL8CABiRel7JsipAgFLe+xPJY2mL84CZPjJnFG1A6oUuiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AOSuVN7W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BTW0DEvM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AOSuVN7W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BTW0DEvM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8vvRn136462
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	829dBP6yvVBGY5q13LsJlqPguq61GcX3fdaYMufp/zc=; b=AOSuVN7WTg3FN+zq
	oy/QEnatslEWXB/sGlpRmUoSRs0elVEWTIY1IdsHSioWtL75uVkcbf953Px+uUBQ
	usvWDnxjb5Hd82JanNkudWl7j0YsoviR+LwpmL7s8hdYuKaH+6pQ57nvTGtUe3bd
	0eWSLbbW1H3+sQ9lrNaaeh5IEJStuLSl8GX0NQkvoE3GfbzH+Fbk8Cs3mC2MNLf+
	9Zfcf0VP4QVDGcMSKhLDsSUcSuAyzWo9NekJXI//bPDmFHKAUUwUmL+SVqOWauUa
	2r62lAgmS5/ZuJcCK/nh9rGd0u/xAI1eOpISNN/BrwFbSSyE1/iQkunAed55uK33
	UfJ5mw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3jm818m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 09:05:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c19493ac2so24094681cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 02:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785402326; x=1786007126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=829dBP6yvVBGY5q13LsJlqPguq61GcX3fdaYMufp/zc=;
        b=BTW0DEvMRYyh9PJOW3iZcuCWKg6I9RwL5V6r5PVPIAlRo1p6Do78vhkIT9F+CagsrM
         X+27PG0ewXduI83JcyPGgGfjwsSep4idD0J8KNWd7KVCPwlwtOI95zLzuFOtv/Qk1lt6
         g283PeRlptE7ShY0dyZ2LmheX65WOBI5sCLuAXcpOnKPoY0Ahl+hLzk8rIJ4dy6X89ow
         J0oqaQVuOFDkq63vx+TGyWi/glVNJtLiFyHuWIX9wF/9AW2LUQ1UD4L5AN637HkioXb0
         EG90/Mp2Hg6H7yLGF/8q9c6T9PPGrBBtOWv+N+ENHp+TRGsVpwVGYFZ6e/+uSNN/ojfw
         qTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785402326; x=1786007126;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=829dBP6yvVBGY5q13LsJlqPguq61GcX3fdaYMufp/zc=;
        b=GEgKy0l296WGjtq7SXyQj9eOUmjy/PXmbZ2J9/u/TIkpPsz005u1e0OgM1e6lpFEHa
         FkLF4rs+N5JoJaNczrBg62Rg41AIcjMRx/dIKVAL0ZQX7XW3UumDwDMEZqA32ItWmgMX
         2dj1XxYHYIP80aja1UCx/JwGZ749KN7LM4jCsAnLTMRIVLzEGhbH+8q0frT9k5wIjo5k
         vd0SlwR7p9+VinVCEOp48uth98/L1ECuquODvi55qtoxfK7KkUThyhQc0CyMwgDSzy7L
         BFh4051TP9LmU/KniKFUCHnL8pecMWWcKL0HuGDigTs7+lundezOmnMacNUl0f6y7fOC
         2/CA==
X-Forwarded-Encrypted: i=1; AHgh+RoGXKygrQsEgz+6h33KnAX8H3kVJNl1fY2CbGTmJs9RN5sz7D2KUDcmiYqRwqpFfwcglvHMd1T/M1zb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+n3M/y1/oN4GEuxjkFUFoOCVOVP6EbanNUazz2n5MyKKVT1g
	FXzUTlmv89/hv7RPPTJbvhRo3XpZ45kt8NJel2gB3yhxgnEN9KVlq+NV8Ou6l8N2kvcW0ve2zho
	D36cQIOaL7ANdEaHhExfd+EvmPYAHNqUHi49eJuN5/7Di8UUvU9mf8/PcF5jllY05
X-Gm-Gg: AR+sD10tPJxnAvn2Dc1Y0Wc3MNg9QTBIAUnXePRAJ1BrNaDjKB2xQNAdeVWdQZ6XET7
	aQ6rnd6APZFDkSU7bpfyyiOKwAcVFMKMOo0C8MO31ZINx+SU2I1kU9X9wmxd92RmAlzlVZ1cq2a
	XEQeU1XXzuWdIGwqAM1vKyVsVZf16b5OgUJLPfi6UtvEx+Pl74Ebi6G7hbXg5RuiMRFRn2Rm1/y
	m+JCPgz37cF5S9UwReSrQ9dxc0FpZ5zDUB2QlaV83iiKqj/OKpJhgYspYFDRc55xCwxkHI0eXdc
	s+gjA+2Uc7BIv504AzN2aEnJ/rext4jXnPqy+movnxrtmnemy2zcXraMcjLznpJaLIhFoeHC+W8
	8EHfJ0PR97KvFxM//qrGiy3ISY59K
X-Received: by 2002:a05:622a:15ce:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52b38671964mr19498121cf.41.1785402325967;
        Thu, 30 Jul 2026 02:05:25 -0700 (PDT)
X-Received: by 2002:a05:622a:15ce:b0:51c:17cd:1fd4 with SMTP id d75a77b69052e-52b38671964mr19497881cf.41.1785402325511;
        Thu, 30 Jul 2026 02:05:25 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:529e:6fba:4bc2:e378])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc88e64d5sm4196135f8f.15.2026.07.30.02.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:05:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, andriy.shevchenko@intel.com, mwalle@kernel.org,
        brgl@kernel.org, tychang@realtek.com, wbg@kernel.org,
        mathieu.dubois-briand@bootlin.com, nuno.sa@analog.com,
        Michael.Hennerich@analog.com, jic23@kernel.org, andy@kernel.org,
        o-takashi@sakamocchi.jp, Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        u.kleine-koenig@baylibre.com, dakr@kernel.org, bhelgaas@google.com,
        dlechner@baylibre.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux@analog.com,
        linux-iio@vger.kernel.org, cy.huang@realtek.com, james.tai@realtek.com,
        stanley_chang@realtek.com
Subject: Re: [PATCH v8 0/9] gpio: realtek: Add support for Realtek DHC RTD1625
Date: Thu, 30 Jul 2026 11:05:22 +0200
Message-ID: <178540231967.12247.5671428262787513536.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726125209.140307-1-eleanor.lin@realtek.com>
References: <20260726125209.140307-1-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2NSBTYWx0ZWRfX/lHCKeHqbksy
 aGEeEU5fhDT6GCY+dud6qlMRQPnuwgp69JlAQGcSuDGvUley/JbVgTt6qwXamx9bnndGYEJ0pPD
 JTgJTO38sTFwxyKIGe970SX4GUQzkdTMDItZ7jaxsx0IndnEa2E6UPZE6HeMBH5+tgfg4FOHGSd
 BlvRSBBwxVb6zb/LDYmrqXT51sXJyvdmR+l6mNbx2SSrFYJy6Nm5zlGWb11QnSJrFLG5GPv3o6b
 mJ0q+qwCZTlQc9J79ossvA0Vs7ckGGqrPM1HfsUDyCZlV/1mJBZdexYCy/Bp3aYgL9EL2lZP9Y9
 eWejqDmdbHXcgnwsfdkOo5cCkf2xc8jkR/nuJ+v9+mKcsbqQjjS0WVwhwqoWCQ3lkpWBEoLlepU
 f+Urfkh3dgVVjyY6DlrUMRN5gUF4itLCsYUjd07syKFn/1mD92ivwrVoy3jxgzBAcrSN9PF+RP+
 tF8pYT5osSKYnQNSB+w==
X-Proofpoint-ORIG-GUID: 2gXyIoAm0oZXREtig9qPf0CQy_dnJ4sK
X-Authority-Analysis: v=2.4 cv=Et3iaycA c=1 sm=1 tr=0 ts=6a6b13d7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MkLnKUXuZBSV6ctU7lcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2NSBTYWx0ZWRfX5VW4PTfGgru0
 g4QQGrDV6weNFfhZh1dUKKiPT4032uvAYfx91/K4VdyzWrUUGCjyjT8FEvc3KK8oObzWUSpLkXw
 MnrHgsFv+ao0M1++21OgF0I1vtAm+nY=
X-Proofpoint-GUID: 2gXyIoAm0oZXREtig9qPf0CQy_dnJ4sK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300065


On Sun, 26 Jul 2026 20:51:51 +0800, Yu-Chun Lin wrote:
> For better review flow, this series includes Andy Shevchenko's
> gpio-regmap fix patches [1] as a prerequisite. The first patch
> reverts the previously applied patch from Bartosz Golaszewski.
> 
> This series then adds GPIO support for the Realtek DHC RTD1625 SoC.
> 
> Unlike the existing driver (gpio-rtd.c) which uses shared bank
> registers, the RTD1625 features a per-pin register architecture where
> each GPIO line is managed by its own dedicated 32-bit control register.
> This distinct hardware design requires a new, separate driver.
> 
> [...]

Applied, thanks!

[1/9] Revert "gpio: realtek: Add driver for Realtek DHC RTD1625 SoC"
      https://git.kernel.org/brgl/c/921ea990b651339d3d319f1ebb065c0f5431a7f9
[2/9] gpio: regmap: Provide default IRQ resource request and release callbacks
      https://git.kernel.org/brgl/c/65caf947fe021c1d2c59e08a9c48f25c38cca9e8
[3/9] gpio: regmap: Apply default resource callbacks for regmap IRQ chip
      https://git.kernel.org/brgl/c/2da8b903cf7039338e6cc1b1d0e9f9e1cf9159c3
[4/9] gpio: regmap: Order kernel-doc descriptions with the actual appearance
      https://git.kernel.org/brgl/c/cf0f6ddd08f37808fd6893e2d9045f069c07a5a7
[5/9] gpio: regmap: Add gpio_regmap_operation to extend reg_mask_xlate callback
      https://git.kernel.org/brgl/c/6c53312b7e2d9a972e509f5bac002e169e241eca
[6/9] gpio: regmap: Add value_xlate callback
      https://git.kernel.org/brgl/c/5f28e3dbd23199c778f5339c0d4488820435f6d5
[7/9] gpio: regmap: Add set_config callback
      https://git.kernel.org/brgl/c/ab91ecbc322424916efea4c4e6220e2046a80e8a
[8/9] gpio: regmap: Add IRQ enable/disable helpers
      https://git.kernel.org/brgl/c/de36d18cfc66519fd3bb0dabf92d5f7fbc1dc121
[9/9] gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
      https://git.kernel.org/brgl/c/6435d21cbd42fea6c66dfd4cfef7d58b9612497e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
