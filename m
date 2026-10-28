Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180467;
	b=EpQ9sXXhEjz0XjU6C7mz5ik9XrYnQEkijUC8OhbjC3/7KjFc3HwSKdIUGVwuoeQpgP1F
	 SEslH0QZZa8qzTtjtQhybENPngIKjSY4fExqLYXKwzlOhjSuhaI/r3OppaCOMPH7iYHxs
	 x6bd0Nk0WUPboKukgjaXG+NXeVe05jQ1+vVn1t3WWY540WxSINBURkSAeiMv+r9Hej8ce
	 1BPILFyy/Pe4wUXf3sUrOxRryyNGifjm8FrDxxCM/0O45s1fUfemMwj0rTWNBqqDmu/NV
	 ns6+ebUVhtEsutNytEInR+Uzf8uJ+71oB2yyrNJAXm/o/ePi6QwcTdi3VRQP6urNisg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
	b=kHf6f7IqGNo5pGP6u/twlQuwuafkVcbBEYwDlJv3JpuNgvb7m0NIbbWA29dWmTTdwCPw
	 RGUEtlzfaEk9ll3GQrGrbJa46nm03HCcSitj0np92UH/DHDFzVM32enJ7OP0pzI25mbba
	 aw9zfTR0HiUTBZGBzJ2Po+IrTMzxj3SP3NLPOlWXEHNHQNKINU7Nibpvuwa7OwjH5MC3s
	 cRmRMTqc2DPUGbq/9wBj6X0tWca+bkGmu6TBoNpxtOzUTHjpcMHPT8N/dA70Stf/k0XAG
	 6zsX0obIs5F16hsQTSSUm+i9nlLI13LQUihELu7mr3z4+YctLkscCGzi7I2CMNMaQ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4jWV9o0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8n2tMZ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BF0606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35BF0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4jWV9o0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D8n2tMZ6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K42i065984
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=; b=T4jWV9o0B5GPSqR0
	iXLOs4WMQznt73YcP5vTThWtO+rAvTqjqDolaGm7Mxw5bPxIVw0a2L1h2Vke8sVI
	PJzTh9X26bnc15ncLoAbuROHX+KN4YoLAKWVJ9nuYBDgo3Rxj96+FiuBk82OaOy3
	JJufsZ4BE5zaHgdbPhIydsTrcNgp0/EpWTjClUKMQo5pMuDA4wNl6/cL+jY5W2hG
	wZtbNvMoGF4mYXmMMRQSO3tWvsdEK7HF7We2aStoWB4/MDIEvaXtvWCcZ7FoYst3
	iMTkMJ0zWMW1CaqMWJV0ln8+/LuoXhwKH3UEt14E25IB9tgCSpz4PrWd/hXyISoE
	Fyjv4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g3fx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:41:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so111011085a.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180465; x=1793785265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
        b=D8n2tMZ6B3pA5T0WKQPbEpHFDg36rhvUMtY6y8ndHdufNaii1+hYsGOVoMS3M094rC
         yVfTuHe/pr8w1f1tGNpcl/ZnY2oAKspEDh7tYwhJW5/LNyCZMxgNlhi7yk88KxzkoH6k
         6XgJ3d5kwDjfylyGl1bitcJmLuPKXSAt9o41JGWwreMvnGi/qr0QXcXziLDq3T8mSCjm
         deW88GhDlL5ZKCgYNGZ/yjaTmLp3mA9DDS/VCGjTz+G3fEJfhwatRH5A3ClRohJWjq9I
         lNpmT1keR+Ng8rOtwGiFapxMh7HcVrGGgCnAP8207Bi25M2M2fps+HP36DzMf/19YK2n
         IiAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180465; x=1793785265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+KemHLx/a6AHtJGiAt24xzrIPnar7pThXgnPcOIO5w=;
        b=b9ZheRgz3uZwhFywT2gUyBtVDaLylAtem3M9kKZtj987Nf8ARGm8qFH90xEkKQZHuQ
         +kZNeId3RMrQt8SCyJ0dqCycAIHpQUB19dmE9EebGM75EMtO0pKcxonDI9fqV6T93AdO
         UJM74dL8tZpjr6LZUsWvQywIq188Y8AlhOPocuhcA+V1u1yQyqhXyogWTBrh3BWorHCN
         DxtkuXjEuzfMbIVEmJikgPL0AxkppV1kNwt9jqafCG+dP70KQSBJXOXCnyB+376uLUPt
         hS4hA+x1zfNhgWCAHXFlodVbIO6Ddk8e7eZMWe7y6TIBYz6omuhBL7B/ILDYjAIQ2CzS
         kkbg==
X-Forwarded-Encrypted: i=1; AKwUvBziVM8XRz4QCBhbdT1vfZTwb5KdHywu1U5OIGTLMKTk+4Vkd/s157YZftEij3CPR5auxEl7N4rQUbrC@vger.kernel.org
X-Gm-Message-State: AFq9FYJdTzAjeYRWKVx5O85/jKNuUzzeobSjzYqyGGIsXi3CkjKE9bx5
	u46jHxODN5Dnm4P+ZKqd6zwNcjn0tCpZCWMwI6jE0ee/qMUCx6RA0gKHDmoGHVPr0pMlEt2aIw5
	ZKD70yLf3i8fj3pdxICX9uGCfBF4KvCdYDbK/DqihtZSD9q160//xe/ibjhR9+Y5O
X-Gm-Gg: AYBFou2+MIy5reD7rv4ODU50GQjB/9hw7OZkE5FysVOgDppgBWgudqbhY9Z+x/YcdJZ
	rhFa3uAXpjQuVs6YVQQAwNJcyeU0ohq4yiJMNNXysvmdms/OJiD7cp+zXL3ddX+6auhesgoaiU3
	8eWAF7HiLjQkc1vu01UwoGL9DLxr30YfeRll016KGGdaHGYguHX1wcdiZWDFqSKygajsxX5rDZ7
	CYkdEcN4HeQn/YqtMv59t2SwZrcuNYq+2GDHyrd5Vr5womQoLOC464C/iN9YlHtyO2OlJZdIeXh
	Bjnj3bz4US5EoHxkBYifeJnyPIuv9kHTSxkWuccM85FH/kWYXW/TBt8SfdOK9SDfkjTI2t0593x
	IIfPjC0o0TmwbmYJr3Yfb8ZQEJovDVDjPd4iBqdj3KRdcOtZZNpD3oc9Lo9Z8mSFzLY4nW1FgYL
	gn
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr229532985a.28.1793180465459;
        Wed, 28 Oct 2026 02:41:05 -0700 (PDT)
X-Received: by 2002:a05:620a:29ca:b0:93f:322b:2209 with SMTP id af79cd13be357-94408aa1437mr229530785a.28.1793180464998;
        Wed, 28 Oct 2026 02:41:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm34882801f8f.49.2026.10.28.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:41:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] gpiolib: of: quirk cleanups and TWL4030 external mute quirk
Date: Wed, 28 Oct 2026 10:41:02 +0100
Message-ID: <179318045884.12328.4163540170233440130.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfXxhidEtpG0eGD
 4rzhblFAH3eYxK1xhYE0hwZGLG3Qn75MIqySGnHsYYfH6QeINZkR6sABYlNKhUVo3MtexwF5mvs
 glMoOydLc1RR/QF10aT90eH8a2bN+IV2bQh8qJ8DAdiOGSrDpXhiXW0+paSg0jfYD3iJAbSvOQz
 FdcgwXVLU2meOMiF+kOJyH1nk+GkRhqK98kHWHNMn0wTsN4w2A5uFQ18+GSp5VUc/lYK9lCAmps
 PoOBK/gW411I1oFuoZsy3bTGHGSInF1CNG51bN0Y3SarDNaD1MdhiMIvhzyj6U+BiUnIF15YB9x
 0J4+PAybmXkXmRrNGdk9JEoRUB6laX+UTz7IVNxzcKenajztQWmSVYGBk3G+ZT5KIR3q5q6rkT9
 o8yLEuBgPbdmNcK8W5M213qZTSOo9Dc9PxaIh1fMRK3fLkDAyvlDj3Gm2tiJjPQfMbHkIpJK8Vf
 a1U62tufX6ZBBUTUVww==
X-Proofpoint-GUID: F8osEmdY-FzFhDuNrXE-MIkT5btu-mnK
X-Proofpoint-ORIG-GUID: F8osEmdY-FzFhDuNrXE-MIkT5btu-mnK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9RPLDoKfv6G/
 qBxmpdrMp+Pbhp+yoV45QtLBasT3Fzne7WOqcISrr4Nei1oRezMlVqUXEYZn8tvw/iaAAEbwoTr
 Rl+g9Zxu4xlUe1vBloeOPPq3Sz/uugw=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1c332 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0dPN6wFaJHghg141mMMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Thu, 22 Oct 2026 14:52:44 -0700, Dmitry Torokhov wrote:
> This series contains minor cleanups to drivers/gpio/gpiolib-of.c and
> adds a legacy property quirk for TWL4030.
> 
> Specifically, it removes a redundant IS_ENABLED() check in
> of_find_mt2701_gpio(), compiles of_find_trigger_gpio() conditionally on
> CONFIG_LEDS_TRIGGER_GPIO, adds a legacy property name quirk for the
> TWL4030 codec external mute GPIO ("ti,hs_extmute_gpio"), cleans up
> formatting in drivers/gpio/gpiolib-of.c to pass checkpatch, and uses
> __free(device_node) in of_get_named_gpiod_flags().
> 
> [...]

Applied, thanks!

[1/5] gpiolib: of: remove redundant IS_ENABLED check in of_find_mt2701_gpio()
      https://git.kernel.org/brgl/c/d517aacf1e177377c48a50043982bb8f6e76d4bf
[2/5] gpiolib: of: compile of_find_trigger_gpio() conditionally
      https://git.kernel.org/brgl/c/ab2815bdba3ccaebee7d39df033a65bc8df98543
[3/5] gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
      https://git.kernel.org/brgl/c/0308963cb224c0b0d368072209a2da1a97f93302
[4/5] gpiolib: of: clean up formatting to pass checkpatch
      https://git.kernel.org/brgl/c/6ff56d6f181408a601b0cb777f34a2cb1735233c
[5/5] gpiolib: of: use __free(device_node) in of_get_named_gpiod_flags()
      https://git.kernel.org/brgl/c/5736f73571b2cd1b957d09ba3479275fc0c89f62

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
