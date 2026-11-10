Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302435;
	b=CmXbfogmECoPwSn0Sw+i61vk7FU3DNuzPjbsMKTV0fMQbmJj6hAdPoHYHyo5Vlx+Jihi
	 FLIGRgYruGdPEyZCra7IB23FdUxWXPZJqvYU7oUe62B/sf2j0PzuB8EVHiMccXmJ3yQxQ
	 g7fmOi+1MHnPqttiaqHvLJDJy0MdfNZ/2XDLAAPAemhPXqMRFuCvEn3HoXB5CRnNVAqNg
	 swEeM+/fbG7b5xHyFcA/46csUVXeBWmtz/gIsK/+ByBrMO06crqdYZ/hsVa9UCfiR6o7F
	 sQ19TBsMMbm5kWWuHwu7JQojOgTFudQP+LXd2TKg0GSGXEkDgCfCtNzrnqqjMzwlA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gZQw57RehtWmejjEg4uC9nGAwlmTjZh7csJ2dxc7a6o=;
	b=LS8OZQm9jgF6xxxGQq7mFaEwwNYyFr8mMqoeX+SlenN68aiCkzolSp/8yPKzor4PiJgQ
	 4Kc3NhJO5WWPz8PIg/KGfxvmCtisqYF8i+kSvJYi9vLi+GUO9VQi/ZxeJrFJFmGZIx6rz
	 zkUpvqsh8Jsoxaix/h0vLm2Y1NGda8U3uy2C47ViYesrkx7hu7GXL3N+N6Sd4G1PNmZeW
	 c6HnsBXSAv5vaj+//PJU4igzDQ50/OZp+p3lxHi3dy5gmk1S2lweMtFLxcCNk1Ronp6pz
	 1Ql3UuDsxvdGHEEdiZRzyYGrFpGRkbqYP+V17qzGc2AMx+DSfC/jXDmKLtzCHTZc/Vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WKaZIXrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XFQC/C5y";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03C607D59F
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D03C607D59F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WKaZIXrJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XFQC/C5y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7l3PC1681076
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZQw57RehtWmejjEg4uC9nGAwlmTjZh7csJ2dxc7a6o=; b=WKaZIXrJWWr+SioL
	g+HhtruzxhNcwbnvhTfd49Bs+V/aknUU6SQSPT1ZAmpwMDK0GAIM/yV081f7OP6e
	/WyJct3aQt5rOFe+gWGQ8go4RahDElA3LRl+tNXkbXa6vuWEVjYMy5o8SeucWi+d
	GdwbecxgZxIUM8CpcrEkfEXdKpFFDLLvnxZyqJDgLDw1cR1lE2e15AN7kIuQba+y
	9/D3J31G2xIl8vv7DdHY6VgM1fjFDOhtpjEtO1hsPm5RE6pLDfJRI0ONMWBS7ypw
	U7ajerg9PyrByOvwCPvzDUO2OqqYx+8kc/JY95oFBJfwI8NrCqPIMv96n4Dek6iV
	7XbKew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkjh3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:20:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2005ce21so344240485a.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302433; x=1794907233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZQw57RehtWmejjEg4uC9nGAwlmTjZh7csJ2dxc7a6o=;
        b=XFQC/C5ykZreMMovwQYN/dzO7bpOI0wif6JrucGKYajzlaaINUqx3IoWWUklZ+TrZh
         PoE0WnVhoU0M3ygRVTyW2JxsA84dAY7mXnZmamhhxLLsV8+KD926gKN3XfZ9Jm7QuCeI
         t3sYOKOTI+DhTS+2FmeNfv07s3GKu17cDjuF9nknfcpX5c3tvl8vqlCFitmLUm/gMAl8
         nJg1wCgcAOQ/wZIa1rZ685b9Q9ZUgAzsoxVt39wZ84jbDr/ZXX4cuFiJuS/B4UpkzhY8
         RNrACpMbSZrC+ORUUpOJ6jBUZ03jejQdIzHTAuIHhhG9p2SWkiiqY0XV8lLwxDyGnItb
         oVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302433; x=1794907233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZQw57RehtWmejjEg4uC9nGAwlmTjZh7csJ2dxc7a6o=;
        b=a7U1c78C/M1o9Gb9/Rc9ygSWJtl8MWvtLbaTXxBUmJuoHXyWmRlQyMifBGs1Q9Ad4D
         cgusXJgFgAw6ckXBTU7lrgg77kw9j4xl5bjCdeQfWbgv3rK2krcQ+X2yQbwwWlNiPNPh
         YiUFj+6addX4dtEK++v/DuzgSHLaMNQalYBSBcG5JRmzWbTPRvXPMIfKGbyCFxwopPqI
         jla8A/uUOPB5k7Dzpjoc1w4Zukamzx+GlYDpfdP7pDoPsMC9kOsG6q2xzV1zY/f9aqRq
         rwPJQPzRRph61AicDbRTPrmwEPlOVlb2/pURnr4BTrWSjAiWQqZHnTSHPWSdqsZQG+mn
         tYdw==
X-Gm-Message-State: APuU4Z+QOKuiahhlCh6MeXcvyZj8d1EjeFHNEHD84TTIgqWmqaMjZSbF
	Q7yKuh5+k9jYIYPTf+NQfKrY5hs3s078Vb7Df6ipUCuMPAfC83xe/RNobqcSusILfAVH2IOQR1Z
	18UG8hLVSBtXUO/hjKVNy3Lzqc9GIbZZF9JPbQRmB0LpWEU7icBOS0/dkq631JWC92sB7TDzJ
X-Gm-Gg: AYBFou1rWcxJlFsY6yGsZ7CYyFBLMimHUP+UtX7UAV9wT1JHPUzJ5ojxd7RfLJVSztM
	UmLYGUDCEsY7w8stTO1fUzT9ZGBfh4Jxo3wHwi6adL+/DcvwMnTmyaZ6Wf03QSYjx851x57E+3b
	J5fj9xfJeqPytN6is8KKuI3aTBE0IneioObfYtfXcD/DEo1Yyg2xXuF7uTz5+XVGJyhEq5SLmEQ
	M4MGlwuesqlWhlbieLFMcW2I/cx+yKwmyFqYFA/Z/xFxnQfJZR94yB5WAJKsQRyeFTQf+GVsDyq
	jEe1qwwAlaWWtsLeuHlXFAbGvHATHxaeqmxVs6ZxOCTnwnWNB2rCXaHpZxANuOxDyALYNfjmJpP
	n3bM6d8ekDkHW29VL211By2zGPL7DeJYzR+fxgtqK/FMiHWhv55diHGL9pv9lkvMm3sm3KEUz/t
	XyLhBLqh0PolwwQHN+EQhIUpakbij8Zg1XXZqG+qAzWy54WG9iwNPMC9BFrKPVKw==
X-Received: by 2002:a05:620a:199a:b0:93f:265a:c609 with SMTP id af79cd13be357-9479f40bf87mr313748785a.69.1794302432780;
        Tue, 10 Nov 2026 01:20:32 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:93f:265a:c609 with SMTP id af79cd13be357-9479f40bf87mr313746185a.69.1794302432401;
        Tue, 10 Nov 2026 01:20:32 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a6b0sm55209975e9.5.2026.11.10.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:20:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: fix interrupt leak and UAF
Date: Tue, 10 Nov 2026 10:20:29 +0100
Message-ID: <179430242703.6893.16466062017492438837.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
References: <20261106-gpio-virtuser-irq-uaf-leak-v1-1-ce9772d8ad0d@oss.qualcomm.com>
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
X-Proofpoint-GUID: qZoUOgteiIYzb14dilvDvfvfsbMYZrRK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXyinO0GIGuZ4R
 2gUrHoxfR+LmKaWLmpyjg5UmKk4H1pFVLXnqgyLysHBdIBE4IB4PM79aL12Bw2nDJIVJNNwHhWt
 GOKuSfm1Db8jJaKsixC0WkDSulEkjjo=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2e1e1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-0yr5wKWe5apWyn0pTYA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: qZoUOgteiIYzb14dilvDvfvfsbMYZrRK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXyzwu4fB+SSG6
 gr7XuUU20GNv4dEk41hkYrLVL9G+UOS4Yse+EjX9vFcxB6pWmhq4gHnNwMLFuxqaei+PMuFdxIC
 UW5JOejsJH+j4JXwJmd2FCs5r90hpFad+97fWx8vreXBTw4S8nt8Xd6i2Y/oUjupoAnFpDxdrrK
 P7xoqZR1ZXelvqGftg6c4KPglZiRgk7TQDXsiPE1i/VjBO23zZJ7l8Wq6hh7WUXoFBKOhDuYILe
 2TQfVqFSZsm5/goiiQo+u9eyuRaleS7RspE1TZ8IC+UuUAOGCMxgpaSEGCE1pT8vcaaWc6T52+u
 VkPnchE+ci+BM6y9diu2GAzxIhlVUOu4qMxpElzX2XMMMH3kSL9QMtJQtgVnhE9TE8TyHnj7lHk
 xSBVmP2YvSmYPIvlU4mS4n4xg59vqkBxIrEPL3ImD/IEbL1f6GrheIjIUa8xz9+OP3sa8fGeH8U
 hJdUP3HqDy/jrtX2bdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037


On Fri, 06 Nov 2026 16:33:45 +0100, Bartosz Golaszewski wrote:
> When configuring interrupt handlers for GPIOs requested by virtual
> users, we never verify if an interrupt has been previously requested and
> just leak it if it was.
> 
> We also never free the interrupts at device unbind. This is both a leak
> and a potential UAF bug.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: fix interrupt leak and UAF
      https://git.kernel.org/brgl/c/24cafd9580627f9f066296f4a6ce1b282a3f425d

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
