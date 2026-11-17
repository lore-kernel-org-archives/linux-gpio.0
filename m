Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903586;
	b=yXAfKtG8KqGO31DVRUuqv3Jx36JrwydS+PsFjbOYZ5jLpK/jOQxCaZ49hG4wNhFBb2E9
	 xgfnKLeF6blhudO/HeeaMJrMZB8asEraRN3Kdu1v6Ep//Kdk5JPVAasoE07ebazV625sv
	 cxO0CJxmCPu3R0vUCy1hrf07Dm+HNaeV3gGT8OrkMJPMZEVsqXS7pcPK3+ipZcB+DvwTr
	 KgLbRGbVrdqH7tuLCkrR6V2xQsVP1xUrOkbSmQ3pMRueDFq/cgbs69BeC2nMINDddBc6r
	 WMMUFcDwo2NfDW1R3Cu+Cohx3hkTguui1hzYu/QjVmnnc9b51we9Fh05OYxDzPBPd4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
	b=cguxI08qd9nhueEi6BUQ2u88hQ+2Mun8yVD+6O4GmX972gRaR6ooAkJpAsfBGQxxCpji
	 jS8ba/R7FazVg/r9vVkYgrNIl+x5buHWJx7RSefomaTKV71wQLIie69cj7RCYg/aCqQPP
	 KYhS6os5VhXdzyI/rTAvOrqF+DU/ARnQ/tb4bwIAoQOJu1B5uCljbswljcMDUA7BhzGAo
	 IWYq3oBKNJoB/qnJ5E5JYUv4ieyWbgDLcJjWTE7PVqX9JiQ4Z4swQVCE+ekp7EegZed+6
	 1DGsBV2KfaucOP6kPbJjCSEmBQ/Cxo/g+uBsShBzo1MeNigLI0sIoQw/6pcMNxbEY5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVgKlbY1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIZXluDy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0E7606A32A
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0E7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVgKlbY1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FIZXluDy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aNTZ2935297
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=; b=MVgKlbY1bK+UWWCe
	tNNVlrxzx851sPGGa92DnVtzARZyeTjZAtAThk0nKfi+7MiXZHu5TR819FXc9/re
	tyGCkGR8aVXCvijpc/pfb6i5EOBp5DP3QeEhyCDkLqoPaY6AVwaK8oP9sIUnYDUw
	TQkiGyYmj4a+hqQdOuO8rDd7jI1h4ovvTMGCk3ihVGnqjasCyTw3Z2dY58RcIC3O
	QzzdrcOFHo9HCsTgcq2xw2VqVpbYTRi1hyazGYzoklzWL02wgpMS0s23Li6zDh7j
	QglVWCnNBnNcvceIjv+GJMisNUzmJnYjIeM5gU+ITBEf3z69K2xdueQZDMJMQPSV
	pqMnYQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j09m0a38d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 08:19:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495876f8beso530185485a.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 00:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794903584; x=1795508384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
        b=FIZXluDys6JMdL4KGo3NWkJhkGgocEo+vvKVZil043EWuoQhGYACRo7sqCTp/mLCJ8
         /nAWmp0BvG0j808w1JzvcZgNwvgEqM/26/I7PIO9Wezx2k1l59NYUvn+P35UetkPcQGR
         VWeovMCEtn904ri4xQedUlPMKDzUi1k59wbFohQpG+Fc1TQa9VJ0wIzR4pNovoTCyqwl
         Szq/NBYVFmxISrznT/w2ffGcewk2vNo9NB9jrIYdul4VG3QEwceVWlg/NxSTCBl6CKIt
         +/FcqSmw3yTnyfxQ0r8cZWJRcTvLkDUFUnEakXhUbb6+c0Ij+akOE8ZhiLet2PKb7neg
         m8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903584; x=1795508384;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ny7AiiPk/oZ9PlbRw4f2tbZfuBw0koUKDbxKbxil8rA=;
        b=HgEUYf62qVQZhTxLOcSQ1A7uj4PTlYfjIO26bKANgqEYbyVE5Jxt1bZ6sapiq2aKE9
         h1jJJAafNGom45icb2Fxv5CnlTpbkrBoleT3qsaDWwEUtYpgXc+cVxQ51328nEAAJDhY
         wHlYIpJSbMo+8Csm36hPyEoXOEv/ljuWJ5LH9dlIEtdQfv5l8Rjmrw4ZY90U7pAnN6CB
         aOcAV8aIb03wRvGtL7oZ+WARP+2IaheiiwbdG025E2JL6koJHpAEZWgt7JvIRTaT6vkw
         Ch3Idp7l1iF48j4ESKidv4GQJuzFAdK1SsTKz/yW4cCxcc2mUmHv8tAdv8sph1PgW9vP
         FKhw==
X-Forwarded-Encrypted: i=1; AL+hErEg5PiMU5Ygo6YrvNJ5fO3JlOR0h/0p0Y/K9E88eF5acD+x9003KUOOWLiRQkSAqNeETA8F18dF9iaN@vger.kernel.org
X-Gm-Message-State: APuU4Z/5eBiPK1BClzq/nmcPMxQlQ9edtsckWGtSgt5MYmtE6lKwKg8F
	rF9nlDY9a2ZDlncVQ4/ay59cxVMl5yaoVkx79R0mIWFU1yZ7E5Efn5Ms0CapdgvqSkcwczZ4O/R
	u9vSqgB+eUVN4uCLv0QVQoYoK8pqILGa3fmIFXZgoHaV2+ZSszXuBKx2xEFG7lwpkEBNGRF0CAq
	g=
X-Gm-Gg: AYBFou2Vv2jrcImwAVtz1WQ1PZ7XtqIv+FHU0IvP9j/6wndTLg5gTM2P+8OAOP6imf4
	bdJmZOR04hBQesBY0/+KOR1c5qegyyTFut/B5tdqlpK92fEEawV5XxROi2hEHwyfOiwcerQs80W
	ylQWcY3XygqUS+Xdvdeb/F3tu/c+33brqbUMOjnlTf+JDiFkBTkuwF96X/pqzN8qkNTAU2Awse8
	G9Oi5N0U5zkrmYBT1N6L2xC5puXS6I1XKclKK1oenP5lQIgm+dSY4vA8VkU6d0FObLpqM5O/3fm
	v4rm8PInO8oaeS91ZmKVXcuJQ3zp7QYFmvFTczOwG5xL5gvl0FGAksXwJtiCVHQkwNWHOLOekY6
	73wnU2oAnF4FuxY010O8As5kPnyQgRX2rJyHxJkfsGilURYZ4dd9dMUQypOn3VoOf880G+ATRQ1
	A=
X-Received: by 2002:a05:620a:2628:b0:93f:2d10:ea49 with SMTP id af79cd13be357-9494bbe6ea1mr2238501685a.45.1794903583673;
        Tue, 17 Nov 2026 00:19:43 -0800 (PST)
X-Received: by 2002:a05:620a:2628:b0:93f:2d10:ea49 with SMTP id af79cd13be357-9494bbe6ea1mr2238499885a.45.1794903583279;
        Tue, 17 Nov 2026 00:19:43 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm26986871f8f.49.2026.11.17.00.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:19:42 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: brgl@kernel.org, Gu Bin <gubin@cmss.chinamobile.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        warthog618@gmail.com, andriy.shevchenko@linux.intel.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools: gpio: gpio-watch: do not clobber errno on read error
Date: Tue, 17 Nov 2026 09:19:40 +0100
Message-ID: <179490357461.14174.7875840926920818948.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113035723.2215-1-gubin@cmss.chinamobile.com>
References: <20261113035723.2215-1-gubin@cmss.chinamobile.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX7VmWDrYKVqgw
 iObiusjEpR94W4iz+xXdEyvLWfJ3X3xecjqfrDMv/JYvw9hvGvm+dssv10iIKgGzAQbzAsYJO/I
 IOwpwvcZGpKHe9YmUXKm4fKbm6t+dsA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMiBTYWx0ZWRfX6Ncy/6CTz6Ei
 FIDhHnpCkCby3SeBdWyGP2V9q/IHQl8OhX/uKkQloSpWlYz4neJbvvaer39HTsJLhSxvIQEFP3i
 1aoU2u7oF55kG37THl+kjJ2tnECUNAT9Pgs1LD42Cl7rMd/D2m5HPSL6QzSYyhGnbULRxx1t8FO
 uORwLvgjNmIZf0upwkTs4XJm4HOzd6r7klWYXJoXNfP0yYRdK27Gb802XnGaLl0Aw1M0Fvr2jVP
 l6VyEDRtTfY1T7Jlqt7+kZTviplnRRBkRjNsEmJ7u5wKYiiz2U/iE+7O1ioABP9Z8D3mH0oow6i
 Ho57z4+srMeHXdHWXpuL7qEcrOtovPsIcm9dTgpo3jM0CUH2y5JZVGEKxGBORN/xB0fIM5zi/3V
 9kI0zDcpm8SKPvNtXqPkFnkE+9R3axH1iFgnywNAmOb3yVwEj3tJ286osc1EWPZrbLISaU09F4/
 WmYrCPVtaxaTgbu3BJQ==
X-Proofpoint-GUID: uDvaSaVsa0xqxlOvYBQueaqCVAXbvnLy
X-Proofpoint-ORIG-GUID: uDvaSaVsa0xqxlOvYBQueaqCVAXbvnLy
X-Authority-Analysis: v=2.4 cv=F7rC5ahN c=1 sm=1 tr=0 ts=6afc0e20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yka6hBzTXpN0FCfeuc4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170032


On Fri, 13 Nov 2026 11:57:22 +0800, Gu Bin wrote:
> gpio-watch reads line change events from a gpiochip character device
> and reports a read() error or short read with perror(), which prints
> strerror(errno).  If read() fails, say with EINTR, the inner
> 
> 	if (rd != sizeof(chg))
> 		errno = EIO;
> 
> [...]

Applied, thanks!

[1/1] tools: gpio: gpio-watch: do not clobber errno on read error
      https://git.kernel.org/brgl/c/845dbb71d620c8f76ed63fa2cd25008194ad3426

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
