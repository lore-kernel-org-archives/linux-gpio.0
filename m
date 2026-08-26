Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1503C2B95
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 10:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787740706; cv=none; b=i5iGrmmkv020gzBybGpmqsLLqM0qtnI2AsYXDPlhYbkJAuHhGquO5UuuJS7f4PukyBupbnIwR/IwnIgrwKF9xFUGl/SYTZXFEVL0qeQbxm3ZbBDggGw8N7e+Gb/SJNCfAiNyVm7NnYsoPNIvYqhaUyC6aGcUakkWqg3YQ3GVgas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787740706; c=relaxed/simple;
	bh=lpZdeKvXDp1Rqt7xvxmDntNNxrJKzFKa8T/F8XytsRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BGCCFYx+XAVoVISsGP4onPJIVH3pi6hpddc3mYofVGL+Marv8if9ay56RZ1dmCdt/ClomjB1XHCR6uGO0gX5MmmGWxFKVO6fDwN4N/vXnuRydGAV5/AC5BW6ga5G1eYecetmxVBf+CWL7e9dxWkxYd5xkwJ+xjwMamJGbe5ltas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3Gadpij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8mpWcP6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3Gadpij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e8mpWcP6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH3If425204
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 10:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ILb+u0DKGfjMc5UGDHKo8NPVlS1H9PeiuXuTqoRw53k=; b=G3GadpijslrwFxR9
	HESLmY6CUDU0YMM+x4D/gXW9fPPKcq069uvDNU/3Y+PBDNYh+t/IIsEFMlqvK3bF
	SwkSJWzjJi8CD6ynPaZKi/xJuGZVk84j2kcpUi/mSoKV+sxH/glOSipBu9xrCj/g
	3Qll7t6WwHiSlBoGFCpF3bElsMC4LRWOKaehMxUjh5x86gQ3WKaTxTtmIA9lvJWO
	0XhwHi+QtGPZuYUO/K/lda8ApDYJmuZyEtlBW0pVzKqoJyrbUBh2ChVEXnoyqYOW
	9GezEhx19UZJWbCNkh558FYqFu5ISW2O7wMd4xpMcdMQzpXtrsMJiCbal0WGy6UR
	JkYq0w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceuf57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 10:38:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52f64c48bf2so354361cf.0
        for <linux-gpio@vger.kernel.org>; Wed, 26 Aug 2026 03:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787740703; x=1788345503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ILb+u0DKGfjMc5UGDHKo8NPVlS1H9PeiuXuTqoRw53k=;
        b=e8mpWcP6S32HGvYRkxnmMGoWx8+YM1uBIBDdKKWbRoGZ59HNn1PlndSaCeJn6TqZA8
         dEuYflISGTgrSJePpq6vbDISk2r7apiOR2f2TxEgyU5iLnbjA2F395CrI1ny/rvI2eUA
         B/e4RQm3Moe+B2Zxm4rRltMM+VwRQYS0e7Pq8Xjd6DIG/DVeJWiQ+WeVSZ94Z75Nbyiq
         thnDB9lHHr1+/uAgjShD0uXP14Vv59alGYHcwnU5s4jii2dnlceRXQFFlYLgRJG5v6Ze
         P7fq0tOSabO4GXI9wrYr3ibTl9LB2aiSJ5uC11sRFcuVJeXuIwzoQuM1pmqrx4rqo6/t
         CArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787740703; x=1788345503;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ILb+u0DKGfjMc5UGDHKo8NPVlS1H9PeiuXuTqoRw53k=;
        b=Yk0Rwc3EX9MRU4lGODL6MwHN17NZNiCfRIPBWdXPlkezqwB8b2+QM/pNeD69or2Zpw
         QI9ttbIDixPHTGjwxakQ0TBjit/rFNPQt88QvHNejlOMdyJ6bPcsTyygIjVMcOcC1euT
         T4V9SXq4zbeA7F0cpJ3B9oNdoYh6qPeq5yXxxZ5TkJABTnzDLOTdxcBidw3xT/4HnWwy
         rsO1+XbTnLxXAXIsbnT9Yjhf+WUWRGQkrCH5lnSgj4FUYTPh1N0mmxFsY32nHLOLmzl8
         YbAljt1gHh79cutj8UJBM1rQIAG8P2fvWXExKYuqcDtelZw0+iYrDRjiCPRLpzNBYh+y
         aU2w==
X-Gm-Message-State: AFuF++n+GTwV/+evROiuICNQT16q6fLzQMe1R8yT5BDVVmvgIPD5bWlB
	Kbs5Mmpq4pT3X5Il8Mh9f2Dq2TRV63AHVbAeH+Ytt6mrZbzA3U/c5gCQTPyx0unO7z+ECjIl70A
	gH4RxZuQ676AOxK0MQhvlbF012dcwTbYFlBH53qym9/6lQ28zxYiIM8QPf+cr1u1CFRSNBMkm
X-Gm-Gg: AR+sD11JpPcXzGEaa/hTwiIceLWsCYMQrxfEelu8UfDiPgEdM/NrX9FSfM9Yey+ErIS
	PXbwzD2iFqkhhj3qFS/SwGpQHe/qmGvfHgr3sRBI+J8dWhhPMK1Ja/1KtDppGJ8DPn0WXAnTNeI
	4l0x8LrZIVIw9F0cKuGoJ8B3KAyUD88QVm9rux51aFCtJP6Edbq/zk0CPqhpXy+p+5COwnQRgOE
	bk6I0/VzIJKxzTRh5H6tKHpc+opsa+J9ymFPhG2Wp2uXnWvvZYkhtM2+QMB3wv1NqNuSWwjT4KV
	rOqu30ObkY+Ml5McVNyrHqaFQGEF6I96HL0M7WDUMGdMchqpPJAPPN754n4CHelx61PddDiejp9
	cyVwl/MrKm4NvXW4XEmcVMGZwqFQ=
X-Received: by 2002:ac8:5d53:0:b0:52e:1039:c45d with SMTP id d75a77b69052e-52e42422884mr49776501cf.43.1787740703163;
        Wed, 26 Aug 2026 03:38:23 -0700 (PDT)
X-Received: by 2002:ac8:5d53:0:b0:52e:1039:c45d with SMTP id d75a77b69052e-52e42422884mr49775981cf.43.1787740702739;
        Wed, 26 Aug 2026 03:38:22 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5771a3sm12616865e9.4.2026.08.26.03.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:38:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH libgpiod] build: do not require a C++ compiler if it is not needed
Date: Wed, 26 Aug 2026 12:38:18 +0200
Message-ID: <178774069503.49994.8214376319796208344.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr>
References: <0eb5c26d-731c-4ebb-be34-76466cf57720@grenoble.cnrs.fr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8ec21f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=a2Vgwq0GL8OCKbOR:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0_FRFhzYRNHRsMAIjW8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfXwQ31pbaPoRdI
 xyR6LgY83HUCEsV5GBOKIDq8krzRtF+X/5J8yJ0jL1XpGEDVA9JJ9p2bLA8v5lowTLAy3eqWknA
 z1ICiPsifijJFcQw5Xh5vlytjwkdgvY=
X-Proofpoint-ORIG-GUID: Pevn6Ij1dgYIiR_XBnwTZ6MM8DkuqnEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4OCBTYWx0ZWRfXwir+oMFBUDFG
 wfyRnuOVxMZIufJzZGLeWcMo0KOOAZnKZ9h/QEINzk1rSiPSD16Z11/Jx5KpfHt7YAa2DFxzYSp
 VuG8aaU3evrq0txV3ikYDUFsrdQLH6BCR9NIp6UrNR9Dn7XF1xLl5+/piyDhSa7pyo+snuPMZmP
 NkagdoFwc0za+46ZiEx0lO7aCx3lehN3fKaAqs0wgMie/Q54GaLlGWXgWi5i39H0Y9gAxfYdsEW
 TTmn6C9PQ7R/mn3q87l2MQVqHPyfjcSXQ3KT2o1B04dI+TJFpPxpcNWzamenHK2MJtgAjmFuc01
 tQV63bxJqD/3g+bsYLXtxE5ZMABocgu+4iKFgc3eMSclBKTX162lUbz9rZ4j19Mj68wXBZ6cDq5
 8szcn90zQ0fCFHprC5C06KzpeEs92iUsqyXhapvA/J9Zu7dbG4w2VnR4qDjdnK0gx4Exb7RZetS
 nVWHGtzEUr92NzO35Zg==
X-Proofpoint-GUID: Pevn6Ij1dgYIiR_XBnwTZ6MM8DkuqnEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260088


On Wed, 19 Aug 2026 22:13:55 +0200, Edgar Bonet wrote:
> Languages specified in the meson project() function are considered hard
> dependencies. When trying to build libgpiod in an environment lacking a
> C++ compiler, the build fails with an obscure error message ("ERROR:
> Unable to get gcc pre-processor defines").
> 
> As the C++ compiler is only needed for building the C++ bindings, do not
> require it unless the option bindings-cxx is enabled.
> 
> [...]

Applied, thanks!

[1/1] build: do not require a C++ compiler if it is not needed
      https://git.kernel.org/brgl/c/4946370d06d51e3f9b003e71da416a6dddf9e4bc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
