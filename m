Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B3524AE6
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898630; cv=none; b=qC2lfFLPPJVeLTShIfj1Tt1wla3VNup1mKNLQplBiUsCmi2BztMNOn3r9k9pxojgOtSP5wT2SQcH9rPGxXTuwWr4Ie5Didiwj0icbBJZbtJQTmSBwsdGUMCXkk8jnf6WfMAQTg29eFmvDR2cuyxpE3r/CEQtewf32X16halLOYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898630; c=relaxed/simple;
	bh=64WuHEmxdRWNJkYPp5WOn0H21zhMZRGRnFl3heqDVqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UY1hM7EnMgjHLPmjPDENevfH7/Vf5W3Q3nZ4/fs5sS2NtRQuW/OoKcKiyMeLbva5nPhu36JDj1P9sbtZBhgh/I7xsJFXtGSVLSCCeMsuAMI4WFbbkfdPMJAnHLglqetsH/EOKkjRWBWjOQu6/Etsm7mKPzI1l8mkZy5APOOmpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i7wEF220; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awL/CCac; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i7wEF220";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awL/CCac"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8HQVc922856
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=; b=i7wEF220NTpnp6Xs
	mnFRt/VjEHRo/jlOJTzWNsVZAC/kiglCevbxfT47GrrTMkydr1jCylzXO55IwF9A
	7GUI7b+WWXS707qu7gchZ0foZ37CQdSCdurTKUF8Qqgi0nWt0HsmvWP9xbcGmHz1
	8/Dz9Fm+a3NfcR0YcRLxlqrj4T92u+TDqIXU1tLWSBddUkUTVTBtbJJYfifbiROR
	uWHV+DIzBNRZYibblKRHtMCWZwFwLDLXdeTjJZej3kkZBl7lr2E/S9o6ExF8RsW8
	myHvITXP3aB2/zp/q0EqNe8ZpazIZOGeBk3szjv7tyvypXUIsV21krmuNM1ge+mh
	/SttDQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1u6r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 13:37:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf71bbf197so2478001137.2
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 06:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791898627; x=1792503427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=awL/CCac6xOUapdQlnivomn8AsfKzVurMfVB6k1sr/9Tgm4kCozIud8pzS4UY8oX/Q
         EHhT+LZmCpXm62gVRsEhEVcguMzalGYS3mjCQ3W+TiXpDt87V/F00eHK0zsV704eIR8Y
         MjJlHT5pNn0qUjyn/OYOuAWaGy6Ofk/cLUFuYBxoU1Ku8HqIG6jAVMCB4DQaC9DiT/A+
         ZVOy1lDmh04OCYMCUFGIqUxktgGuxVRpg54KEutNZlOTxFwdCTDUM02p6jAdusxsKqrK
         8LK+NT/aGbRVtBT7Ls5R+Gu6Z+r2gGYteSD8/DEfyHRF4yNRQApondMLCA41sDV87J2M
         dsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898627; x=1792503427;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l1bK2yIpjG6LSvK1o9zPIjDttYhmCliK1Sp7ju45BI=;
        b=EAWDPiBOJVKYZaDaFeL+3TgSuBuQu7t878jZBVntKwkGp1HDB3jWc8RLd357KZBI/r
         VlYo2skSx+DPJxJLv9e4Qx00jjfZLsNne0cZ11hk+JNAkO9ZT+HjRBAfX7b8KHxXStyM
         MV5fUUiXyvA9BEHfawNFkqyB2mTlUGDhAA/xcoDdHrjfCU6YMpRwGWAc4oKuM/hk8v+M
         gR7aaEQTislpoUC93pETmo0xADzVkjorkIZHsxC0PqlEpOrEH9fTmY/WYHiWKwOQcfBU
         4YnajSLFG0vhumNgpD4MHbLFoscEgeTRWp2GFeadzWMB0ILhwkaX3f8fOwsQ8T7Un9xY
         MxnQ==
X-Gm-Message-State: AFq9FYIDhaPnL8Zfp9KPMEgpguJCaf21WB7BewYSmRjeerDFUKDvlcGM
	AOiFO8aqu+PADyqya35u31rOYD1UcawRafjrB/r3LP+p4h6smsuMuZSieFF7DMM71L5OuneT8fz
	H1aFLze1jIGAwz2kaEEn1fdmPOm/UZj1IJQO6BUi2zVTa03O3u+/lhbpQ7UOgbeoa64TDw34U
X-Gm-Gg: AYBFou3mJNN/+nVMrWrIIe+HD5TI6ipoTKucm6B38Z/kCppmfIuZ7pU/MSkBABGFHwt
	ekM+CvwLUHcO4DAgseKrqWaa01W6NMKqnODQ4JhvhvPIsamCKMGjGeYjyZmD4B4VuQ1XwzKMnsQ
	MTNhueVrUzXWVLDNcRx968kPjevGdzBazMcdp7ZuLqnoeR4W4qYV5GjG+llsDdwscSQnTAUv68I
	PLFKZjig3Avrgb4pNq8HY0sj0Xc2uhuqP67g2HiCEN4lrKubwd3m9czgmqLVSb67wWo4veKCMIc
	EArjZD3MJH8FowvGh0Rb8/hVkjr+L/PxeUuIQ4pqK5CuAif/ELPx45v304d31DtDJEVwVfFsyaX
	c7/y8sYyzfe+9WWslgfh5jpKA19M=
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019566137.7.1791898625834;
        Tue, 13 Oct 2026 06:37:05 -0700 (PDT)
X-Received: by 2002:a05:6102:2926:b0:7c3:3f26:8785 with SMTP id ada2fe7eead31-7cb3729bd82mr4019550137.7.1791898623915;
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ae0c9fadsm66312755e9.4.2026.10.13.06.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 06:37:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>,
        mfd@lists.linux.dev
Subject: Re: [PATCH v1 1/1] gpio: legacy: Kill gpio_set_value_cansleep()
Date: Tue, 13 Oct 2026 15:36:59 +0200
Message-ID: <179189861230.27409.6716341566208896281.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
References: <20260715192415.1326037-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace3404 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gkddGGStw1GqfmxTrhIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: iRYrqtTeOlVkLrz2AjKLMl9BnVI4MQsd
X-Proofpoint-ORIG-GUID: iRYrqtTeOlVkLrz2AjKLMl9BnVI4MQsd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX73uVEbfjYGxJ
 q9dGrs6hRY85KF/A0FoEYktupM1mObBGidZdhZnv5VHrw9AYagPCFZdDR2CWIFX/7miYSsC3lae
 lfZWfV2gx9lKokQjjSDE6yie4ekL4kA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NCBTYWx0ZWRfX24gYYuqCX6W2
 oEmBx4Kizhb0a+qemFEPCgU6X/QXtEiM8RBL25H/Es7lf8uys9EfSeyINqFTsC7mTclZhuYoD24
 Mb3OolIxVlv/LcmxatJFK51Ov6PBkWkyKBwX3NeWjkX4g7n1vZlXSCupEDZAYTLSm2BX+s9idhv
 DIwNv0K/Lx/yLzOnSt9uJIxGV7Pso2vA6D4GX9opHv6g8HgUNxYv6L0xotzru5OaUxqEeCELq2z
 os0ECxSrcs3WleKtc8EdeFyYl6/Owxkg8b+r1RxghMziP5HlFpsBKIJjsISy9bKYJPWRruQ8j37
 2Dk1GdD4VnzvNX+nmVyUYRva2JsI5qV9RX7FoI2ON35/twSYz/Jen0VCoA6tR8jfhVkB+BqLOuZ
 ZaIb3jCMc/TgDvBkTjXRCRwcZk2rPDhQKFiOiMCzQkZK7X7X5HGNZ96vWY3bI9FwFJTBjOax3S5
 9+GYg4lnjLfQHFUEBlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130054


On Wed, 15 Jul 2026 21:23:30 +0200, Andy Shevchenko wrote:
> No more users.
> 
> 

Applied, thanks!

[1/1] gpio: legacy: Kill gpio_set_value_cansleep()
      https://git.kernel.org/brgl/c/93f4db6fcf0bf62a4e00c9beb571b35e6e3860de

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
