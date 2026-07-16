Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12F73BB11C
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784188730; cv=none; b=fST/bvmMiZzJ4gLGuebDY0t1PROvWt8TeTOvPlvWJoZauBSOCEWU+q4Ka6UHGPE3+yNfeSpPctebWa7Q9r4Wu4m6b8OmdaS5Y56UCENU6yXEitMOYUjfZygPJR+zx+wRVP4LRzmD5HIsQTuJYeIXFAsITdc6z+lCudMQATbjxi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784188730; c=relaxed/simple;
	bh=xkj3CbNtpsQQELF6vqywDuYoJlhxgXl2aCyhWd1IOiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BlYWrjsfvij4jmdKy4WKHe+qvU4nqLcJL+OUSkJn2tc2lbhDfhT3klyIpPYuEF9hOXHHhiJRqNtG2AjrnT9yrj1C7x7PfbH5/Cd5Up6Rt0X7c+jkIoLuC12G9JOAx26gh6HqQkRr/AKURv4LDMf168iZABYll6kGXhNV9W1y1wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQcy2Nur; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SoNPppXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQcy2Nur";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SoNPppXc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7DxiU2115330
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAdwQyzglCbMhJebgMRFMHDqAC+jZDAVHlge28Q8bBI=; b=hQcy2Nurynypdna2
	+WeKTTBMeDvhyILnrDiGCJBejeLVrFwiBMz+tmywAEIXfPbp8OyLnpI5ZPFfbi0A
	IoPb5rfz8s469uYTO2d22fRv+jhTTNLVnbBMUmcM/JbilNMEtjnaF+8KqzqrV7jg
	3K1xs/tMyJAN2zJ6JoSJxQyLTTw9Q3DW/C1RB6CJUNKJEdMDxZ8rwQY3PcWvdvvZ
	PWdNHePYQATjpNj+T4LHIiE9esoYjHBjZukdjsm1VNh89x60i8LMvfViuesShPsA
	JVB8ttyhrMNC6gmqzf23kBXET1/ivyU239FQbYzfXukNaDXeylTP2RK7EJmEsioo
	HCzN0w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feeg1jpxr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:58:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so87566671cf.0
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784188727; x=1784793527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RAdwQyzglCbMhJebgMRFMHDqAC+jZDAVHlge28Q8bBI=;
        b=SoNPppXctUx8N74oRu5FybQfri+nkVThBaMv6OVeIaPs6Shk/g8qz4u2AA+HZ+DGx5
         b607AHBBrPmn92UdJvf1c7tIFrBMSZriXc3LT113MFYrBhXRGElX1kYTJ0ehBRSv18/X
         Fo00oNTulGuwIgdNFqJPXOkdvzizbGbr3wCKtvpVjrJLEwL93zUEfkmkJOJ2MdZafNn9
         uXRWp5j007areQAbe4OFkiIEydCh8M91WQnCisHqO59niRlH5RRj8Rs8OFlnJN4S396N
         4dj26uSKrlnMehn3UqMjnQg4VVRCWK2Hh99jY1jjoeRkO0gHZq4ca6sP/Dd+3Xg6mpTd
         HpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784188727; x=1784793527;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RAdwQyzglCbMhJebgMRFMHDqAC+jZDAVHlge28Q8bBI=;
        b=Pvt6pzaJRV0ffMSCwMz+6BSnQMJeNGCJz6+0GMo6RMMvF+HjpDOtpPSNK0dgO5lqGN
         wPRNvJuANhEmyC8Ye2p4W/rRm8HeZuj/dj1mh6mapbVABvRUhhX7z+E5+opU4AWlcxUX
         xK3wBbqEy/0QERhvfT6M/jMR/Wl7g2650m4h1HTJFCJyPv+vIARQVCuvbbLva5as+kfr
         2+QeO+x/aNC6HUm79NzDsKKhKyiMSi6OruGADMMViFjSIBl9C4cor7IpKQQLTef2onic
         NfYUMefmibiCu+sZHJgZGmeLdBHCow7GEbnOSDDyVddzItnqFcGG6W7BlTuzC8ZNyasD
         nBZw==
X-Forwarded-Encrypted: i=1; AHgh+RpgvIDSCBxuJtGNESfgsi64+ozJmDRrTBgRwWesuacUuzgI0XPxc4P1v4QFihvQqb0+r/xcvnSBMmlq@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6fd1LBwB3alSDajBXUxSZJbEdz2YJ0DEuZ/D9xTq65FFRO+X8
	CyByU2yI2L8u+cWpVBwT0w8Q/4n7Fg3t3gohjyod68y8FqgLoQq1jcxEq3Mfo660SdyEM5Vk0u3
	ZPEEQrwTLbDAazXFvEztbuIXCDVHb/LG9lNnijRFWfgm07nTw9pLLDA12wdjx9ZId
X-Gm-Gg: AfdE7cm3xbM5x9LOVTumt257ULhVY1yaynpfhG/QRg8qXpxQl5r0jv+UaQaVEw9etZl
	VCSjvuesEousSZrvDUUoLJ8P+a1y1V0FrjNoAJ9fgfxH5NycYSf1BKZSiTB1wnuf8beAOMi6PZn
	6IfS8sM+HXnDNQ54NNTfAkhA6GYqelPWXwwY766MSL7Q4uneDqHGwk1G4u1U8O7qWIe/hFxUETq
	r+sONa2C2vGq0zIR45LDB+iwYPZPi3H40svt9ctMrb1gGaQtAg3qhHXeeJmtSlhHZBm3pmE4PL2
	N5HUW8hoRb/28UOwatyTNqqHxxmOxNpQGVSmOPEKUEYjqGhEIP2oohg0eSjg5Kyh0SzsmEJx82Z
	lRSQ1AKVx6YIQnYNgB0qLwRRmUQ==
X-Received: by 2002:a05:622a:1aa5:b0:51c:504:2ef7 with SMTP id d75a77b69052e-51e3c33baeamr114404241cf.67.1784188727272;
        Thu, 16 Jul 2026 00:58:47 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51c:504:2ef7 with SMTP id d75a77b69052e-51e3c33baeamr114404021cf.67.1784188726809;
        Thu, 16 Jul 2026 00:58:46 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a63esm22876616f8f.9.2026.07.16.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 00:58:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] gpio: bd72720: make read-only const arrays regs static
Date: Thu, 16 Jul 2026 09:58:41 +0200
Message-ID: <178418869934.4524.16365988098606564304.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714170258.186766-1-colin.i.king@gmail.com>
References: <20260714170258.186766-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX/BDZNpYntPF8
 Uq6T3cZPuQi/t7Wrd+N6usCP9v34CqxbvXmz80aRix3FWU1b7UVaVq9VSNQKvP1kBKBTnydU3Ql
 YleZsoUOpYdLGac5EaLanzUBxI1FcHaXlhoSxA18g0DT+sDQuXtPoRAV6mNsM6iZ4tWJnovjor3
 rYRJLPUBczDukmZ1eTfwpaSFJ9q2pGUDQwt1naJwSzR2DqINz4qmH7ltYKsEk6fsGpjzHTAOAz7
 O9k7FM4anJXBJVGLUaEiAzOvxnNjiAetJi450lvORXaj/xz4/kskYFTDLaIdgRsbwdG51kBvkJi
 gMHaZbvg7AXkfBYaBK839aM9PqZTK0NrBYtAe0QD4u48jrgwCdlP+9MqkEzSiEwOGqPr5YkTQNO
 GwG5xqUrJSxjevnCg6xABp+7yuQYzgVUxfIrKnrjSaHtOsjGUa/EYtM/addiW5fC5aa6dh/iIBF
 IHce/L7OcxpcdUL2Ssg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4MSBTYWx0ZWRfX6z0A+NB/VktD
 +MQXXekAYAj/Tw3mIyYB/r+7FNcZlGdw5IdIHtasEFoXt5fQjYZuTgREeCfl9jGTpwhdrXVJvAr
 4xtD1dS2uft1yREyscPG0MlXAdW6OxY=
X-Proofpoint-GUID: Ai8xfxRsqVnCSSb4vq7qGXTmYbQPrSHm
X-Proofpoint-ORIG-GUID: Ai8xfxRsqVnCSSb4vq7qGXTmYbQPrSHm
X-Authority-Analysis: v=2.4 cv=SsOgLvO0 c=1 sm=1 tr=0 ts=6a588f37 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5Y_hXDp08lPRMBJS8ZsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160081


On Tue, 14 Jul 2026 18:02:58 +0100, Colin Ian King wrote:
> Don't populate the read-only const arrays regs on the stack at run
> time, instead make them static.
> 
> 

Applied, thanks!

[1/1] gpio: bd72720: make read-only const arrays regs static
      https://git.kernel.org/brgl/c/a8e59e3ac9f7f7154e0e80f45933799da8b4dc89

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
