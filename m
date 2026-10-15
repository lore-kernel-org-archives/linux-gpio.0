Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAAC51812D
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065999; cv=none; b=ME7tEpckomljyKHgA+rNKcAb6GGmDh/BSe3vBLj9h5Id2z282ZZFHInp9WE7k/z9V/j6sg2NFQWBIGqFDVNMd22DMrbjCh7pxpKIZWl3+823H7FbUznEQAQV1Z+pgDMRcORSDGda4DsrgydO6+ST9lbnIdS89qwyGE3cxuN4HQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065999; c=relaxed/simple;
	bh=X3NY/7TiPZb1ayBoO4JqEe+o2QYp7NEtl+kPkVXeLXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BT2U2QAbKmHYuHvORQEpY1sRV+lEQi7tEujnKqJ9OwC7WHB/B/L5sU9BA9J2vAsOMpi8CFAucC7qzX1GIJ15fJeoNwb0py0GBp2QefFowPD++Z8utRJoGAsw2rZYhsBKACPV7Ia1ZN0sGMBTdG9a/VPu2kQz+AZ4kKJoOsXyod8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSoSODNe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIJ/Hcy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSoSODNe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIJ/Hcy6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWlR2416945
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=; b=pSoSODNebq4YhKz4
	f3NKdiOlGSVh+V+TgyZcHUNI7vwRgsOga42k7Tc6ppd06qtnuw9dmeoI44c6BcGP
	DZbzCbh+do+PqcIcE0kzzsBC5W7lH/dWDit06YgOhh62v0GfvPZEO4j2UguJtWE6
	Omti9hpmXG8CNZOh8VvGuungzx8Sz/IBuJtJzvHJdyrfF+9vbVPRq1iiZZiI7dfa
	znp8wMDo3PwODTPBLa8b5ftUZmG5OJMJq938m6BZ4+BlZvZnRkemwE5UMQvR904D
	JSVqm7U2R+ppP29AoBEmSwcZMmX5R1+r9W2mZY3VhWx2rHe6U/cOk3LZsqy01ILE
	EQ3E5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhhyme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 12:06:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso885901485a.1
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 05:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792065997; x=1792670797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=;
        b=JIJ/Hcy6l2v+esvcGx2jZSaig0V2zbYmsFrspGb686Ny3YLqO2T65yruWjUHOi2sqF
         LCmZj4EibODWHJ5fXPyqOV5W8aAV8vbNm7kN7BQmfa/8YG+RWukCgFyXzrk5VvLXAZri
         7WbbdWj0xS0koFQzytSnNi8XzUY91mg3CDzkhVDoXD4onUtA0MbfeFuj69rv6KHon/5W
         4yH+dfx4W4MZHuc+/a/TwX140+P37EVIUrhP9fGH/I31WKNdkxNT1AJOR7xPkR2URUzc
         O3qwcyh4j5UaU2tSEwNW145PMTd+X2qH0fTgFCe17eqqC85Vj4Pz0stgm0bslVyh4yCC
         xx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065997; x=1792670797;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ub9AQP9vWfbEskH+qfVnP2ITHLvzIDg6npIvmPf672Y=;
        b=NC8tqcNF8gn6S28OdJOZS+ZpLTDoyGjJ/WW7JUlkEZvEJ198bM5KPJPgCiEDNJ3b9b
         T4lPEgI6vNNwnS6pFyuWRfglhHZgvHlzqnu8tUuYwLOnSl6ywCSjxVwk3zIscRDpbI8u
         vCIu45kpI55dubhReMyG4mIQ5R0Xj8v0bfnSjP4SebPw6jg7TSH01BEWNC07+SUE1oSZ
         lY3F470rBgoBUFe1Q7Lke2b+va3ckqSgKbECCLQa2gA7XQwfRGxarc1qsxK2qsHP5BzY
         q3q4fQFj8Q3nPBtRGe/FQLibax1mcIFbCA3G1uai0e/na6h2VI5QHdlFcJjyLXxF/r5O
         8FAA==
X-Gm-Message-State: AFq9FYJGvN/6NrzvpaZM7oC8n/+a9F8XStiNTIa6HWPiM8YvEPO6KIkN
	PkfCDWtYSlWIjcUow9qmd1JRs+HZyQ+mKq7m3HxwGmAPdyhgaKg9BzIn59A9FhZJaHw3P9pZnUM
	89/ypGjYMEBUYegd61uEw9ZKwHw7qG3ob4Tjbo4J3X+JXGi2WH9hucl5WqVXQd7Pf27N2BoJp
X-Gm-Gg: AYBFou2sxJiafJCCqzpp04vXW0AqDDbnysVuRfPPgwxWbCGIi/e8mpVs+RYSOg6T0iI
	sZT8FpSbJttvvkEIXyna8e4gE/i6GOJQzjGGCBGgwsE0CaiJa2L8/1RD4QTURlC4ex4NhobBCyV
	V10m8SV/5wZey+rMw9MhwrSl5JlD6YXgHueDinvO7vUxssR9/Coyox/2GBeaZWZNgqcDBcTGu6b
	/QhusYF18pOcTlr9U6SX/VvPphq+aEkV6ot1s6cjmhe0HEcSAeYThSh7MG8bCfHKTE9bYMWHe6e
	1yVr/D3G3GAJ6f79zx71cWjajL3kFp6jzDpeDxLv0KuLmaxdUJ+5TrqcWjme/vdYDl1YGiERY6O
	0Qlr62bDsIusPOUSttn0jWWzsQnE=
X-Received: by 2002:a05:620a:1991:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-93ebd0cc7d1mr3064789185a.10.1792065996460;
        Thu, 15 Oct 2026 05:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1991:b0:93e:8c7a:bbf7 with SMTP id af79cd13be357-93ebd0cc7d1mr3064784285a.10.1792065995923;
        Thu, 15 Oct 2026 05:06:35 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm17583804f8f.35.2026.10.15.05.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:06:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: kunit: fix GPIO device reference leak with __free()
Date: Thu, 15 Oct 2026 14:06:32 +0200
Message-ID: <179206598984.9610.18154781769344073751.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa7be0eb1f@oss.qualcomm.com>
References: <20261014-gpio-kunit-autofree-leak-fix-v1-1-5bfa7be0eb1f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfXysHWI3V50kS1
 nH1qcEHEpCqZ1N1/8k4xu6rxdSPllcWgU8SzbibZstv1S5CsOAAUDtWmcOdWeDj0iUB5/XSoQ4q
 lIFj/M72JJoaJDOmXOwwMyooyEoFOoxs8opghJJ46lCiaqzVKUQhqZZfh//9WblXARy/7q3tjLT
 ierQf2PL4CUpxD42g9cVIybdXw/8wCp/jSGGf11U89A0UXPizlladGckwym3NcnRnZkX+0XBFSh
 Ny5yofUr64Y9XhcE6hWlto+PPufpYT+Bo/BIPsBpuSvAOa5oK9U+acsi7iX13e0Egjv2bkibUxf
 Cti5EhAobvvrjy5BVYFLOnfztiO8WHLdpSkwYifC9ea6gxuFeWvsIXYjl+jzS+cQnhS58Rp9NCr
 dVWMfkR9U7KaqGRyztxEDOwtKAZmnlpjPdb78C/QxzzM74/NdKg4VRyuEJak//gAX5nqTRQtboz
 KEe0AIvDJV5EJdzOlRQ==
X-Proofpoint-GUID: hEDdWiYrd9xXoSu659lFciVHjM6vq769
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0c1cd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NiAw90gZ0SZeDWJ80IwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0OCBTYWx0ZWRfX2z8+WtI1j+eB
 XyiNy+Qft8QGr0BgtVT2kyT56pMdehqZVcrQ/LR5zNtCiLyiNB0BVtlt2mJ4VKken/yaRcc5oba
 a8iCbOtQj794c73cSxzbClf6iLU+K60=
X-Proofpoint-ORIG-GUID: hEDdWiYrd9xXoSu659lFciVHjM6vq769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150048


On Wed, 14 Oct 2026 10:44:02 +0200, Bartosz Golaszewski wrote:
> KUnit aborts the test thread immediately using kthread_exit() so the
> variable annotated with __free() never really goes out of scope and the
> associated callback is not called. Schedule a kunit action instead.
> 
> 

Applied, thanks!

[1/1] gpio: kunit: fix GPIO device reference leak with __free()
      https://git.kernel.org/brgl/c/851bb4a42991666f515040e95e6f40191da9e899

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
