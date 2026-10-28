Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180142;
	b=nvHCrjz6HQuKFSWsQWbVc5dNvLO8OKsQJN9P94ROsENp2ch0j94xO/8J5OM9TgaqIzIr
	 LFZG55X/eOhsd9651kTDJk4oTXwGCQr+F3EAhh5bYXataDDJFO035OrSaj3ekmAWzrtwI
	 9+MY9wITZ1sQM510F1EdiwwgpsUIWvRl8nYjRrHTYP7lKk1/CT/6qXmFd74cwlzN0vElD
	 dIHW8NxUGFCPsX3zK7330MXbVS2Q14GoihUcJmfbC+/EN63ECK0NRe6kMfRiKEYgYfmMB
	 hPj7OoCuF0zlFgGEol1+rm7AhDHOjc1rwSfBhlvkfSJcCfsH448SO+nn/MSK5DcnkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180142;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
	b=vzpAwsahR//2kE+vHqKy0X3OU0sP3heg3P9LS1rsBoFiN5bDdvcZxZRkp9VeCyX1iYyz
	 hdapyUAGXgK1bHVV/Q06ETDUHuUZKCK0MdWhS84jZr9QWipC18iDeZLx1aFOD/KDsW8iD
	 lz49NAwPXjpBM/ajqPMO0bcCf0aT8cgmq9xJKXp+WQLebLQCO6NcCW0shitVya2IAwhNb
	 7oUGnDtkGzpZdMCfgYSMguad1lMK59y8aXtbO9eIH5QuUQmHiEyN7amotDdmRXKiK7D91
	 0tQTsZ4u+8fc+sCDA7jvK6SJTwGqoqNiUkhlI7TPEkCNrR9MtPtmLvgc1WxhF+n3zTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldPlcGE0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJaC9kV5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC981606A31C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC981606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ldPlcGE0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cJaC9kV5
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3Sl557133
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=; b=ldPlcGE0hlHPeHPP
	QJsuYuWJOSr1QAAkv9stM42AGaYcrar0p3Wj8m8+Vj+MunnwUcro37aZ/XgXQcq7
	lGk8u0R3ntPAuRuPr1asbLLMGf8OFvizMn7uilvZWWGHR0BEK82XQODY14/tM+km
	bSuX2pTt3ki9I6ubtu06bghbBUxPQr26tgVt0bzXHlbCd2hCFxikGiMw91ZWMns7
	7DJGZB0CW8tmbvqjvFfm3GM8VWkJha07wu30iEqSx1F0K5+HUnfMGXy3oJqhOaeJ
	e9t6ZaC+9HjalTiNd9xTOGsUa61WxjZ9rmCRxz5Lu/GgvDT4Ea5SE6GA265As6FA
	L0XZNQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82tsdvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:35:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb71b1443so146142785a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180140; x=1793784940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=cJaC9kV55QEKY6PR6dYpYmWriW3VmcASsEsDUP+1uDHmUt+jf9r99Lp2ItoNOAvyDI
         gRn2LOdI7nNrG0gC3kuZRxKmfdxSEMJfRh/Ycc4tihw5SLBICuLb+gwJNa9SdAuUvlM1
         4VaK7XZpsEB9brGzyapIMCSQO0Y6Ct4sH+lWXnkjoH/YskK4LBQCWQsUu0HIrGb3mjHu
         KaGbNUe9bTllLA9zx9NyF7lGqPgWZ01m/j6Y6W5MvIoWSv7Jm9Knc5xxWcEvKcXfOnM/
         lqvDi6J/rtfn2ImyNcbgiMUxHe5XHFhAQLRY6eCgP9BVlgcfQmvPOoNth89GNUdMt/hK
         68yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180140; x=1793784940;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O7UFyGc7kgg/xP65U47Z0ECqHDvtGybh3bypLow4PPw=;
        b=o4eRE7h1X1f+YjeKBUJNHxI30hBEzeUiKbzmWo/9vFF4Vl2Ug5TU1VyHx0oi9xH54+
         qEha5IdubETYfYcltb129hgAb/AI9GmKIsssQiPX1gPVaXtSUi7MNf8nlG0jScZ5I0LL
         7+dpBOyTaR2gbS0LuWn8HuzRGB5AjphEDLZRIi2IJwdVby7lfEQa7xLFEZjlYtjMrWnZ
         sDJE3JlvRbVvtscKqFH3Ahc2iS8fvTpkw3nk0J7hnQFNVXaCEjODM9g2S/66dMPZJQSI
         45kjaBIXmeQuTx8cQK+yFD82u+FuRVr25DYQoacioRZ5yNI0AjfHYewENAhPqk8LXwbw
         CUoQ==
X-Forwarded-Encrypted: i=1; AKwUvByzD7IHZOfhI5wkXmW1lzVjPV6QlOK5/THh+hxIGaFegT4mmyCBQQnYA979KpLXGvjS8oZ/2S7Aaxef@vger.kernel.org
X-Gm-Message-State: AFq9FYItebg6YuAjwfY3rVvOc3hFy/5ysdpdeSldfxhL16biMcNYLmKr
	18BFNFc8IZOhixLAW9yR2YuVJObKzPb3fSUBK+ipqi+j7P2259Yos2wacRMgQcwpVN3VbtzCTXR
	Onyorvn7M5aqBFiaBXVJ0qXg8qgDzouxHqwzhL//JhGoKpBvjW69WeZ9yGfwY6PyO
X-Gm-Gg: AYBFou1H+3bMHvpDSgzbPWqmNYnCfRe0pc8KBGJ+Il+xri29iHztFGIXbbyZBTEZzUz
	vkDFmVfBW3hn4LJfBgKdW+cq5CLumsXU7Zr7HxIrb2v46ozxi3j1n4fPizO1WAHm+rkHhspkTRI
	zwon9WhVBWoAByd7l6BsekQnKi9p6Dl3MnqPFeHOTjhQ9ZsDBI0hw9/pJkWzFyx6RfTciti0Oqt
	QAFiRMPyWI2v8zBpCuwYp2r8/FLAVkJWroOqxAAKZi60qOJjdKfAJ1/gs1wEHF3HFi8ZIKvZAVI
	lCnLFs5pb4tQyIPSh/FLpFGS7LSG6/1bRwgQVCGUF82EjNWZ4u2DMXXmktIfj8TgTMFN6VuBuaU
	BeWKLCilIHjOlHh7EMiKA78Hm8F7AWDxMqBUm03rHLy6q1MG8zGLc0d9vwHvUqQzm5E5A+kf3PT
	Pm
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192968585a.39.1793180140016;
        Wed, 28 Oct 2026 02:35:40 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93e:f4f4:346 with SMTP id af79cd13be357-94408a96a06mr192964485a.39.1793180139398;
        Wed, 28 Oct 2026 02:35:39 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm25490073f8f.58.2026.10.28.02.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:35:38 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Gregory Fong <gregory.0xf0@gmail.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Guangshuo Li <lgs201920130244@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: brcmstb: fix UAF after IRQ domain setup failure
Date: Wed, 28 Oct 2026 10:35:36 +0100
Message-ID: <179318013455.11588.11130360473129768323.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026115227.41779-1-lgs201920130244@gmail.com>
References: <20261026115227.41779-1-lgs201920130244@gmail.com>
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
X-Proofpoint-GUID: Of1ExtE2dc-nUgp2AExQulyzh6T6qrda
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX8BUY00XMaIkq
 Y6YUi+jcQ7W5AoTe2U/4zZn12ILdVILzsH0IASkZnHUArorWP5k+zTIByezYw82goa+lsaUVbSH
 hxAtfWlHazF8sffdjTl33hWTW7yn50E=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae1c1ec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDcPP8y_D6MSDcTJfBEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Of1ExtE2dc-nUgp2AExQulyzh6T6qrda
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXx8KPeSm9ey+c
 2kyCcWgN31ocyhdczya88G5z1xoQIWYIdLweEd0KMjwYDmNf2FKijAyEDiWnnX4xyxVENygcjZN
 0tBk/+6z7Z1NM0dvPEMQfpBCsUU8OHzP2wIXZRYP0bvlt+lkYMOU4+bu91TSdD+Vq8QWpl1uEi3
 rf3wKeb9kKd1Qz5SKB8bQoy6LFxderSRzPqFAHsQZ6aLumnZEP7WG+7gBG3yOEaviAUyEc29//2
 UkRTBfFF3lEmO3Tsstq6F2fUhQIOmtR7Q43hP22Iat8jFFJnDnDIK0MMG0WJz+xhu3Tru9ejJsh
 4Zk4sdwHrnGPUBKnlXBqZ3aDHioJCimRcsyD6kBCA297voF95oPa65u41qh4pGu3mvyte77Ypnp
 JcJQNnqyBwSK12Qr1h0t6bdtGMK5nfq1fvN7y2py4mIYqvV6qibKL0DGcnEEzQd/s1gstw8KC3W
 BunRDGudMnAlvtPXH1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Mon, 26 Oct 2026 19:52:26 +0800, Guangshuo Li wrote:
> When devm_request_irq() fails in brcmstb_gpio_irq_setup(), the error
> path removes the IRQ domain but leaves priv->irq_domain non-NULL.
> 
> The probe error path subsequently calls brcmstb_gpio_remove(), which
> checks priv->irq_domain and attempts to access the already-freed
> domain through irq_find_mapping(). It also attempts to remove the
> domain again, resulting in a use-after-free and potentially further
> memory corruption.
> 
> [...]

Applied, thanks!

[1/1] gpio: brcmstb: fix UAF after IRQ domain setup failure
      https://git.kernel.org/brgl/c/baa14758afb3e2828de1f76511edc1de50216f39

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
