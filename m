Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176382;
	b=ombqqHMo17AuLyVKvewnSaOXdUEMwFAPZrY4+VPGH3x+YNbQ/Kn+SrHdyytq+hzbk9uW
	 p2JM5ffjbv9ljTRzChrh45Qxz7ifd+0DuSF2q+rxChQwPj8/Abx5XPds5rMeQr4ujn1HN
	 QueWSBk10GrkiTsDTURRRxiHbVdM9RMKw0qPckxYZBjECY441VLMGR84KAIiOBoP9F//3
	 U8TPp7sG9LOiVG+Z1MOeyEpXMMxOv8jEFPSRmCv425FdzdFoMejheqhLUmknl4HyYFyh6
	 diQW9EGJruCATB1Q5k9K+ULss+GHJ4p6srOB3oe79WQCA6DPpx5sIblbeilx/USvAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176382;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
	b=5RelMT+E+Sde40L/yegRZBx+TGnZkIifEu1QP2AriYobMurtTNi7/Ghk9w29FPzfA7b9
	 F3O2iNlNkhtl2vwmvY6FeUzJEgsARls1pS4h/sHvZ/Mvmiz+iiU67SMZJz3f/PI/NvMuX
	 MJorvT3/p1NxmFyO0HlR9zIlzxW9FSKDrIQfiIeNkGf1kSm9Wimxw92GRv0bMIOkazguV
	 q812BtWKcFNZ6wweGzCEnUjcxBNZ1hh0dEyza0Zo5DS5YcN/HHqAjjamDFAde3r0W7awM
	 pzZax/8Gm/4vvQ/Ok/r3RZ6Kso6HSoazzOVeCto5UKMjOHWFEJt/+0uf72N+FrSWoKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RmXN/UH9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Pa1huM/T";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F75606A31A
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RmXN/UH9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pa1huM/T
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KKOO3264729
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=; b=RmXN/UH9tAHAatHx
	tO9msi+c3wcCJMlbU09wKFIe8OCUsMhjnDOsS20mxFGGdZNLfUcFvCzq6KFzXAly
	5EvACi3kt7JILHBQge+1JoXlCti6IghG8dSCDbZJ0YeqxJ/56N37fKKg72zOHiXN
	7JvwXZjcvuCAosDDwcNGT/hu20qvuE+7Pujv/f7Y4n+VEhR5za8kNF5mAjjr//PO
	rVp4pRN53v6FqUMdQHuNPAYCAhpUYlkUoh5v+XlRmzDPkUhJvCSk/fo1qYHJCDNW
	AtxQEH4+uVCeh5fxdzvWJ6sqpFf8fvdGxfjfU0nkGvc3WzUgC+oQgTVzFhJZqTOC
	iKiCFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy7139en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 08:33:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so62549385a.1
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 01:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176380; x=1793781180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
        b=Pa1huM/TF70Tyd2ozmBuDm2EfW8YNGh7fC/mPJL5YYyP1vOXxHvsDkUKpCN8kBJwfY
         UblFHbKiopu5LGCOOK2cZocAXtgAwPLzAMePTiyyGLFTJh6gDDWsLR+Pg75RwoTha+sL
         2DaH8NICHSlO0QfIUTKoGHPMQjLh8wUe4kXEwg2tcpYakIQEw/XNwTtHMVNi+tDV4VW4
         /66HZ5SjSa4kqCroxiBLOUADpuG/YoL0PgvB5cdyD0y9X0Cs/IJjzU9pEVLlCArgkbqZ
         eYpyaYUIWzF7KyfStBvvJhmUU+9E30mM2RzxDJzwK37eR+5GpJWDW2TABSgtSFoiBbsc
         GDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176380; x=1793781180;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvkImuUZZN8wIzCTfLOpE+RyFC8r7MIMVjR7O1zODfI=;
        b=dCY3zhrQMDBNivoF41g/14NayfNdZyp6Y9MJHq7tmFpxIiRbq5OC5MAeGeIDVqtOfT
         E8/GfG8Pki3r2nHL0r3Cj9UuB744+N/u9mniOGsjICrdKDwrySNtK0ZcozxcBYPdDPuG
         az7Aa/9IMDONQF+oT67Q+SUytL7Ee4CL7hneDNT5Czt79kFltuyFbsAJNphkvvTM/i+a
         vT/cfG/qmyc9thLDTv8ml9nkqmI1TqwEXuNro6dkinaCedyt2o5dddcNIn9qQUgtum5a
         50H459Lk1lavXFQn8Qs8tIzOqXzye6WnCgKmaWtCg9MtC0FNKTwR3rpencpi0W+8oAmc
         kH8A==
X-Gm-Message-State: AFq9FYJdjsmlBVC+WWIdvHB5Oc3NizxkqNRI2SF5bzogmc9PDSIU9Qb4
	k0h4mEWv/VUikdww9bSu4V0u2KxiTDke+kQkBLVQOLP0tJwNqq91VcAFDf39pMg9IRWI79vSxtK
	/xfOE10UNPMsPzPkaxqDu+W7C42c/cgLNBpiQRfg/MqfvFDN9Qz4rIf3wrJBiS48U
X-Gm-Gg: AYBFou0dwjmuEiw7q1tYnCChNXSsNh04STmCr9FL/8ixT58FLmJ8tf0T9jGlJnMlcOB
	mvishZM6HRoBsYNJy5UFWh3QKS8V8Bg4bhKrT2oMGi1xGalJiP1CPUup6/uMBnM8s+FR+BlCWHA
	JLsY6n8Nc2UYsdf5YZFlNMzrYVatOWRRj3/+xeo/av+v88C2UlrU6zYg8E6k1Xlps4UoPjYZKcI
	hadNXzRzmAJeHwgakRouEaBn9rQd9r/Ya3UnQysH1ZjNqUuQrHCDgupIZscYs5yCUvYbW6YQqPs
	izlMGEH8v4RVWTx5AE6nQqievgmN0bfvDmrUGOXAEOSv8x0K19lumwOLRcda1C79RduJEaZqjIv
	t6FAPDIICLpQaoD7i9NBAxId3pPb5ufjvgmTJOJJEAeAyylV3ZvV0rEWCxiCdZVOZi7qkb0Tt2C
	gv
X-Received: by 2002:a05:620a:4147:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-94408cde155mr208296685a.51.1793176379991;
        Wed, 28 Oct 2026 01:32:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:93f:2cf4:e6dd with SMTP id af79cd13be357-94408cde155mr208294385a.51.1793176379505;
        Wed, 28 Oct 2026 01:32:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:32:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: constify struct configfs_attribute
Date: Wed, 28 Oct 2026 09:32:53 +0100
Message-ID: <179317637229.6922.2864720743065087678.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
References: <20261021-gpio-aggr-const-configfs-attrs-v1-1-a98e8d1157a6@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX8Uekqs4obsxf
 oBmVMsB3Y8UFI2cyG14V7mXbWKtBsXA9akxOytucPDTfFONwPXDszdrYIJR5CrMVSdxm275XcjC
 1jOzwbB+9m4duDHm1xStGU6sT2kUkV4PNIusKoDxmOkAnLMkwGICbeyoVHkltJqMsNhMNEb8ak5
 Ih2Kwm8mSqJr7pZ+h00SHOZRF88Py90WzDxGSiGTBfXDzEohZJUhEHzBKY1QqSVTlnsyquo8O4e
 DTexcYLLaJhMIcrKoNJYMGxXE1ZAiJpP4sFnR2BDjfxJjUOyQ87KmXI+TIHIL/UYx1Hr1Ml1WZQ
 /skIH60M5lfU1borIJuSjCg1KtwvZZvSyJI/UjAyiSwIk/cOqenTlRhl2JKQ/ygk9u9kFQsOBTE
 l+FMMf2wO48PxxfNbRqYsGfTCJHkKKVdGY1SPegaw8qCIspn4y2Uz3OcWdlu9urN3XD+cv2w8jJ
 EpXER9ZAz9T+Vsp/bcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXxx84CaGlaYgz
 B4KKjwhrEJmWgi3dMhGJKWZ3xRrlnNwTe2kA1EwzPf+io+szo8qJXbsMrFmk3gMEYGXp/WqDtRp
 owtGmQJKAh6K9oWJ+7A9uX3CFml0W28=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1b33d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wRwPfHjqSs-fDICwijwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: masDgqKRwaW9ELwNrQH2QZOoTNnSnT20
X-Proofpoint-ORIG-GUID: masDgqKRwaW9ELwNrQH2QZOoTNnSnT20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 14:31:41 +0200, Bartosz Golaszewski wrote:
> In preparation for the constification of configfs attributes, make the
> existing instances of struct configfs_attribute in gpio-aggregator const
> and use the new st_attrs_const field of struct config_item_type.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: constify struct configfs_attribute
      https://git.kernel.org/brgl/c/59abcfeb59426e7575e80be53b7024a151def2b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
