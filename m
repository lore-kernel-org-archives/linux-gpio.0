Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910854;
	b=Fh6j3yP7CIZU+xEv2Tn0jvsqc/Vq2QYMUf7SOpVXy2paLEOAUaKhHvkWBRB40RsB2DKp
	 vvf6uirnI/fszr+wUk5LkEu6U9FzF0Y9rlTKmcp1O4UDzHhC/CvDmqdbPmMfcq6+S0SAi
	 kf4G47BJooJHXuvOVtoyNC6uRxcGmaiSJ/I66gly4NxIXyzCDuUqmXxpx8swWjvF4fgyH
	 O4NGdR4/7Ww8qvATgsyTnPByV2+2J+LwgxLZjYSqtlc5HMjuAUGuoB4FiqUOJ4yf3i5Hu
	 Vhsyuv9LO87HsKSR8/fpbe+6uJX3qOsV75ruJLcBbHMYOWJK+VPzfE0WxTB6yN5tz+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910854;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
	b=qOdmJwFo7VpE5Bgl6kuaKQvfwxjc5p00KTnicVtMk9EBwl0PHXVWHBex02x8EWpuoiQv
	 Wu0hlb3Qx0YmvSuSok8KLYZTZTL11YnVYUFfNcdDimKBvkwwus1SqBA2u1R7PGdO/bY++
	 wtf/MVnIkwcOsSJAMoe/YxZ61pJDbwTq6mS5bQFXZ2agyZdO/tEoVJeNE7PU76+U2aJJt
	 G3XgaAbUZqjGlNiadbRztxuhwbj4xJrjDkP2D5qpM1x+7pq3bQz+6WTwgQf16rjgJoecj
	 V1YZySES8Fyvp5CHJHh0aGFlY1KLUuKKFuZJ8oJ9Th+BEEcloyB+EjQmUUcQuniw+uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g94MOWNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjODMonJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E193606A323
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E193606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g94MOWNz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjODMonJ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8uph22934224
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=; b=g94MOWNzth+xBunp
	hOmkSpvC0JgQ6l3J4MLRkj++1Aj3Iob5oQovsEtW/rMKc+iynR1k56o2ngfn1sH3
	vFQA08z5vD9negODGIgxfl+5WF3jA1PGgCUYTX+nSAmfit/62phKuKqcC6P7GE4e
	+MtQjH+dvKjOLYUUSLcKrkJsCXWEduS5SL+ZS4L2llzptj2ReP1OmQsCptlWS/54
	4q6Jz12yReAngkZgMpRZfEOsZPIp8KSJSYRAegwpWG371C9fooXkxEvbWqKJTwG4
	+CLaNS4Dra+DQm7j2s+3LVgeJsHDfFmAm1RG0T9ZVZVf+2yA1mp7+iHDPPrce5/b
	8vCRxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0akj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:20:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so493126985a.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794910852; x=1795515652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
        b=XjODMonJHXxpwmhfHq4jCOgmc+C0k0FJ/3tCgftZn7xoWqq5O7W1TMTD9y3lktpiHb
         qrqbkg66GQ/69oU7KRmgsTxj3zPEB7v3Coe/hL1h6Q6QvkOTNeSmfq34hmJR1BqT9URR
         d4qWJO7oZqPbqZkX03vUekMTwneoMpXkW1WyBHlOsDKwQQMR9eCiSGhwNQ5aO/gtLKgm
         XqJyy0salEvlvGVWTy6xaKmwYnQSOAzwDpTJRe7RDvrfb/vcMaQ1qkH2U7pe/1a3XjPg
         APZskAdmn7AM1+J/yJ6pqTs5CePLMQ65fY5FWE+QnLhMTImzMjVoI6FM1NQzY/6NB4Mb
         bDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910852; x=1795515652;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilGgLF8asMhieoRjJnaDA152krpezAwFlFx6D0TT66g=;
        b=tqGSg1r9PoaWwK6khVje2tluwIez70Mw6nCO81qkA3DAv6uzojeZVq0Lnkfi545jnQ
         ow/di/fWU3ZjETppYr0QoJaSRi/Xm2YpbZ5VW9MvQQdzc4Kopw9mtbPbs93bFOkAViYt
         Q9lcLQkWEFsww/XgLanvauUu1I+rthuck9tM/TdaSk9uKYSIaRYeVxSodx3s5JEVk3IO
         McN0AqjY7fhQQOsCn7sc0S2tvToejIvZIPfnjaB7arhcFzZv415rwTv3hkpahiiCY+F+
         UkEMelX17PMzpwgreGUfx8WedvzlzI8ham59TcYKKK/YIk4mcL/GuSCVfRBfNzcHXWnX
         EBmQ==
X-Forwarded-Encrypted: i=1; AL+hErEB3at3ngvJlqsGPir2HhrFhkvIpUz0Y8AdtsiG71QZt3c22z+UiMYPiLjTkaaqiUmCQssf/l3VniUq@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kb73Uqn8g9U+aWM2EeaycADetdl5g+bY9jI0Icsgpf0qPORHc
	wCMdzjoSGDNSAdR/Dfqiei+gGpQhoHdAeBnt5tPiM0Gvr1G6DMnCGGHxEhemYChcTSy6MhV0sXk
	RXMR6fmeJhmlHL+yFaeRFZp8VLKbY7iBLUCzczQ0OeNz+jgRRNLyjVYJIA6/4jJaj
X-Gm-Gg: AYBFou1nBoM+3LTWdnCdtqFNA8z/P/xWdP6RfzNJ3GgSnDrJOZ8bQi7zH4FqsdqV1qa
	bMJ155WR1YT2NDOj9tS98Rasr5+Rbq2RHg6t/M+N+CFML+CDYrDo9eQQin8wBnh9VL/oliryQD3
	Q6M5fEUc8eitqa3wN0B7iDLKygMCHsAujAeQQW9IrDfhnW+TMvaTVUzaEYe+OGdw7peg0w3mn7y
	YKQtCRJcunjMe4fdA8OTVzzfD6QfjK2mZt9FxSNUFh09skIxcALs7RBjitI9hfUMWW02baDpyEu
	dlC4NL112VsvuTdocNdIL2q0aU63J2dlusEtXl+YsO84rK6qwtuydFNPAIrRXam+3NPy/D6btgG
	3PImS/CUxmwMCyZd3+4E83r71+X4sjucMLzmrQ5I9cA9P2SfcRjmLCINuNKLJpoHiRJRH5WZCRL
	M=
X-Received: by 2002:a05:620a:4592:b0:93e:e2ec:3bf with SMTP id af79cd13be357-9494bcc9ef9mr2151886685a.78.1794910851989;
        Tue, 17 Nov 2026 02:20:51 -0800 (PST)
X-Received: by 2002:a05:620a:4592:b0:93e:e2ec:3bf with SMTP id af79cd13be357-9494bcc9ef9mr2151884985a.78.1794910851460;
        Tue, 17 Nov 2026 02:20:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783854cesm90386485e9.1.2026.11.17.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:20:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Haotian Zhang <vulab@iscas.ac.cn>,
        Alexandre Becholey <alex@becholey.ch>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: ljca: Validate the pin index of interrupt events
Date: Tue, 17 Nov 2026 11:20:48 +0100
Message-ID: <179491079451.28213.15188778805240746031.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113144432.1354180-1-alex@becholey.ch>
References: <20261113144432.1354180-1-alex@becholey.ch>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX6PGOOnuZNjmM
 zVo04bPk1d7+Vw6je7dJ9uOMGV8tqWM0soPvs9FXE4dCaqKQj26awAM2/nEbG5WkHU/PAmGIV1i
 Lr/u4MuflZDDNIDrK3DAKGZM6SUYxJE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA0MSBTYWx0ZWRfX/MXVUfDaWjff
 tkYbVvHgyehPRhZTAxf7HnM0TXbyUa2LZdUCYbha8LNUhHQe4JKC8Ufve2HILSic12QqhFxIDot
 usOkQh8HbUHnzllr8FRrDWggnsJbgnttYMeOapZrfO8pm4pr7gY2grdxjpoQCo0nYE03Jl62jaM
 +IhbakjU66xwB3PwPqyFl7ixeP5nUTh/a+6HkDu3GFJvYSfelXSrKeMUzflsZmc0i2U2ppKi1cY
 RwzLeEwNedwP31MOB/joY9eLgr0v6iSAJwa6R93kAC+MSV3NdsraCYT+8Qsvcy9av9PObJp5hqr
 abV3SCTfSir71P83/lZHPg7WLG+XIwAz4yi7Ah6uIIX9IWR1HhUliTX3d8D4rUZI+gTR/ZASSer
 IN/Poe+pMmbfeRIUWrPWK/FYLcTQUXXe450sMB3jYJZx3LfyzYxL6UYy5LGVvM500ct+FgdAhsO
 VXCSFBl1oyid3QNRiMQ==
X-Proofpoint-GUID: aYTxfd4FEJnV6bzln5DqlBJ-uURLO3kP
X-Proofpoint-ORIG-GUID: aYTxfd4FEJnV6bzln5DqlBJ-uURLO3kP
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc2a85 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tYqXyjVJoe5DErGjTNgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170041


On Fri, 13 Nov 2026 14:44:58 +0000, Alexandre Becholey wrote:
> ljca_gpio_event_cb() takes the pin index of every item in a GPIO
> interrupt event from the device and passes it to set_bit() on the
> reenable_irqs bitmap, which is only LJCA_MAX_GPIO_NUM (64) bits long.
> The index is a u8, so a malfunctioning or malicious device can set
> bits past the end of the bitmap, in the members that follow it in
> struct ljca_gpio_dev: the output_enabled bitmap, the connect_mode
> pointer and the irq_lock mutex. connect_mode is later dereferenced and
> written to by ljca_gpio_set_config() and ljca_irq_set_type(), so the
> device can flip bits of a kernel pointer that is then used for a write.
> 
> [...]

If you have an LLM write the commit messages, please ask it to be more concise,
half the stuff in this commit message is just slop.

Applied, thanks!

[1/1] gpio: ljca: Validate the pin index of interrupt events
      https://git.kernel.org/brgl/c/e6e2181c6920ff59ded349a100f80cf85d074601

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
