Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72983DA5D9
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278738; cv=none; b=O+MrILkStSAdzb6bT9OlDZMJ5HOs9vuiRrwuWbyp8EX/QNKBHidQPXVRkXxdxMGGKvjMklgd2V5JzqgL6C5krX06/Xr9IRuJQpIZZ0OdJBIjrBlNPZwOf14Q5Qrn61z0kIHjoIMyK4ilPUfFhxWNMgqtDLYR+hU/B2zTlBP0U2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278738; c=relaxed/simple;
	bh=zfW2SW4jpYFqvKi6G3uf6HUeHVtbhZwG3kNrRUq2zbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ay8djhbQMfT6EjnBlw6nrevndbzCtIlOQe8F0aS/XuFyO0tWYLwQCfvzOobxWpV28T3Yuv47rgVVZvGUwamoqokb47EkRc1ApKVDx/colDTmQn7Cs83CnXp+JVPYGe9Ph4REESR2MPw1/t5+HDkvuTDoRGYMkxbg9IzsXkx08BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCj6ZIP6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhosN+Z3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCj6ZIP6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhosN+Z3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cP9w1018919
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=; b=gCj6ZIP6z7DNLnYt
	wH/JVe7Zsz9rnR1trAmit9dSRIdHx2oFTJR15O/jLtfpDiYVL7noiDo29gY4g+9m
	6TWTzcie58ggc1dqYS+2PlQ7Jav8iPPNeqm4bDaSN+6zNEcWUK3tC9uu84w1gqAG
	eKEktktHdx6SfNnSpzUurgk9uNNUFud2LoUBnmgOqaanFQyzG3fWv8x1J55PZ4Za
	Mr/YBNPEe6paGCztNJF40EiiXbRGxZd22MbOKt8SPwU7U1XU5xwmzEjY7hIECSg9
	nfGqUw36KC1L/aE0+CNKgG962z2phQtFDQQ53buZHzWrMIHGNrC5U0m2YdjgFe+E
	L2/H2A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff810j2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 08:58:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso93759991cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784278735; x=1784883535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=;
        b=XhosN+Z3S1rDBHpdoCEw1ruvCZMgj/i2FeL7cvU0RM2WZ2iwLv/K6n6UCooJ5xncMj
         42BzI3Yg+gejXWQM159Xq7Rz0Tyf1cMChubt3xYiy/Ff85oNYaRDnEQFIYVqm+qfHREt
         VowxllIBBp4hM/BOliH7yLVIftk+r5mRZnfteYG9Lk3oizVIKWTEQhwaDxqsth6L8TE9
         zFB9p1Fkp/alS+XIZkwBChTmBhfKcKvPbR0XYvGgfWcqGvS3MFDoU9o5hQ3jGvGLaT2X
         sj1puBx7CoJwTSIvbtJ2CHL1ofwRieDSIuIMooZ0azpvlovKU9S1IInUTbpT3g6Rb9b5
         FeqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278735; x=1784883535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+6zn65FvRDStkPzkD5hyeFLw+Q/tqVt1jRTbl33u6c=;
        b=DMFoCP5K4MceSm4ck2Ye9h4NdS6dWyJgf7PYsSC20D+MXrIxd9NVwOwGpV7UNvcNlE
         t62XybJ3u57Gv3YsK1AxBe2WC8PzpAWLAC2VpBLka9vZVGV1Z4AvvzcyAuBXcI5yR0Zk
         Fu8H+98Ap+OqXA8WePLkkYXxF1wBkf8iDRKZpqtvbHkVIslliBSL14tlZNfaMCw4mq2S
         6b3yCrWYzBgixd+5e+xuQGXEOUMFYHNHkcXBUL6qH9OXTkuDXr7hbZuoyc4n7ByYHodM
         vStkJy/pcbMfiUBWuxnZGXIDKXWT5y27EyEYqkb9oJ/JI+UOjbHCNVF1tGfmSc2lZh9Y
         uxYA==
X-Gm-Message-State: AOJu0Yxa2H2ErRDrlhNQdGTd5qoJhvHizdFYVrsg6/yhS/40IfW9T1UQ
	pKyuf4BvF2RF9b5dApTg0QRJ2RscfLdiN0w7GBEjlCFRsPIR5iSC1gEwwLbF79SnQnSn/zKt+bh
	k2otUZyDUBZGWnatf0gH9DxZ08krrqhD44ZmUG2nxbgwiX91s+KEhbKYH49F+7zgnKokiIq4k
X-Gm-Gg: AfdE7cmDSxtQFY5PSDDAB8UBxDBLzpMz/meLwctVLfJmA9S7ETFtcxAqTV+f65UmFsd
	gGV1h3AULMLly+dZYRETpyr/SJ84shKlR5rLtGR9RraDYtB4GqF+7Dozg5WWfxEFKmYwqtrw1hA
	tU6ePq/c5JE9BLfiXECMQrbrFfh9YFdx/TwVCHWqPqVyhc52mg3VUta9U6nifKfSInLRsnnhCSo
	gHgzR+/T/piy737gYtkVbwK9gsqh8IkBOYedGDj4bl0RJ7tU9+Vv7/PWd32dMjasaXlmQgFYYgz
	/bXQO+xY2WIQq+Ib0Y3Fk0No9XukjaYqfdYnElzVOXnf0evwbHTLCnkrENgmQgbKcEQKmPz1UGE
	OXvhPCUytT+z385JL++aOCkcYwpUW
X-Received: by 2002:ac8:5a52:0:b0:51c:1f1b:afdd with SMTP id d75a77b69052e-5213c5f3a93mr12791861cf.24.1784278735084;
        Fri, 17 Jul 2026 01:58:55 -0700 (PDT)
X-Received: by 2002:ac8:5a52:0:b0:51c:1f1b:afdd with SMTP id d75a77b69052e-5213c5f3a93mr12791711cf.24.1784278734623;
        Fri, 17 Jul 2026 01:58:54 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e65644sm1911449f8f.16.2026.07.17.01.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:58:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-gpio@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Michael Buesch <m@bues.ch>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Subject: Re: [PATCH] gpio: bt8xx: use devm_ioremap_resource()
Date: Fri, 17 Jul 2026 10:58:46 +0200
Message-ID: <178427872031.9452.11556035251702200753.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260713232810.1144712-1-rosenp@gmail.com>
References: <20260713232810.1144712-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RbqgzVtv c=1 sm=1 tr=0 ts=6a59eecf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wcrWqbcI9P797jCuS0QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: XY7FczkEK4gUcww8adBo6VSOOfJbws8E
X-Proofpoint-ORIG-GUID: XY7FczkEK4gUcww8adBo6VSOOfJbws8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfXzH6xkYvwr/uo
 VsmYuVy9mK3Fj9tYduGdTrZiHslqZWsdTHmpwIg45p7XMNyhy/iG8y0RlStQ/kYRc8M60AtVQnp
 Rk41YO/VyyeGpifu6RWrOZcTcqLFEw3UYf4pc+wBFEX8nnOVsrznt1OVzb2E9oxpSTawBGOrHVu
 HaQIjC2tFmbeaXCMR32fYZXFmjCNbRO7cKP2Le4ucOdCGaKz2eMoBJhJ97ZJJya3Ok6psMyANPH
 OiCZ6EVpTf0YHIrwSmz7MMtvjiL44YVzvaJo7AHOnlKO1ipz3K6idMDprt39fFVP3UGUss4oHy+
 zYREGXP7lfAGEeQnkWnUb9EzwCBYYUQk9j4qrI6y66k+KhN8vO6Q7WL/w1P/gNB6eN5rYi9xgzB
 7FSQNXEHZ81EWtZ6eddRiW7q5W6hc1Ghm+Z01KNETaTWalvGSUfMkluaJ9drCzJeuVJvP718QoF
 edX0gXy4x1DWRglcrxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4OSBTYWx0ZWRfX2uVn3hVzkut7
 4NWCMkILT6692Bo9siN8wEhXwhLBaAga/2hGUviQiq0vgQ21K3FoSWH9MOj6nbyX5kfEUOXwAlD
 RQ/ndkGqlMJ2+d82/vi7cMYO3zIOkfE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170089


On Mon, 13 Jul 2026 16:28:10 -0700, Rosen Penev wrote:
> Replace the open-coded devm_request_mem_region() plus devm_ioremap()
> sequence with a single devm_ioremap_resource() call on the BAR0 resource.
> This reserves the region and maps it in one step, and maps the full BAR
> length instead of a hardcoded 0x1000 (BAR0 on the bt848/878 is a 4KB
> register block, so the mapped size is unchanged).
> 
> devm_ioremap_resource() returns an ERR_PTR on failure, so check with
> IS_ERR() and propagate PTR_ERR(). Drop the now-redundant error message,
> as devm_ioremap_resource() already logs on every failure path. Since it
> can return -EPROBE_DEFER, place it early.
> 
> [...]

Applied, thanks!

[1/1] gpio: bt8xx: use devm_ioremap_resource()
      https://git.kernel.org/brgl/c/bbd8254da11c189072349003006091e8327e8d36

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
