Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD7844238C
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771183; cv=none; b=T+G2zQ6TjeXvKV/J1HtbwDCWhvppWkZS2wVtsDImYU+44m+hRWj8PdHgdOiBEiPkKEZHaZz23LfzqkxtJe73tCNqHPgULEwtmbNwGJGwRHBpHjvrsV8pJks7cM3Bke3rsrTunz8So/y5+hz04g2ccxQg0z8XE7fpSXa3Wux9eh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771183; c=relaxed/simple;
	bh=q0qQZEkqK6Msbf3TjaGuKNzYpT4UX5YubX6sxauOmsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ej87oMxStDcXpYvN7sXSc1bVr+ZQ1FRDetOw6kMQjq+HW8SkNXYL6F72WprIBNwe8r6DDJOdfk79FJYLTShP+NxlQRbQFIeT0bhDYhgcb3dj6JznWV4Z5rHZLZMxf7ieJYIoO5pJtrcJAGZgYlmQyuywpWu2mV6PI04BLaNRfRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofJu2pYk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adDpHNsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofJu2pYk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adDpHNsc"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777Ld33352425
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=; b=ofJu2pYk34uJjIFz
	XZLwyPiauWz68SDs0FAKcvvBzIpf5Kp+KI6D9cwo4QU0aMzFFFYyrXCxrCU/nugm
	LMJJm70RMoEMuXGxZA5rDgSSlthqS+JeRKYcj00IdGfwfO0GbUNjr9B4Dbh0BJa/
	2gtb9r5ntzlOZADOl/nxindLGn1qojrdlRGC2ZLJZ3/i9oG57qS+EaviIN/KlDZF
	2N35Hn+bE7BbVU7cNppzXedHKlMduOIWydhSWj2vkoMoYK8iib2+Olc4ZnCMArsj
	gDdMAUyq96InWacE7tjvRXr8Q2Hmwq2b5/aEAAweYr6D2lbso6pqK1xxV3KEQ7K7
	95UHjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gwtf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:53:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9390a2c895bso714361185a.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788771180; x=1789375980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=;
        b=adDpHNscJJreG4bdzftNfSYGIfGtV5GPSm8D5Sil4S/j/CzU3HHG2GKhvueXLGi5Zr
         7EFwTAI1EWWLyJ4/pwrisMW2VT8dLYHhMBvkBYH02iMMltlRo76ZAvnQKezAccqqyz1e
         NWMcIK72w7qflfNyiZqhiTFr4kdhxcaQA/FyfV+Tne1aTlcBpCf3fHhjhx3LKQrXAzh3
         V/5GTEqIwsrqb1loHz7LS/nOXwDvrGL6u/CCmc7FAXcJva+qp6qtq8F+0de+tL58QBMK
         ObD4AihqfNhYt1a7X7hYtOBkKz5t5ohIQZ1l9E6nNphoWd30hbMxb9O1ePbaedCCQ2Gx
         8zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771180; x=1789375980;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdAhXpSY0MrEXYiI76VQYeRGlljeXWxRkvWbDM3zuws=;
        b=ZruX7c6nhpdKjHhm7kQT6/uBCJiGwu4I8a18tmYATP6Bckm9oMbgDJbeEHs5TRZNZn
         XS4dte6FS3QUirr9yXMg/m7Wi+Ix4VhMiHcE8XKZJlwY9BmLxEXY27eRRZbqR4mNWLdu
         ggf/GnEi8LwQA8kp7BWVc22tAgpkhPeZFf9FGj2CqIRkIqQC/aCgwK1n+ls3H8Oqu3Xg
         l8OfqB2Rb4AKuPjfFXEs7dUjOCM2iXJUcKcSmXGb5j+L0GC0E7O0RiinJ5h8+70DvDry
         3jCoquPozZQOYftJVAIDnmzzKKUwig7LNPkAeBWTiywlJxOPwElCTx8PNJlp8GQDgw0K
         zk1g==
X-Gm-Message-State: AFuF++mL0tP7gZ+VtZTK+7Sb7Sm3fW4gY+UMvbShOrbYs6DNDtgr8j2+
	K+bldwbgLg03UU2z41VNAGiKglmLdtxevlp+WNKvdvo0KSJ1FK6s4Qf1WUWc8AmpJ2y5zVGaxoN
	xwuFSaSIDsJZ2cpQZknGHEs4Yq2m6CcalXU6uFaHjssabrMreoT/WqVFTkhENdGLfTKwphCIB
X-Gm-Gg: AYBFou0seBDALKFrRj1g/an4QQ7TuwLWCIZZ/Y2ShaCLUh2/gon9XboXLwMfuU+8yAo
	acxMHp3ASbqRmzeFVu/5jq6U70OTWEb25xNrGhHah50dL5ZxrCL3Mwjgt24bAc7EK6ELpHiSVWz
	39t4HNpA1bvRi8SpMn9CESWJuy+DjHgdcwppr+WpWy5zjNHtDMrj0jkbHj6z5TKUbwITdEUUXBP
	lFqsNQvdWroDHserOO7gHcFX4I709kAiQ8Q1V09d2NbfwQufze/3Z7VosGGsf8M0KbQOgNwL9Ie
	9zphFnHHHw6S3YKeWoqZcvxqoETT/hiOE/TUG7LBtjXa6VVlmkriHJJlxx0CQbxIgH7FHA2vPPU
	Rb6bVnvmAQOqIPF8Jp+D5wdPEGg==
X-Received: by 2002:a05:620a:708d:b0:939:49f1:f975 with SMTP id af79cd13be357-9398072f43amr2299769485a.43.1788771179798;
        Mon, 07 Sep 2026 01:52:59 -0700 (PDT)
X-Received: by 2002:a05:620a:708d:b0:939:49f1:f975 with SMTP id af79cd13be357-9398072f43amr2299765885a.43.1788771179427;
        Mon, 07 Sep 2026 01:52:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm22984773f8f.17.2026.09.07.01.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:52:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: mvebu: name regmaps to fix debugfs collisions
Date: Mon,  7 Sep 2026 10:52:56 +0200
Message-ID: <178877117448.9999.18406164256759299941.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260905004334.177074-1-rosenp@gmail.com>
References: <20260905004334.177074-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7b6c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8q2mPcn4PX5QYCfP6OYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: b232A8DXulS9FuczI01aGKSSjQkOhcC8
X-Proofpoint-ORIG-GUID: b232A8DXulS9FuczI01aGKSSjQkOhcC8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX59HHGhL0rUsG
 ahfpILvLYcDFVvNJJywyHI1+8UfTE4bZNdwlAPcroFcpwaay6Gc30dFdjckUQdT/JySzjBnty/d
 o2lcI6wtsNGnyElYquphIn0q1FHRvqU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5NiBTYWx0ZWRfX2WcNmoYTIx2B
 5665/wmbhHvqi3dJ/vZ4j2vFuqJBs+8tPn1eruGNxq3ZkqefVhcgoYmC7ycpByAUz7OHBP54Wq8
 SYYoQIbqUScVprlUduwNbNhoAjQAd9GteLN4WEAEOjsfLMaE+HMQVGelealuL9voLIA/XDJtyml
 9ku5ELwkaG3vflZfPq3Z6jB2M5S8DN7oW9cQXHn1Jn4RxbSugSX4Ou5CVECGPtvggKtzSSIk2WH
 12hWaW8lqzsq18XgO3DG6ldeC7EdZtkkZsZ1ArBl/PWxr0dy36yMbIoYHMXtwrHCoy106NhQdZe
 iR+ixOWEn08LSWnj1FlysKER5ojomGHmXpYUHGiB+yjvOWyqoNt2IPyGBExXXzs7fuvMdvpUwyX
 ZLWBP/g98KC97+fwmxSKDpBa0ME5xUHZdpp670VfSmuBfbGoqL5nWrOD2fAr1C+/SWYUQbzD/Xf
 OVS4wjuX7ve+Q/VZezA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070096


On Fri, 04 Sep 2026 17:43:34 -0700, Rosen Penev wrote:
> Each marvell,armada-370-gpio node provides both 'gpio' and 'pwm'
> register windows, and the driver creates one regmap per window on the
> same platform device.  The shared regmap_config was unnamed, so both
> maps defaulted their debugfs directory to dev_name(), e.g.
> 
>   debugfs: 'f1018100.gpio' already exists in 'regmap'
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: name regmaps to fix debugfs collisions
      https://git.kernel.org/brgl/c/4d305c2273123119c27d6e4c822215e650c451e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
