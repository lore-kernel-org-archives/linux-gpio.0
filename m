Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399E457E4D
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981936; cv=none; b=jndq55EDrH/VEt44R1gBuLnvgUlmr6BfbzYrlx7gYMDpfqrVJxh4RVA4nHUigNk6z7qsVn4uegP/TYfM9W64V1lZvVgwKH1dDL3YJATnRBeeYOr2bC0q/d1KqTfTEwR4O9ElYMw/yp+bmF8AnnqyrdBfmWSd7uPQffRKZlb0ryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981936; c=relaxed/simple;
	bh=HQybE/rREyoJpbWUiRRQYe3TzH2z8xGubH8XzfJ9ZP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p9sm4GuaP1wCTeTDTYWl2hHAlge7J5fUb54bG7Ig/O8IA3kJ9pBWo4nv/26hnSrXYFihe+HA17s3A4uwWofCGNLp9IM9O7nsWnsvq+PNmiJg2wceIetldeAI94XT6JgHmxMz6IR1G81AsNDEmCp9uv7o8TV/6AfMtN98/rhCPgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TevG9fOx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwPvnD89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TevG9fOx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwPvnD89"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84QNI4134798
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=; b=TevG9fOxvoXuUG2i
	Cxf8oLeoAkajKH56rYbbqXqy2w/n+LJuMyn5M1Rfa72O01Ceq+GGTp/yiB8nowco
	Jke7JIUxSVTCop9pqsHX5Gr5YQnwnGtO0GOBbEnF7pG+k6o7f1qJ/X8WwfxQr19C
	+klaIIgC9PXsygMAKOkuL5ET/xXQQzWMiI0XGMcAqd93t8d8iCFKOjNli4qBW1fF
	x3qzjlWQawvRjy6SZh0DVMHoSRUvYw2OgNnoy/MS04ZWHrhoY8qe1mOodicqXWSd
	iqbpgnzeVl+HjlJaCfK93RkuUmlXJ0YFuCmGQ4A5naxUmZe0xWXqjsiD0IoGn4vL
	kpCQLw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj09eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:12:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939062ecda9so451983785a.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789981933; x=1790586733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=;
        b=iwPvnD89HhfNTCNGpi3qbh94fd1avT12YRB7XGJB2N2tNxl0Isla02QRXWqSc/tvpZ
         HXSkLCz9m1itlrjYRkiU7uNiVwrRe5zARaVsXf+iEmK1ulyU555xUTKm+DhxzwF4llKO
         xSioxG381SK9DRBRyPfGvxIJ8U7duVKcvanzstcP29tsaWCLCrfoD+Bw0Imaf9YC7lQr
         hjT1nmpbTguQ+ensWGd3qLymssCbsjyNngGTE+afcV2TPLnY2ZFlkLQsYenqcZ10r9gz
         T2j188EqIySf/VlVfDLUDZrenf5v63wTwAO6OEh9s38B2u5wvHBZcoJH9csmlmIeZcW0
         AZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981933; x=1790586733;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=51YDh1GOyJ947j4DEGodJFF86zLPqJMFWS1GDsNvero=;
        b=cEbl32S/z/COjFNfbhAZObCr/PbPiKY5WfjIHtGipMA80rWWTEqVKn3mNzoYW51OsD
         73kyOKA8/LUBniIwZRRNsnsgtaGqNv1Ls9GyjaS9SKkt1lBdf7Ih/DJZXE24unGWwDno
         bzFSVqbs1aTsd5oYAFpB90yFyTNllo+GY9BxxHdlvK7ErLjCPAaJTxOh22EBIJOqKe++
         EybpsNaaCrZenEK/rG7/5JYXEuqhyuryHMLJv5hP+kRvgyjhqUgdtfKfMbXUUFSI6fwl
         OdNIda+1G3yUIfrxPTbtuVEb9AxWmXOTgnS4m+lVCrX9rjnV7S6mprHtWzEjxX4Yll3m
         XoGg==
X-Forwarded-Encrypted: i=1; AKwUvBztgn6k/XcRTXjVsAO5s1JH1gGe4yc82TJkZqZ8HkTnAzOnYGqNrhPALY6Pif5xzl9U3JIio10iIVi+@vger.kernel.org
X-Gm-Message-State: AFuF++m7bheBcUJAUarWV7m777mJBWJ45YQCuBPQDfMxAgb+6/QEAktR
	I/wql2eZj8zSOwJpSk4oyTN0wQH3GiChajnaISR2D30qBoJyMfqxhe5LZSkDSCeNBS9BZ9jaD62
	CMYyhfawNuKHMmcdK+l1ArUA5aYoy+w4OkplUVZkZCJW8VpCakiWKjUzc98sPrl+T
X-Gm-Gg: AYBFou3xZh24e6FC/m45h/tYaEGPiR2XswTZmnlWxs83u6RvrXJy4agfcWlykdgLRWg
	6TmROK/AUZ6EOCMpRZIYNWP9BIc72TBW5yjEZc7op6pVSl+KWHYkvmsTryAYOwEh39UFW2KXJQ5
	uYVtRmmcoj8pi959sEnk1vMPhodgSaqyXI9oZO0G31whcl50zH+l54nBTM7jxD1acHDMv7h2Dcj
	QkjA078a+jLki4QMalS5Okzu7rOlTAkKYiN3znImvYdZNREAhvBNKH3qvd9p6tr4AneVInCJdHz
	pjsL4WnAng9gOmcldGrs1C2h5vky/hMCSqd7q6HHok9cTUHTeMbAIacJC00kZ0pPUy2wwQrUU+g
	kddvCgdRAID57vXcUiRX4reYp1Q==
X-Received: by 2002:a05:620a:4707:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bf5554097mr856779385a.16.1789981933628;
        Mon, 21 Sep 2026 02:12:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4707:b0:938:e23a:2ce9 with SMTP id af79cd13be357-93bf5554097mr856776785a.16.1789981933272;
        Mon, 21 Sep 2026 02:12:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcce144b1sm350038535e9.0.2026.09.21.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:12:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kees Cook <kees+treewide@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] gpio: it87: Remove const from labels_table allocation type
Date: Mon, 21 Sep 2026 11:12:10 +0200
Message-ID: <178998192701.38701.14119171190275640686.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917211125.i.966-kees@kernel.org>
References: <20260917211125.i.966-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX0+1RAyGKXv4w
 80ufZAuT6FNSyvfMObOApVeJBO3polivpcqDGEOYEdZiikW34srzukIss4yrV77HCWbXbBtPQRb
 tMIrzMIxH4otViRw/O3qT5V1cJOyjDk=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0f4ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tgKY3BxfLQft7ZkSydwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: oADz1BW1Cyc6oSDE6UTE6NHvNnHLq-h3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX3Prc5ajKHw+k
 PMdbIaT/hkNaWx33uqen31XWOhtdYXaGiKWoyxPabkinud0TJDoO0SrQKsEaHbbJkd1jjmWd99w
 fbEcamct/0K5Z2qT5uEFGRnOIhnzQHOuvTKZ/+SKPAgRLslKzj4KphvrseHlX19kKi3c8D+OmPW
 0Xq8pYCGnXHrKzl9Vk2D4StkLA7IUQXjLu26RgAxJxImi+wtCYPMoEBguQxkgU+fy6rB7dB/Hhj
 ILIS6RYCpSua4IGH4arY00NQ1M+UQjy/RAe4DiNwo/Zaa3B/D/xmjwqmAFASwJjgZzBbq6+F1uL
 llLP2HR9j9u/kLgZIVISmNq82aZjM/cgPLIcH/vndinaqn4C4LPWFfQZ6Gxq2+DC0oP4IbzEDH0
 9pLmy75wzvLTVrDKA58wU0cMQxXA6dLNiG10vuetx84YjQgxjZHBsCSNM/V1R0e1BudrKWBiUjK
 +ur2TMw+iroAbKQW9Kw==
X-Proofpoint-ORIG-GUID: oADz1BW1Cyc6oSDE6UTE6NHvNnHLq-h3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On Thu, 17 Sep 2026 14:11:26 -0700, Kees Cook wrote:
> In preparation for converting the kmalloc family of allocators to the
> type-aware kmalloc_obj family, we need to make sure that the returned
> type from the allocation matches the type of the variable being
> assigned. (The kmalloc family returns "void *", which can be implicitly
> cast to any pointer type.)
> 
> The assigned type is "char **", but the converted allocation type would
> be "const char **", which is const qualified. As there is no general way
> to remove const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> [...]

Applied, thanks!

[1/1] gpio: it87: Remove const from labels_table allocation type
      https://git.kernel.org/brgl/c/24715edd98ba62840214a35137ed23e611348797

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
