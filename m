Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1E043B3E4
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756958; cv=none; b=IeWzVAtdWsHZfngDFhdYMS+/TrvjaKUK2Zj5h6TOS1zOiaEZ3YkwD/00JSR9FstuHwNkH5sZAwRebAJ3bo+fEnlTsodmHkBzivZqQvmZnTv1Gx3DNr1tkJjLJEGgN1Ac4GmHqSOq9r6SN0kNp0dPVkS0iM3JJk2W8MzRY032Xf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756958; c=relaxed/simple;
	bh=7/uY2jRf03y0cD2toWywMcpwrFsqR4KgbVVsV0WsVS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKz3vymzN0zLoCZN2L2/V/ZxiJZ9aYPshrns4uXaqV6oyRxZlYCiRgaHn/lqqqz1lXNZTrhuHVGPIRsML0zuPsUL1+FWURkjWaHWNdzLlzIwIAIFBsnOG622IhnSIfuQRWn36TSj94Q7Ki+Da6A92bhF/OLHcMW16XWEwMIWJMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktnqikQO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AkGaqSap; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktnqikQO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AkGaqSap"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDulxN593259
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yeICc+1dAQubYNuI3YDBt6Ye8Wl0TLH7Clain95jxSo=; b=ktnqikQO5EmOfSAk
	gtRctBXbhhcpsYaFWwYccWd3mgSw+0ZR0AsMBnSwdCohFkI/yOUnzk4R9Wi7L/HU
	Vkcml3ivHMXg+5rLK5cRZHCMazQ6DqKTNog6ZC/NDdtdhyc00VQ0qp/ahf+esWtd
	nov4lXIYbFJ6s1Q+HPw+0tYwGOjIfEamXtrWa8wlnOt7L2lE238rUPs9BRb0pdmZ
	TXAITAn/8CVEUuDxsdC9I4gRMizq90NgPHGGxkiypzEUm9fbvSlPg6cbFQOlN1he
	OOyFgK7igZ0+CwrYcX3QOe1mjUT4zLD6fqObRbd+S71QDfPAOLR6sWcdqETlcyL1
	rXPlPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9gafgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 15:09:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so14575621cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787756955; x=1788361755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yeICc+1dAQubYNuI3YDBt6Ye8Wl0TLH7Clain95jxSo=;
        b=AkGaqSapJhH+7d1MjLvwhHoZaqR3ZfQ/3PAvuXdtfVCAVdNUEaPSa3MGGw9R9ZVTi+
         oFiQaJBzKsMyVqrZiVbMd5k06AyO/QiexMmacmf0JjWdtMHc2Fv+KKmSzxSnOlp+Gh8e
         Md+Qkuu0gpS+x9wwBtKWNWnTbvd9eHQDxK6Ab6ArAC2V3ZkHvXQay0rf+aa7X1Xab/+9
         pZxjajtYOEm8yzEpWQcY4Xg7MgL39dPnNWOqSDFTPxFHZwUtq3VVS3C16YHMy1zMQvJC
         qDIH1jvAkyrtZvnjf7873luY3+wIR14HLOT+Xin1/h38Dg7qEy5QYl3+ILjeYU/h6pKt
         2jdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756955; x=1788361755;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yeICc+1dAQubYNuI3YDBt6Ye8Wl0TLH7Clain95jxSo=;
        b=WRelEMGXNFgWvvUd7rKF081Qcdbp8HHNDlOuuSHl9FQZCd14Z8rHNJxOanVz+wURvW
         BLOwZhpdxNb9/n4nHqUyqlGCyIgVO7481Uopjk4CRaUy3Bpa3rf6wqZVL+lO8AJM5jv1
         jBV4C5qHjZUolr6i4aYNmM4y/Iw4M7kASs8Hb5jTTcyiAjJc/r4wonVIWAk7gTtareg9
         X8wB9PJ/uQwNuvkvz3WK326UYtTmWKup3YPgriJLD5T6Raccsy+BOj3JycdbcPouSBvk
         GDVYEAdsVyRoFe29aTRHYQoSixTlQtcmdWFYtCfZP4tlTTex2Mama4GoJpk6+M35gSzY
         E7yw==
X-Forwarded-Encrypted: i=1; AHgh+RoRjrvZLDlL0aHUY1phlQVQnGMXwEQG917NDVhNpsNrkMuTqVttBgQy42SE8ec3f8xJPYzotWrhKLXX@vger.kernel.org
X-Gm-Message-State: AFuF++mlA+lzjN7GLlPtA4hvY62LRJ6fok4hRw+ulVBuZJ+sLiWDQgHp
	NR5S9MN0pxFnUOPWDGy+KeFX8M+lwYlVmGjNgY5l+YdLSA6p77/zFTEdAO8eu42VI2F+adg/VsS
	QSMv5KWCNbKXpVZMyIbLKmhea/6/MRrpyG6WauM+joNU7metjsg3HSONPHl2+Ihmi
X-Gm-Gg: AR+sD11yY49yi2DYa5KXhOIvOfVu+3ThLOhIDrplroVnKPtepKVyDliC6KhL1m/xXF6
	pzSgJV/EvVwZl4ZajSWoh5N/jXauHjh3Xq8ysd1tSYEYep+zB/NL6uotmFrKBziBKcxflXAqXsp
	fGWDaFswiHRpT/quT1EcYL3aNjsuSwlbc2aq0YsPRpTBk9IPINn9Hxv7ZvK590EPmWsxAlc8SxZ
	f8Q8rPoGYOjI3PM1KsqOf+fKN8HovDldcMWkIYvJIjvopipmPkbRS/ijq+rgVDZKRMN0yrodSCq
	BIeB4U+e62fAzDVjqqPOrgvRvTxF6EoQzdnrQya04dTJqxPoNCegJMpBf2gwBXMc3Gip3eIpQHW
	nUimaIVTwJ6MosFj/LaxDjAyLZV3V
X-Received: by 2002:a05:622a:903:b0:52d:8743:bc52 with SMTP id d75a77b69052e-52e424275d1mr81466871cf.34.1787756939141;
        Wed, 26 Aug 2026 08:08:59 -0700 (PDT)
X-Received: by 2002:a05:622a:903:b0:52d:8743:bc52 with SMTP id d75a77b69052e-52e424275d1mr81398921cf.34.1787756904844;
        Wed, 26 Aug 2026 08:08:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8a986sm29340315e9.3.2026.08.26.08.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:08:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, sashiko-bot@kernel.org
Subject: Re: [PATCH] gpio: generic: Avoid pinctrl calls when ranges are missing
Date: Wed, 26 Aug 2026 17:08:11 +0200
Message-ID: <178775688401.67048.6900793031927743576.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820-fix-gpio-mmio-pinctrl-v1-1-62c2d7dd4903@kernel.org>
References: <20260820-fix-gpio-mmio-pinctrl-v1-1-62c2d7dd4903@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WzlZXADE_84ykKBH_EFQ5StEvQYG43OS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX1VyEhweLKvKy
 bIcPHpdztk/r6EIdVlPbFNjue4nqWOVEoKjSoB5dPxz18N6B5bBq4cG+fwpaTEM/jZsixDnlCKK
 kbi59vl3RmtB2XSSY/4JtO+vBrdvIlXPMT4b9aLqrQURQMC9IFp2MaY6MIrmK12N8S51/grQXuU
 q/W54pXDzDWtYQa6bTlBJRYgf7sN/sRW4A/eMD/ry7zwi9QpM/gsKjaqdhQWrd6AwJ4BG3nXDwY
 ZulNQsaU/448uqwck+cI7eUvI7kUw457MR517ks58o9GnIkeNnLZubjpy7r5LSlKxE7RUN71x+J
 wDAWkDCyjBQQSlAoA5S+EiNGPxNvfaoVfFxnCnrv67Tz+0ab9xWwWqxwBMoEAiua6T00S6tmlVy
 nwxkfHitCBySH7ZuMRk6I5yxMM+O5K7xbPN3/lpumH1CBOSO2hjQDbHg/OQPC6U9YQNf+E+QCLO
 CpFAY+Pxr5cB75TQ+eQ==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8f019b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=etu8CaEKrgjOfP1L1EUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=0lgtpPvCYYIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfXz+eneFWcM2Ar
 fsc8a/PNCiy0B8pB0rlsXzUP2wdLH2vaShCXthGuEyqB8tyxge09Nttm+YTRCmdcmfSB/IDIWCq
 8Tsy9RL0f3TMbQxC1gKiymbqXkGC2Y4=
X-Proofpoint-ORIG-GUID: WzlZXADE_84ykKBH_EFQ5StEvQYG43OS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260126


On Thu, 20 Aug 2026 19:10:05 +0200, Linus Walleij wrote:
> Most calls to the pinctrl core is done through the generic helper
> that go into gpiolib, where the library checks if there is a range
> associated with the chip and just bails out silently if ther isn't.
> 
> gpio_mmio_dir_return() misses this check before calling
> pinctrl_gpio_direction_output/input().
> 
> [...]

Applied, thanks!

[1/1] gpio: generic: Avoid pinctrl calls when ranges are missing
      https://git.kernel.org/brgl/c/a38ad4bbd1f2862a7db1cb0a4ec27af166882e95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
