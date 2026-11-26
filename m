Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795702673;
	b=adYz2l/vWMagNBpWdPlc5n5Wc61wZTJ9SGIC1EqWgM7W643LBnASViUVbWaLdLDD96bq
	 pL0yKVe0Lc/eeNcUAIYV3liqFKLXMFnq0eiarYLSoRLW6T34WFr8ExGzrLQwhW6zu5pL3
	 F7jDB0bAG/L8faWi25UNvF0TZ57LUNRpBK2xQHi0E565qJkSUMwFSP1nu/dYgfs+eLAeD
	 6+QDC2TtEC99zljI4EtMTSgCq6PdUqpbtm8KIeu8fT+jhoyKkYhnb1UmH6qOn9lXZgoJP
	 lxaHUbUiIIndlqMK+rmSWfIkXdqv9WNmm3nk5RRQ7yim8Gdribx088gV7x4omBiCndA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795702673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VHfg/XvlpdAbKGxmELve0UjQdGfsR/kNrhAkknotzs8=;
	b=Z0iS0mXcTFAGog8RLI0D2Ley6AQzLSQ9c38mPvemb6xrkz5P0UWcegmAcdq0XcTtp53c
	 cm9p/aDk50ycVVlzlQGzv5kP6rNiC0TjNA5hRK7inZHXAIfdXx3wDotCNsb+zuiLdnw0z
	 gPqKf100NQnvPYMnhmrm5OBT7qonAogF5whGZ38gQgtdJaFPPzEn4fSGpHuCrEh/qOC3j
	 bP76gLzwa0OiD+ppKcWZW8Fu9OkRWp1nzo77L/Ci0SsBpKk3xFLyEmfk9H7eO8YPwTm47
	 NQxJWjFXYcmxZE2N8TbnK2aN3GLzJPwIFywiEzVjKxuCZ75B6NL5CTRsg8okMgFUGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dh3u0GC3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAgLbPtU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A112C606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A112C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dh3u0GC3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OAgLbPtU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVTS82785132
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VHfg/XvlpdAbKGxmELve0UjQdGfsR/kNrhAkknotzs8=; b=dh3u0GC339MKLnWy
	5EqidsDiL4KylA1T0+v1L3nHObvstSbhcIHnMK/3edaxWObHq494FXcrLCSP4HT+
	5pETNRJtR2FNgfWSXHFNhubQCltdM8Dbvotu+nCFtxo39Mj4OKCQNKdVrJdOnYcK
	OlM2XO4H8/+uZd+uBAdV8mTJ4XcX9X0SUGhgbU+MtjY33h68sl73V4d075erCW4L
	zxcGrL5o17ngro0GZDGMU6g3rLy/55sLA8lG4b7igYvV/NiIZbQetcse18oB0KXE
	yl8eIBAb9wNqTLekkRwt5iyFfKo/PO4UAUj6tZEioAIc2MTRStOvM22EcjggDRpX
	tDeLqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qfb8qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 14:17:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso1289579885a.1
        for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 06:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795702671; x=1796307471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VHfg/XvlpdAbKGxmELve0UjQdGfsR/kNrhAkknotzs8=;
        b=OAgLbPtUkJxee/OLLzWBNYRMFd6RrkESnMiSDPSogHcCwStB/LbbnCcKuistTfij/k
         5Ep9FATDhCLcLE3kH77tyYN+yTDNF09ena7KHbTWlAFtTxPpAHxJ9D32LF6G1guHSAkc
         R5ZDLk0PzVK6DXLolTTWPkDpe0+k+6FEXInZHnXH9+DvWfXMcJIBSc2D7ZCgzryC4Qdn
         gYuPcjreeLi1EjlWlS2yuVailGiKm+DfN0t/L2omwxA2C89ZojTq7NMeBEPo0GvzCFoF
         +nwCtqUs5g52cAP4mn/pka6BVFXreDsj2JRCQB2HJsl6bZ3FVawmlHXVlKJTZqZz8jvo
         k8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795702671; x=1796307471;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHfg/XvlpdAbKGxmELve0UjQdGfsR/kNrhAkknotzs8=;
        b=a9uE9VepvSp3ldSeJtp7ukD9G6aRs6pkuxSXvJNOceX7NnP2pBqxFcIMjrraD0AqKF
         I9ef1tb+x7UjJo87dvLySnkLX/JARbL17thmwbLwrah0HxAbIZUimnoeZkolOWpdz5g/
         Lbz0BkTIWklY3biztAdHb9Ef7v4KXnEk0h3WOJQ8gmkW8YCKNix3UQNV5mAcaflGg41W
         hlflxSy8VhRbmA9rFrNNTRspfcbuVFB8kGkheM+WAY+fRmBEiOAaDkdpmzkAZOofLiU5
         LqRItz5ElPbtYpb/bQUYOFtvrJEd3cfviaZ6QT+q1EOhAbZcv/gP7XQRCAkLXdLfY/SJ
         84+w==
X-Gm-Message-State: APuU4Z9M+Eu2V1VcwfNf+I7b6p0d0hzplCKbabRNi8L5EaShnXGHqJAR
	5H3PfQlSZZJkB0qLeTcvf/kMWbg+VkGiu9GVuahXNVJBIjRJJEoslHUi76BSFvKf32mVqAu3ZpW
	Hj268HXIiVz3vNUOrzvaiTZDDKoihXyJaHjn4y3oOdjjvpBu14KdEEBS7wmgXYb3/Jn8jOE+k
X-Gm-Gg: AZFdTZf0vQEF9IQ0won4MOq/l+lAiJi9nzatS32zBvRuc7Gwg6Q1FSXSdxwErdtfgnR
	JDY5kyRHr21bH2vmQmrmsGLSH7HklLhwRnZs6nxDUOiqnmuaYVIJxAgIwvcBaS30suLVJipVicW
	6mx4ib9ZlIoK9ZHknvAwEpcnTDp/jMscse2HmlW5fBQOeNoS2k+mzUkGWpWOglk7djicsx3MMnH
	LoL2+zlUSjDaV7IsqW9ssYHxK/S3ZLAtVKwlOvC4srqTgxEVd19BnU4vWRzO9W3NrPrfLA/j4PN
	QSb/ogLSMGmnX3NamlzB4ixZqfUlGhQuGOeaA4R+r6LRX+5Y7iuM2XGuM4qm3FwoOfT8UHj7aCE
	RaSNSxu8ofirpXoDTSKmLgKDPwa6LnCnA4OhY9m61y/8IhRMbl2buJl1tsiSCUyHMsTdNeO2jQ6
	3WK3aqgoRnPqMDtV1VdP7Rg4yoLAWv77V7VK3qaG32mRFPAo3dFSDyV6e+QoMjmQ==
X-Received: by 2002:a05:620a:1d02:b0:949:6614:667c with SMTP id af79cd13be357-949b3572259mr4189271585a.11.1795702670872;
        Thu, 26 Nov 2026 06:17:50 -0800 (PST)
X-Received: by 2002:a05:620a:1d02:b0:949:6614:667c with SMTP id af79cd13be357-949b3572259mr4189265985a.11.1795702670402;
        Thu, 26 Nov 2026 06:17:50 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm42074018f8f.3.2026.11.26.06.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:17:49 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v4] gpio: mvebu: validate ngpios before use
Date: Thu, 26 Nov 2026 15:17:47 +0100
Message-ID: <179570266545.23627.17353966972435483371.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126002650.603321-1-rosenp@gmail.com>
References: <20261126002650.603321-1-rosenp@gmail.com>
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
X-Proofpoint-ORIG-GUID: BgatgXSfwZxXeGNsNgICcDIeRPki9mbJ
X-Proofpoint-GUID: BgatgXSfwZxXeGNsNgICcDIeRPki9mbJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX+lLpaNwCSYAC
 efTKWfIi4NRUFGVgA30FcncGDk5Wy2sSqCbXD/ycdgU6lxrJwpUOdYTujbBoQCogomjbkTyVstF
 2rB2LA7zib0uDVNp3EaTXLm81Kr/Syw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NSBTYWx0ZWRfX3hEiMHSSiw21
 2wWLerp1jKcz+X4Ikf1XetSpYoMY0tRwiyTiUSZrujeNQrBB6gGYMRjLixLW3C8M89LHditBGyW
 8ItWEO2SKkMcjdyMGawfmlvdX1QiRAK5M/C+KScWsC+VZudagi+5jWgpdwZP1NObu2Gb/Gzg7RG
 x5M7j/gx3zQhIGz7wgaeKGgToikWA7LmTGpxyAaZifiM23u9qotI7aqCdVncip4+XBIISW8OuSW
 GzJ6c0W0sQRRapzpLObaC6gCg6jA8t90iyke7CpLSJWbrV3VegNLQRsEHoIGZlffMJ/slPTUaqF
 84pCSrQ+ee7Bsj9D36tNFGaAmBoCyojh0uHDzs2dse+GhC3JBztsaRkhI5ns9GDXQUicDwPT3KX
 Gx979Gz4k/pDEw6Nvt+8b5RzTQ1r3zPyvpgJ0xn6YM7JEnxIMk81bJ/jn6xKjnGmcHGW89eTQ59
 fzsvNWXwCG3CtybuffA==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b083f8f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tVkH1j79yeRU6jyaDsIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260055


On Wed, 25 Nov 2026 16:26:50 -0800, Rosen Penev wrote:
> If ngpios is read as 0 from device tree, it is passed via
> irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
> division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
> Reject ngpios == 0 early.
> 
> Also reject higher than 32, which is the limit.
> 
> [...]

Applied, thanks!

[1/1] gpio: mvebu: validate ngpios before use
      https://git.kernel.org/brgl/c/62a41997c1553b723a7a333c0246d0646ebd2c95

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
