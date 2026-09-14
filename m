Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA269383326
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374813; cv=none; b=Fx6+R3Gwy7ZdCf+7gYRzMS0HRUw6snKVwFWXNxHesXqifjYEoXfgK2pbgw6Wl/pDVPjea5KQH+OCSIDLix5MV8B7xFeoguwfDOtRxNU24dk7dFwfyVAcuE8Yjwi8MldOGx2pnGPL0HNJC/kMQaianiWGj/U6mAU5mhSEil/ibzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374813; c=relaxed/simple;
	bh=5Ju8t7YiWuL8GYGvKcO+x/6n58FE3k2oXJWU7rrZh7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HqxzLx6kjzBk75eusGMX3FRtscSoArjCd3WdozmIH9KIQbanV+rKRrpjPgq5zYbh6uN5D3lKa2dXDcTbz5EMT/cxzhlS40/TQzM3pFaVRNyXNV+Nm1TItF9mOkrtov9wTJv6iYCLjzoFc6PmJheNibVrf7P0g3Dg61NWXYN7COk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX3FBM1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KEf9utyA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX3FBM1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KEf9utyA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jfg53843224
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:33:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=; b=cX3FBM1qWi0k0/uL
	97rVSeqIMgkqVynDCCnbhQhTH/e7TmGTQPjy0eDY/kEvVbdgNPVBzwcIjJ/mWdZR
	9W6eLE0rn33rWc2HDCMYW6C7TBJzi+vySsyOP0dzDhy0gAZfdOr3cB/AkRMROSuD
	b46rfttJ6mtRoKyK7K4DjeoWffdN3F0upDwrsFjUb3lXJYSlTE/GaWlHmxxWv1Vu
	WACJnVQg75aYt7oM6apjqvx/ar3oHeeIsupkufS4l3Q1FTj6TuxnYkx6N35oqpyY
	RRrwvLq5OkVPZsMdLkTL1DVhXlhP3JSIDpDhimWQ2aFFogyUhJf9OT+3bxUT0DWD
	afNw9w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5rhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 08:33:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so803290985a.2
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789374810; x=1789979610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=;
        b=KEf9utyABQ1HMkvGb8i8apCK0utza6Q801WLNPmC7g5eTuqcK/gJVuFTKX2PBc52ru
         aZ81laeUUlwDPcv+KizRi98rSrJKM34bgHmFJLH2XJKOjNlEgLCJxbyZiMm9vF8TY2S3
         8/vy9J4M1yoQb3y7YMJQaq3BXAjbUq/SzC7kawkzC4kKBGZWO0zpLaubt2c5UZugI9pz
         CGapWdHw/2NntBVnxTG2B8tsDSu5Q2USwqLxPNGkfkBWugl1/VCzH/X2ppLVO8NpAWDA
         NmVyl3h4W3zTqOf4oTIx+XVxKouMWrjL4KqnbFgUjDVhw8kiqxbSL/R+qrG70bjO7MEL
         QFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374810; x=1789979610;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=;
        b=kzxMK1uL8avin/tEV3CpUubSMOGi61WDh+wJ4RZiWM19VStqTCC52xL2NKpo5Ni7lv
         pMpyawt96TzP8On5e+YkJScdNUCr2cMD6hibR4xWHKbVd+Z3huOJaLpiJT/ilNqgFv7R
         nT77c/tch79LETuEvDuKJVuTpIzpbnI5rP3/oygxi3yVgG9DCXTugYsLsCyVK5zoQtbl
         6j+bU8dmbfGD49svYgtodOYKWAiBvbOb/w/3kXTRK2t3IE/krxo94HBNqinLNJ+DGkxu
         dQkaLS1BDfKdh4SmKbTU63Vmt2hPjdyPOtwW8AHBn5DUvSSCwQpruhDcFS7VLZd53rsY
         Oqhw==
X-Forwarded-Encrypted: i=1; AKwUvBx6+7BHD5AwJbmk9QqNgA+0joAhlQnYNs1k90gDUs1UNPI4GnsWgqc9EdYpc1iV3T68O/InYpva2o6p@vger.kernel.org
X-Gm-Message-State: AFuF++nQlBf6H5KEIyWxDgQC6o78La5Z+gq7lSIE4M9mzRClKd6KK+eT
	l/THfwDkKAC3Euw9PTVuCiNKdfwJ+d1HwBxKjHNKOmg1Ka5NolH6LhkeFicE2rI8VwTa6H7ghvJ
	VOPnKDiuL5Wbk7r9mEm0PWvc+q3lUufOuIYN0KwfYavhvdxjCTMcwZDxedM9V6fel
X-Gm-Gg: AYBFou3wWDV03HHIwSXLQsbT8JdwNWT3nLf+1bn8GrkKPidDWMA1ZAnOEsoLnXRTN8g
	7zAwlLJ/P9ghyNoRKttjmXjkYkE6fu2htgyRuWO3C61SS27yELTUCcasLgdtgxRZjc6VcLizx+M
	5T9yXMtKsiLxDIRZBpCZ3GSmA+8v4G3s+fDljcucVCN+4l/FYUKz8Naj6e5edo/tiyGdlqdrIHV
	mj0MkMEC4mydiFPgMPiNbo1ICRJ8g44dTP5ujWVmvz+fEyql2SVWXud+eoARZTgU9SeXiSwVY1F
	cLS9Me0BgWe/yIk5iIqIwxjeIEAO5K1amWb6fPOo7g7/lvYiPdmDieyF5f8dpyLCWxHyVUbBwU8
	lnAXIn19VUJZJc2roDPtNlTBql/M=
X-Received: by 2002:a05:620a:438b:b0:938:61d7:badc with SMTP id af79cd13be357-93a29a685d7mr186376285a.36.1789374809805;
        Mon, 14 Sep 2026 01:33:29 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:938:61d7:badc with SMTP id af79cd13be357-93a29a685d7mr186374085a.36.1789374809434;
        Mon, 14 Sep 2026 01:33:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm225616115e9.11.2026.09.14.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:33:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] gpio: virtuser: skip free_irq when no IRQ is installed
Date: Mon, 14 Sep 2026 10:33:27 +0200
Message-ID: <178937480474.31976.14976644818444633836.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
References: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AZZSSNy_oPXhpozySLsQ17Wa8L0bILd4
X-Proofpoint-GUID: AZZSSNy_oPXhpozySLsQ17Wa8L0bILd4
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7b15a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P4bCDFn32kF8sA-yhioA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfX8uE5kdjJ7p/Z
 dS2l9m6DNSFSuiBpGFeNGoOUacmxcGB1+bcMyPP4piYuSn39Vr+O4SbeUPLF5AqykUb7HXewYat
 5UIn+7fDINNqu7KflX6UxBhU8u36iwYpXyWLX85E7rKLqPokoOXLJ+l2Gnxwtyr9f/G0KpRC3Y2
 sdJxNIv5L8DKHQZmhGQmzsAassGmI84DlqvY+gOfkBBkiu4DR6Bc19IX52kocqFM8v/wCQ3Rv7A
 n+9OGvCtYlAUTsQHafzdPFDTdFVllIJs7i0ifodW8mbYvdndOwH7NtHcHbFdqC299roVnPwvo3B
 Ix1dE188OvpGkQyat83sAK/GYNDKR0R2FTUrwpJEfOb//06v4lurYi/TD/XOSMOL7VX7jMRI3a3
 gfIir/O90c0Tqe+XB5VjDho79LK3fcVRAIRuVnaAz4MGE5h4uTgHwuxnvn8SG5Iq9+hPZvxctU0
 eh2XvFCdYDQe06UW3dg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfXxoptHbJ41eBW
 laCAXgECKvsq2rVb7mffSXv4SfVJTFPLC8wBm+npc154bI/A2OxgNinzWqeYNQHQoB7yEs6zAtD
 f1/Sl90HkbuAuxLTOA60B8kH6HjxnTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140120


On Mon, 14 Sep 2026 13:15:37 +0800, Runyu Xiao wrote:
> Disabling interrupt monitoring uses atomic_xchg() to clear the stored IRQ.
> When monitoring is already disabled, atomic_xchg() returns 0. It must not
> be passed to free_irq().
> 
> The bug is reproducible on an x86_64 QEMU guest with
> CONFIG_GPIO_VIRTUSER=y and CONFIG_GPIO_SIM=y. Configure a live
> gpio-virtuser device through configfs. Its input lookup must refer to a
> live gpio-sim bank, such as key gpio-sim-test with offset 0. The
> consumer's dev_name attribute is shown as <dev> below; then run:
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: skip free_irq when no IRQ is installed
      https://git.kernel.org/brgl/c/ebdb6b0cc453103972278258d88d555d43129aef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
