Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303498;
	b=4n6xSPm5FOAsR3o0KufxDGyr5t03aF04MguZUzBnVL29q+b3c5tEfBbllw9zTNAZH8Wk
	 pu20KeiLRKzNsJNR5cI2pTrlG84VNJMgpdNGNRxXkPuqmFZHtnqgceJCZop0snqqZA6i+
	 2YsK1HML05JeMkkKzIWhK8643KiK7rZJMaPXiBWs5+EnbDb7+D0lw5Pu1+cagjECRBpcW
	 H4F6db1RLwDyKEIqI51PuBWpRzqdNFxbWEYZ/027YrWs3vS7ctLwDadEcyKgiTxppU9BX
	 VSF6YwVA1epdt0eziPU5GhnZ4DNF1E8Ud6utHy0myOQ6XUe6roijTJIQOdtz0VxxR+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303498;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
	b=c6OfBJbCN6mc6nb4O72FQ0E3/H2QeQaZ2OYyqh/95+tBNvSVc8Up9638M3SZtFWjMiGa
	 moqlnv50S7oza7CU6g1zHYzfOZomvjqgW3WqvGizRoevVy4PrlWj9I+QzyZrG7NrCCnE6
	 MEjZGMCHCiJWHn4sC6KKncP2AmkZ8yBWy2jCO9DQHDLbv846cC667zMsfQOtWMmuyBEiY
	 8bjzNRGkLdr2zY1JICnqu2ueOAuiVOTmY5FmgyO3pleYhm3/b0YwwuibMVYIbZWSogXro
	 XeBeZxI5hid8VfumfMfvJsxVnFhZJUHyioerTlcmQgeJiIa5oN9iBBPk9oiQZPAvuOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPRTJKQK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+oBaOUE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A9606A919
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D59A9606A919
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aPRTJKQK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A+oBaOUE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7klob2779819
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=; b=aPRTJKQKR6HnNm3p
	Gn15g8HiARayyGrzaj5nAYiRG0y7dT8nL+GHvjo4p0HoMMCw8DmC8U7ANF4BQcNt
	ltqASJN9ErdsKbznmMz7xAPyhW1I/ipXWhY2j9iFLNQuNYqC6y9iYMa3hZ4iL3vq
	POk3f53z2MUVV23UG09gEsewNU7Du/ZtYfYtaayfa0VPrgTETc6cNeOVuDho9wZo
	o+5VdL/vphdenyjg99KhEKaLdMvAB0Xv7rNiRakhV1A1QxCso/R0yseejdX6N8RO
	r4Mw51kwJjikBlGp/zUOMfas2Tffl6AS9lD0lIlTB1xBqwAimXMdeqbYU2qh8nfO
	d1Y6Jg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huy5d8ehd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:38:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so424189085a.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303496; x=1794908296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
        b=A+oBaOUEayRVAO2q7aC5BPNpGEj/oPc1TFNI/Pl/fRTkPoa+9eG/8MXnVWmqYI3sRS
         Tgc3BdOAvUoaPj9QQa8qGcb9cd0UlE/Z9VjyneGK16ZHR4P6i0OiWjnJEXcsTt7/S/BK
         30hlHXPTEwtytZPt7e8CZj3zW+L86yOWNVysTXY8i5JfJyYRzLcVaPcMb+UWUjx5sdW1
         z4T5d1QkSYe3iUtTTb8UE9Hd6J01WK/BfVXYcjXPc2aNyCy78APeDQjaPaeClh+okbeX
         t3aeu7x2XYPTnC3rbfcTgmLUVH0uBs7Nns7jSqhnv9gPDvBXxbpJeAg3HRcIzzva3V7Z
         CzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303496; x=1794908296;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GskYWq0okKXhChzrerCcQUfZoiREEqMRqr9GQwC2w8Y=;
        b=U9ftgBgIy1k7GLHmxAI18eqmrY4HL9wtLI6gzXJ3X17mvF0laejsBvJB1DepPTWB1o
         /eojh8UM6vTZCyUA7JFVGe3oCYVU4x8gkL9sAQGe58Sa2wcacbRrC8dZYnpUYISMNF6D
         oJGLAd6qRrZs7vPv1O8zT3nSgdKvhdBV4LK/LJe/PN65WVx7HcMAy1cxnAMbETDpCEYr
         R7vq8MeywwpE3wCex82RxY/RMhrtSybezDTkf83igd7vslcL7MsZW2N26ZjYmU9ozaEk
         e0J4M9YpxRb9mMfbU0bvjAnLuAyvw69+pn5dRwshTEzonWT9dNhfbb8vwZ37pl7MvtnS
         +uFQ==
X-Forwarded-Encrypted: i=1; AL+hErEY352eGUYHZT+ympKG8ZMo4/q0h5K9hWtxQSYRZAzIKSXUtj7SrAfqkUu6l1dnA6aE677ciSsbs5KF@vger.kernel.org
X-Gm-Message-State: APuU4Z/I26Xgz6zcpB2SxdIO1FnBHeslwgAl15e+hrdZuvGCR1rsCNbg
	mKxKloKL0MateoqOTI8IFsHGvI/nvpjLJSXC6q6b6qVKhtiQGsb1I1ReX4bfFAR3zEW1fNf2mvv
	8FlcmHlsLsJXFaODufUDgbigy5ssqEqVmOS80q0o+w6zg47tvzYwo/i+82opoc/Q8
X-Gm-Gg: AYBFou1alkFQ8GuBqpcpW5GmGf9T+tH0IaB8YM18iUhfPon0X7Xk4vam73uHdZ11LZY
	zKfQFltqQZD2WcFKq7bSI8OKs+AcvXM9SPj999rOQdCckZew/9Oj9BgBo+3wcbYhyrGoPFjyDp5
	ITfi4ZSzwW421ApfemI49bVoII5edm1v3wYEGIH/GqAde4+QjOXtdSiHb+WkU/ItH/rjMmHeWKw
	ZlVtKHS0q3+bJfPV90HyWootHE98uLcN0SvOBN35PlKWrYfhsOAU0tQsWKEBWf9iMLs0iPVJGzz
	EsMKFOMJxUQhNc1qSNq5yI9PR/L1Y5xCEzLo45MW/3LFWcP0ThQiTmoYVt7RuxL18v2kMVDQWpP
	vbPiTNLHdR5LlZnjkug6djazEQ+HMva+7pjx79YGb+RHugWdUaMAlUWWtt8Qmk3oKOsvIRJvUgh
	QPd8/5TV1AdcxiCfnO8jit5RKoYuzzxQI8TpH096Psb/is0c+ncF8PUCTEgvtZSw==
X-Received: by 2002:a05:620a:46a7:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-9479f3c5fc2mr320944685a.64.1794303496127;
        Tue, 10 Nov 2026 01:38:16 -0800 (PST)
X-Received: by 2002:a05:620a:46a7:b0:93b:d7a2:83d1 with SMTP id af79cd13be357-9479f3c5fc2mr320942885a.64.1794303495699;
        Tue, 10 Nov 2026 01:38:15 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02005762sm53126545e9.2.2026.11.10.01.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:38:14 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sodaville: fix use-after-free bug when registering the irqchip
Date: Tue, 10 Nov 2026 10:38:12 +0100
Message-ID: <179430349031.42519.17560346076327838160.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
References: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
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
X-Proofpoint-GUID: 8knd4y0Sr7sfab5Qq_iWqmF89RZcRXqj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX/14fE4z/OtL8
 2eUo+IeTbfFrQG9GK4/V5Ju9rwrzHcfylF5r25HLqnoUPE7u+5VE67VNFNKAXAfdXxrYlyVWs5A
 6uWsIMY5L6IuJkqqdLK8iu4D+dfg69o=
X-Authority-Analysis: v=2.4 cv=d+9gWhjE c=1 sm=1 tr=0 ts=6af2e609 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Le8wEPVksgxnqJZgdr4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 8knd4y0Sr7sfab5Qq_iWqmF89RZcRXqj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX8EM02bQ4vlkB
 iuHopvxaDvFTh1Mr3Yy2aL7pXfndRQZsW4v31tYAnkgoSO7YvxNlue3Y+UMcVSXNIzPH+0C6Ju1
 /Os1j+F0THlMQJ2qedGkH+spETxWxklvLdzw7ers50IY7xnII2clMv8XcWfvq8XQC30QFjfnmUU
 9V145UzwtHfiNw9HmjkYie40UqVYCkvBqwUT8R/j3x1ixxRRYYyJQwD8udh0r1SusDSygFmXoJZ
 3zcIKxZAmyzIeAPsWIT16Jjoo1ptbGyzX5lW6hlryyRMlTp7qzHTPandynd5i0212+64g7Uh5q0
 z+QQC1rHslXCCrqmDe4G+m3iafLeaFk3yeuUDvR3EgtqZ7wwDq0X9xZfIBFaGpuopxEqvqy7fIC
 2eAaFLP1wbMJKayQbyEzzw1KLIuLDahMayCLTozeuRisRrZIzN2j8ap8f5oxrZVTMfI8RwWCrSY
 TsBOqLVJVaM5ZbzIgXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038


On Thu, 05 Nov 2026 14:14:27 +0100, Bartosz Golaszewski wrote:
> In sdv_register_irqsupport(), if irq_domain_create_legacy() fails during
> device probing, a generic IRQ chip is left registered in the global gc_list
> while its underlying memory is freed, leading to a use-after-free. Use
> the managed variant of irq_setup_generic_chip() to ensure that the chip
> gets unregistered before the memory it uses is freed.
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: sodaville: fix use-after-free bug when registering the irqchip
      https://git.kernel.org/brgl/c/ab9102375b7c77e0c4d33c7594e514454dc9f2b3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
