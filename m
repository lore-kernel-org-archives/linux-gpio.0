Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1D5383CF
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174536; cv=none; b=pajcXJIHUBp/vv9TU6Mw1urpqFAfGV7+2WNyeQpgrrvxXXnSX8Wi7Wbn/iJCC72864B+U14zf+jfkNEwxyKGl6MDzeAfoLotZLrvT5Dhn8dx7WH5FeIRt7VqQmHi6Jw/U7mvMP2lkGHjKd16jr2TF3SbFXIB1Tl7C4FcWg22uAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174536; c=relaxed/simple;
	bh=3Uj+B1NgxgU58OpZlj2YX/Lnv7Y6GkrNPSxd8oQ7guQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sqARw3zjkT9bXfAs8U8iM9hdBuUtxGorK4gn42+QjOPPDxjEa2lwFaabahwjoAHedPkZcQBHHMVYvCprLinJBRgmKnudpByElfln91jCEyCybcDs35Ww4UXLDcdckcSZWB9Uh6t/CmbK3gugXOdmsdR810cKObEE8BIfzk4yans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksc0vwm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akgVYc5s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksc0vwm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akgVYc5s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKm0c322352
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:42:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=; b=ksc0vwm0bbTIijxq
	3o5bW273wzguMNDnOnaaZrH9ilPdnHjTF9CD1yX8g1i3r3N77Afg+gZSbXduibkn
	1zbn20CVDYWevvd6RYf91VEELDjvX+94i0ePS9kITvm9seFjLZjqNM8V4EtTwgKG
	qFzgsVqkPS//FdCWRWTGmXR33ziGGz55vtbEoedQQ0gSP2bKiS0LqZoOREJAr53f
	ExSzqfCD5nSOlvRuacxMi5HfMtNM2nGzfIjxnqaaDFs193CcfhHY8tjsvQLmB9/A
	tWM2I7wfd3ePtcqBveN4zXkof3+gY0zxBoeYSsz2evUdu662gj2m+C9zGj8ssc+h
	FEylNg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsgbw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 14:42:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78a6d5cc851so287439137.0
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174534; x=1790779334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=;
        b=akgVYc5sovooQs1vCGcu6LhOAcSl2ohO/1OuoMdaaqYAS4ZfSqL8nUGN2CIzvxsYn+
         28I/Ys+cPniX/fx434JtSQ9BvNRP9N4tKiBDYFYNasdWK1wNzWaZDCAiH+4duPyG2564
         uzThh0CrZnhH9TSujlZaw8qPWvQMN2UzY2dOlvlvflmNeD+c9i0judB1O5HZTEkjXooc
         Jpy/fg2lO1vwWMEhsyCwmLIDc+iJKtbm7ZKKLIAu2rPBEJxIWnDmD+6+RbZmd8eIWnwq
         XG/4Avi93gqH+qZ6TISFHccmsKUo0Xw+yQ7Ds9LGkNvD05q9uUYr9OwhVscgcYsg14MI
         gqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174534; x=1790779334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=;
        b=zVPBQrOwQDWwJvL3UA2xRZCwj9Q9bjpdB309WSpr/+NH9ntuGIJ/41RfhAfQoFQxat
         q5cESVUH2M+FHzr1bOf1QWoWEbE+/WgJjc8z/GF05rnkU94rcZT+V6UCA+iORnzskb3T
         8eOeWHXS1CXnnKA7Ivr95p05ha+wP5oIF/M/wsQMw75pZM1+xXg9C0mHHaGXnjXwLvtR
         JIlNHvsjXe/p/CemG7EdjlKDyIgfQ7CbiFCDBy7dMiKzhI0/Epv6bFrE4zMkFF02kPHc
         bo8Lutjzx2qj23rRvdBpFJAf3O4QnNMJQ7V+Jzdv/i/gwRNJwsJA/GcozcmzD1Okg/L1
         xD6g==
X-Forwarded-Encrypted: i=1; AKwUvBxtHygnm1k/kIurnq8/TRyFIER57vwkNPOQW9SMatvVGwC5Kgabem27t00ZZyFWNwSECStJrSimsRI4@vger.kernel.org
X-Gm-Message-State: AFuF++nUazOYGeEqCZc3ZRI3MCepdlEweu8AiS2zkPFJVVfpi/q6pZGe
	BuKwT0eBDaxqVWDw6VIyKwruRliENZA784RUE9HtIxMO0EksSs/MI3DQw490F2yDF6lI3uMauam
	EAscDGjr2k0Qczjwne8/D5gVgJkTS8qnE/91nSjMFesGOX4QbPLVnuToYHEfsGQdK
X-Gm-Gg: AYBFou2Dm8sQr0DI1ozqtI1mwrKeBnKBli8PL0AwilytNYrDTuOJ7pENOVQA5MpNzUA
	JbTpQmp1Ruwlr3R0FAgWDjg9HsRUfvWkmRBGt5T/NYiKBkRL8TM0o484voBJskomWH3KW//yro4
	m0aJc77FtHPFHNV7HbZIkPHb9RLtnSO7Ik8jhxULVXD++QMo8ZxSKyH3hfZZz4//RVwOc7KbCNC
	RaX+STve7l1FWXTNuBv+t9ZDv9d18/q6IF36Kt6+mbx/p8gTaqgENuuj8H5ebUNIq5Uh62X8d03
	V/Q5ii/wLxuT7k6I0I4gaH7gyysQHjDtbDv35wViEzhAT5MIzJtfIGx+oFdHyIv5FJr6zyYtx3g
	Z6pVZkeKk8kX3qrc1+XTZYo61+6o=
X-Received: by 2002:a05:6102:162a:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7ac1b81cb78mr2670598137.9.1790174533704;
        Wed, 23 Sep 2026 07:42:13 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7ac1b81cb78mr2670574137.9.1790174533193;
        Wed, 23 Sep 2026 07:42:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde134739sm76935275e9.0.2026.09.23.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:42:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jerome Neanne <jneanne@baylibre.com>,
        Jonathan Cormier <jcormier@criticallink.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shree Ramamoorthy <s-ramamoorthy@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: tps65219: Fix TPS6521x GPIO handling
Date: Wed, 23 Sep 2026 16:42:09 +0200
Message-ID: <179017452737.62498.16565807565260585932.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919171100.90430-1-kmehltretter@gmail.com>
References: <20260919171100.90430-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfXxUV9ZwllqrTe
 fILEV8D7BcBDyG5Ulq78PgYv64dXxMWxakduBr0ZVeCl1NUR1TVMjmpuBLFIQ0qN7YoEEquvvSD
 44m3MHLpqsEkN33n1Tg7paYuNx6+hJ591BnijjIh1rA2mNeGm5llIVrSXxvfTS8UDgN9SH0q174
 DC+3ucLKSntVR+tQ45zZVHkFISBCvz0lpoUX364LBw4dVCvRf/awBXenON27i0eoJHJrM0+YL2r
 C6YM5NKqoMPyTaIx+hTCvRy/9KxP0dQM3wzh5Bfjaa4EdO3aHekkKuDCDmlGuhCWIM7NMORPKB+
 KRXcJ+9aOuMpBnaiBQQv3Ht+muDfOkXRr0bdERVtWBcbKlSeOvmBlfYJ0w/Vft/lxY0Yd27aPx7
 EB5JT0kTI2PqoJ5xIIKjV5mysQ1qPyvcGzOZl0FGbi9NT1RFqG/O49bz5BB/Q56yK+BSXG3hOSL
 bTXZAthjklfDnzeZq8g==
X-Proofpoint-GUID: njL6dUyPY88WMVI2jvmBQgelYp00LV0a
X-Proofpoint-ORIG-GUID: njL6dUyPY88WMVI2jvmBQgelYp00LV0a
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3e546 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZxkUJIZQlAJGTDoIxtwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX3gJ8ZBoXOov9
 6BGrpkyI/TQDgXqj5SfJEXEY0YSiFXKzYHmNNrOLEsqt/ocSezbIneEaUPSt8xXSsSruXGFl9u6
 jb2ij67k1aNLNZSoHmy84st3CyYj3yM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058


On Sat, 19 Sep 2026 19:10:57 +0200, Karl Mehltretter wrote:
> I found patch 1 while looking through the tree for code that mixes up
> bit numbers and bit masks. Patches 2 and 3 turned up while checking the
> nearby TPS65214 code.
> 
> Patch 1 fixes TPS65219 input reads. Patches 2 and 3 fix TPS65214
> direction handling.
> 
> [...]

Applied, thanks!

[1/3] gpio: tps65219: Fix GPIO input value reads
      https://git.kernel.org/brgl/c/4cbe530c0233c7413aaaeb029a4f32dd6aadacbb
[2/3] gpio: tps65219: Use the variant-specific direction callback
      https://git.kernel.org/brgl/c/93cf8cedeaaa05714f709b539cfb976e0b80c830
[3/3] gpio: tps65219: Fix TPS65214 GPIO direction programming
      https://git.kernel.org/brgl/c/270437f3fe62516f16482742a7762a075e7a9457

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
