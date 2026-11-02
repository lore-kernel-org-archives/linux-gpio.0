Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793627950;
	b=l/3z3roHyMP0hykA55J5vzdggJeG1dSbf9d+7nw+lSFrPnC5Hrdox4jRZDWyiKPYbVwI
	 JhGh317FBQRZlZqij/Hi4boVmEmG58MkAsgl7YGVlUaJXOq5gWBxafLUDzjp3LzW8QS16
	 S7zoowAr5YyLBFubfx4PqF9Yav7eupQJ0R257WwVRRN7+VuoWsl5lExMvEueQX2beCybE
	 jTSJSi1tAW8ibP0cUOLQiKgD975LALEhaPhgnattw3UIdEUNWFjs0e6OddTKw/t7RBdaS
	 ByHBa9bFfxlmaL5jw3has5Zx7mfqC4vINWJPTkfQr+ne1gaZWHppfJSUCtR7qJh1FjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793627950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=do1afiaL83mxtB8yNfCQ1s1iDz0WujoHfKGzHUz4Ios=;
	b=k4xIP57uq3tS/fkuW6sgVzRv1p1l4UPf0qXWm9KmHUB3M7V8ay5vSScEPaLWj4q6goqG
	 ksQXJSvtqEyLYvxf3tqsX5pn7pDvGrxFjVIgrb670Ygz0SHGZbkVodiGnoPAiBFJuLxzi
	 X1UHWp1o/zZcEOi5voCg3hLCP0/PeHI7Y1VdZMikzpvAWi7jvQhg9yKiUnFx4bntS4wNe
	 z7d6V0k41qyjCi02V1HTtaa/yfwG0q1Khy98petUz9QwXfQqgLPCSfWVtU4XAytEGlZ39
	 PflEHPktTpgMYUl5WMy+4l1l2bjtmkrrrAWMt2sppwbixnbo5zxp2Lb1tL1YC2ybmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bR70lz1P;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hr/za4vB";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC001606A334
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 13:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC001606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bR70lz1P;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hr/za4vB
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpDD44033997
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 13:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	do1afiaL83mxtB8yNfCQ1s1iDz0WujoHfKGzHUz4Ios=; b=bR70lz1PW8jIVIMb
	w3rX5mLLDEbxpZtmdCT08/sjkd3doKIV/1mBmLL4HGlizaIofzwVWP00oOGx1Qm3
	rpm/rrY1iraaPAo4Ktia65Pf2PufE17nhyY/SCEkZNYoaKqV+tE+QiFva/C5DZp4
	k8SD778b7jvvPpm66glpysPLhnlBcjBJaDDh8YpvFgsCQJP6K4gmAvF9WAIIkRLv
	FIxUMnlm3gldZlKoE1m0kYStyBVsu7zbnFQcBOCLLhWyHN7T7Ugu/2aN39PihxhP
	nk4/KL7vZjWrU6n5aBCUxel1IgJ4Wu48+vLKMordOUZLXEKJFvY9MkDfWQ1C8sQD
	/FOBlg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe9df5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 13:59:08 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so513921137.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 05:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793627948; x=1794232748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=do1afiaL83mxtB8yNfCQ1s1iDz0WujoHfKGzHUz4Ios=;
        b=Hr/za4vB9tsX+5yIdWYh/cYv1O2YhwWrONiSkQobg1U2igLugqpMc+e3rHvnUW5zSc
         K1waP6RR7OMLSdKh2T8LDzcU3mM5dlpWzl0w+4YvNTX7OSq0o1e94tQ6VZOeRlETk+sI
         Nd0bnNBKjFkduMDo3kdZiB7JEKrEN7njOs/Ej1WldlI/WoZ60YAOUA3VOs++uZ6cHyuR
         jKfLbyzkM/QTxVxdNtZs6eCuaNVi7+lwqZN1FxS2vAmAFMvm3yUfRX3tAkJ+56pTvHWg
         w/ZBelTGYOnIJ0x8xSHdRBXMgWwM5jjPiFLCqbrRVfH9Dfif5yRINaLzERkvODhYXjuz
         ufTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793627948; x=1794232748;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=do1afiaL83mxtB8yNfCQ1s1iDz0WujoHfKGzHUz4Ios=;
        b=uSEGDuNK3znntg0WW090ulWzswVCTvD7T2FX8yGTxYgfNcEjZyh665pO8HvrbuNUU9
         0f2vWdY2ehKyfHh4Xm0gQwyvKtdBVwysxNTaNX9YDS6tNMt/xN+UcVERSd0VVieJQ3Ja
         HPNZqm8+iCJWa5KHfwXzEqj9bPuoYpY3gbAquwNlZHWs2196TSFjM0/NyT8SetwtuIth
         qqSq0c+u5lgxUozMiYgGPCNYgMTFsdaHNF/nFpd2uD9gP/i6mm0r7VkCGf0huYjY7O1x
         sPxs6U6Gvd0HDrEBGoxXZ+L9A4AxKksCVK624FsXyF7TBqo9/AktBvizUe0KKcB0Q6I3
         xx1Q==
X-Gm-Message-State: APuU4Z9/3IdHoiktiQ2puvemwm+YZAtTagEk29oLCnhzpsVq1p9DEWAB
	GsRgnYYPmD54bqkiKoltDiCFpFdCrBiebja49jGY67xG5ZaTn3utX5k5A16/ylykn8oWHpar6B5
	2gmeaFibxPz/Wjo9J/3z/nHOcUHwCYEdOBobzMrG+IOWxFUDScFXpw8snA94hsUymHXDbijN/
X-Gm-Gg: AYBFou194M/OZbG/6RDxwbeGeqDnUxAYLbjmbfDb0EL/3oZazaFRAkywELxYlT4U1vC
	h4kCuQz85LLsLE+XbYsGQeqYkwJ9r04TUEeh3HxB6CB+UXP17kV+Xzj85N4sgajFUdw4/kPu+sW
	roQ7Fey+smGUdGnVeATnhtzL5IJ7oZlZMN21K5/oZUEwWWz/4tgjYO5vTOMHXuleGru8R8yRpDZ
	pzpw62UQyLnAigTbxjUX8JiaGmPqHztOs7qcPqB1l/zabUD2eMNtvFcssn4DNCSuKkGP8zA0bu6
	snd98HN7/0jcHJnH5CEyvwxRRSfpmPNw5dTmnfNyvF2yEJneV1+Bh3Az7lfnkxcPdsPfNvcrJmw
	llxFPaJJAYSgkZkHn+49UWz+fH94VfhsEVzSg/cShvGGz+IKiVDVTnwICkvg6rHHLmy4l4jqD/7
	KO
X-Received: by 2002:a05:6102:e0b:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7d0726280c4mr2958456137.17.1793627947712;
        Mon, 02 Nov 2026 05:59:07 -0800 (PST)
X-Received: by 2002:a05:6102:e0b:b0:7cc:2fd1:7143 with SMTP id ada2fe7eead31-7d0726280c4mr2958449137.17.1793627947179;
        Mon, 02 Nov 2026 05:59:07 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm18679276f8f.28.2026.11.02.05.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:59:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Yegor Yefremov <yegorslists@googlemail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        brgl@kernel.org
Subject: Re: [PATCH libgpiod v3] build: honor default_library for the installed libraries
Date: Mon,  2 Nov 2026 14:59:03 +0100
Message-ID: <179362793116.77930.10539104427843596830.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030113620.1091481-1-yegorslists@gmail.com>
References: <20261030113620.1091481-1-yegorslists@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8972c cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=WV7ieA3pZzZWdS6pstgA:9 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfX5xaTCRhvKT/2
 0eSYgKYSool0bCdoDrqalMs64qUX9UJRlLE0/4VBV75NYShXfBD909tuxqTTmwCpCr0i23tv+56
 +7UPk8r9GyuDQnNlKozLkJH3dbpyQtOfQ8mN54C0p+VxasGff9tGtPMbAfTsjQo7xn/PJWnGd7U
 Y0mWgj4eC2lq7rbbf6pah+TmdhjY5L7x+ZAmW4mphMeMfIjqOUTAe4U/BgL6JV9Wj5zzR3QUb0g
 oApGgGmTJ6wPcLkBxIiMsh8GMYpyNDnjLDsmFj/nrl0Fz+zSSs+gqxi7vi9AH/UQUgjC3fbS0Qw
 aPlh8J5+2ph8Vlv0GF+Og9fX5egNObuz0jE+sfxWBI715zyKnllztYS9NjfhrVpDqVdXdO3V4Xr
 2wZRSGwHWnZ3h/fM2z+fCjbK5+v0LJ9tDdLZyI3wa0jHVE/9Ndod3YyqGAD896KGgGB2h2cTnaH
 XJJUroQBgwMTijKheAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NSBTYWx0ZWRfXy6OfLPhRvFC9
 PfmcJyVjEIMnmK0eQ0iW63LvI2CaTRgH7cenQ/5lZAmXhU2Ra/qDcHUewUI6Mv/UutY/7UxSXds
 hLy/zeZoXb1a6BadDzXe6GRXEj2JzXM=
X-Proofpoint-ORIG-GUID: nD4qePPI83FcB_ZG8KR0m5v10Gh5_wNU
X-Proofpoint-GUID: nD4qePPI83FcB_ZG8KR0m5v10Gh5_wNU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020055


On Fri, 30 Oct 2026 12:36:20 +0100, Yegor Yefremov wrote:
> The installed libraries (libgpiod, libgpiodcxx, libgpiod-glib,
> libgpiodbus and libgpiosim) are built with both_libraries(), so the
> shared variant is always built, even with -Ddefault_library=static.
> When the toolchain or the environment requests a fully static link
> (e.g. LDFLAGS=-static, as done by Buildroot for static-only builds),
> linking the shared library then fails:
> 
> [...]

Applied, thanks!

[1/1] build: honor default_library for the installed libraries
      https://git.kernel.org/brgl/c/114d75e95c92fe5aa5721a0c6da2c56f2414ebb4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
