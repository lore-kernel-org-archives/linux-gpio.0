Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8A40BCAD
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278132; cv=none; b=OXve89t1Z4C6X6MAdFge2O4XyxjQBRE0I4CFbV3uc1iujaKzzAp2kX7aAR68O+WnFZdOeYFZ6eJXmoTq081firEscfbIrkouQpeLVepwtp0cemb5bDv+wEPkRDW7wZYPPXGRZxfvzWIrg3OZFOukJijw6jBaFG0+Ce/Se/+ABnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278132; c=relaxed/simple;
	bh=QzHnjGL0qSVpocwYkw9h8cLH9hzxzxgvdOHkQMzj6Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvhFXf8oN2hw0OHhFwFYY+2CDwxiBxb9EzNt/aPvltTm3wtW1lHMk3FOZbXt2EU35xFCI5T4SsTAwtwQ2G8nMukRRbuShyUb3Iz08la5kx68qA8wch7F0HPjvLUJeoe45dszzcmn5Vrr1EPa1dtMheHnaGOfLXE+dLcVBvPHuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHtypnx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0mOVcBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHtypnx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0mOVcBr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9STW1638696
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=; b=VHtypnx9WE1E8/Il
	pJbVj8v73OGCbK7UmSJr16lodtzlmEf3OCrrcaKAXnZaraepep1E+oVuw+4Y4NF6
	yHTpjjBXy1dLDKxrkHcqqYe7Pxjk6USMGHk7vtpcCZjf9ry04vdgWByxE+Zv3aDm
	pmWixgKdBzoiZ1BgujEDermvppnUMUiMC96pXzqdtcDN0tSRHn1u5k5JXobrP4pL
	/0hKvKICv6ESIpgaeoMxqvGpMRCnUAAuF0XAiznopO2eOPcNInbIU0YbPgJLYwUV
	a/13/H091vpjLlcHrmPhtl+4ksiHOXE5ASBWp2IbMP0wBm9JDLhPy+AFs8zshJfJ
	o9gucg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjspu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:55:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938153538caso12097285a.1
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278129; x=1788882929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=;
        b=R0mOVcBrUl6pGp+dGiQSM/NREeYChwsbZ2W7dxyKc7sYPD5b1DA2gynlFDYrBz10Tl
         7fnqWnGm0HIjAjU5n207tjr3uERMISJNeTQG0tJNgoND4lYrFY7vINAnhgsc1oQPM/RR
         6kmGTE12pm9bPC+1P1Ws/96CoZRxuqLrCKp6llINNG34c2RnNkoScs7zMbcnywlUcMGq
         SKHNyOfMKM0+ULsf4Y2IJbyPOftyOxRFpZ+n/X/wVYj24eDHaawbNXggt0r/NNi5Tep1
         VBaXPtcNzUew2WmVrUh6ZZYbsfi8QpNPiu0qAo8BS8YaHC0boJ2NFpmtBPXGxbFugDCe
         uvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278129; x=1788882929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=;
        b=s3oqxP4FliEZu33VwoFkJxM8iL6oxSDxpxtHttJa/WYHCCQ9PGiXSkUHE/mGcevOT4
         y+eKmxOOnPrRf9VKcebLGNOk/VprS5N+mO6TpZQHNNa+Spvwqpv8vR8f66lYfNPMiyrC
         UW1wG76XiVGq9KmwCDVKRvBzXxhSuq/S4gPgzPEJRXwaVVb+Kx+gbNfx8DpIxweRupjp
         sbkhlDnyb9iOIuSBlUwpNtE1k1G6H+KmE6NcATv/uiV1+KhdHc2G1I1hWPFLC/lBBhJf
         I65chRc6/J2PWn8K0cwHj7pY61nKpYCqQdCU/IV5lT0jOnvSL3K1485e3/Pp43m1G1A0
         0aQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF/VOWgUBCV1lOGCdZHZILn6/eY0WOMIVbbx8cPnlsihQUSkebGK+E6kjEXxw2kbFNmCPmvd3z/53n@vger.kernel.org
X-Gm-Message-State: AFuF++nMIQFVg7pndICnUA1x1LuUodM36m6moZBFATwTANB1kAK2irM8
	OGRrkMhoLWJoPoB64e/1J0MU/YLMtUj1THPmlgjjeFxP9MJ0EED76J3Dcxz7rRE2r0AHvVnJZVV
	HHQT/LqF6s6R9TgTv1/Zm78FEPW6N4t5wsTkYiKt/CgmO41z2MBfnePidxbXZFObY
X-Gm-Gg: AR+sD10ts3dEIwsxjQodB6FINIpgekRif3mcX+G96QOCX5P9Okk+5tvV0QH7QXY3wjE
	HvqL4pEWcyLAP48fZn2IMiF1QeaQ92TENWV7aALmbPIoYGhpjSXelptMOOgzpeTAV56ESqBeF8Q
	VPMNACnRdEpynzAR/aBCCYu6FQYrwhuKqZ6FhkE1/rk9jSJ2RPPVzMohEvr5hXLG5XwVjYWu/uv
	fohq9PsjeZvkVfXZ78QlSfIaLtUz+zUZQnrO4ZC3xnwVx0IQgEtgl4EhXFEZWnpKm1AUSeKFtDE
	MXrydj3u3+T2T4YyLwwZE6hfl5ONe3ZZXXX2xV+lXLuzmU2Ne0zx4BXbhmlD7y3WQKl8VvXGfRS
	DpvCtJgxSnZ7qO6N1JBguluMwaw==
X-Received: by 2002:a05:620a:6910:b0:939:4b04:cb01 with SMTP id af79cd13be357-9394b05015emr926209985a.31.1788278128745;
        Tue, 01 Sep 2026 08:55:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:939:4b04:cb01 with SMTP id af79cd13be357-9394b05015emr926200085a.31.1788278128194;
        Tue, 01 Sep 2026 08:55:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c94bsm5165318f8f.12.2026.09.01.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:55:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rustam Adilov <adilov@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
Date: Tue,  1 Sep 2026 17:55:21 +0200
Message-ID: <178827811899.38653.13750210224034521546.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260815094451.31792-1-adilov@disroot.org>
References: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX4VrsV2Z9lf2W
 3Q+nkZQYBc/pnIKNxvurd2v1/dhmWk4H9ZVE6ZSm5b2aq1B2IqV1jbBlY2LDlSdzj4V8JUx92gj
 NQVs6ysKSEm4nf/abl+/JMIC24l/Ok8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXyZx23pqaHTcI
 0jh3DIJEW4wYJJzERXsmiPipTX3GO6WCTRoKU57sgRoMRDBEuLpFNFyK7iCX1wNBpkPj66kdw8z
 UW5d9M4l20vdtudlDQzX9Et8SdSRrH9Kx9b+eIAPwaST6xaZCVZxQ9gA868CoARsyh2FDtGvABd
 eIlmK/xssZ+ynFn2ggkHIb/cqX21QNSF7nmuT6Oh4hQ0lIypz2rkNU39BHxfJlFRrODsZAf7MAK
 /e0LEp0qwBzxVwBBr7/5BMrudhU9Rgjsglfc5dCgCy0rSFWvmJYHV/IQ6x1eMZW7y5TFNkjRE8y
 L1/A546F7QRWIOW9C7Ee1+cgorfXJ1WHj/+VcD/V1jBCo/yh6d38EX9ghh1Z4S1aXAOcsA3lQ8n
 d2L+boynNH8euPjMf+l34uuc1FsYd02vKrjETMoUgo4jnPYx2p66XGj3J22BmHoe1dUg7t13/SI
 IzjNOu5FzcjdtqNsu4w==
X-Proofpoint-GUID: Hhw9Gpbi_o3lI8gcC5CSFlOL8a57W4XE
X-Proofpoint-ORIG-GUID: Hhw9Gpbi_o3lI8gcC5CSFlOL8a57W4XE
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f572 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q57xzXiXmuqvwKR0DX0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140


On Sat, 15 Aug 2026 14:44:49 +0500, Rustam Adilov wrote:
> This patch series changes gpio-realtek-otto to be functional around
> SWAP_IO_SPACE config.
> 
> Firstly the ioread32 and iowrite32 in realtek_gpio_update_line_imr()
> have to be changed to their __raw variants as it is the only point in
> the driver where both devices with ports reversed and without meet.
> 
> [...]

Applied, thanks!

[1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
      https://git.kernel.org/brgl/c/61ef599b782e776437886f2be0623b3c9055e5d3
[2/2] gpio: realtek-otto: make bank_read/write overridable by endian property
      https://git.kernel.org/brgl/c/785ec26c37e56ee5f142b6684f7c15c7ca7430a3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
