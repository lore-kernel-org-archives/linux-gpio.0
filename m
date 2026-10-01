Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6888C3D8121
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 12:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858056; cv=none; b=YKoTfMRRjsZk/Xkvk1g9p1IIbJ7CQpczBo8d6QaopKdB1eQ8AiTn73/D6ofj5YZ+RzaVmlT1yjOdUxMEEjOxGZ9h6y3q9K2p8th1V0SUtiFcERlOc4bK7X4pCrq6hdziCCag6Q7ZOk05B4gFINmfXxL9L10Z8xPfjcHdmPxkG7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858056; c=relaxed/simple;
	bh=lWJqTAbNe8S0v5g3pHoGmeKe8qZ/vwoxmehBKfILlfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNebmALiwrIOTswoUTOyptP1FzwyYHDI82uWizCflqwgdkOcwTHGCPIMr2ioD5sAGnIMxt74LrdKrGTbkIduLX1LPdVn7sLtuGpibkO88/ezsLxUipd+6JDJIR1yCOzdiK91rVjvE21eLXb311I65XriO3HosBKWsVmVnGdaJ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YmhKE2ov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZVmXRMSN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YmhKE2ov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZVmXRMSN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691CXVk5396164
	for <linux-gpio@vger.kernel.org>; Thu, 1 Oct 2026 12:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=; b=YmhKE2ovQR2CEARb
	waPZU8N7mLWzLLusjBW5OxSfrucQEsB6thVkU8kQJBRTI1qW5U3hgaepUumjaq3A
	MW9nb5V1P1qtM8/rV2NnuxNgIdaeDCg8YP6H0b4YN9xbgDK1Tho8UNLh1C0h7D/q
	Q/9X0S/VCzNoVupytLkmobt6wFmhfJiIW17NVXirh2KWpR0d46WW6wvNzlqVicje
	fTNbKQAS5oxI/BLEMseThKv9Hd5SJWqviuP2NFNf44cZsek/OyPLDHKfC8kHUc+R
	iterpsAZm1AcB1OAi5HwVl0Sb7QKup9VOFCrq8lQuiZNXVdZiQv7M0Zvbxj/kWeU
	oDUsZA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5awp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:34:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so220957585a.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 05:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790858052; x=1791462852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=;
        b=ZVmXRMSNceMoPXAw5MDtCgR2UmwworR53lcmtQwIvuGllu2sBk4fnY2fvN5xSF0VLS
         kUBZROK5uis7fBA/zVL4/ANyXpB1rgZEdHHZBXJGWSUROurRhnzi3ay7rAo6n7n+Z4Xz
         ZCd8NlkysYVaVYkxnM84n3hi3Qkfr2Z7U5y02s2W3TX3MIYP9ieWhy6zin4mKVVuCkZu
         bAHfJH8ec1Swvcl3oEsKvlomAgWrTUkMTO9H6HmUEdraHFMhIn9qSLM5GHAbScNbucvu
         jYMtbnzF+frXYVEgG0WCxxBA2FPFxwuggMcEZf2C5cl+8kUGf+YAdgevAzKDdNDx/Yyx
         PVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858052; x=1791462852;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YrXlSTxL52+Qckdx4bryleQ6ouzT5sfmdwxifGhyfc=;
        b=HMbAMJLM/IaNj8Vx0BH9dLEjgwLThMK8I6uBoy6Fh1sPtNDecteNgKwQlm+26PxYIq
         zvbBXRZhB7mEyXL4RyA7aMupt/w1VMvALGB7EfOhDr0Kd1xInHhZadv6feo7bqSK+Jn2
         1mshQKqE1gdexxZLzWGHenYErVgATbWmTIe7Png0HdrAU2wvzTRQvmYy37hHplwBSpri
         GT725W9WSbhKm+r6EUOU3FbsB70DUv9hc+3TUrzyhwlLslJj3VxN60v9kVFAQ33raaCH
         Ngw9NWLy8gu8jd3okuSpcc+2TUfWNqMYSeUCYhRVrZFpk2wggyAcKnPosC5QZj2QgXnN
         FZZw==
X-Forwarded-Encrypted: i=1; AKwUvBwk5bGspsMHvXiv6jAME++Dbkvlr7obU2+iV8/ecL45TPVuuzI5k5gQyZvO/XZZyFBvSdp1ZOYPII/J@vger.kernel.org
X-Gm-Message-State: AFuF++maWCS71qF9Ba3qZOj37L/mNl9Q5bmjvJhUuk75WW9kYO2WEzIU
	efPpXQjxeR6/UjIhwMca12DLsAbUhk3UbJCRMPigboHRDKzgeMCQNV18CwTVR7Twvehx3MPsFw2
	rGycABL8EylqeYvEKRYwO5OyiQ5+oFMAE+fAbvoDON90pmOhq4JcRfzzHi6QAGh0Y
X-Gm-Gg: AYBFou201dGSn41Mw/wBzcERjhnOSF0QamB9j0X5u81Z5XleMqNsoepiTLnRDDLh1uI
	bnmsKvSOGdrBJoWOjQJud8Bm33Y1Fg59wWqwOCk6QZJafhYt1alDEYsMnZqjFKF3A7odbub2atb
	G9oW3fQczox0O2m984PhZFiFzTxcNQRsxUel5HSAv5xpZCZS36vGpXHqMOOaWAKkrHfOkhmPQHv
	eOqVBa0T6cMByksQv6Xq+iuPogo7QSrJJairsFDayQXJfi6kGmAR6VFmaODamncdfsWfy+Klm6Y
	zaisCSDlrk6NubKerleBUujeouo3hYYCe6MhwiJ10/lwz8QoEJVKbXKMoukMJZk03zX0OGTds57
	uvYwlBOKTfPahqNNlkdj0BDkA4vk=
X-Received: by 2002:a05:620a:890b:b0:93c:16ee:ea03 with SMTP id af79cd13be357-93cac199d85mr769957985a.38.1790858052392;
        Thu, 01 Oct 2026 05:34:12 -0700 (PDT)
X-Received: by 2002:a05:620a:890b:b0:93c:16ee:ea03 with SMTP id af79cd13be357-93cac199d85mr769950785a.38.1790858051595;
        Thu, 01 Oct 2026 05:34:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f98224csm54683465e9.3.2026.10.01.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:34:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        George Moussalem <george.moussalem@outlook.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions
Date: Thu,  1 Oct 2026 14:34:08 +0200
Message-ID: <179085796993.11844.15948697775614399550.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260928-ipq5018-pwm-functions-v2-1-87bbcd706bc6@outlook.com>
References: <20260928-ipq5018-pwm-functions-v2-1-87bbcd706bc6@outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX3g1aPLbz46uE
 R6TF271jA30fWj/YsxMAgXBBS/gr2HplfG21XhnJIUCO6xysGnB6YhH66r6Cw9s/pcUh1qlAR+w
 BQCeruIQJFGrwts7hMIesSMa2wFkQzM0S2qSfkDjMJ4u13Sjtm04Li9on0DMgW9NW9EAxX6/BQu
 u5uPhLmpeD4Bzv7p2etuBeeRg/N6bVlwtibwgh5s2lCLZEncAboaOJGw20X5XYsVfhdo4JQ/tah
 vwe05soMi9opyMpw0BQBbh4wWA11qSOKcmfVaYQ7qGJra8xmDp3rLQlXjBuMKPQ/Rj+QouiwNvn
 B9aZz3fGXd+Nyxkhb/6bJWJXGhY7uUDXZ8qnShmR1lc4cX0wwPQuIeSazqErLZh6Ct9W2/VPIh8
 LZPXKXl1fskxciMFn/lLwvmZmuNJ/zIeiWrHsNm4atFiVmeudS6z7O07jGOSiWkCJ4wBiI3nhye
 a/aMh69mUl913Iju2Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1MCBTYWx0ZWRfX8EEdjWrZeL2O
 5ln8UVNR+sGQ/xPw6co4o7mAOlsDkPzzahSXwS9EXV/7dzT2iIs8VTYgrKGj0sNGvQhgBNmaZub
 Deu7Zxsykv/BV00efBayuMcHg+qfB6c=
X-Proofpoint-ORIG-GUID: VnI3aQMURc_fMzr3QoTa3iTWcy6amrrL
X-Proofpoint-GUID: VnI3aQMURc_fMzr3QoTa3iTWcy6amrrL
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe5345 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0YQyuc7wub6QuVhEsVIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010050


On Mon, 28 Sep 2026 13:48:47 +0400, George Moussalem wrote:
> On multiple Linksys routers, GPIOs 1, 30, and 46 drive the PWM LED on
> the PWM1, PWM3, and PWM0 channels, respectively.
> Update the corresponding PWM groups to include these GPIOs and allocate
> the PWM functions to empty slots in the relevant pin groups.
> 
> 

While we discussed this not really being a fix, I noticed that this is rebased
on top of other fixes that I have queued in my for-current branch and conflicts
with my for-next branch which is based on top of rc1. Linus doesn't like me
pulling in upstream tags so I'll just send it for v7.3.

[1/1] pinctrl: qcom: ipq5018: update PWM groups and corresponding pin functions
      https://git.kernel.org/brgl/c/65db42a9fae05c46a5df5b7ca5c175b80f9c4278

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
