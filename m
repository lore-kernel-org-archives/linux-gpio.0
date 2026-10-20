Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502941;
	b=bBqoyeZ0ajBzp/q4Q40BcFok3W/WP1qgEKyRpp8dtLVydgMc4i6nZXy8U0+6ofhli+tX
	 Lt56j6boKpgSaXNA1SbigP3SxevOHRTf8Q1oxRhtoNfBagFhAZLpJxWKhuGK/ZWFcsffT
	 kipfTBguzrHEjHYdiWuaoVBOzEU6BVnLcenKml6YCrZPmtVz1C9UNEkNDde1gnd8jDdcl
	 N6LxspcU4XAvkKlEpOn6kDWrFOxolBl82mwjndVIRjh/nxxrbFQRalmPq1OE9JHNmlS/Z
	 w8d7WRc4Wbaq6+MUpksp1SB1uHcHiIzdo5RBRjnGAQ0k876XqWs/uhPzSSfhe6LfQ0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
	b=r3NkhlYtncUxC2o1hAgeg9E/JMM7zy5x0Vm3t15N6xWmZL7RSxlwo0DGihm+QnzNoQQ9
	 e6YdvI0ZBkHvZUkBnN/dvIr59q+hB30lEk+vmXmeLnM/iNZfyTncpXwNTOYJyNnAH+FeG
	 M1drP8zeO/gFxVcZYxhtRpv+kHL9tdAFk0MMxPghyS8uMgFWNei5KRkIiPXXoPpi6qKrg
	 TSUbo/Se7It83RfpQXUzPlngUtltd/wjySUfqTipRXChQTyPRo9/ieYU+7yXhjauvnY7t
	 rdgS0qy06eHtvEv7lwUfIfvAElRSmh8pZTzeWaWKP+lvsNfYfjzNtIPsnpq19l5l38Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUpuNFga;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEWOHXbN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5655606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5655606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KUpuNFga;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UEWOHXbN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9uOq1731319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=; b=KUpuNFgaVxdtDKc2
	I2dDzcn1Akrb0hWrkgddAbPFLSkltiP5lrk+uBuO6fG/lAzTVoUkFT1I0otQdp9H
	9aURM+kUpmaVOE5C6SBlFPHSXdR7F8upQaQ2uUTBVzSobv+Su+KtZ0ebaxabF5iO
	SqDcuukONJ+CHJ1/LUe4FMW6cbyHvwi0g+0O8GIqWC9CfoN+nYlDMz2/N56VJ1Ab
	5NTupjeT0cnAQJ1F1QDQNUq8GPsXHq63VuZkhybH6a7HHBXna/WhV2yxxQyKoo7+
	6PqV9ZnwOECwNCWBbQLEblQUMrKUvO5APUsdx+7oGJu3UhzBUXKR6xthn0sF9m84
	qcra1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2nea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:28:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso447406285a.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 06:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792502938; x=1793107738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
        b=UEWOHXbN3SXM/kokrB6PpgPlv7/Q8DhA7clRfA1aZ9poNgoeX5XP3BOWdq7se6q4Wv
         JHa5kIVF/snpnbK/RlT0OFw71WM3O5Alfh5jWns6x/Ea1xzoa1ky/hlLZ1Ee4++mhbd5
         dRW6aw6ujTRoyMJhzCN7RfdSKn69bIVYPOA3+Y5buVhpVDrAtZ8lyui7Y3BIsgh4a1Fe
         BGtXUT9Xl7Q5tXkpZrZOonWtc/XylSjRaQR97KuwCVN1fcMw8ZDO0OkZzFMmBx2XpMaI
         HB5OiSo4hUzu1wKIWPnJEXJiBVwHpia13UWscg+La2ntTytNpEjZ1mg6eJKW4vyciJwB
         Qdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792502938; x=1793107738;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6zxXx5rgVEHyEDIN1thSxX0UYekg66jtrYrLF3czZc=;
        b=JoG909Bs92Gee69DGCOO0v+Hk3klyBE4XIJ22KPG+TDL675nxxAfmAq0qtZh2P/X8F
         BnU4WJZCeskzqYp/67zCpE0QUw0b1nZVDP5bRbVjV2u44SXvT22gvATQfHV4CY6G98Sp
         7PBPF5hQLpCAlHSpM4TnhhYfFZKW6wiQEdEaJUwd4YxsPWdehzj7KHKQ4A/YEbI0g25s
         cVyzhXrn2xxob7FOIbFpfnHYdMVbbXTdDqeWpoz8Zzo2abJiAJzAGaOtSJtGrKLjYxJu
         jtdo3IRey/lZhDQZKLhhqVvgow+DaN2L37VOUXi4FT+Q/payn9Mg6DEHq/FFnZd7d2L8
         13LA==
X-Forwarded-Encrypted: i=1; AKwUvByuMpaFg8MZp8ylr+0Q73YHek2VbIW/PnVeJU5L5AQYE4bfAhUvik8zKmP5k6iWfGmSuZihAxOlSWDI@vger.kernel.org
X-Gm-Message-State: AFq9FYKnguyhlWAGTNfnW+pXcPZFZRQ0O9H2ShymrCoCwrqydKOZzFtf
	dQMcdIy5e1sPe1E50ikV91Jz3Gx2Z87BAGH7IpIuImd9wKojKJzaZAh7eWIYJFeCNqVptiyVrdZ
	1kv8UGqfwUGC5g8mxitE+bMIUuPTyKWd49iCCtsVD2CK8rZNKcsnPcdRAAmCkfwXU
X-Gm-Gg: AYBFou0yyNGH+YXUhrADlaR2VvIrwo0Vei/oigYrftG+RvcpA0j8+NsvEo7+xs0Zd/J
	meCnkJ521BTCxH3RJ+ajVoRINhu0in9WGP3nvtPu0ZMFNeQHP0rgQA0H4nKz5Y8X0VpNXYH9ODA
	GYG72wtTh8L20AS3fDdCJWtRRq9nbccHV8CtnmePKfQDkMLSeCWa1qzVzi3mCopV7H+joUkpoB+
	QgWCMHmR99hmAt7gB8oVKHHE6/Q4FdKVJLQa3b81TGUpBymNStjFTKcbYz/cXKC8UEVznLcjWpd
	rrBgn8Dy3WjvlW6sB07s4BEB6vcxIfzV/GEeA5nTEp7nkD9/AEfxq6vPfc4UnB9TJSnr/fjbWBu
	b1fdSfwH5UOiTLlzH7y0x+6E+wgc=
X-Received: by 2002:a05:620a:40d3:b0:93f:4f87:4f5e with SMTP id af79cd13be357-93f4f8751a0mr191652785a.72.1792502938221;
        Tue, 20 Oct 2026 06:28:58 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:93f:4f87:4f5e with SMTP id af79cd13be357-93f4f8751a0mr191649785a.72.1792502937823;
        Tue, 20 Oct 2026 06:28:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fab0b9dcsm4429835e9.2.2026.10.20.06.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:28:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Handle direction register read errors in IRQ paths
Date: Tue, 20 Oct 2026 15:28:52 +0200
Message-ID: <179250292927.34033.5879344425589033751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
References: <20261018165003.3372368-1-sahaj123.sc@gmail.com>
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
X-Proofpoint-GUID: O-Pn5Sbc7uFYaJ8Yrr24kj2CMUb83nWE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfXy4Ulonwh7fDR
 nKC9WwFt9fVpvfmczeP+dVrtXB/GjEGd5qSGZ1XM14UgnFRelcy8KAcug9tOVSvDNjynNkdDrRX
 niQNPsO1Hn2HpVMHVToCaPgvrv9ZWMM=
X-Proofpoint-ORIG-GUID: O-Pn5Sbc7uFYaJ8Yrr24kj2CMUb83nWE
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad76c9a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y_VTxXPCLCIGpK0l0V0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MyBTYWx0ZWRfX4K4qpWjaUJQ/
 +E+8t1OijcWi5epuppmPCJwALhFiWKQ3GHL817Hx3WlJUvv9hzDfrkCsA/yfAjjtn5hpA1jSKDH
 1FHxckffIYpzFIPF2E9YHevXY1tAFMPpycbYEEuGlslwMJzFPLsgT5vrVhZ7iSz+4SGMryb5DTi
 A5S83xNUFE7vTqdH3UlvNJ1GXCAQkykWUlmg/pTTSnHWKTGK08aG65umgY7qGsyA8/XJnVFL09i
 4NqfIsW5U8rqEAU5lwNCYU098uvlBtQr8rMZx4R8fTzQXAbbC9sErSEIM8KM+NZQdmJGp9CzKtF
 DgvEf+6nZJXLFn4NOrNHbeQli/bwLhdcy4EJQDUzrj4yXLHQHf7Wg+lG7jk48RTGfrTCNZXWe0X
 lkDRHT+1/HjM9X1jgx0v26m47vtrHJWfmSwgnd+tXVn2gOHm44R65a2w7pVSINjgRPBqFdyhP0g
 ixdUEO64dlvXP17/+/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200053


On Sun, 18 Oct 2026 22:20:03 +0530, Sahaj Chaudhari wrote:
> Three IRQ paths ignore the result of reading the direction registers
> and then use the destination bitmap. pca953x_read_regs() does not populate
> that bitmap when regmap_bulk_read() fails, leaving the callers to use
> uninitialized stack data.
> 
> This can select incorrect GPIOs for direction changes during IRQ bus
> synchronization, corrupt the saved input state during IRQ setup, or
> produce incorrect pending interrupt decisions.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Handle direction register read errors in IRQ paths
      https://git.kernel.org/brgl/c/a0fe269293509acdd93b9cfb3f46636f7b91b33a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
