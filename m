Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612582;
	b=ACsKacqLtKiPbt1UrnnHPki9cDKndxGXTA3JXO6cscl/JFT61knuLMGMYIm8eUHCjRdS
	 duPMo1Htg8e3DPYnHci3ydv7FkzT0B1Q0KlUqNeYCLLuqYfT8/bOVLevPba4BtVb3d9N5
	 Rt9RRjaXfv+LcAm+QGWnmRKdCFdBT9ulFKFN6MB+w1RrYXt/6OxNf2zTP/y8adnkIfXoO
	 IQT2fz4fkkZwxOCXjzZ1+hvopiuPQw4p9e0I/zuC6YU34OR1upqCsDlO/HxSJkr+JobPQ
	 qo9vmiMoxFAg/9lW5tFmeNwZfnSxYXcocwcGr4YkCvGLigJk8XYvHWZrrXCADlxEZDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612582;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
	b=BBVN6Wzp4J2ezQ+Rh3DHhw+U2Q3ij+1r9xE/h8KRrnVOF5rwLI4AHXlIEL1mkxrvNx2L
	 5TsppK8Ybi3tkG633ICDeLwOPZvbRo5Q+E83ep2YGsamWLeCPVmugqEPJasvsJA9oMgcG
	 IiWI2Yisqs1fbWFYSeJACEomw0j3wsOeK7qXxYPjF1aOxx6paKsNwHcHXeLyhZVQHXIHx
	 BcA/svcnEYvRUDPir3w6s9OZafchWja9dQRhESN4WNFvdIrQn2wVG7UL70vpH3u9OrJsl
	 vOiOsS6igcf7UdxYPgwUB3zmRsOY0cWtrtNtnJi2tF3XTowwfZ6NCwFSOjaf691dcOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="l1G/73LQ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ivhqNUJ/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870E606A331
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 09:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6870E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l1G/73LQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ivhqNUJ/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AEca260818
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 09:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=; b=l1G/73LQcGRmSUnO
	U8g2uH4q/i/X6dJsZbxfny/nj5qSQ7E5d/Hb41csjkojGkyMIVad2hgXswZ5yqsR
	ry3Wztcvc6Gsh/GGbYLHEBbSvqXnGK0h1WCcU7I1J9GLGveAU/JzzlPfAUGwLz7G
	e+x8nrKuvCXkxxy7FlaKZ4BotliNu/3/+spekyaH2GozaGUHsQOonXozu6Rn03V8
	Znnhgh7vDEeYpnL8+RoIZjLdyaQXEiwwiML8RC5wcj4ccfiunp6wl9S8+cwNTDjT
	rldgk/A7tuGiobm5D+SUeYaiPvgoJRoYzFD7YHwkZoJmvoQj/MHgtX1uYA6Lr7Ao
	Lshe7Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvr4yj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 09:43:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so560190885a.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793612581; x=1794217381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
        b=ivhqNUJ/mSGC8BIFDiZz4qkI+K7xTVyqF+eNVifs4bHVcrRoB8hfUIwy5xuklzKD26
         Kx69d9mG8oyIdwNJPTBr5TjOVzlzgIJCUhC+uSnAXznpqQYWeIcXxdVJTrRWjFmOOsdc
         RHGQc6yd4jQ1jm9dC5v9xKh/XyGzzw6eRCoBPU1hkjCKQKDOF/FVFvk8Fd/AB1md9a7C
         QpGuOH19YwwwogeQsMPHDbJbYkbcN0m+EPT+7s/huqa6JimPe/0bpg9NCKUI+G+y4vyn
         uWGp0kSzeaPCqZPI1y/vGEks3bwaixYMpuW4byHhd0H6DUg4b5kEF4SYSELDmUEoRwy5
         BTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612581; x=1794217381;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89EGtrCdAoR6l+ecweYzP++OTOh+V/yp5mFZY6u3Czk=;
        b=JCiIHFLf6pS7jnoEpiqmzBKq/Y82T17neYBHr4WExGTub9JwQoGcQLUSDiHoCh3kgl
         VwsY3LaCZ7vmcBHWETLoyUrzr8JbxT2m2sgp7e5SbwSrrpn5jkKFi4N+vhWSDiDRHyj+
         U7VEz92yeMDxNIa/r+9Rane6pbk9dTLva5viwR51aOU5dst4jSXFzM2+y/bsIhttFhXw
         khw94lgUxaFQmSIdZYzqnp7x8MGAlD8v2wFZk5l9Ck/OqJQSIKrD0Vg4LJlhuyYifa4G
         wxg8mH1sxdiVSY+frpwLZ9B1T/y0L4jLT3Rljse5dZYv4H/WKRw4ujWQoZXPt4swAjPC
         tOWA==
X-Forwarded-Encrypted: i=1; AKwUvBzluhaM+XkZuFG+AWU4Gynzrvi+1h+pLykwKXFv5QYZlXA8p2UWJZW8bVGC7tjAF4gNHp6KZDbP3TOi@vger.kernel.org
X-Gm-Message-State: AFq9FYJShyuJXSKY1lqEA/MuUW2KmzZRTxjZSqEY+CoBOAJcKcG3rrvU
	4YI0fPMWaqQfFW4Ji0/KhbTmgFGVsA7sZhgsPwvLzjV+DLIsy1VZNch4Lbfp4kBNXF2kYquRoKB
	6Q0GYFImF0fp9Rtri3YC5wECzaU84z5xiWWRIGKwpFVcWMqQrM4bUWUtLGcdJtDyU
X-Gm-Gg: AYBFou0vbBv30kxqsgdO8CyqD7oicpdhSQTyDJRqTu/j8ZU99c2CTxGtaF/9H2UPCDp
	zT94Goy3fDatrWSD9b/jOMOChqn012AOYFf+FQnMpH16cHn8VWnnQzb/qyWTs5T8cxfyhZ7XdyW
	BX0aI8N0B9Hs0G6pVIcfTOb3hJShTxEVfHvJyNPx57V3HkLieNFaMC5kVNnZLnPD/03aYnwM6ra
	6OEt2BM6hm5ETjyOLAujH7pNQmzueQXIDf4VMrjzWhzbgLcqp7jnYN7xWgbzLNMCS5EVdsf90fu
	BAeN3WfwC5vUDzuHH+oJpptfM7s9yFFA0xKhU325Fl79+qg/bW8bv+0z70xw+MNo5nRjyZJ1frP
	3NL48wJRLw3QnY1heZDhdNzYHoyBRlA5fvjtR2k1pGVxzjiSje3FdC6z+Fk0y0A8+LhUCm5Axez
	1v
X-Received: by 2002:a05:620a:2627:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-944214cb3b8mr1490955185a.9.1793612580634;
        Mon, 02 Nov 2026 01:43:00 -0800 (PST)
X-Received: by 2002:a05:620a:2627:b0:93c:c7c6:90b5 with SMTP id af79cd13be357-944214cb3b8mr1490952285a.9.1793612580149;
        Mon, 02 Nov 2026 01:43:00 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19124292f8f.20.2026.11.02.01.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:42:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: sa1100: defer GPIO chip registration to postcore_initcall
Date: Mon,  2 Nov 2026 10:42:57 +0100
Message-ID: <179361257407.49840.3441048970024202305.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com>
References: <20261029-sa1100-swnode-fix-v1-1-112f4d83d191@gmail.com>
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
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae85b25 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=c9_QNTXIi0YaEdUqp3IA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 2chg0-Dvb7ixwjp0TCGx7EUILqSSZWYF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX5QtNRtU95B+X
 uhz72QFZkpuPf/F6VzqtZCU33Gcx7G6oqofpu51UFbajtIDPFnm0yud8SjIDb8ImWMHPvpEc8a8
 zGyvvQ50QS3uqKCRbvhqtk6St2UXH1s=
X-Proofpoint-ORIG-GUID: 2chg0-Dvb7ixwjp0TCGx7EUILqSSZWYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzOCBTYWx0ZWRfX+9vfwKbR7cXu
 GtREC937dpJee5Qu2gWQ27ypCW5KBPiupHpFuYfXdgDI1JskdPb02WolOx+sx9BpDypAuw43j9c
 LkuT2dImwcRMMzL4glmPkM4Pbj8qVgg6ejM4W9grspVMAxpXlCmJSqYg2wGMuX+7tEbhazqGUQX
 LYDOcAsUM5wY4QkZxi7i2BGP1VcRD2lZvAuBCu3/78G8RPH4LOumO43gGv/etgqrCuP7Gk4bYR1
 aUnHiywSlPRGquXatP2jUhwHwl9GokD3HHsxxg7RXEZs8GuRD82nNLIBfAqkFKlG+CHoIf1swcq
 Rm016s7I6AwZ+arPjMGyVybHeh60qQWOSn9m6fBMjEmSG0AAr+sldOQLFd2+nYLl76kINnmYQ2r
 f9g/t9fdNk34ZmkMa7m+M2QSvf7uS7JNtGWJl/WL9KyZpPK5N0ak3/cii0261SVxmd/knBZNxkr
 iXcllJhfCrH36CPu5yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020038


On Thu, 29 Oct 2026 11:58:15 -0700, Dmitry Torokhov wrote:
> Registering the software node and the GPIO chip for the SA-1100 GPIO
> controller during early IRQ initialization causes boot hangs on
> SA-1100 platforms because the software node subsystem has not yet
> been initialized. At that early boot stage, attempting to register
> software nodes dereferences a NULL kset pointer before console or
> driver model initialization.
> 
> [...]

Applied, thanks!

[1/1] gpio: sa1100: defer GPIO chip registration to postcore_initcall
      https://git.kernel.org/brgl/c/32c89e32b3fef2ee0aa5c4d0b0fb089bb20b3223

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
