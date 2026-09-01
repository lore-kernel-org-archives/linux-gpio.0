Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C7043BDA9
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278133; cv=none; b=FKi0uXf5yRZtP/iAubLqcgxyZCzaQrqnGyemJ9TqGkdn2Wl8KeHfiA1MTkbZ8sLMPXjPS422krBmMNNWQj6PrECQD5i1EeZ/Qh3D5GdImZHtonviPqoYb9OzWHspZacd0NpvTK5sRIArh+eEAxh08oeK/0PW/pdjvHdOjfUJydg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278133; c=relaxed/simple;
	bh=Hjr6pu/eagjal8jxOhPKaNfXz/MD9nUNeSAS7UrU0Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vFeYM3fHc27vjy0N41zWKcghwnIxLf2dRJSJj/OC8p2BBbp4WWWl4oxqZ9zlwhJLs7V3dcignGt9TXXhuUEUgw4he/r5hrYB/xkVggaZuF+skmXXOK1qrAjbW+sqAKn02HTdK8/VTwXrey7K4sGD4Jivcmk7AnUq2PqbYl4Xz84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJw2hfcD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gm9o9tgO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJw2hfcD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gm9o9tgO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8dnN3913701
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=; b=aJw2hfcD0xE6Y2JE
	RO6PCw0OKWHhRnvXyTWO+QC2yvb0+Shi0Ly0vnjiJ+7mKm3NZmNf19tc+MtVRr/g
	QazNQoPOR+QdBI/i7t/GwZSBUWUhpbRW10BhMDUyoKcR1CUHfgvvCvgSi1D6lgpb
	7tw/5dnUoi0PuCjWSBKk+dfOgYsYcz9H+VTU60n4wRQvuaQ0yLiWHGaJbdVJ1dKp
	B6LhVxtRpn3RNmdlhpnGU3CvKkN3K8UZ3Jc05KJPYC8YoJD4Dug34rsBw4LMjmeN
	N+O8TaWQMPeGWJ+oVDYww50Wd39SVQZ3RL2m7g+V9+0QbxxwijAOyIWtgQ8xhDJI
	eUwgwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu2hj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:55:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso204308185a.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278131; x=1788882931; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=;
        b=gm9o9tgO9+Lac6dh9vc23l7qJeUx6R31lehhmLEPjQXtQOsbGRRjJ24TK4s4hy7XSn
         DJMT9WbwTKmRzH2vKgv9zaOQnEhciuJZG77G0Q9zLrEluCjM5XSbKLOL5F+gvcIKW35q
         lMCMJL6thjuePp2CVchI6y+DFzgQktbZOiQUwGC8417/UcpCJiPAQg12BdTSf8lF5xH+
         m3O9QCO9l3Bc1oYiUByGjcDVD8Gd6lttWbETu9+NsAPN5Vvvj1MX2QbwUCpwX+BJ+IE/
         Gfgb4PYeJEV0AgMy2yUbOj/uh1kRdcA+PUhGZtPwQBRJi4nkGw/Dbzf9ir4DaH3O7Qff
         H+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278131; x=1788882931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1LD9xwtAYsfVMIBHE/konIrPFCY3x9B/N2DZeQ9+OY=;
        b=MW3MDLjPb1roUpH4KKvkQ1cOTIEBgzgH1zb/Kn8F03pjCL0mVWtY+H0Y0bblwjBiVE
         HvgEXTQNeIxdvMNbQdcgD1rEjwaaktbydbOop+wAJUt8T2//tCbHX6dglPur7CF4HtCt
         cKwoPm3g28eOPhqIYH7hmQXnhb3Ng315NXf3VwvBda56+ytK8mNTb6/DI9DikaSMgWtC
         fFubUkwfxXVPyv3AupI1aug2aRzy0FYf3Ckvv86QreRAHkYNhAvEfThQb4jXGoGv8t87
         EEAohTSEdjG4VgomKAzL8Nukxt4W+vLj3PjNvpdGNu3B0edsNNH6wsP9/7Snsdl8uuvH
         wxVg==
X-Forwarded-Encrypted: i=1; AHgh+RpnhIk5/n2HwrD/gUsohB+aMSRfAZW1Fg6m4x21Nf78QFTBUzhBE8Z/ztFPqXYZ6o4KiofCRVRzDRPI@vger.kernel.org
X-Gm-Message-State: AFuF++nokZQA3yZhWWHAYPiLq+EBKmukmkSBY77mfu0bAbqQB1oQbDvT
	QeSCxhtyzS6SCE02jn7K4r+55oql/c9sHjkwIKqBT7DQaNIkAzVkyD7Dr/hI1nlC6udqFyfkr7N
	SpddkP+jqj2R+HSjwWF3DD3Vsdodfs9jCgERwtOv+WrRCuIfo7oyHcWpyeOEyBjI+
X-Gm-Gg: AR+sD11pihcpUxniBAV0fDwNebIsIkXMpz1GEiZFuir3fc/hAzAgYnBa/Pm7jheL9RJ
	23OD8SorIbSsvbfgIBsPg5bxJ9WgtBKnD9K3TduyZp+hsWjuXKQs7x1UKOasfcSvBo/MvxKCJEj
	LSB/I+WGhUjiamDBS2SnhButa5JB4ZaxIN5Cj0cZYQooK7YGHwc6kYbD2wvjaEAWXqidsFE4hQm
	GlbM99u0P3B2EOgUR1zWRg8oz6G02GsjNYriOUoN0KbCKM0w331NwyyfuWOPnVac81+eY6JfERx
	Ymr1eMxlWqX29qs93gBOUS9VV3zI5Tra8LFCOrH9Khp4Ozaud6RXO3oVHPAYjuepMTWoGQzpSFg
	MQ/7MNZwmLVkgECJTHT2XDi0Ttg==
X-Received: by 2002:a05:620a:371b:b0:937:17f9:da2 with SMTP id af79cd13be357-9394bbf52a7mr824121885a.6.1788278130631;
        Tue, 01 Sep 2026 08:55:30 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:937:17f9:da2 with SMTP id af79cd13be357-9394bbf52a7mr824111685a.6.1788278130012;
        Tue, 01 Sep 2026 08:55:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c94bsm5165318f8f.12.2026.09.01.08.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:55:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Adrian Ng <adrianhoyin.ng@altera.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, phucduc.bui@gmail.com
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
Date: Tue,  1 Sep 2026 17:55:22 +0200
Message-ID: <178827811897.38653.11753666556124365890.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260814043028.12548-1-phucduc.bui@gmail.com>
References: <20260814043028.12548-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX/IJTy7ovMLY6
 Mkw/Q+L+8R2gEjGFX/K/gE0Hh+K0ckbrnt4pSm9gLYikVOn+IN8m7YsHHZd/CVX9VDp+YWOrnrD
 g89CU7v6dzg50h3FX0E5xJQD+PHfMSiWus634+AzwDn2TbTQt/TgJXOnoog0Ny/MqPdcIsGc0wS
 Ud5OVuytkIsC8Ld5iLYkdQj2eTLbMBpnoAV0PwVusezv7/zd1k4ychI13SU4FMuiqWrZlRXIiMc
 3iTUcv4evJb1MtBrAXp2NPmQ8B25sdG07LL34oI7BPwOVIhMu4f7Jm+913JWFXO8WQrPeJ69rq5
 G4ttvvZ1hHm8vAqPi7pOXT2o/lCm7yf8avi1c4Dl86H2EeOC12Nmq/8nOpRPatI24jRCEcAGUu8
 OcpNJ8kInJ4nqYC9EsCRtbuW6+8WnpwBg4uQGAiAzDRlHufFV9EJtoaLrzehEdN1w70yiDkmBJm
 rr0jzovduC4My33IfLA==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96f573 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=YjrwkAG9RECl0-CX3-0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfXytamu/vFfVzE
 uLk3IZ3kQosKIr0xqVgL8orTFMcI33gkprDyoTUx25wjbE0JiVynx9L4AwcLNtJyTL+Zivq3Zkv
 vfAPyJhWlG7PVieeLtDzSM39V86tVrE=
X-Proofpoint-ORIG-GUID: 52qWjotjvm34VlVqq7fpRAPdQN339IhX
X-Proofpoint-GUID: 52qWjotjvm34VlVqq7fpRAPdQN339IhX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010140


On Fri, 14 Aug 2026 11:30:25 +0700, phucduc.bui@gmail.com wrote:
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
> and -EINVAL, should be propagated so that the caller can handle them
> appropriately.
> 
> Propagate negative errors other than -ENXIO.
> 
> [...]

Applied, thanks!

[1/4] gpio: realtek-otto: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/ef0d275786a3c98d1e52f1d4d89183c802af58db
[2/4] gpio: mlxbf3: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/53ffd779a094d5752551dea2ba7bc787aab29229
[3/4] gpio: mlxbf2: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/d8aaf6b0fdc835d10c7def7775803b28ebfd4d81
[4/4] gpio: altera: Handle errors from optional IRQ lookup
      https://git.kernel.org/brgl/c/6e6e585b603e4f679c2a33c8f0954ec88b52fd7a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
