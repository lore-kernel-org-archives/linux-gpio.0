Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741727;
	b=vVAwIywWWKLPGjashzuCSzPbDxZnoS2ds3e157LU0PSJNZzEDcNV0NrE0LnfLQbrHJLu
	 NC3fzEkSZT61ICHco1xMoAKA7hhDH3WkugpsxkaS1mR0wbTF8M84c8oQEX3Hq3tOqztzu
	 NLORMGy82dyY5jTmyh3ctkt5FETrG+LZd2NS+iav72p8CphOaJ/fAoNM+wUiUiHKvHg1U
	 uqM0xmpXwkLISK1MPjcHi4Ke8nCWvL4mgTo1//qB9K5akmLtooCBQtSeD8uGccjze/ycz
	 P+1lrjF7SU4Obtor7yXyY4RQjekOpTaNY/rCKr6R7Z+WKxi2CognAqCZTAZJgKAtTRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
	b=t8FYDByLmy0X6O/GhM12c6X9FSiWFswkQ35dA/tIQsA/9EbNOBdo55iRXfPhIp885ILC
	 tVuIZP0yMoRl1jjGnJIJDpBcMDpWUUSisKJtGvdnHEwFRMw1vunF9B19f+IOWMZNeiae4
	 EjiaZRyaUhylvgJyaWXmKRJLR/UGSnu9txiHGnclMYRqWhTs+91TFt33m34SZbqelZC61
	 6GG63Ffcbb32qYLZ+Muvc7JNe7A8nQ+fQkauOD2NAaeukNt13ldivl09a49emnLqh84rt
	 HZ93ZzoZZ3fmwxIvt9t4NvHbdcKdwUbsQqlzHjvhcmiBAYt8twL8WbDzPltzMXSQMdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMlpTlFv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV8B6wTU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936C6606A322
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 07:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 936C6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IMlpTlFv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV8B6wTU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FMlU2572480
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 07:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=; b=IMlpTlFvxoBxAxXm
	p7jT6BKYAdbg/r3GC6dbD4v9nGNAARHZ2+Tx1TR5A3OIrPiwtRJGLAJl2Oh7Quka
	h6k4U32a+LB1xV7itulAT83M8UsJXelcubR+kmVW2F8WQk67a11j1g3IuVyVd46J
	8Mlnas7hK4G3tMjIR/b4QeDGlNtKpKcmd8jfPT5o6eqfVhFAmLLj1KRI3EphAR9Q
	pkeWbVRA+jgPEHIe/yVFhj8BHzPt6jt8RVaHA57Smkwu9LnZ+uIieUxnOS5YipMl
	9xPxbDnfDwLdcPxkVavuML/GYIlTa2X7TVssTSUOypEVqpjlcnNHlwrQwKTK0zxd
	RvCnAQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0k45m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 07:48:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f26dd2165so208196185a.3
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 00:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792741725; x=1793346525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
        b=YV8B6wTUT4AGdtm5VAQ8KJgYQY7a1Kwo/X9ZGYYZES2D2bELSpEJOkMDBzmH3Vw50G
         LNTtnUga1KbDfRViBAPNHFbS1KDKCcwrn4vmHrVLZveDQYKKy5BB9XA3r1IqouD41wXg
         yZ2bmucqqbWhC50pvYYX5og3pcn0SZcrWIacM6UoXPRGGqvMivdEXd2hwhDj/O4q49x8
         wxvLRlgodiPekVJ6kF01GtdC+7M9yIv8sXfiveYALHmbH9SBFga5kNy6Jd0ZuBr5HHWu
         TLYRc5sQlsfqetbjHxbVBMctHzk6DKVj0ZbAwpK8mwaui7aMomDwNJpLMypQKtSHz2B8
         cg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792741725; x=1793346525;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fLv/0ymzeMVr3+DKh8bjeYNHCYO4plYAT47kOv5TlFQ=;
        b=pJNiT4nFxaDpc/m+7bdHfPM7rLs6nYJgtpAb3anMj5GtxornaGbTXZWhQw4hWxBbqy
         Jv6FC2fmdYXNCO18Jys6iRFlRV+5bnNOrHZnx4XQ8McK5FeaODSy+Kx24w+lIAgUM0Rd
         6u2Aimp1r8vABeJsGvD/qk4f+tRWw6oUw2+DsofoGhlhe3EawYyaEhdCy8vLpZA59g3Y
         u7RKWWiHf8l8mHPbpymkAgrxJDPeQFszqk0EF9eXlpcLpTZ+34VuDFn7P5XEFzwGdR2O
         2A+rmTRsr0FUGepNykeTxAdWpmBX9PTu7OeMZy+0N/5/bmPOvwIPCeRzIwetd/oOmUfk
         6Y7g==
X-Forwarded-Encrypted: i=1; AKwUvByG6C3Aqv0x4K11ffGU8kOf+eKjNje0LtOu1fOMlCU25cT6vXIm8htJcVaWzZC8wKZqipit2bG6ReMV@vger.kernel.org
X-Gm-Message-State: AFq9FYJvtz5zcaKUabxOuBTH23PaRr8BA8oXvStin0B0QLnTqz5gIkLY
	kAN8d8FwL1mdw1mLmRVRJVFdC43opkiTawmGF6vOG/k9hkK8qoriVmxndL/9k79bfLBwoBhEygG
	6RkIzQBY/aLeTlCILu14/QB2IhLfqOuUTX1I399kQ6oLpbSbrAT4nH3Qi5koOyFh2
X-Gm-Gg: AYBFou0Uq8G73ndM8+8kYb6/MEkloK4i01LoH2ruWWkm+vBC6rJt4oJ9H7zC0BGEeM4
	epImFuT/3U+hgAhC/RXZccrhouI6NkEEEfzVgl8szOUDk3hI04ZZkFW0pqd2XXs7xPSzTExmwFs
	2gYyIncd7rD+/2ejhnIra4Qtq5TK5D+pbSVsgpN0VOFCK90xUJXHmvxMM4VlT4UsHlKz4l6Gl9j
	qcL6yETvC5WGtFsX/vsrcatYwjTcyYzXCH8dnIdRJfKOWHpisAkWBuJU0tB93d/DPznNX0Ea3lY
	Cq+fXbOcpcb02xTkSCD69BRgmXGY8OaHsF96xKoq1uQ8X8aei124a3OFlRwOUT/n/dINg5hB7Nl
	PHza1AHm/2JwucY8lB+36uKdbbYY=
X-Received: by 2002:a05:620a:7102:b0:93e:f9ba:690f with SMTP id af79cd13be357-93f6fa01641mr287676085a.73.1792741724651;
        Fri, 23 Oct 2026 00:48:44 -0700 (PDT)
X-Received: by 2002:a05:620a:7102:b0:93e:f9ba:690f with SMTP id af79cd13be357-93f6fa01641mr287674585a.73.1792741724211;
        Fri, 23 Oct 2026 00:48:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm3116633f8f.20.2026.10.23.00.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:48:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpiolib: don't report -ENOMEM for a requested line without a label
Date: Fri, 23 Oct 2026 09:48:41 +0200
Message-ID: <179274171913.5027.9030259966354597736.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022083343.3905973-3-aambrozewicz@nvidia.com>
References: <20261022083343.3905973-3-aambrozewicz@nvidia.com>
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
X-Proofpoint-ORIG-GUID: O14mP3o66yJ3vqqLVTiYnFeCekwNozXG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfXyPspGafPn5na
 /KZfolnxM11ovDVw91CFKxg8dttHgLbZd1QGQcazJ3Xydqnzd0tcfY6BXaVT5Wr6Bey6TsTuRs7
 0tEGlJey2iHqIPs4PhlX5Ucz4Ar+J8kIfzno4D0KCmkj9/5kak7dw4EAq8wYiMtGhAINYqvASqH
 szmk+c42aOsnlWBi1MJGH6zeZBqgJ2pxHKjldjVI63rZXNfzJ+yuFrYbdf3KY+Mk5yoXsaf6nf6
 IgH9+fpjIg0ld1CctHjhO0/nubjsyrjPfxIG/pro45E7tuL30Vqj08GxOHCI1WnU0Ow2cvZzcWd
 NKPT4K4z57nYf4kj+xJUXKReXo32ujg4mckuzLdKvd8QswkgP1STdbI/sBA2GJuX898iXq737y4
 Ttm7GzA183ENivp+NdYbz4FQtKve4VB+M9a4vdrTmRHf2W991GAQEcWmV0AapQhVIdNTZAERzJb
 wrlp8wu48z3U2ufiOqw==
X-Proofpoint-GUID: O14mP3o66yJ3vqqLVTiYnFeCekwNozXG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMCBTYWx0ZWRfX2oMcsHHeif8/
 nWPYlS7N1M3QwBEnTpg8rh/spSlIX5QNUR7haHKpa9cv+//PkTyM98jDCX1cZxNiVBDul0SdpSz
 YVK8vQXq9L/hRa8AG9qSwEDa9dnDV/s=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb115d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7ofs3B3pnvE7NeEcutwA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230030


On Thu, 22 Oct 2026 11:33:44 +0300, Adrian Ambrozewicz wrote:
> gpiod_request_commit() sets GPIOD_FLAG_REQUESTED, calls ->request() and
> only then sets the label. A line in between has no label, so
> gpiochip_dup_line_label() passes NULL to kstrdup() and returns
> ERR_PTR(-ENOMEM), which for_each_hwgpio() then passes to kfree():
> 
>   BUG: unable to handle page fault for address: ffcc73074355ffc8
>   Call Trace:
>    gpio_sim_dbg_show
>    gpiolib_seq_show
>    seq_read_iter
> 
> [...]

Applied, thanks!

[1/1] gpiolib: don't report -ENOMEM for a requested line without a label
      https://git.kernel.org/brgl/c/dae739137441667d67fbfcc4d303a0ecc6618662

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
