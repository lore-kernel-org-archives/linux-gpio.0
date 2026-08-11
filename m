Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F8387363
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786457322; cv=none; b=bz1I/TWAe1ZeCn1PVM9CyXtLlZw7IxC4RTzWURWInJ6iYlg1SufMy2H4omQuIWPWDGbXjA8Wgr45hWUm1A9DmLIsyYgSE1b9i4Ued0s4AAusYQvtSC6L014usQYiM/pGRnxi+d0Ik1E2VVF3yL2cFgplF3Wx8VXoPoTQWBSomfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786457322; c=relaxed/simple;
	bh=e5Oj5hLtcffZYxkQMBA28kxSpJvkqQVDB16MsDpcDIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nWiwY8CrNC730QRurWOtwjmARPdE+HxSZcGmMBvHauw7DAq+ouqP3bWtapSePPh/RF18xoZvhKxPKcip+udKsksthcu3McQoT7BXWV7cqJtEyt1c3NvgeL2w6mOT33X+i3hxoR1y/J9PS+PpDT4x+1KRuRPAPJuAr9qDYQQ6FpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AGW4yPMR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhjzrHRP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AGW4yPMR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhjzrHRP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDX0Zp1091089
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWGaUX0LFklO81eTu9DRZYJ023x93pGsq4Ir7nlqlAM=; b=AGW4yPMRi4BhETbG
	z8JyB4ED2msU2HZjSQl7HB5eCETr32ylT1lPIbr+gDrLNrUMkptayim0xIo6zfxK
	9d995DtGJu4iXNZrlngq3LsdPVlHyAPZJEaJJRSbBeXC1OdbU/9Y75qbKr02vrn6
	RqhNTPOWAL+l4vtXcRr92hgPLQx8B+ntjyP9PnfLsksoUgUF/VC93ZN5RhCdvUuU
	hW8CVRVE204whjrLAyoR43sOT0fE5R/3+xFlceEmFz8gz1v9D+FSxoa9bZZFP1Fo
	0haEbFVAcbh0PlDslFk146GP5UXq2+9cG/h9DrdNZhG53oyz9e4LviRdGZUWy0jj
	QxqsSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049era8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 14:08:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0199faafso36556141cf.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786457318; x=1787062118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWGaUX0LFklO81eTu9DRZYJ023x93pGsq4Ir7nlqlAM=;
        b=KhjzrHRPwoCdYVQ5O5vRB3YY1ojniE2ucMtVmTMdahymsD1LSGp2B/uuA7BaBn4Kns
         5knLJOJJ17YSv6hbn+DkskBcf4lqdttvD+zbr1XbU4/tqxIm+q/fzBqJ98meOlTAF9jO
         17Vz55UrCbTP064kjSwKwsY/oVb2NVkxcT7JmsattV0R6VxKWlllNpoBi7tZ43khmkJE
         7gL8rLlP7JY7mhvFORDeVxp+WqlyPQCbs+g7uJ6gqwgdPorK9rRvuRxAWH0KIW1rXUnc
         OVEn14XsFyZDsAIKWEMZE6cR2+Msm7tsK/VbIFiGzX91w8Uh9+dZIOMQu82TRJ4FAa8w
         I/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457318; x=1787062118;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWGaUX0LFklO81eTu9DRZYJ023x93pGsq4Ir7nlqlAM=;
        b=dfXWM7Aq6K6oToHXmKiLMJ9m3KlEDuTOrhQNK0CDkeQES6g5AQkcMQae6pBXa3xIfy
         WW1UEhTLlpMSc02WGYHkRCSSoBCGK3MqqMi0a5SlAU+3ghFBzhwByH9LG0g8/M4LPxYf
         fU6DcAIsCfrfWQ8iSSFYrt1u9CZVRtkFZ7rIDCZi1B5ST7PK+AkFLVxr4fOovbClVjYQ
         Xppwpthcghb/L1M/aEJ85NNMb4v4GSIToWrXD/jQSWy5uJu8qyZkJGvgjW2qc6wPLirK
         UDKgyYssj5ZBqLnRfQ7TX56wK6pIAvywat35XCJKr6iITtf8KZWEHgAQ5xMjvWG/I1bz
         a4OA==
X-Forwarded-Encrypted: i=1; AHgh+RqVeYUSzYhIDi2Pi/6uCZTpixiPZmlpq6NfNznR5iBCIJiM51JvcuP0I+l5bptBo5LP5em+LKgy4DPH@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1tNm+J2hj4ae7LGKp5EXX/kWnVoxCu8OOSIxrWYEBn9ivUrK
	x1MhNbdvRocFdzng2f5AegjFCgTxHM2fA627jfanFZe97npRkfH3U7/4cR2GOsV6vI/O1v4noTX
	Cr2vUDXTC9Uqm4ECwlmmlJmdaUokojr9CXV15sIXy6yODAaRaMZCEn+1SbgzKAgYQ
X-Gm-Gg: AR+sD10nCm4AIk9jLPKsc1WhIyrYJ0b6tiz8UH7dsF2kCwhhNjXeJmdHCVBeJ64K+Ke
	qkarRcbPuJD0szlcdlvZ0MyPcUr7tKViBLHIZT1KaCK0PzJOLSbzVy1TWRxmHmWTFjMHP9mSvvL
	HcFuYOEcDWtIj1wnpRuz2R4/Qi+hjq6o7hXDPcuAlIqaN0I3bjDMBrlqTeH5CAYVVKoXpxNU98z
	XuW+yAW6x3sYe7T/Ylfjy+uYgBcRhq/RBxovC4fYDhrpq8bw1QS+lOpt/Rzs6r+ibA43/nRqUqW
	4NQKGN7gYpK9VhxcicBoK/MvqXzWq4ZnPN3FxmnWZw/svN0+36OrdW3pfW8qIQloEx8YZvfgi3c
	6vqCfryGPoEVsF25wIIaGNS2A00Q=
X-Received: by 2002:a05:622a:581a:b0:517:8470:2d2d with SMTP id d75a77b69052e-52d602370c3mr5913841cf.29.1786457318107;
        Tue, 11 Aug 2026 07:08:38 -0700 (PDT)
X-Received: by 2002:a05:622a:581a:b0:517:8470:2d2d with SMTP id d75a77b69052e-52d602370c3mr5912291cf.29.1786457317464;
        Tue, 11 Aug 2026 07:08:37 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:cb9c:2dec:32e:84dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5ac76asm4212321f8f.2.2026.08.11.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 07:08:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dan Carpenter <error27@gmail.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
Date: Tue, 11 Aug 2026 16:08:34 +0200
Message-ID: <178645730780.22364.18028605328792164570.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
References: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX7tHHe4DgHfrN
 5qa3kWI6p60QEgMsj2C+RdRFruuTgMkoqPSMFgo8fTBQou7SZCAgSfhM6gHSEjMWA5kQWyI20Xh
 NRBCrYOVIxsitkzJPMFsl0gfuUilxSc=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b2ce7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Ja-oyO8pF0z1exoHtvcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: EP2BsutBji4T5gCUdC6BGRzrVtyg0OPc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExOCBTYWx0ZWRfX4znr2VPxXMyd
 nasypzjx2F0W2FUGSoabQLftGrR85Zys12/RRAX3Duo0IjJWCHB+fCfS4J7wbaPSEhkubtDxs02
 4yL7lK/68e1illRNtZNnlX7NsGU37OHDf6G2qzib218qEOFoKhOjyF9duNLm/+qmv1qCvT2VCPV
 U1yz/MrPGPhzea4Byn9meK1EeDuBLQtjwVGSbGpEfLIllI65qjF3PN+NfkOgvPg5ONn78EdGabc
 0JidAZCGYlXajW8VWqHQC/0qhb33WG8GvslBqtPFzCyTEoOn61efBBMmrBhJp3wY9r9TCaKtGfX
 M63BKI9qDEyiEBiFqbFshlhdcOWB79OsvCBet9J0tBUVJTvCNN5AX51dqhUqWou5itLxtMp9mLR
 HyJ4pBiuaypvF5iPNJyRpATLJNbLIDcgSQWTSePCq+ZouWD4hhiJm0TYSkHYtGWHEDQJb8qwCdx
 +BIyLq/Kz/ID0bXbFYw==
X-Proofpoint-GUID: EP2BsutBji4T5gCUdC6BGRzrVtyg0OPc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110118


On Mon, 10 Aug 2026 11:58:17 -0700, Alex Tran wrote:
> Apply the requested initial value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.
> Afterwards, configure the gpio pin as output.
> 
> 

Applied, thanks!

[1/1] gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper
      https://git.kernel.org/brgl/c/408866669ce01b8f2111afdea2c13d15a8960bff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
