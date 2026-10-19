Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164F4495030
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396880; cv=none; b=ja3wl4XrPZzDtllOGe6PZyBZClp//fzGR9hVXCWs5JRCWAB1pum/H5NnT1bAgKPOwTN8h7vXUX83zfqInTJnpzjDnJoIhp5/pSmwYoWjeWEJTSEkfg2h8P6UWqygRfLRCECb/Asqq6P3thuPC5qNRginQMVXtgwni6Lj8VrBBRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396880; c=relaxed/simple;
	bh=9GKtCRXtDMzJYeor4lO1X2TbA08m1kIe6U+mpNDHQmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/fIcCIlP5OPezjnQaUwpl89B8DZJThNiwFD6vx9IF3mEx7rt16WK9GTVu/7tn9vw4DMsC0xqkyRrQwB2Nzt35YhXejxKzQG4V3FxQZAn1BBMjKwTlgK9ox/AwPXiqrnokzyjkoh7w1XJaiKZy+7Xohs/dxkmPrU8ptAYJFq97I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKxiFTft; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g9Et1ebP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKxiFTft";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g9Et1ebP"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j7fD2178008
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHTyZz7TNwkFYhkOwNG1Ox9KJc6BxCNfyiot2Zr+we8=; b=BKxiFTft2Er+6WOj
	Wu3k9IP6asZIo3v+ABDsoqY0wgZUvOQX6ffBEE2wiYkGiY1KHTc3REsVT4QBcdt/
	fMNmw17o0O+JsrD6LjsWkdR0ymHMYCEM0PxJga/Dr0alltH5AaLKf2DuaikR2ecE
	cMy0sA5oTHgFOhd61YRfZlufBd1AefUE4Ou1PVIp4o2CawTPliqOFJEVmUSXkdM0
	1afmn4bQQIuWFNySTqgduT8R0p+i3cO512EDiwj+mKDA2RdLFpazIMek9xod/jxr
	7xwTKUytEzFjDhfvV/jP/XwmPGqTBwb5nXvGqYCpBMIB9cLSKfJYOMrLnxC25skV
	CP1c9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5u1hp9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 08:01:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so350808485a.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792396877; x=1793001677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHTyZz7TNwkFYhkOwNG1Ox9KJc6BxCNfyiot2Zr+we8=;
        b=g9Et1ebPE1/tl11eKmoUJx+CZSLVquBXULoNF9Bde18/BstYDwQ3Bdi9+TxPyMIhHc
         lfYFhh3mMmnWya06PJFDWadzr7RYdKjHkuPK+mb8i/6DT4WO+u/se15+rLgQoQQjr/YY
         diBVc29ubQSKmQlQsSfPpZenaH3gpcoJiVpQTByilXmfBm5nYtYn+w37c4ppmVnir8ai
         1/0TRxF47MDbk4SBNlFRkQYaWTj+hcFPLBN6tr63lQAeE3ukZomvWPUrsS+4mzqvhChZ
         Cih8/QOqtGWnkIXH5ChWiFf0JwqSAiPiShn1BYvbZa5btFytjyuOginJqB3aL5/nK5S8
         8sgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396877; x=1793001677;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHTyZz7TNwkFYhkOwNG1Ox9KJc6BxCNfyiot2Zr+we8=;
        b=0R4w4JhtE+ssamdAW5mdFFg5XhyuvdD8XIGazqIJyAuDh5I+QQPLpaFAIq5Lf+1d6G
         vfvEK6DQaIQsiEdTrumEOKiHuSJjwiFFNfpKtIPAWPkYRi61qe3VsMFwD/xpXAJJFw59
         sjgQ7s0TvUg5tqMN1F6YO1V3FcQk5ArN6EjvSfZVY2ZuOQHqxzaCTjIfY2rWyOBTCN1N
         ZTM/6HuWUVlUaVzPOXaRa1f0Nsb44pRnY4J0ln+74NBStDJoomL1ZvMA0izSpUM0FRPe
         VN9hU6a89q9IgMtpsi8DHxatFD2vULuIum5FuYN4As+/xx3GfFttOlbdJFdAHjcSs6/f
         LbFg==
X-Forwarded-Encrypted: i=1; AKwUvBz4XxtXvVoq+cx5+yChrsZW5mIYS+OYAiBPTrh/NQQ6p210ukpj2BwCMmToI/vG9+uds3ZkPkEIIBbH@vger.kernel.org
X-Gm-Message-State: AFq9FYKTYL45RKZqZ1mx7anzc9i8XX+H1vfHGb/vLxtDcIPCdW0emIfb
	7MX9EbBlWiVpFVdzv8tjDw0qrtuKQ2760eBpOQpQCgq3w/PaZl5xtD7jl62c7qIg0+0r8c0VBUC
	lYXb13aMDgx8F/uZv5dD49cygwJZgYT7A9r2z7U33pjPeeddAmGnStsELJGqdhGEa
X-Gm-Gg: AYBFou1U3WB7RjEJ96sNRh1jrJPP+gp9Mif+sxACq7cR2brLtqjRDQ7pkFm7hIJ41Rj
	KSIA///WlD2xAMWRKHVmXWKgRR6vxjoqfUmgXKkBCt5pB/ZeBxQPEjJj5NbEURsqr1WVK/fx/mr
	nNyhimeEeGQCXo9daqJq6Y/deYYbx2QPELcatpUMSwuNO7IjJPYVzR1X3W+3gvCvwLeQRrLKT6g
	judKTJB2iYHR8DkMULwMwhPOujrCkkCw7wZ1dGNvocC1/zIJLybjlgEvqGP3MuOCOOy45GSN4aU
	ZUcCJ98RZrgRkpN2I7c5cIzyUjjUjLuMM2xal+SmBbCgJrIrOWWHWg9L2+1F2nbaHyaWBEoqYd2
	gXEE7DHVxUeoyfDpYHS+p27z50dw=
X-Received: by 2002:a05:620a:1b86:b0:93b:d7a3:45cc with SMTP id af79cd13be357-93f29d5b658mr1142321485a.53.1792396877119;
        Mon, 19 Oct 2026 01:01:17 -0700 (PDT)
X-Received: by 2002:a05:620a:1b86:b0:93b:d7a3:45cc with SMTP id af79cd13be357-93f29d5b658mr1142317385a.53.1792396876737;
        Mon, 19 Oct 2026 01:01:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm316809685e9.12.2026.10.19.01.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:01:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, linusw@kernel.org, Kent Gibson <warthog618@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        aambrozewicz@nvidia.com, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path
Date: Mon, 19 Oct 2026 10:01:09 +0200
Message-ID: <179239686602.5748.16871411892919881207.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016105442.109836-1-warthog618@gmail.com>
References: <20261016105442.109836-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 88KFXun_E8T4FdneftkEqUgJ-vn19mUS
X-Authority-Analysis: v=2.4 cv=NItAaE6g c=1 sm=1 tr=0 ts=6ad5ce4d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uEdq2d9-TmA9ig15PEkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX0nzaA0R5Gnl5
 c/Sxn3HXiDiznAtJVAeghVF6N2EHUrmwRRZVuUo90WnIuUdEpyTHskThw3f1zK6Mo3iY+WZWNx8
 hTFVATXuoeqOF5s2mOy1A1qq5kf4Pn4=
X-Proofpoint-GUID: 88KFXun_E8T4FdneftkEqUgJ-vn19mUS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX0iaMOHxh8IUi
 PaD5eewcP01ZWOjLugZoNgy9zzYgJWjZbMGjphwgkKm7odlrcHrR9CJECWjWhvsalsXhw6cSSZw
 u1/+3VtWTEPoKzfl47DT3giMLXUhPkOaIX1GyKO27h8hUFHey13UW16sMT6z1+Gi3eXjGxo+gCI
 1KjOXWKH1XoWw1Fby79bzwcUwlVJoA5r936hhmrhKpNsWkXRIzvd4u5ZDO7noq37fAJDqj3ALUc
 Xl1nQGjAe2TbgDe/CoFSKNDNHOzdQTE8e056PfX9X1VgNIQjMDFpocIfkO/v+6+l8lWcNkTlOFK
 H0EJiQLVz76R7aj8Q2jrqfs2KpFdZWL12IROWJRDQn4k81rtXozE5b5NS+K1Sf7hZE82It0b38i
 k6Beej05k/K7Fg3qhXti/uNiKIDnKI3TfLF7XbmPZmdRpEjFTu4wVkdk02KLtH89UulX6Nnuvkg
 vTGfF4HJUau2x5Ri8cQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Fri, 16 Oct 2026 18:54:42 +0800, Kent Gibson wrote:
> A drive-by review by Sashiko reports that, where the line has not been
> configured as an output, gpiod_set_array_value_complex() can return
> without freeing potentially alloced bitmaps, thus leaking memory.
> 
> Cleanup the bitmaps before returning.
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix memory leak in gpiod_set_array_value_complex() EPERM error path
      https://git.kernel.org/brgl/c/138d7365c20efe47b4caa92c46f086ec39b81f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
