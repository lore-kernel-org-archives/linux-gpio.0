Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D314718DC
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790583979; cv=none; b=GGXuaj0LqYUr2VTzR7YxfHBD+pBkULG18o9UAYwOCkc8O4H5sj1eXVCpdMtYMIGl2C2fZji/RRF50XSX3GGboiQSVXHN3bi8ZErTQeFqzdRQLCCoXIBqE/x5r7Ay4PUol33PTgxa3lVa8TyFHuUqTH4qWWFRI9WvUO6R3iiwqrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790583979; c=relaxed/simple;
	bh=O9FVM4oq61tu77EUmWttNJpUlnBtfOplel3gkh8wJAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9JN0zZ3fkK5RH+Djrn4C9T/k8VhxkYyiIvhyOWX7P2PM0fILt9if9pJpYxkvkUdA8fXpIaWRsf08jGG4sIhCMh6teE6Eml/t5wZZRCGwBz6BLHkfV+6qG6GZxkbh7zjHw6KFYLayDdRig+na2HZwC7YOKVxhZq7tmyRnZLBMgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYfpOOlH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTtC32Ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYfpOOlH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTtC32Ev"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xNWi1010230
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=; b=oYfpOOlHfrhYgjZf
	yfWUVqMSpV9zere3l6ZpI7kjRkFXd/83ZnSK0ahwfd3zPEMJkYGe0i/JXF133Lfa
	K6MUpoUVudt2lcS4g66fQ727J4W7F8//AgYst2sOn4/POa8NrAUGS6f3EaHujq/W
	9D/svih1YQd8nqsdXi/NWL0qL9qzJ++R6CWmswX0P6g+EuLA4pnonDCwbcNRw0Wi
	qqeIjvTY1wyC2pVOaX7X469MWo5PcfuPUTvfhnhS0hRDBD5o+HYCxs24XlZLqqJa
	QoIErxUERH5WDlUcDag18u6E7QyU2QALE/RHCml2nChTfmZW+OyfrkVPj2UV1C7/
	e0BiQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj2s0m5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 08:26:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1de6d5c3so725553785a.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 01:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790583976; x=1791188776; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=LTtC32Ev1XjhiUVZHtlSIeDBAhDjWTO/IMPr4ZO429Oqqt3EgqpeWKVHkZ+MpVcsEx
         X9ao/NRt0RLRDfcatd41PE/KVxFATu66Tie8N/BKFXDQseqCZyzhWnt0PpDI1Ivxbxfg
         Y+0q2fdRzZhdyfpPGxVjqsZxjlDY/oL8x13wznzApv9lt/wUMAyXwYoBtOtkjxzBkTlX
         yOo37zXlmA84EeSmLq5x9qpxsLjz8BMeNhlMALn29jBbapDcjbpSBBPWSCBa5pPSceqe
         0j79HpiZX/ZiulkhO3AxtinUjkRHfeDsfqcRg+TXxWgPR5dlKRD3TzGEFApPjaUl2BY7
         Vb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583976; x=1791188776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaRIHfyS839pnGmtubgjSGEcFcrMTPnSFxHKmD/d3ug=;
        b=sNBchbzEpCO0klnzT1yMeN4evd4RDFxV7GUol+uVTWh6hvt2DGPPKvdRChQ7mrADKI
         3FMsXEAto7LCd96OcXrHxJ2e1oDEZzT9Z87g0oGdE3wPtlXnFqX+u/Oy1WNi1BTC+Vph
         5/6/p0aRpwjG6kXxoQfxlwNfUTKxS4aMfBlAE8bt/+rTATo9ELvgwans2mjjriym43S7
         1ftcWqKkIpLue07c7PSVsiWcrKSpsybQqhLt/ltBi0kToRaKOwKGJeesq7TmiMOg3lpT
         S1TdsrlnQ06ol9b70jvI/sqfWaOj1F9D3Sep/g1UTEItGflXw9guqF3Y31Qa931ZtPrT
         JAiA==
X-Forwarded-Encrypted: i=1; AKwUvBwnjb8ZZnDYiAEJK/M5GvXOpMV1BzOVq53uFb9ODWQBirSmx7RjXCtixw0WZ07pSf7XjDdL2wGCoDAC@vger.kernel.org
X-Gm-Message-State: AFuF++nsC2cpstEO5IQHYGa5dn88Tt53rAl9iL7fo8FVo5WPH8wu19DK
	bi3VPe1ZZ38ODbZdW5FFbatOqi6NnBsHftvr+4N/fuX3uXo8jlx4pgpoSCmOHtxtbEkwOgLCf5O
	i11WqPoPLlaov+0UHrqm6Y8Ukw8kD59pjw/uHQb3tO5og7AkNMuMdmuyRrQjxwABn
X-Gm-Gg: AYBFou2WKHY4Y7aoXuEx6ji/d59i2Pv/ziq0I1197yBu/DdG8jCuKuoEuMw8WLDOpsK
	TE68eWWAyTHqvEeng/eOU5hKZUyb8djeEibBsscSTZ8ld8Zly2E+AHTP1Oxn2ksBhmTyJrH3M5V
	gAso/6f4cNZouBUikybvtcPdWYEjFzPzr3Q0TnM1qCYzuxcF4V85V+zVbSe6nI5AI3x0eFN3vnz
	bZGk2mKpHJvdqRrUfDEdLQjglBzAhvKiLhiGdcrBwNDL4LVfFBtu9j2E+lX28SbEdCmJarAnNE7
	F6CEwJPqFmD8X/ezp2htv3atpEZwz20XTQL+OCJioCc9giqQ++535WnhFMjDUcR+agKj5lqgXFC
	LLWNBWHdmhbXN7Rdf2D5nzlhOZeQ=
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530357285a.52.1790583975958;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4381:b0:93c:7955:afd9 with SMTP id af79cd13be357-93c7955d94emr530355385a.52.1790583975552;
        Mon, 28 Sep 2026 01:26:15 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a746c57sm24546686f8f.35.2026.09.28.01.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:26:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>,
        Prasad Bolisetty <pbolisetty@axiado.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
        SriNavmani A <srinavmani@axiado.com>,
        Karthikeyan Mitran <kmitran@axiado.com>,
        Michael Walle <mwalle@kernel.org>,
        Petar Stepanovic <pstepanovic@axiado.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 0/2] gpio: Add support for Axiado AX3005 SGPIO controller
Date: Mon, 28 Sep 2026 10:26:11 +0200
Message-ID: <179058396966.15719.5627642110789688777.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfXwL2xovCATqze
 sRSHeO3BBGUf21uFkttACRMnM1lKAOZKEBcPNaG63gKJ9r8ssNqUQRz7cZKIl0YPkZPYwPAA+4o
 FphEVVg0RAETrY2ktA+z7r6WrbhtwSVeNJg1i/qVcwBtYWV7eyuPXSirPfygV0fuVErHyiNE4qd
 7HOqjoHsBg/oL3uQe4QxUgaGg9GK6MGGzndxvkggT9coclTjmI9IwRj512SIpgpcI4/4vy04Qa3
 JElJqkE+n1rRsKeXFti2U1D56MrzOuR/Pg4b1+TDB+xnT72yN6QjB8Ri8yry7L8oiKHKVahLtmL
 5ZsQ/kNuO1Fv6kRLlhNV5voIV8HQzzTe7gnLhz4r7tFQQHvqBzbWz9CRxJ6gQFnGvbKkWOies9v
 f2oy53XVttmEmdoZ3Qd+ZCxxBBMr6z2/W9RNG/kPHml4mEbon7Kae2XvvYYR70yIrsErVt9g3MH
 KgCulYnS6Axpt++gv4g==
X-Proofpoint-ORIG-GUID: NJ9wPH-QoswqeFydYMt6PJYQX-G35V8d
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX9hFmWEvA4uDA
 bU7HtVoaeq4nG/ZQG4jFS37VIjft5bV5z7nKJZ3uHvHCExaCMJA8cdCcGH6DYXwI+THkrlJUzwr
 agof334XdNFLkOaK262TnbnxF2DWWOA=
X-Proofpoint-GUID: NJ9wPH-QoswqeFydYMt6PJYQX-G35V8d
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6aba24a8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Wkxt52mgQ5FUUMUmAjQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033


On Mon, 21 Sep 2026 00:20:21 -0700, Petar Stepanovic wrote:
> Each SGPIO position provides one input GPIO and one output GPIO with
> fixed directions, along with interrupt support for input GPIOs.
> 
> This series adds support for the SGPIO controller found on the Axiado
> AX3005 SoC.
> 
> The series includes:
> - Devicetree binding documentation
> - GPIO driver implementation
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      https://git.kernel.org/brgl/c/a7787b818204d6de78e2e83ded0155d8195119e6
[2/2] gpio: axiado: add AX3005 SGPIO controller support
      https://git.kernel.org/brgl/c/dd36a4b7f391eec4daa336c837a197dab0cf6401

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
