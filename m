Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612355;
	b=e2D562wyqJi6Mv8UTuCIEgopPqkniZnbr1ZJiNO+Vryv9UWTJ9am3Tj3KOC/qfSJu/K7
	 svH1BTBT22C72vDduygsdQ/qi7P+IBb8DH/Mp5DPiYllGUGK4aTRqE7Kxu4KKeF3QG3uK
	 bWoSPPnlpAHmY/eVxUHUCVaGvVcfMNnIgf/yLRuhu5zkkEMOPxIR8tW904afRoSAjfiaI
	 98OFKk6jIHAjKvqJb1uRJVgkWOLMQ62QTTMEnmyOJEslTwQeWSTzePzxOPoG7Bwe8PNK0
	 GqNL+lcvIFAtlASK1aIJLPN7ZxrwGOHEZwBjUnLY0irvSdTpiX65Dkm58FVi6BLzUbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
	b=1ilv3D0CTTPesAUGMsc68UUS2Dipx+7GuZL67HID7C+xL3SaszZV0fYUDbjpr7xWRkDr
	 xVhJDz9pTcofkoK7fJ+68sO9umKx7nVq2HcLvk/4X25Q36QxuRdurVacNCVa5VIfgAbKL
	 S25dDi9RSYVL/ufAJ9zQGNdNEB8bn1v72eZ8vuDsrEcmLazkesDVWRRw9suaAeJhhHgwr
	 +qrq036Mk1lH3+FKjXS+HJGoHA3+kNMhCb43UBkgr6McI5/al0r4q2KJ7o3oT7b4viGp5
	 l30YBaZhFfReiQh577edfIXGWwuBEu/VEF9G4w7k4Kp1e04CpOuJ1rtBMipaNyBNY0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp8zXave;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15FA606A326
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15FA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZMfuYuMX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dp8zXave
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AQhZ2361168
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=; b=ZMfuYuMXuVHTnI2i
	yRZUsfLxhNsB1lBdsevMx40wIH3StJl3jo2kKp+g4KMSehmTQ0yXehaYpdehoLnP
	H0d75uGi1E1sYZP4lWoxyiF72Ja9RFQIj0qeTbTBYVEn1X+okz9Jr04uhFi8c3zK
	usZ6B6TSHF9F3cDWhUpQBzTpzksq/nfJCBNVWPX6xmPNqLq6lHzHimUpAORJcQrF
	nZ+gaSH2ct0wJBT6sjg0dM82nbrlB3zzYqqmdB5YpcX3sjMxJ2DlNtURTWrwn5BL
	4E0uCdZ9MBN0tollRRR/cLIN/XAf6BKtdezCntS/NfolOg14lHd1K8AmkUl1oiBq
	28BRnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7x6ys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:39:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so269048385a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612353; x=1794217153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=Dp8zXaveyvnn2uN4rhpaAGSbOLrUxzYVjvDfxQONvCqDNXd22ulKRF2PLxnvcCpcZU
         e+Pj45a2WpAlKQ/SyEA6CATGw4erhIvgQI8RDZvDCAqWFUOADttpli35Ri5T1CnHBp6f
         HvZHtjRykURKehy9QDqmPw6u0JEc8+zqW7LWf18ASDjMaSOqcS02odIhMQLsAgzXq0OY
         GZ/uuCSFtuZ6pXCLWZ8BpFFV4zjH/O1z4DPbLh/K+xarrQklDQuTRZjHPbNO4zYbCyxX
         ubIp980NpkU5Gk4e0lpgOp1wu5R/ccwGbmmwRKcBHHCxapk4n9CJeRj88wOH1VA9zTOP
         QzqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612353; x=1794217153;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k75SutGpyQ1wEbJYlWNPsWqPAnlWbSqGVZUV7dZvgNU=;
        b=lvB9GSc+IN3qYYpwEHnTRtLbwsjZNAe7Rw3+9QnLaVZCABtGcaGAzBOWhTuhRI8L7S
         0sMNuOoK9oqQbwsiZ0LbzKju2iOVyA+XucIDL11xrcaSTZyBKJXl+Abwj0KFhF7ghqLQ
         zQvcnbjMoCqnibw/71EJ8JUgNbkKFr0h8NhtMDf4CVyIKQEsH3GCArbmU1Zfrx2rF3S4
         h9uQ/Y0LwEUIUkDdhYUBx5ic8RSqso600WnFfdXga+nXlEo39lAdAFbkOzUU5Wdve7HO
         /nqeaATfF/HpV+1AcUgj7jWCxak+aeSXiyi+Ql0A1WnwuxIy1hToBateIVOxrfdAePbp
         lCJA==
X-Forwarded-Encrypted: i=1; AKwUvBwdqEIYSnfaxtKMBwmsYBW88SQdenMwLJf2KoITSoeaDYQ020hNO+El5rJ4npUnDpAopNVj0Ba03Efc@vger.kernel.org
X-Gm-Message-State: AFq9FYJjIIo0lFE+aI658jkQoTck/88b5NQ9SoInwx+p6yRX9HKFdAux
	T102NZqvGqmTjTOnir2OVgrsrRME2/+y8YSV2oNsHYwdwE/Piur9m8CVtGJAY7rFxpf5QlhwsPF
	xv8TJfrqb57A7BhqgkJUnU/eKxQQgJDvIjIr1GapUANH5f9yeDIodCILa4lf0hTcQ
X-Gm-Gg: AYBFou0tIwYfUDL/vuCAMCeA3Uxcx0quxF0llY3sfo3y+CiMuBwFksl47ZTJGSqJoA6
	2HWGI4zV3iuCheoNNZnPcRxI+frj7YdY2cYvLnsMf/p09V/NT0/rsmDZRExi5flgLb/uO52YkIZ
	LqW+72FeSnw8VJO2UxZ0mBSV78tDZ+BBubWRPvhbETTI8P+1KGxBZWdG1yQXazN4qO5NReXb5FO
	zGuCs5b7yDPtOEBB8lKSIjLJaE4Hs6/ijnMpTACF6ILZgBh1u8gSYqn99VeFYkWVsx+9GXCX2bF
	a9XhiB1fgr6zQsZ/Ewwp9Z2DSemF/gzIvta69ESdVE5RodQg67YfYZDki7QrnnMtjt+952o4ute
	lL5UwloqUsGx6BM4qVBTToQ/34zuG9WHGBKTTlwHFGCM9KivptS0wk+bnZ71jnZBuST9SYHQQpt
	nF
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519529185a.73.1793612352635;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbcd with SMTP id af79cd13be357-944217a3ad0mr1519525985a.73.1793612352017;
        Mon, 02 Nov 2026 01:39:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bab1a8sm18880436f8f.57.2026.11.02.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:39:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Peng Fan <peng.fan@nxp.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 00/12] gpio: mxc: probe cleanup
Date: Mon,  2 Nov 2026 10:39:07 +0100
Message-ID: <179361234152.49297.16476841533966255067.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
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
X-Proofpoint-ORIG-GUID: VS0CHojBR15aJRpAa0PmPtu29G3KpupD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+bZhV1y2eGNe
 RHzt1JxuR44v5sPTuF3O7CipPtI7ospQAMZodHt2zHdOOp6wfU3CktqVnMxQ753yXQTT1neOav5
 6WqmNaD90w1ATHeXOICW/GQVtXtx5Fw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfXwHsWATXGL/7+
 AW1vG45iuoh0CkJtJQ9fNW70mdJK0X5wP1Ybv3ZCvN4BAqfrx5Osma1lW6+ymRffkDnKevirl0i
 BnHnt/xiXPv1IXau1F38vabgM96DH+QCseoU6sPiCHfLmAetNHH3s0vAXOK9Ba5UhxGb8kHx+Cs
 yRo45MvWTq+Oi8V3GHo9fRT3Bx8+L/IPvled9LKDv4szJw8mEP2uwYawgNgAD7OoK/uqSMd+vyH
 XZK9WmAvbDwbbKNA9Xt3LgdH1JXK51Mlkv7xK5UtIJ8kvbCfLLf2otFGCSXRH/EEzobq4ERq7BM
 7lyPWzIlKP3aPBridBFkaWQH9VyQDgqvjD3KtCG96FKNDDiwrDjhXpN5QypTeo7i8wIR16kXVJs
 KLgyd11lXAYexVrYRL7rpqBebbGmjqenJ4SqMewR+7x0MPq+KWBDwy/OGenbBKIUIRND+igfXZ0
 zVb79jDh6kIYNn9uaHA==
X-Proofpoint-GUID: VS0CHojBR15aJRpAa0PmPtu29G3KpupD
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae85a41 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dTNmjvSPNBXJgja9_wUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Tue, 27 Oct 2026 20:09:27 +0800, Peng Fan (OSS) wrote:
> This is the cleanup portion of the gpio-mxc series, following the bug
> fixes merged in [1].
> 
> For Linus's comment in [2], I will use a follow up patch set to
> update pinctrl-imx and gpio-mxc.
> 
> Patches 1-2 are wakeup_pads cleanups: consolidate enable/disable_irq_wake
> into irq_set_irq_wake(), and use for_each_set_bit() for the pad wakeup
> iteration.
> 
> [...]

Applied, thanks!

[01/12] gpio: mxc: use irq_set_irq_wake() to simplify code
        https://git.kernel.org/brgl/c/f9922db7dd7ac1a0545e165b4ca52bca77394715
[02/12] gpio: mxc: use for_each_set_bit() to iterate wakeup pads
        https://git.kernel.org/brgl/c/8b56c9bc04d5febf1bcc6b3ab4020608f7b59bc9
[03/12] gpio: mxc: use 'unsigned int' instead of bare 'unsigned'
        https://git.kernel.org/brgl/c/fe290228900ba8a6351677a97feb5e7a8bc493ca
[04/12] gpio: mxc: replace of_device_is_compatible() with hwdata flags
        https://git.kernel.org/brgl/c/363f30458065046fc1ba1564a1932f5deddbbfbc
[05/12] gpio: mxc: convert pad wakeup compatible checks to hwdata flags
        https://git.kernel.org/brgl/c/eba30afc04687a53300011bfce94e95cb4050ff9
[06/12] gpio: mxc: use local dev variable
        https://git.kernel.org/brgl/c/569d0a6f57fc119c7f9471bfc7e0886070c6bf95
[07/12] gpio: mxc: use __free guard for runtime PM cleanup
        https://git.kernel.org/brgl/c/6d0d40d6d39dc0314a54d89ed1635da9df0c8159
[08/12] gpio: mxc: use devres functions to simplify probe code
        https://git.kernel.org/brgl/c/02f1ca1b7a56cb52813c476b9c881862d29ede33
[09/12] gpio: mxc: add dev_err_probe() for error paths to help diagnostics
        https://git.kernel.org/brgl/c/a0739c3cc3d414d981b124543d6b45eaaeaccc08
[10/12] gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
        https://git.kernel.org/brgl/c/5ae5ecd98ed2ecb81b8b27e184fb28a278193673
[11/12] gpio: mxc: use BIT() macro for single-bit operations
        https://git.kernel.org/brgl/c/116ca21f82df0eec13a1b949746aa17fa65c0a22
[12/12] MAINTAINERS: Add an entry for gpio-mxc
        https://git.kernel.org/brgl/c/2505bf94979f596f2b2146cc654bc28cc46bbb9e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
