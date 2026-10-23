Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750723;
	b=24DrR7XFXIgsRBXVt/6jZFL9R2+uWdxkl053PFsTuLwZf8yKE5Y+C4Evt9mnZZvsLz8u
	 iRFzj2mZUHyYKkV5NWnd55tKM6IL6fLrVe0H55Rc+ONAdw8FEj2ig2iiVBQlM5zAgQl+A
	 aPida/3+zZImclC72mSs23ShCRrhd+O3xKe7ZQOhLyFLrjGrJ75JKV8umyqxS8RSW1l4G
	 dtRL3KBfQ1+67AsHiKUGZxos9MEqBgeByFPJqdtc8UwPNNTAYRT/eAOQT/peWVdRuRR69
	 aYf6XkudWh5bDj78y/DFnyvl0gXf+mCNBhjugnyxXjXa3X3iWw4/R1mTgpGmz8CoXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
	b=C8vgg8nh69UZxwPxEfwMjF+yXdGRhfalph4LRFDdKB300yIK0y4ZF1qdSrUiRpgMlMb1
	 7n64eXjpcmgW6J0tDr+2HYETciJRTuTvr7tpoM7TIgej/utRkUQExnfahK1mqQswOuLwR
	 FdeP4forjCc7+ukCjGSXTJ400lKdDscTTB7a+478cy5OQ14dufn5lykrthduVOItu2zbJ
	 NrpCiGj0CR1NdvZ0ioFH7/err9CAvpCpkXIa2j13QiE+fPCL2abN9hFTdkxs7eo93g6oD
	 69BM0vBmPATua1PuvYyqJaDXLTcfjy3EWiqZch9FqRDS++udlSanvna8R3qDrA/SIfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57D606A31B
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B57D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BcgynjsH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YE8GQJzl
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAB0mB1444108
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=; b=BcgynjsHOsEyW0p7
	JmBaDsQ6nFQLkANcOVu+eCxU9MThVEiziIsFIThVRj72ESReWsq/2Fjlue6EMw7f
	QG7t3qTn0WrzVdngMbQxjibzLT4HeKhh3qX6VnfwOLHzcXvE5ilS23eCh0gfEZ3V
	gJdN1CF7iZTXsVzV/Da4x6OyFDP+nAvYJbtvKk8g4DpMYruI3A4MmZNNGmIgHFuh
	HQLr5vagq7d9LX6Hl5Z7FUUkE8k6BcGB7QJFrW6hfi9MgYUijr0hAVom3M6rkMS2
	cyyjxy/uNB3eb+d6uEcH7zV8JdmH2kJx/yvZVhQwRVX0UqIOddcFZnJf/IIQ9HG7
	+vI2uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbk835-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:18:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so153470585a.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750722; x=1793355522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=YE8GQJzlyuIDwIzkXS6EO/0vsC7REihvins5pqREw2lJ5PJjl1pPc8vGO91lstg23V
         PYFf3ZDLCAVT11iD1QaK3DfSR4+OWhlhT0cIcoIOFLJukihXDfo0fILomrH6bUoMS8RE
         E1Ddl3AXgAy8Vzy2uop749Lg6Ute4hBPt+Bokfg8TsE8m28iuuKSPWfavtZLlvSgAzup
         Ieau/oLgkKsQ6ZI4QRyQo4tvjQnnw8751/HAgYhq8TCWA9UWiYLa+Bfs+8uOthHI52EY
         6YM/LEVxpgDZ+lPAIPJjg1gfdHmMnka2eeKNXISkFWrr7ydGRE+jjBNYWyxlHx6jZgj/
         sZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750722; x=1793355522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjAarnCifburoEXGvsqsh/sxDLJBq4lP12OGzhjxpF8=;
        b=ywRN7WKK4QjRRMhkqjduscYk3IH5qjeGP/2pcdJlhSTnZ1X1hwfAMVie5nUkh7YgE3
         b7Zf5fiC4QdprDldepA9UTr+nsL9BKVyxb5r3wUn4SzsPpq9ZL+14pjtIUFrL+V135/2
         977ulNhMbZs1FXsMtfPkwuIrojYAMq7bvIL7ef4Y+vVs6c5gUfiyoszRzIfFECDVk84N
         V7UBrQ4MRyUmplMUgSrcsqz46HNkjc0tgXLyf7I/eg+sGLA8hPplD1mY6Zk2vwpQQZwY
         lLb9hwQg25LtohsD77a0ZtjIYsLLD5PpJoE0R3ml6NN8LEJ1Y2f6HPj+1waKg4Hhz+oW
         Zm3g==
X-Forwarded-Encrypted: i=1; AKwUvBw3NvWjH7m/JfJuz6iiuBNJcWoB3lJDHM3+yL/aP9fgUptqq6QCcT4p0O6Ho8lxiyi142aZ9IyAASv8@vger.kernel.org
X-Gm-Message-State: AFq9FYLubm/IN3D/G9zBqD7WiFPGWNrsGAcGBM2nlllcdq01m5B5eCFu
	jWulVR++ul9QU7uSK1J/Vk8o3L5o96XneOspMJipE28PWZlcP5PoNwbyDRQ+SG6T2SlrcIC03RW
	jPeBQbt/depiE12nMlqOApHKUxbnwdFrEY8DJ1gSf6sGj4uuPEsK0ieS+++C958M5
X-Gm-Gg: AYBFou3WOrACtdq+5scFMFtVqydzOODbyI6WTbBXJqJck02vL3ef4v6y7fFBloil7S7
	F0RZZVxZq8DV7UzHHUXjNgVrCRD8zyFMZHTrlD8xiEjn1wS2H44QixQ/9+TyvGQqSKnNBIMvu4G
	DxgFGxLdTdKb+lAnShM9rvSV+FWk4tWSjoBI+EA5yUKoI1H7KMKTxZbGlOsnaeuE5yd0eunf+RX
	tyfvl+3y+4KG+kiNBrsCHL+JAvlBcMxPdF2JuceKbjOV9XSSYG2vAeLJ3S0AV4345ba2gap1oDu
	VaFu1XM2A97bKSfao2+COV0+ZouHhvN9YacZEllm49u3W4W5G5X0qp21OkiL/8HEwyUD3RnLxUY
	S00mgLKcivVna7ZgGLCOe3Uz7VlY=
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362487985a.21.1792750721688;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
X-Received: by 2002:a05:620a:298c:b0:93f:2ab9:729e with SMTP id af79cd13be357-93f6f79c238mr362484485a.21.1792750721242;
        Fri, 23 Oct 2026 03:18:41 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38053b8asm3894504f8f.42.2026.10.23.03.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bradford Love <brad@nextdimension.cc>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-media@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v1 0/7] gpiolib: kill gpio_request_one()
Date: Fri, 23 Oct 2026 12:18:38 +0200
Message-ID: <179275071555.146035.13882849400290683549.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
References: <20260715185112.1323510-1-andriy.shevchenko@linux.intel.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX55cWxN3/0vWy
 VtQwCZgHPQZTlFKc4IujQ23M56GZr6d2ZI+CmOS4KazrodDlwKuF3PoAh0CH7XrPbIQYX8PGz3d
 J7GC68L2PlMdZvgMPOS5ssT6igAQyJA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX7osF91WANOXD
 Q8P9UigXdusxU5f1F5AfOycUagGSPHOoZaXMmW4omiH4g2mdUsc8M4gIlO3s5WAzHyLeJinJx89
 vXYxYVrlWZ0ApJ6RYTAC5DjFo47nJtW9XZVC+oQN7UHmh7NXe9bRRTrpvNXVZgjmDLno6kxyZeg
 LUJ51yjcahSqPD7LaQpcPeNCEdeY/lRHJOhcaZxWBQvpzoO9pUEp3RQyCdcVanZGYADHBDhPzOO
 aCwoyVjGZYwtmcGuuf6/aR5TM0trExLHe9T6zyaS9mfdCqTve0CX49ot+mac4EXLxhD/q8hU8Fh
 ns6aIaMSf5zv1ATHMDtNOcQ6fB23hn2HHdDUOHRHw/XvfyhdCFAzTLkaG87v4/U/W4RPx4Psq6W
 hFamC4aDF7Fc1bru7uPKCiNGpjTqovY2qWRnXcipduZTrANPpBT3xWwvP07tWqJQs/dZSDDZ86j
 np1sWZbF3ofCS/6o1+g==
X-Proofpoint-ORIG-GUID: GQhL7eLWd-hGboEnFOWhA0mmiTJ5K1xh
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb3482 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=xyndvWGceNBv60aQF6QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: GQhL7eLWd-hGboEnFOWhA0mmiTJ5K1xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039


On Wed, 15 Jul 2026 20:46:40 +0200, Andy Shevchenko wrote:
> This is the finilazation of the work announced in the commit 61e1fd2abca4
> ("gpiolib: legacy: Make sure we kill gpio_request_one() first"). With this
> small series we kill gpio_request_one() and leave only two legacy calls
> devm_gpio_request_one() and gpio_request(), where the managed one has only
> a few users and high chances to be killed soon as well.
> 
> The series is supposed to go via GPIO tree (due to nature of the last patch)
> with possible immutable branch for others. Please, ack.
> 
> [...]

Applied, thanks!

[1/7] ARM: pxa: spitz: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/e4c5145a8c42b1ff8c36d209b265d65005fb2a8e
[2/7] media: em28xx: Split em28xx_pctv_290e_set_lna_gpio() helper
      https://git.kernel.org/brgl/c/aa6a84558231f61264bd09c8ef013c7bca63db1e
[3/7] media: em28xx: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/492c8f997533acc550bc23be73b847f5e7bf3e75
[4/7] MIPS: BCM47XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/878804621d798dc9eff6148732f74adbc45e99de
[5/7] MIPS: BCM63XX: Remove one time use ephy_reset_gpio_flags
      https://git.kernel.org/brgl/c/6eeba9dc60aa6a5e2a617c7e08a6ad4da325c1f9
[6/7] MIPS: BCM63XX: Open code gpio_request_one()
      https://git.kernel.org/brgl/c/1805476b1a49aea62787072b28d7a2d5880c53da
[7/7] gpiolib: Get rid of not used anymore gpio_request_one()
      https://git.kernel.org/brgl/c/dbc9f76c3ce301c76991574e1944a0d2a8717062

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
