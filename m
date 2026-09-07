Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6E442397
	for <linux-gpio@vger.kernel.org>; Mon,  7 Sep 2026 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770346; cv=none; b=pnJnnLJPZjS9xMQi4BXRqdl2dVtt6nyBixheYN70v4J2zEDBX6XzBWrYKz2HS8rtS6SAaEA12ulWL/7Tb4jBMjlRarxsg9RoagQO0JBX9uxFIimUzD6rvf8k4l8V6CQYgNMK+eLV3J82XNkTZAEGEliw1gcc6o8Dh6izd8ge0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770346; c=relaxed/simple;
	bh=SgJFlYqFLtSEHRQNmFsUWB5y/FyJ4pAiDeXpdH/kUXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C5/2uQT7omzpWACv0S7EZ+QE8NE4k4CUxaArntIgqMk7IajnobdpfqXwo3RVR34l/Oaw3ty+ZAczalqM5LtAN3ZS7zvJi7r7CppxK7SqPKPNCQgGXTlQBDK6pRio4sFX2VKqgXz63I16tGIjy4s5ZwCMM8arr0omDYsopXORpWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oN4O6z5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqZ0qIH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oN4O6z5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqZ0qIH8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777N2E3352439
	for <linux-gpio@vger.kernel.org>; Mon, 7 Sep 2026 08:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=; b=oN4O6z5V/8tT7dxu
	+mwAxCNkfLNTvovqsNszyQRLrDucv25FpbPsth9UNQcKCwExmgHz/RlznKBOEyMI
	OqSiUitIJ75CN7ConOP3QcSld9uNGAZa4ygX5O9BWK1K+8wogqXCIMGbmRla7pHq
	4fXq6gH3uKjbknvjeTyGgP0OmvxeZrQLknzFDcToabb0EUahbbd9MfoOOLamVxIJ
	EwSo1Mh9HKdTuH/i1Wax5kBprZKK6bgqGSLF7iJDCJMxDfOavpwo7Lo6Wt1RbdNp
	2yqBoeG3UZyx9flMMZJ/Z2HeeF2C9HiwrmCSNS9EtbPun/PcxkrCuLqUQXLhjJlX
	PmyeYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66gv29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 08:39:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e4f946461so623245785a.2
        for <linux-gpio@vger.kernel.org>; Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788770343; x=1789375143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=;
        b=fqZ0qIH8+S2PT8YP1AuolUKBqtGfEhyHZ1o+9rc2jvKk6ZQoRzQkLQoVy0UKWV6ngr
         vaJ+uLbemubC9oyhzi1hTydsQ9eOpogeJjJIc00/Zf/Ii+igQX9W58OFn/BYJmnEmPae
         7ydPyIcbHYwyeboAuByOHxDll9XxFUgGtymhUv+AwvJnnWKsKYn0i0ani/3sw9CordFS
         smW4gIWDCppur+6PtQ/ryw/hZDZSCjtqhezxdHJU0P+D6Se6/YqB4lP+/5b8oTrBgCV5
         DZa80IGlJ764gsf4KheqGcaUvVmunIaZMvSWZAuY0GCo0dfubTwSPUlLOIg4IpLnM5I8
         +Fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770343; x=1789375143;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX8jDekrM3WxU6LpzeLGTKk0UWwp2DSi7W/uiO1IAbU=;
        b=rhgEWQB5kPcaFpC1x6FmfqKuYFbfOsCqvbKtDB0bkMRPcyrxz0grgOF/X4+P2VosGj
         UKJePBRU2ana7EUbKZOst+/wu1RajcuwoNiuJRbcIdXGWwiVY7vnOOxIS0YMXiCSmwLm
         9N5dSd2QT15YiE01QHBll32Gdn+s/5uHLxMvz+J1ZYz2srM27GNJMt17mNmt+HahLm3Z
         M4f8QGR1Ir61Ir6rWTPXF3Zx6akOkLXMwqLZlG83IuughDzlLoubg7yPfACP+zXk2dIT
         SpQ8IpnPGKj1u7yurH27jnJq9YHAcCTO4R5lBOi/WMZCvHlQdk/KMfkwir4czxxt22YK
         YnuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsKHLxazyR3NPuvYtVH2QBzXxKO82DZNE3hdiFKuqjcwyr1Njx7IImG3fhglfZGkcruPEi4I/gmXb8@vger.kernel.org
X-Gm-Message-State: AFuF++n+utyJOnuxXbm5yaes3EwS2UJzg6jMracJ8sgISo3qjNyqTeok
	0BRbIiGMrIHWQtk5g7sJSIo57i/hRpuKvzMJVa+yK9Qx0o1GN4WHClHLiO93NsD2QTrg04PBPwb
	lF/Je7WCwbnW/iHAMBLOfIx0YPGk/hm8D/XO1DIpEdS9PWNWC8oqBiWPHOcZrJU14
X-Gm-Gg: AYBFou04P6dtoNBacmzvQUaQt/Z7vjQqZsZlc2+cP5IimctQvl3KNVqmrN7MRJrM6Nw
	NtDXcN5gRqiDkVnwX3eW5bSsSuhipmppyG7qlRA285vgxmN6zLYgS5x7XdEnyy+enO0ukr+WCmr
	4pgrdmIx9zU3UHhYRQUHjjIPgl8c8cnL+BTr5dU9C+gdxHBWgqyzfeRxE82pmnKFgFd7G48tzur
	WTq5NsohdKjC8gxjGi0Gj59jT53jKFlYP49imtYtBlOZZtjJHNJVeGCib4nQA//2lNhcQKTPtaZ
	VbXBErmphIHLx513c0danzd1JsSFil98DyKs9Qg+qYQVUuk1GOL0xauwB/MaDk7bzy+giTyFnb5
	n5Mfea7nEpoOBBJXQaBffMX9WcA==
X-Received: by 2002:a05:620a:5ef1:b0:939:7c8:78b1 with SMTP id af79cd13be357-93980444d88mr1910099985a.24.1788770343029;
        Mon, 07 Sep 2026 01:39:03 -0700 (PDT)
X-Received: by 2002:a05:620a:5ef1:b0:939:7c8:78b1 with SMTP id af79cd13be357-93980444d88mr1910096685a.24.1788770342438;
        Mon, 07 Sep 2026 01:39:02 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:48dd:b57:9236:95f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm290051765e9.6.2026.09.07.01.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:39:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Hemanth Selam <hemanth.selam@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] tools/gpio: fix typo "amount of times" in comment
Date: Mon,  7 Sep 2026 10:38:59 +0200
Message-ID: <178877033557.8617.11772358021957395311.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260904105915.4327-1-hemanth.selam@gmail.com>
References: <20260904105915.4327-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e7827 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ATh8l1-nZCtOYqJaFDcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: k5jx-6KJ4JPbwOuQiMEe2pKpe1Qg_o1F
X-Proofpoint-ORIG-GUID: k5jx-6KJ4JPbwOuQiMEe2pKpe1Qg_o1F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX/VCxpym3zISK
 TUOv/0nmuQJ1lBOTrGwi+oSqcVPuh+5+yciKf41t7Z7JDxPs+5OY9NRwRl1rhpEOg2/TjCxTaff
 jFzMz0MArDFCBFIIrnpHWSsRf/B3Ohc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA5MyBTYWx0ZWRfX/H0GerR2srX+
 xLmBgdndGLB8kISDAt8WGZ6RbbpPnfQ2y/CfW69bn+Vi2ud+VD0c119aQeWIpL+qOVofxUeG2/b
 bC0goGglHGf1UWb1NHF5zFSW96FIWMhihbA994hQ4RLV9ueOLAkgO2WjAYVBAUCjeY16Kt+EskH
 65htzZ0mLT1UG2I5Mhe6n+jsORbsJRqj1c7V+UMSlatstp/ZD2w8Iv7aQ2cogrrV+U1OqZJVKbZ
 XNtD3OM5mMNf8SvqpLz7N5EyqpYMNf/CJA67Mz/urByCC/XGh9sub7InZo0U/QXxOlgo+WlVaY2
 8BXFYTCja4IvsXNIdKTAwG2CcwBE8/0B/pzbERY8eVEMhaY7kIqhDgjPglhjAVnQv22F4k/4qYe
 +86hfsXq2E8ByuD6Rn89kiJmzv87waQsAddi2YNjhx9wE5h96pM4TFswc+EeoqPcE4QS8HEd+ej
 0bGtMDB4LJUBKnwBd1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070093


On Fri, 04 Sep 2026 16:29:14 +0530, Hemanth Selam wrote:
> Correct "amount of times" to "number of times", reported by
> scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
> Only touches comments, no code changes.
> 
> 

Applied, thanks!

[1/1] tools/gpio: fix typo "amount of times" in comment
      https://git.kernel.org/brgl/c/6f2e63ef82062a5254f43e0d499053f1e1b19f8b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
