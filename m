Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499573;
	b=OABY6hisBR1YOJdfB6MTw9c0MoUTdyUXJfwO0X/2T9AYSKaaK4RtL9fVMouS7Qv200Vn
	 3pMQNMl9p0XeHZIJ3U/btSLJe4rAoukzmraUcvi1eiGj/EwrOXdrgyQTUc1sFNxrbOg15
	 bLal7+FklF4FGSvwf36g42P+vGPNLS51j9fWbh138CRRUyviEWFKYxTJxkzIsx/wJgbtX
	 CCSQJma2u23WFbCtamRfCuBKQqkiskJWG6WxJBStBKdsnNk3/tLWz0uOhGDOTP2y1WxUy
	 NmL2BuC5k07CzV/YRBiUebIW5VaunVywSYEz+PWSPs2Dn6l6Wv3fgp0Zz+cdDrkZO1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499573;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
	b=W1VCIQXPfTJ4PoNAXDSLIJh0ElP7RkDTHwDFdTBbh/OsLnjpTVpa9g6Q8J5zxdwFy9wj
	 vIBn9/mJATIMxvSfVD0guk/M54vGQMmRGSlP9vGssMZx7xV3rIjFy6BrhUSctJ7WXvllf
	 7MORtSEEnmAhGJ3ELZzO/eaXDz+kEU7cb/cv2djTRg61v15fuzG+MMOF1sGREUleQQ4VF
	 AOSe3D24ygM66vEVDoRa17fBB6u1fhAMeV92DmHS7ZWu/KCVBZ4v6XLXSOc5yiD4Lzt7p
	 clkZuwCE9qqeITA7Q9C/xIyLOHaGawaZDARFfWXbGtMXW167RO2B7YJdaR0ekQ5beng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvQyDKY9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKdwDSGR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20950606A32D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20950606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvQyDKY9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gKdwDSGR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KBNhpV2067027
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=; b=YvQyDKY9Wanl+MIn
	LmZuOeWE+r8HggU1EpMuNGxUZLchlJj7wEjsVulMoGA4LTFDrMe1AStVBSvwmSZb
	opCPIRWwkWGpt85Fqj8i5+JvZ1WspqBv44MDKr7IIQHabUqKiJyApZHY7VrZgLUU
	bpXJEul8WOrd0lMC+lo5/xIKp7PUg6tV9abJkNVfkbfT7Oh621czMa6xUy93f3P6
	K8SfKqWi+bQr3G+2DulJQ5+bAeEQfZDEOwteLYbH393suja5tO2uUoZWTiH4adjg
	FOK42F6SRNgPVaKpEk+H6wA3bO/9Zo2wt1WbB2+vUytSgoLhxFg2gbFDP7Gsf5v4
	W9QRIQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjfcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 12:32:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e92aad34aso644467485a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499566; x=1793104366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
        b=gKdwDSGRVNJ+WUxJxs6Rp0z5LEGqmYK2LRR0jJuNmu8Vq8563GuEJY6hVN9LdqBr2H
         bDWgQ0XDs9yMUbLhyArh8sPYCRjGf+ZIyMhIOKkCSGGaXtCn5EbV8WC9hlIiiQ60RjPy
         /sZetKfsSEK4PNqdXkF6tFnDQZgKWn5rIExfkmynN7C9veorTxzJxNGhFSdG5lOdV79L
         8hOZBkFhn+8EqkGitc8UloOdx6Q7j25dXwKw/F3iD7H8aGLGB2SlmtUAjBPvj1lzatlG
         V8Nn/8TjI2VENnNxXSfI9fW97hWb97TZ06NIlyt7geB3R4f4gNsYqmWW8rDO7AQ+c8EP
         pATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499566; x=1793104366;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wSq35KvYyqFQXaSYjFsHwlhahs93/LbgbJ9UIRJdX64=;
        b=0eBVQF5Yn460hxwhEOlw5VnrbfhIhBc6s/hD+sCcY1OwaBl8MD6zd/kp5d3WKDzCri
         rRtnwho2RuRt9huhJE/hNcJwiVoVS1SqInDPLM9PuEJqtYSDU/apTgJeDEUaVNBHC3Os
         rtwTTXrJp1UqMARR74XYHf4V41oZcqjc1x5cFvUU2tICmhxOUiQ8pc9rtI6BpObUbx//
         y7Mn0tkwKV1kf+IrYK68p4WBddr0wRdXf5ahy98BWwZp2Sjk6AgljhGnUUkBulWVODIG
         wsaND77GAc6gmDKzvE2vBgAddPkphhHL/lW13mkSYlkR5cAzrfHOgMEiodpURoLHKmPI
         5Fsw==
X-Forwarded-Encrypted: i=1; AKwUvBx4PJNDXldCD2ANKApQ6ux/qwhXzJq1tNaCwjwuaXk52IzNyj8yuDVjOsK34ysoP6BTy4FPb5S3i85O@vger.kernel.org
X-Gm-Message-State: AFq9FYICSReWdA0J7AHlEjsiW007XLuosO8mBn/jhKAIbpK8W48u7c/f
	HdKO3vV2EMTU5zv2zVFSJTbVF9APMi9YXpksAhNHYjrAl7CwJ/1ST5kU/40AAcR1eh01QI+BzU7
	2F/vTpmtNxm7ALByY3nccRGGXtfTZcwU6S+dayp74+DE6l4KYNKycwqm9msNliwnR
X-Gm-Gg: AYBFou1ysS5UeYon2ZJVEofx/sKQzKUnXH8ArW9TlLWF8aBk2/ctk3Tn+sEW0l6AILk
	JJwY82aCGmxVNCLZfKqB4m0iC4rOzcPhBEM9H7PfZD0IOOe+yrHGx1hhyuJa9nmXRZVXMbgBit+
	fQOG3wBt+9WnPF+f3Q6t1J6ChXu8FO5gq3o/xRNZe/AzwV1x2LAAugolAkZixrTTdVQ2QdJXPQi
	yPJqaiaiGfbPGtbI1BbYkX5Vb2cgp5hIaQtlEGRa5gtOEn6/OhI1cEddhVwW6T0uvQkXJ7+G4Fw
	Xmjfj7JWhaTR9sY37e7ixIn7vtOLTgGvoeeF4Uhgm8ikLOdmnQk4v+cjuJsNtdxFm0F2M/Mugjs
	8PNaahGkW2UOYKHqLirtoPi+6dY8=
X-Received: by 2002:a05:620a:171e:b0:93f:5ac:14a0 with SMTP id af79cd13be357-93f29de3496mr1821373385a.67.1792499566491;
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
X-Received: by 2002:a05:620a:171e:b0:93f:5ac:14a0 with SMTP id af79cd13be357-93f29de3496mr1821369585a.67.1792499566034;
        Tue, 20 Oct 2026 05:32:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d838dd6sm5866725f8f.58.2026.10.20.05.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Werner Gartner <Werner.Gartner@congatec.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: cgbc: Add init_valid_mask() operation
Date: Tue, 20 Oct 2026 14:32:41 +0200
Message-ID: <179249955802.22604.14302944831924075277.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
References: <20261016-cgbc-gpio-valid-mask-v1-1-938202276e26@bootlin.com>
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad75f74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZuLFqlo1Mdk4vJeqesEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 2Nj_EhiS4o9PpPZMEq39_xYBoZS45C7V
X-Proofpoint-GUID: 2Nj_EhiS4o9PpPZMEq39_xYBoZS45C7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfXyh51KgoVM0e2
 0bJjAOP+yLu6sW+t6NCQ8JV592W0IL3Vj3hWeU7mESQK2gbX/dWaYzABhwhmZjQ+jD4R2vEGwmu
 /QBLcaSpn+WqGuGvfgaKnzPl8GG9YTnX72dX6qwTkMKSs1TrQ5iuvUTv/8DqBMX+sryN4zt05RU
 WAtFaAObkex0Iync1i9B1rh/OmwxpcJzAojuHgA54u4OARneXdRYHz4rVptTxxWxpx4MPQBjsIX
 8MSteQWP6RHmy1W3fogvQXsB7uIiSRbC0qFe/kvX3V66nqgeD2b8XbHu5A9X5dDonSG11muBrEC
 Tmc/7Yu7aO7lpOXl/nQ9w5ZH5FoIiYrUhe2p38m2Pm5O1ovPqU5xP6daA6SjuvotyXM3FXundMQ
 76np9ah3B8h6Wpgo64RGTpxy+x3gB70c023wUNAmvoxBlXPSv+EGYP3ZLFlz+djmAOJUtXLEAx0
 FCVXU8dM6zcr6rLciVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OSBTYWx0ZWRfX9klZa+HH2azz
 bZauQ9FxcqC75g05WeUsuso9vpcyFGnoIJmFBRlSgh8CrifsgVCDf6ohtAkzgpWPV2oDeUU7SCb
 k/Yt8IsbuK4yQUkiDDS07UvkU82/ojY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200049


On Fri, 16 Oct 2026 19:13:03 +0200, Thomas Richard (congatec GmbH) wrote:
> Some pins can be reconfigured from the BIOS as alternate functions,
> which makes the corresponding GPIO lines unusable. Add the
> init_valid_mask() operation to mark as valid only the GPIOs which are
> usable.
> 
> 

Applied, thanks!

[1/1] gpio: cgbc: Add init_valid_mask() operation
      https://git.kernel.org/brgl/c/15516ba3286daea3debeffeb8e04f250fdf7e703

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
