Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302344;
	b=GaIZ1aBXQENV/yDbZ8z9yglNfpyc+44wvs8a7f1a2vE+Nv6YuNHCRyrsKkatgwc8R9f+
	 hWMPgLVC4LF2bhzeiMFEZ6EkQa9xNqsRxXCYU8jIvSf2G4+tWXhqZxfjeu6aFCxM/mcWn
	 /t8CrGa9wFKgGQjv5bYQnumyOFhOA4JzCjtaZQRIfCT3PPeDBR1/45zuOD8yK2ZvgGZMJ
	 shMU8Y8DruRvBV5bQUPmWxzttgZx6OjBVqWwK4Kr0HRfWiQLKQj52JVJB+9fRch71hGf+
	 8y+lnOQmuwjfRYp8e2pHIHtWjDRrx6xJjdsgjuP7qFzOKd5zMuIdbybDio/xIBg7IZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302344;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
	b=BW7gx8BnGTJzzM186w4zfUVsJjYhX9vMBx/Bb7aNr1nTGGcSmJxFMse9hxofShi65Yeu
	 5q0eXb5iE9nYjpsNp/evAAIOt/LHyPzbK0QURFhoNhPYHkqKDkXh7DD2OzNras1zpZ1Es
	 orOJ0b3PN6stDH0ZhurDEePNDyaT7F21XvdvxYtLT6TvPmn2satJiOcL4wE5fKMbVHvQy
	 +NxuL0RU8L4BzQ/1wwsRv4i0Z+3mRUsx9hFyQkkbWCIfqoNrwvd/0cMYqUCUtofsPV4oF
	 cT1RB7+IIf+mbP/gHHu8ym+WnAhBALYuI4CdSAeAjmVVNlIlAAZcSEEZFexvYUVJhhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGdQVQDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SDqUyk+n;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF4B6076136
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DF4B6076136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lGdQVQDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SDqUyk+n
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W4f22833660
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:19:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=; b=lGdQVQDw79Sh9JG1
	8t+u/9SE1w9T/GDpMW3jqAX6AqQHlngxI3rIix8AENJ8NV/bocMLECKXVkTVsXt9
	HXa3CMR2BcGNT28XH5HhLRl7rEFy4Wfp0YtPiJ9iGgHNXn+RbzCenwWA3csg7/DB
	s7P9Ezc/8AlMmofHYtop9siWG4WM391uMEda3DhZkWDi7VF7n0Oz4uhqywfU9dT+
	gcclxyMxa8U9lUH2HWAq7laq5FWoWKrnVMsoeYaTUYSo7MsejR3gKSUtFXjruPre
	Wdg2TLtNGyxodwHNkfWr927hc9gwlUTpjvxpoBzVFQ19Yhod1d9pjMABT9tXXXXI
	sdAt8w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr6b2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:19:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f3969a2a7so301451685a.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302343; x=1794907143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
        b=SDqUyk+necOVYJzybnwYI2ofeiM8nlUZsEglufLnX8VNlNX/pBzqhXLfdgmhm80CF8
         pTa5DAU4ve0MNlFg1WEIoklPInTf1mQSXwoEOhPpbLqJwRNDdSIzVBE1ZNzYU1yakv6F
         1/LhZgwCURRXOt7wlM2NGegaKQHICQ2glEv2p2pZR+HRhOaDlF+46d9P1InUcye1btsM
         YzNIp7gCjEeUA0J9z3fLlIDXv7UQ4+5K6FipPkVrLBZyJ/FFwG15XdKIbeB9pJ72LnC5
         aCtbDNLmA1ntqfh941rHIOnN+aj3kxKFro0djmhuYesTgStQvElA0BwPUJMmQMejn/iA
         geXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302343; x=1794907143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RrfbhJhpWyjn5vAaoJoaKtZ+zVmxKxTyBXnZ3krPL+Q=;
        b=1nn+97GTD16MgRJeRnkkuVX5aT4MnO5NAPNr2d246j+2GjioJ+oTwBj2yMRuh3ILR2
         2mrreOMlvDeAEez9j+YrH3h4+bWAM6RCX9tmkeKqHwSwa7Dg1IkUy8eG1xjKWU+FSQvy
         m5Okw7tN1nP2R0e7k3DE6ftXbfX6nclk6akf3WH0OmDPkU+XWzGxt/fLq1jYvOMHgb0S
         Pb5e0ICBX5nfPbWZmNUJ3WqjkOzDrCyB6UemOpGq2TwL+ReELtDxXgTvE7YoASFWnAft
         OhZkT3+zhg+Fbv/Ch8QAbDXgrJs/QJXW7TCyPczjNsOlp3mnE2cdJNkJ3trc23dt98wF
         8YpA==
X-Gm-Message-State: APuU4Z9Kpn7SpC07LpeS8ARDpBJuaSEzOMYmpwsmwz7/jHU+cKmfKSa1
	VbEHHmqfWINVM6TwZRQgtxQQ+/Q3CUFVWGwGE/3CfGjiVxrEO8GSxWB0T3UIGI5BGaTgbu1wvj7
	ZkcC5XwpARbzc7eAag2y+CvNXLk9+BUruz/C37JsrCCN2sH8Gxfk4Imo3uBiebgnj
X-Gm-Gg: AYBFou3qUiQ/tOb0o4/D0I1UQBDo42i92AQnIPDnfaChhPGbFIitCy25AFvyVIpZs79
	ycl/VyLoRq05B7iyq0qxCoJ1kfLuRxO2E7b3B22ss+buKCgpFJhZUHh+WqeFDtM7G14Zdr+O+VM
	u6ZRKd7o0CDap4l4IAJNB54n3637/BzKpkHnSEjuGcRoz8hI7BKSNnMjVLILEYzr8K+mkUtv7dt
	mijhVf3TG1H4hSo7SvcgGEVaIiCck+OxwND0ZyKEBIAtC2K35mn+F274YSyMTn6aXm+4YKlbgaV
	q+BQLxBQWcQxj05tPZkWWRSPPueq0TyjQFRn7fwJDqDhgjqlXmjDQ8We56kzhwWe0Zft3zVc5xf
	kItmFGMKaH38y3fIF9mRIq/mHB3ju4qMRjuP8rSJNv+2+KvnIDGk8D1oun5qcMxtmKEZEncIABD
	aYj7J/bb2mmX05WwXDxx0+1Go22YHj1VxHGJuEQup6/NO9ejC69sLOy5nEIPUy3A==
X-Received: by 2002:a05:620a:319e:b0:93f:633b:ee1f with SMTP id af79cd13be357-9479f2b50c8mr335994785a.28.1794302342567;
        Tue, 10 Nov 2026 01:19:02 -0800 (PST)
X-Received: by 2002:a05:620a:319e:b0:93f:633b:ee1f with SMTP id af79cd13be357-9479f2b50c8mr335993185a.28.1794302342156;
        Tue, 10 Nov 2026 01:19:02 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm60276505e9.2.2026.11.10.01.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:19:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: synchronize updates of descriptor labels
Date: Tue, 10 Nov 2026 10:18:59 +0100
Message-ID: <179430233645.6529.8490191928778846102.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
References: <20261105-gpiolib-set-desc-label-corruption-v1-1-fa84726ceac0@oss.qualcomm.com>
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
X-Proofpoint-GUID: QCRCHLX-9O-cQHXuXbAFx2hTsVSgqUFX
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e187 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w_KnAPlzl-2QHVUEQtYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: QCRCHLX-9O-cQHXuXbAFx2hTsVSgqUFX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX1s2tiOd8KUd4
 kutZVi7vyNgjiWXpiiAcBicwzkOgKVoztLLrs2e5g/GVlzsdyVgEP1goWcpx9c0vh5mu7EuwS9i
 YrxOYy9CDSrM7J71eBdeUlzepFwszSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNiBTYWx0ZWRfX4J626QkhC+tE
 4FSTDtPY6SPLnfN4HBQf0G/IY6kgQq//CPRcE4woQsM4QM/6SyBazYs2q6p80fcyqjj/OOU9APb
 frQSWezco3WfBgBE5SAZjo3h2TcFB1h4Z/gaqFV6fXZG4g8gS2dZ+wyTZ+Cv6FE4dm5UiLVtHX4
 YVGD+SlOBnm7KOGLibvoZtIODGClwWI9CilxwLMq32fVcCQRhGAtpZUbSnco5+EC14cVvhKT5Wd
 xsxqR45feDvVmAZKSkDbd26TUwZ75S73cmAgWq+BpEmrTEKtiGf0TFGpVlkCIVsRQqCqo6luHIM
 b0vGc2EyCNEgbANg2gFjqA7vV3RBz351PZiE2EMUOr1eitEl5MtD5OQOHArxowz9O0+SePqHt9M
 ZEPse70FV1sTylUV/9ud3wSJgYqUkRxWU7KPWHsUpvmKLL2QE747iywHB9nsawLRx6WZHTCopuP
 S/c/mc1GCvp4XMiJQow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100036


On Thu, 05 Nov 2026 14:23:45 +0100, Bartosz Golaszewski wrote:
> desc_set_label() swaps desc->label with rcu_replace_pointer() but
> without any synchronization of concurrent updates. The swap is a plain
> read + write: two threads can observe the same old label and then call
> call_scru() on the same SRCU head corrupting the state of the chain.
> 
> Add a spinlock to struct gpio_device - we're using a single spinlock for
> all descriptors as using a per-descriptor lock would unnecessarily bloat
> the size of the desc array with very little chance and no consequences of
> contention - and use it to serialize the pointer update.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: synchronize updates of descriptor labels
      https://git.kernel.org/brgl/c/82028344caeed2ea3536708906adee02e472633d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
