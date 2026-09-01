Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E6471D02
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 15:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278241; cv=none; b=dRuRyJOt2ZJIJLV6JMG2z8n4XFMvSM2CUFnlPdwEhgAcszHhHKgXL1a1G4qGcx3xY9fpIHio4S0J3WDCi9rY6g8ONVDvBfueBgyIlBH1b1ibjQzPjn8xMgiUlpwLFbl5IjGeMckOdEwxDjppTu4Xgm9Rl1Opwa3SJAV0qpGdl1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278241; c=relaxed/simple;
	bh=mI+0OCmjkN8IPzMXzsKrgMBigNKPLjrQDoxW6AICHxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=edDh92LV81Jt0ves5mllYg9cfY+q2rHTS3v1GaTA3Zgdq76ktPVFRrbCGcaQdmOL9drheyDf7viiIVn9It6YWehtGyWZpCZVm3qY0FBNr6cOe9wdjFsfaVGH4E7CkQ6EvxqPe5daRPsj3nL80R6gPdMFUaK6sbfV23eN9L/0Hic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YyYgO54B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g3z966p2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YyYgO54B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g3z966p2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E96rk2912189
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 15:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=; b=YyYgO54BuDL/0Tfn
	tH1YRwC1B6H3WYDkK1f5L1UDkYhlPijHEtr9bJ59EmTVT9hVimetw9nrcQgFuoL7
	wcVcFuhOIWnEXxCBW3nHVyBKnTHV/0HOpAWIc/MD24k6kYrjUQdpWYlzG3I/NKfG
	E6hWmVGm9xHbaGRLrZdypNuFvvHImUpzcCk1h+SkQF5SYzpC5zEMb++AFC3+tEHL
	p8Psntsu9KuEJkC6QbyRlnaT3Os1LHgnsbKgQXgRRlpmEd37n19vLEUuI8FRvv+Z
	ggF05gcfeNnpxAZXxQosTYSZ8tuvnUFB9CWtAlG2Tgkxb7+TCq5zmLnCjKMeMOVO
	0u04ow==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r39tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 15:57:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e88a0e8dfso416596d6.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 08:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278238; x=1788883038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=;
        b=g3z966p2x5SiZPERWDgDDOAOQpE8A320wtu1Mc6NG6EdM5vOozsi3RPczaoJMHZtUS
         YZjQ7bP96kPscTdn6jzjeBW+juImT6385vLSrIJ2a039KYLAfvS97OWZWsZ8Sb+1j+C2
         icxFD3UUnGXh7uL8mVpkTl56n9Cl54kLj4gsi1XQsSDSSJQvuAdi26e8gDvv9NDlwlTa
         BrZV0dM0/lmibCyMSJ4PxscBA4EXWKEa9YFDSG65rf5x2uzhtUbp2yts2oScGme76FuG
         +Ge+qIdI8RmvAvhGYBZZ0uoGG1J6XOFXDEgIPCsoplsJ4GyMOtan3d5mAkjj3yENTVmQ
         D0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278238; x=1788883038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/OQCwLQW/6OFj9hLgRG5zobTrne+fl2iMm+qRPhRWc=;
        b=K3wKqU8hmNLy7B//KzvfcmhDxS8c5gYY16CmOi0EqRPj4IrY2ZLKIDp5kXcLAgOD3g
         VqlVODQLeZyksqxjetjd7DSDNpndjtCAbEuaVpwBPYzGauYnG/LeOmDNh4zZoeXmvKw5
         sbqspio7hEb4qRfEvSZ8yXWiPX/gNka1rdzrdzAV6SQIuX6iUAPRSs8cCYkXdLs02nxu
         fb/1999eAaBJDF8bV7yezeQIDQkvZpLtS3El3Cf1z0/JOV1tAVBsrUyOBz9A0pxAcKd7
         UQ07Zpzgm2NO0WlbpAWFIgG0phzGCslbQySBztWLdQFpntXynvgHiBMkczi0IP/JEigT
         96hw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7TSChkqVjSkNgsXzfuG6N57BPvEa0WRMOFIc1c81XAQaA1KZVtsAcKhBluUkkkvcy04ELaw+kNNtq@vger.kernel.org
X-Gm-Message-State: AFuF++lz19bavjLlPV0knR/PTlsWR+gZmQaZTtalZkcATxSPcYmdr3RM
	eQQyi85dbS4U7GBhAUUAR9hIIjflql1HER1sVgc0qSZ8jiLP/VRAsD32hZc3MGEzkoSRv3M44l0
	j+DUknMVuCgrUkb0TJgfoljaEBfoRmTbjbc817xUaGcphDVB48IHid4CLiS77aEme
X-Gm-Gg: AR+sD12VtshcMSdYnBFGXv4zqtXs1HfVzxY9U+Aw+FPZizNHtqYyCxVCDm+bMRtxNzv
	xFoGzsqizDIk9RikCuzKYqyAV3rwjQy1EU4yAeVyHKG/EAooPMgC6QQUymigeCu7enfmXwhLP7b
	3/kg56/hO6n8b9JspJPXfKZB+y7Bood/0uk9OM6mdgG1RN9HiRBHses5EWsJ9A/ZRxGZJ2ULb3j
	LRy2qsR9tYxkk5zgzMgy71ioLXr5+gIgYhMOURuzlBXO7RC5SHjlHKm9OKL6KmtJz/xAeIf/xkg
	ZARPjyziB7P3g8eJkV6pUunyyYoWKzLOcaZNbRLPu0fsDDLsioLdNS4QMcnhH1y54J7Uh9GDO3p
	Xj0f16zARcJio3EFUm+G2mbklBA==
X-Received: by 2002:a05:620a:4009:b0:939:4b31:4669 with SMTP id af79cd13be357-9394b314723mr951627585a.29.1788278237989;
        Tue, 01 Sep 2026 08:57:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4009:b0:939:4b31:4669 with SMTP id af79cd13be357-9394b314723mr951619585a.29.1788278237413;
        Tue, 01 Sep 2026 08:57:17 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6eafesm5366057f8f.24.2026.09.01.08.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:57:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Daniel Drake <dan@reactivated.net>,
        Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found
Date: Tue,  1 Sep 2026 17:57:13 +0200
Message-ID: <178827822449.38953.11000538311935272937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260815-gpiolib-of-hog-flag-leak-v1-1-6126aac5f6f3@nexthop.ai>
References: <20260815-gpiolib-of-hog-flag-leak-v1-1-6126aac5f6f3@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96f5de cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fwK54NpjPF0WMB8fScoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfXz4NKPtgW5nks
 rm8SQdKGu/at5yCV4nuVyTsOeP55Sn4ZgruJKd/CuPqK/oovH5g6JyxCGK2sNVn0pfvAReFCDss
 EissR//QLaO46s7W0U8kpymheHi6TnZZQe1Hx2PWd4Ucr+lGsbJLtQoOHargTXX6w6P6X0WBHjX
 UuJMx3E/Kp/4+zNuJHVjTQjV6qp7JQ20IV/KpnLsKGWUHH8iWNDiRwdz0hPnke5H5/MvAmHTun+
 uRAqc2vI8WYtrylJxFuuMCHkYdWOco4L69vJ0VpA8pWQyrHeyqVKcrEwTzaRgDQpmHJ1F06HGe/
 qNOOaFKhThdR5cI9saBXNEgROr8Pd6/QAnSxdubJa1yYjQd5oEtG4/ZXXHMmUUfE7MVNdVnL5wK
 v14COJvot66ami3i6eZlnRl5AlXGsejdR3JUN3GGnhryQSG5zxQ+CFn1G5Dyyh/aWmj/4cFpPvO
 lpn6gJIOHEvRv7nRUwg==
X-Proofpoint-GUID: lb2h_aswRLsanC_tqAp9tTAbamnfSWPA
X-Proofpoint-ORIG-GUID: lb2h_aswRLsanC_tqAp9tTAbamnfSWPA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX4+nkULJ575Zu
 UX/PPxrgrXsbkAcBalCjXJeKsOI0/SU+c2uTBRyiko5rq1zRbTFYVMyN0LCJZWPf6Qta/Rnwrii
 6KtkzMZZkawBuzvz3DoLtLURb1lqZqQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010141


On Sat, 15 Aug 2026 13:44:19 -0700, Abdurrahman Hussain wrote:
> When a gpio-hog node is attached by a device-tree overlay before its
> parent GPIO chip has been registered, of_gpio_notify() sets
> OF_POPULATED on the node via of_node_test_and_set_flag() and only then
> discovers that there is no gpio_device for the parent, returning
> NOTIFY_DONE without clearing the flag.
> 
> Since gpiochip_hog_lines() skips any hog child whose of_node carries
> OF_POPULATED, the leaked flag makes the hog silently ignored when the
> chip is registered later. Applying an overlay containing both a GPIO
> controller node and its hog children - and populating devices only
> after the overlay apply completes - hits this on every boot; the hog
> is only applied if the chip driver is unbound (which clears the flag
> in the remove path) and rebound.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: of: don't mark hog nodes OF_POPULATED before a chip is found
      https://git.kernel.org/brgl/c/1f1d0812f6a8ab8e6f709c599f137c99646512cc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
