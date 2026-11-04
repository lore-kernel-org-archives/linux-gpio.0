Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806626;
	b=SFwBDpyDQwgzxVLZSCCnNLGGhB0tTKy64W/IEtcLfmiFeWsHUSpW37Y99OTnlKtQYkA4
	 VFtX+aRLD0gNLnkj9TcrT3uKE9+BeDgtDTH60zR8XOmOeEijXSv0Y2OLBx9fhQqZcy8Zc
	 +z6G6/6Pd5a8drn7iOWCRR27TvIHp0ITdMly9kv4ZN+WuRKYBcZaUraGbqFeC0VhIiIXu
	 vwuULKFMSSFpl6N4qC7j/phRMZKj6Qis114SktTfKszlYQQxIuR73hexflB7Tnkv2wXKe
	 qUzgcNaGfAFyD/ZMsPxp2xbmWp8Z45aPMZBVV+3t/I+PDs19DI3GxYIQIkaFUqTSObA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
	b=KWHWfNJ+UlUUw/Qy4EbyO9/dpFuOh9BusTncAYb9z6fz6DLWbPTsniFJQFQjrKe77IBW
	 GLLWtZ3l+iAA2UpCKeTRYbXjfKbr7qls5AGZt1n5bmfKn3p9yzJIW393qNw5Ky8QPSlsI
	 drLyCAtdKEfrI10waT+toqyCVAR3EQ5isdVO3OQoa/0js3orArQsUuI2c/H/LW8R6aeLg
	 d1qnEUk15rZFThcSV86aM2ppkNIUBJMA5wyB1RmXnLh9BWRnqQmg7+6UrUhjarf5KEFFX
	 zm+JQyiHAGhkUXFOniaqsl04Xr6XvEF/IBhIdnWfXTyqHb2Ni9egrFycjDJ5dgXuQ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=heTYJtwm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jKrSZ329;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AF2606EEB9
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34AF2606EEB9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=heTYJtwm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jKrSZ329
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba4fo2284313
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 15:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=; b=heTYJtwm/5DiNiwY
	G8SJwdU9hl5Qmd1VtPf3VXuJFQgU+snsccCgNN6Kn66PMZrBeOUQSOV/cSHbFQ0f
	K3KpWHi8mNIYbX0/lJLxYRSgG+AnivAg6FdHwN0SR6PAy22SNw+fKsMO+JJu2uLd
	1uuh42lOcA991KSL8DduSShy3BPNPV+27zxyuu1hau3r5flI6QgyI35FM7apgkai
	3XfzoiMJ4neOn5EOrZTUIryLIFRgYgkpWUT2hGI9Q+ssJbutOrw45HRO7esFq5eu
	mx4oUQyv/pw0tjQ5SndvtcFY6rvQGIJ99RsuWsahV73+1Y5kZQv4uMgP9dwCFeW2
	nTXt0A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284scht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 15:37:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so127469785a.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806623; x=1794411423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=jKrSZ329HO3YGTdgE40mXo1GcyS7g2SoB+tBCRVLZYtcbzw30SIWmPlsomQ5t1SAJJ
         WdoYm4aC+Owcm/vi/+p/FrxB6apzWfPbHatCUQyt1VrD1gzPweT7SU1h8ihofFHl1AOA
         gNopuxsW+SrTPe8yEepVcnfcYxEgy5IMBm5khzGlfR6OOarlPhapWPvNx4BMnlaS8yA+
         xejxYyfRsn0u96aWXa3BFZWqiqCFtanCnUf3wG2VfH08hGmKEEIoA1dOefbf8GC8sym2
         VfYMlLKz+83bfGwJA9ygGthTc3C2/WXiV+PR1+rS4muOSn136YKS/r/RUNfou52qWPNn
         9SOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806623; x=1794411423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oYJdfOinrzELgzRLOUmhl5r+8YEY5GN23EPCj1nWug=;
        b=b3aDMxRoB3kIfjC4jviXRWSyUqaE4nSyuUsVzQmRJZp75H5oBhHPQ65LnCQulxkhlm
         paFeBndJw7J3qWGceyokO90SXkPmJRh6BxlHy6hpS3kqMAhPQeUyI5wZm7gcmIzvjMUy
         nHdShZbwF11k0FlUg3tg8vkduRiMp4juJd8prWgZ31ZZQANhXwUeDXYpA5EpMy6FyvpK
         9LRCG21AdnzmVJtT1InAOPeMJCFo/r7yyZtDPxpMuKEieKabh/vkkp3gkyLmAi/uPRUx
         x8jI8F5EnAR8Jf91/XdsbyNGRHnZXVtK/ZuTWh+YS4brNG9EzzsFnmqCJKg8//5Ygo+P
         uaXw==
X-Gm-Message-State: APuU4Z/Al7/6Zf8TK1JCD5AfqA+fwOCT5VQjjzJaJ5j6dx96hC9N2wlw
	00nLo/z1oJ33OGBI5TMLQ1WXwD6lvmAIrSK1sWRyOWf7cNlIzCJet/5KwLv2N+T6hOls9XEzDIR
	ZhkVqDjvHtSt34QECbfAcmxKP9T+DRVEPMT+oi6jLo9AgTaZCN261h+9CVjCpZfbm7yoENuqx
X-Gm-Gg: AYBFou2hXxT77BXoPzKob/ptU0IOPSVktxaoPJY81YkH70BhWFrI0ZmKKuwOFmeNGxu
	1svOpABFhaHSws0yWbN9b+9pmtd/LWqhM+2fCGITbxA87HwmgC6sUAwJDXu6LFHjfZgHE4xHq7A
	6lt712P+H4u5SuMzn+Q3vVTn50PO7CF3yBCTsFkASsTjbP5C4EalR2keMb6eWPMw8Nz5yOXGK58
	gp8L7T1gq4msAfPll/53gVKF4wBYDjRjxUk/j3rC30mybWh8EIdjBEd/az0dC6tCAve1ww7Emm2
	lUCQMcwhz5pUYDytpHi9knzhl+a8dv3kbFPHgBxHnLOOnhazj+viAO/V+XmGzkM2vEvU39Xp6Ef
	HVyj3ukPWruJz/fQUBdS7LtQArKRnl9/xvWqDh2opg/8CIWN88A6DN20ZqblbfXruW0MX3VL1yv
	E5xw==
X-Received: by 2002:a05:620a:31a6:b0:93a:9ef5:d370 with SMTP id af79cd13be357-94421541a71mr2748313985a.1.1793806623450;
        Wed, 04 Nov 2026 07:37:03 -0800 (PST)
X-Received: by 2002:a05:620a:31a6:b0:93a:9ef5:d370 with SMTP id af79cd13be357-94421541a71mr2748307185a.1.1793806622911;
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:02 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 16:36:56 +0100
Subject: [PATCH 1/5] gpiolib: don't overwrite the entire flags field in
 gpiod_get_direction()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-gpio-desc-flags-atomic-v1-1-e23cedf619ba@oss.qualcomm.com>
References: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+8v3qmfY3AHKzOT4m6VAF4oSiX3y/ZfBI6uqAwNRMe4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61Ea3P80RXVixb4xgFgjxcRxf1vL0VxehPiBy
 7QS4KdUCb6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGgAKCRAFnS7L/zaE
 w7geEACcF/NiCk/I0Re12FiNWQm4mEYvpGHxzcCsBNkeQ11ISgsK7tvi7x31dfjCEgHsR6vOMzB
 eCICUznDuwqFAj3Ggt4vzYtcH7F/xOwW2oti/OiMXZ6wE5GSHS81Tj25/JmytA4kDMyQKuizHUv
 hIEbVuci2bRmtfhI5qOC6E+ndYA28UXatc2kvjL2DHrteaFQZqd+tWD6XF0XBazY7WZYyXXuGVe
 1OXYUb/B01rYEUvTfsUh1CrYU+fKvPmHbw3rFu+Ms8rwwqG8yjdK0v78DTnhEgV9bHZwsbXMXAo
 sjwlT5EssyOFbD8qbiU8+566T4TqXpxiKlp6P4//ydzSrsmq3PKCmNWvxAoIdJxnyQvF6SX8V//
 PEt73I5bCmW1fIk6noX1/DzEAFQo2lXd24XvhaK7CzKhNIjbPIHrGIW3/z0v+ztyKrd1B58oOIc
 qjg5osqMmkC34AoQoUSxAZDjkxXzz2L7KLzGePos/9vVp3KK9gopVS7Doe36QoenYYS4JyvuBI0
 7XWdLqQosrUdVg99PyhLtiMA8HmUnXCafxInEZ39C/LVH/73rfeB34Dxe34WkIv3mXBumBwTIgI
 15MfsL8HLqa21UJwu9Ak8dsqZXnk/QDAx9O1Ns+ULkuiqglpPdqhkgbiXSKZeS/hMg3lSqEYP0b
 pKANiOu2dd64/ug==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb5120 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i4ZC8ekb83Sdn_VXTnoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: A40rUZbSfwvMnd8k_t37qImUihDL8cBk
X-Proofpoint-GUID: A40rUZbSfwvMnd8k_t37qImUihDL8cBk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX3Ok92gLePG0Z
 j9l1Lm5CAaMjGY8HjwlaB+8WNnjZH5G7oxLNUUba9Nv3ppiuR/SBcuqNitTFKhITsDaZOATpwP3
 9DZjuvPeLlCPcPCsw66jDvryOplQTVXSD3Z3FVy1SuMz35iFCh38xzgHcewP3YLbYUXdFmB44Ne
 7Q9N5mNv7LjnEWXlqJZOsduRkEVBX5pNgxpovzUAqkNkBiwg6k8n6ERS1Ii4qT3iToB8uysHANR
 WM7S4N8oFvc+QJkV/fEb2o04T6NkM+YeKH3gZjQQfZsqRKqH0N4Hlcp1zLnLs8OWSf2a8oJ5pFK
 kXIuFBMD3K03g9KuYpPwXozt/eKgfT2Wv+DtNsjG4sSGFMxQtVAVdOJzB72pcSYKLsbOtMBsKID
 N7h45Zbnt1mNoah6bxG8WjdFkxxPoHCK/6R4h9hkXBAw+W/G3oqSVH9d/itqmgUaG3JnRJQn/qT
 PPNIvAQytw5EivQHXbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXyPnIxl3qaLOz
 q8orKXtoOQ7Z850rShQ4Bh9Z0bCGsuaXOc1QS4/RaQKVsKKqdttOb+zeb7jgBvh6idazt7uSWn8
 4NHukdJOzLUf++k6rDtVhtYmy6B6oZ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040062

gpiod_get_direction() snapshots desc->flags with READ_ONCE(), updates
FLAG_IS_OUT in the local copy and writes the whole word back with
WRITE_ONCE(). Any bit that a concurrent user sets or clears atomically in
between - for instance: FLAG_USED_AS_IRQ from gpiochip_lock_as_irq() - is
silently lost.

Update FLAG_IS_OUT with a single atomic assign_bit() directly on
desc->flags. The earlier READ_ONCE() snapshot is only used for the
open-drain check and stays.

Cc: stable@vger.kernel.org
Fixes: 2559f2e09211 ("gpio: reinforce desc->flags handling")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..63b65b646fbcfa9ea0f724d1d3e1ac22ba28f638 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -486,8 +486,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (ret > 0)
 		ret = 1;
 
-	assign_bit(GPIOD_FLAG_IS_OUT, &flags, !ret);
-	WRITE_ONCE(desc->flags, flags);
+	assign_bit(GPIOD_FLAG_IS_OUT, &desc->flags, !ret);
 
 	return ret;
 }

-- 
2.47.3

