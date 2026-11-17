Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904243;
	b=fG2Bg/6LbB3mn36Uo6j9zfvjZInsYh9WpwMWEf1K1eSTvKRHhG5FAM46+X+J1D824J4W
	 oPDceWNYR2VaZ51b/wFeG9i1Z0S/jH2rAXnPEYtdD0wqn047IijGnt/4gYCc7kOTYqQzy
	 Se46e45h+eFXOlf9jhbOnKHftV07uGWbSPmYOmP/2SHahg//dr3E0pnWhds0FHrVvaRSO
	 ihWUL/9xwOxld9UFg1EAdGDUsnbXgGeufvscWsEwv9BWczOtzsCX40AfFM1a2FU0v7rgN
	 1KXgze566zIgvxaaTZK05ateYURTL5Jm4LQCMrSqHWUfjt3GX4qm6l89hsWRXT0JCug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
	b=0aF1EJ+Aze/TLM4emMbSGjaOrxn3jiuSxs0wQ0XfHXcE/oOPy+CmXVMXjMJtYkV1Rb8V
	 ffcMdwvgWADe9uAzTfSlFbdpw0o3qFDOStQVM0Wu5iap6HFNc2339XH+vjf1NmXcvdrUr
	 QjAAZn1+SNOw1o4ek8XxpN4qwVZM26CKybgYIW1YepUCnMOb2UcCvaD+dtCoHXWVhE6/2
	 /q1lDSt0T4Cf+/RY3uCvQdcuueKQoxEaXFOliKYRu14IUgxFU8qyWU4HkjwgqUQieq0FX
	 WGxIyiiZXn14Dm4alQ9d91JAmVSmZBxINp3LkWpiMxYXiDOizRpnHVop9vxwQKCPRIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqQZYNU+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KlMrQhfH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DDF606A88B
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6DDF606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fqQZYNU+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KlMrQhfH
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LgUI3980592
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=; b=fqQZYNU+uHYsiI4o
	vor7DxZHKVjMV4jjY+IramvoLpXUV/f83JZUPMGeqshMPuZZjdLb72CR7DNUtI97
	qBwR/W6dG3inCQh0uE5zmbee4Hf6GiGz/so0f8yB0TImdcZfBxrmyQga7fwk07Bh
	Gi0ks6mKdT71FhPNG4/JJif12NxtXVqxJLzvkjiNcAhwjSKnoH5xO6WHNgyYUwUf
	Zp5yyH7Io0nvlyokdO6we7NVeNHtvt198knfjTtsJO9qc6ZieqSv2hWn8dFsDsOO
	4uHCQHzLsD1JAEbwMVk2wptMvEgSCgJOY1RvfTh3qJ5AjnjCFroUAFZeoR03WVbU
	pPi/YQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0fbu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:30:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-920fc31420cso10784196d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794904238; x=1795509038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
        b=KlMrQhfHXPqO6zXT2hBEZcPCZZn9chd2T78TrmvQFcQfqwqbI3cZtynqO34gIgt6A7
         LeJH+vZ9zf6EujS0Y5HfZBF7WI3LRCsX/upkhIqBzUBxxk2xYaiQTY6NTeKzzkC4+yjd
         N8YSAZZuL+n7nOPclqwLPssRfcT0Cqam/x5xHNaCYQb43N4SQFK/yAsybxkNn0RejUla
         gGaMKbVT3JIzkg2F29UMxYcnCpM1eJqAWK/WMkOQolO3qPsiGtk7jSTDjxYqWLu6fmPR
         lzqPyTElZG2w7xW0SPR53ecYCTaVH7E8TmJB4zSwO/J0BUHqfjEirEm3fH8wdHs3oHZB
         NXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904238; x=1795509038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T7SrH+SEDGI5Pc/DX3J27OAmA1Ya6DTNGVrVgDEbF6A=;
        b=IHrk5nTr/aBBi/z7/FpUvbD4FPhue1ta5B+82JYBE7aFvd8SaOTw2sedGXl0GHYr8q
         t34sv5H7n6Nxs+QfR9wmkFcL8sOVMArSae/OZGM06BoRs74nAqVv6TvWhXibPE+kSkW+
         gsz6/laIdgIEURHVOx7U9bUpeqK6lwRv/5bVFJfAG2G2wyUh7xnmNKAnIcOLWD4zXhFI
         AD/TPm4ZSEBJO1nxbSZKXxQEhqL9yqU6LEBgoO8ezt6+Ywp4z95FA+2ikYTo0Zy2NOLb
         wBK7+PoIQ1SsVw8BBnMJl10u52y+SA+9p93wzW6azqgyjnLXj16uNGN4W1i9byQbfU76
         HyBw==
X-Forwarded-Encrypted: i=1; AL+hErHmFwcew/kEhWW08iBT6eRLSUbE8jl+CZ9EjcKRlAmc1RM4PEywDEF4rL7TQKjnQKbGaNegYfHydGZr@vger.kernel.org
X-Gm-Message-State: APuU4Z/aZOdek1aY6qOKKftJmbt+wyggh4DbB+VgAAjVe++CTIsgGMei
	qLXSEGxuJWvJAQ4mt3mYcF+l8NSIgMhKKLEUKKluokCo2YEArt4v8Tex0BnDd+E1th7G2KiWQFM
	dEJdzq/kPDnHo+hpH95Sk2fP/UDKB/AgdCR7OTRhBmO/n7HrRscFOREDB2DCoUgxL
X-Gm-Gg: AYBFou3GT2JVS5rfzva0nTAWYbthlXYqtJEAJEuS9dyuF6aH5sgvHcAQ5u++k3D0la1
	9HgrhjOvycJ1aPdv3ybKSnIeJD8VpYBefMI1y42IQ1Mcik8jbOK299ZaNBxUd715ONLoCHZ/TpE
	1uVJ2zBtQPwkNUcymEG0TW2d4r6kbzmVv26HEFU3umDkIquWR84QSa8gXaZ4bGMdIGL0vUBwtHu
	MGwHHWntE6QYMgahZ0qLgc7Oqs3dWxu2h0gbXicTlath28lfhN8EUNoYuYiWklP02zTmKXwrpED
	SxqDHdmLvo8opWb04484kaLlIqh+eDztNzW21qom0V4ObntAUe8jQLgU+w7e6foazSPqkHNuWk1
	F/RajVz8BA152CPIxla9oTbGU4h/aHFNDPKLl0Nlf7LNUx6abv4q2MChQKjGlwqZkfT0Y7RAb3Z
	E=
X-Received: by 2002:a05:620a:4493:b0:949:816f:cff5 with SMTP id af79cd13be357-949816fd1b1mr727764685a.4.1794904237943;
        Tue, 17 Nov 2026 00:30:37 -0800 (PST)
X-Received: by 2002:a05:620a:4493:b0:949:816f:cff5 with SMTP id af79cd13be357-949816fd1b1mr727759685a.4.1794904237455;
        Tue, 17 Nov 2026 00:30:37 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60da0a03sm21613010f8f.53.2026.11.17.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:30:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linusw@kernel.org, brgl@kernel.org, davem@davemloft.net, asmaa@nvidia.com,
        David Thompson <davthompson@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v1] gpio: mlxbf2: Disable interrupts around the chip lock in direction ops
Date: Tue, 17 Nov 2026 09:30:34 +0100
Message-ID: <179490423029.15574.4911642575575429380.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113184444.3431-1-davthompson@nvidia.com>
References: <20261113184444.3431-1-davthompson@nvidia.com>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc10ae cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q209iurod-_B6gZumggA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX58vYgGvf1NMS
 bFUTVgTEXtOaJ3qLP919PLzt+fjmg6wCP9T/ontmFBFTEwg6oigWJig4hFkglVvuUzRKY10QCvk
 cz4YeX/9UNasthRHXYCSsOIic42G15Q=
X-Proofpoint-GUID: btrabFZrbOYgcqul-cL1bnVL6lJZjpLM
X-Proofpoint-ORIG-GUID: btrabFZrbOYgcqul-cL1bnVL6lJZjpLM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX8jOXWzaocJvK
 dCee/6XxqAKKV917LY8st3Uo3cJyOD4kE84uN4lTrzuUV8Ovfw7X75hnicWFXakKo/uM+UAtt54
 cak39NdJZBHVfLnRB1+mkl1+QA4KvBlHob8UV7O0F1QC5XwhlHrN04Dcyo7XVSkypuUy+dwdDtZ
 71pb0wpkJlyVaf5qXTCmiAqEf/V4jxS0B2b9KkfTYfembkFXQPetYpadWCAtmtQzABYo2x/4iUZ
 AaXIAf9t1ibP9L2Iu/GVPQaqkj0iajNTOk46G/Oq0VwCO4U2vdejVVQFz90Kvr+KCG4vvG2p166
 nb/HHi6zICU8vsJR8997BpR7Kt7D2ZhMCPQ0IPXD1Kz4xUfKSrhBaGrCfZF4ira7LuUGjkdpNHH
 g66NrNWJmdo/FOq1Nhpo91dxGetL8A6TpZv/nzb+yshwzwc22RsvCrQldpsS+A1T4xfSoz4OmkS
 dUyy/hV1ysgTLGsCfGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033


On Fri, 13 Nov 2026 13:44:44 -0500, David Thompson wrote:
> mlxbf2_gpio_lock_acquire() takes the generic GPIO chip lock with
> gpio_generic_chip_lock(), a plain raw_spin_lock() that leaves
> interrupts enabled. The same lock is also taken with the irqsave
> variant by the IRQ callbacks (irq_set_type, irq_enable, irq_disable),
> which run with the IRQ descriptor lock held.
> 
> This creates a possible deadlock that lockdep reports as an IRQ lock
> inversion:
> 
> [...]

Applied, thanks!

[1/1] gpio: mlxbf2: Disable interrupts around the chip lock in direction ops
      https://git.kernel.org/brgl/c/f95bdff1d53471159e3c7112c5de4f6240772521

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
