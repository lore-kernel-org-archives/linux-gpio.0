Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296592EEE60
	for <linux-gpio@vger.kernel.org>; Tue,  1 Sep 2026 16:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278453; cv=none; b=g41Cfd+n6zcYBz8o3FVK2d2HeWK6epGc9Bt24jBiuUDbPAri+qxSa1uaXYFePNneP3lzkfJZG9nCRpcoavf3nh3DPVAkYRM/L+fKxv51HUItvY/iRca82fr56l360q8RsC4EhcF+bX50qH8xdmXeq78HWpxP+X1dQKFd0jrI9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278453; c=relaxed/simple;
	bh=VWsXx0oUb/3cr023vldlEdubGn4liZ5nYTzyVVD9Pso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFb7LpJaaTionW4/D5R1zN4KiRTIsSa9v5ORKZ5zdhvcbelxoXN6HJylGFYZbclBgBGxggg8w809Xh+l5rThgSBq1rZWOek+bWEytghKQwNl6v7Fm83C/EhdoseUx4jpxRAmZFR/DnPYomwrKcBPv+8DJdNmwbY6tVOulWWNFNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O23rdkJI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfAWnGfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O23rdkJI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfAWnGfN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681EA2nq3005340
	for <linux-gpio@vger.kernel.org>; Tue, 1 Sep 2026 16:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=; b=O23rdkJIh/Al3g4I
	7HkC+OcZ7W0SgTtl8NgVSu/avNHVZc7hsCvhT4YhH936ODyxkaF+skSyRXcydeOW
	I192VD41gpMnYAVdY2qZH5ajE92nq6yfUF9Cp2ShrKCpXBj0T5WM7LQzvEu8zpWQ
	btFnVtqWjJOFdlABBy7ORiTPZyS3mhEmMopZXaiH+zlQk7Eo3o6zKzeKOvSBaEEI
	XDNJfzjjGMkextk3rmN/ZswgLcI4FrWY7/VomOY0AYyYvDm9pyY64dqkZsUivk2D
	Yc/JDM3+SZ8vFB+uphi/442vX7hdpxn/zKkU4+F/faHBr85EDZQXTuYDyyIhEZyu
	regG5g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh34kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 16:00:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939281526e1so10826585a.0
        for <linux-gpio@vger.kernel.org>; Tue, 01 Sep 2026 09:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278450; x=1788883250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=;
        b=RfAWnGfN13dHD+B8s16eZhWjqd2QVIEFG+u4B9PLgOavrBmzxz6RY169EBg9jvLlux
         D9qJ6Ynh1O6NpyuFjIHPIi7dteKdhOR9j7B3Lm5Z3MiqjJ6xrE9JrZ2upgxijnTVNuEp
         cQIoffINLJwNN3t/rlgKYOQ3BpsyVO2BO0TyhPD/V7I6NOrdy5B9ILSKeSWwi3LhswuX
         lh/2uxaxiVfCVVwkG1L4SJuawR0NoPVvU3J7l6qK/NWiWXRWTJwbT+l1aa7ObptRfOKG
         EGy7VBA4gpjGOS0vaiKK8tN1YE60K2+EzYlS2/BpFGnrSlhH65X/EgQQmV+HqEShJfmJ
         83lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278450; x=1788883250;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4J8eQJ9hKtkVUcAFRu9iHtJLeOFXzc723DIMlxjsbk=;
        b=RbLY3TKoA+auryd1bYnrqguNpDgaq0RrmydwP/24NpHmt13iMPtnHYl/rkFqk4wUeI
         D4iXEQRf/2zw2h3GiksrOE2ZVd+Fv5Ph/Z0ATm55UjBkw4mgimFMb6WA3+CP8gVEldLv
         obAWqule7JI6oV3Ab34JTOTFQ3+ASZ2GJnyznrsGkgX0qiE4DrVYwC1OVBTCELq+zCGp
         bNBpJFGVjlD3oCVfqifvwLtBmQEVlLp7uMKxiz2BCAsIfgq6Y/xjPPWhJb+sh011xGZe
         MAQvi9rDb0kjy+fXAN/cb0281PJnYtEhkkeJmnX5xwLHaZZHcRBLZNqr9qvTx6EdY8R8
         4vKQ==
X-Forwarded-Encrypted: i=1; AHgh+RohyLv10fBxf3bBnLEJqZ2JgIg1Jywg3C1uxJDfgUuHA3Z3ipdK0R9MKktCr2mZmlIgp8le/NW2orBS@vger.kernel.org
X-Gm-Message-State: AFuF++krpGmAKNObQz/QA3tRM+INcsIqXXdKlbMLNWFyWzeRzDy77xQ2
	zecewVGgw8Hj520Fa83DtyzQTzxQR7PpSJdMh2nanXtMGmo6G++lJRuxfwk/YzNlt7vG5rFCM/P
	ZGfNQTkhVXhsgC2i7or4SFV+o9WXXDqEieTuO6DRfgZ7UjeyPltK/KKbCRzec9FWs
X-Gm-Gg: AR+sD10mW08xVIDPjqKD02UBRrP0mBFgJKwangGlaV7h4rfWuVymSbcgCjXR5jHKQQv
	wX6t/fAxjJSgPNu9B4d/eo1sDpkSgbRiDnnBFndEY6iPVNXmSaVpu/YR9veG37d875X33jTaGC5
	XmMO13eNmJUwF4EygJbapK1dK34k/curNN+reZbXIYausMTuUJniv9T4hI7P/09kTAtxcRof/RS
	VUss/EufXqfQAb49lh955mg8KowE/WCzUARH2GAN5uhMXbR/WVggkwWb4SAvImAuAVfnB+HuGmN
	RyYTLFO6LpATxh0By8n/DQqTWJCZ/VfgX4StNAVssSRpDR36FWMnK34FS1lPQjvAWXKQUZqlSAZ
	PB7UJYgn2EMEZIu1vOuvaeQT2vg==
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr4281596985a.30.1788278450157;
        Tue, 01 Sep 2026 09:00:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6190:b0:936:41fe:2351 with SMTP id af79cd13be357-939138fc2a3mr4281573085a.30.1788278449321;
        Tue, 01 Sep 2026 09:00:49 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm89484475e9.3.2026.09.01.09.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:00:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Mika Westerberg <westeri@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kivan <vaknins33@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
Date: Tue,  1 Sep 2026 18:00:46 +0200
Message-ID: <178827844334.39529.382963115769227795.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821070651.39763-1-vaknins33@gmail.com>
References: <20260821070651.39763-1-vaknins33@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX3f8FTeRPZnQn
 bKIn2JfU3+P+izN75RJ4qmKTWvzorbJUGijjGgKP4i7yhcQaJwa2SuiGSEmEJfiQP+U6ti2yWm9
 pIipmmK4Obz2sId1Pk6DvYVM5uxYxmM=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96f6b2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uIWaOjwd8bGiIQV9JQEA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: VbcTeBLJdk2BkSH7pyRx7nsAeSMN2xsR
X-Proofpoint-ORIG-GUID: VbcTeBLJdk2BkSH7pyRx7nsAeSMN2xsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MSBTYWx0ZWRfX5IvOqixwyjzo
 iDWVJ2DZqTzG7lbRmKpqh5H1GWLUpzRstB0sq5BgylR9y2VaSevX5pD/GnZMZ68SnR5ZrwxDnof
 z7VwLTeRuS3Se7bJLG0a2EO3JLoh34hUwn2kDBP+4qKMpQkgjM9Os1CXGd4sptRJ4Og/rBTQmWr
 8ZuJxYnQ1BPldKJ8vAjxVaYwkT1fmDI4N0kaXyxnYK/MKUKV4+l+tx8FDGQs0nU0iX3xipE+cX+
 jq/arH+e4Dg58Lf+TwaZFakXdl9lT0EshFhZTAssvLDEHZ2ASFa6It73eeyfu4fYtke0m6N18+p
 bOtU8BBcQgHi7zwZNTycg1F8Nu05IMw5TrgwP66Wyxy9tJy6brUk85hJ5rWCWpTQEsnRYw0keXG
 anewNh0JISk6mXLn5+T0uq3ZKt82M9nto74gV/BY2F6yJGhCGw0z/z9Zm73ym7xpow97gonQaJc
 DRYiBHLinbMCQzBbdfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010141


On Fri, 21 Aug 2026 10:06:50 +0300, Kivan wrote:
> The ASUS ZenBook UX425UA_UM425UA (with AMD Ryzen 7 5700U SoC) fails
> to stay suspended in s2idle (Modern Standby), prematurely waking
> after 1-3 seconds with 0% hardware sleep achieved.
> 
> In the laptop's ACPI SSDT tables (SSDT15), GPIO Pin 24 (hex 0x18) is
> defined in _AEI as ExclusiveAndWake targeting the PCIe bridge device
> \_SB.PCI0.GPP3:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA
      https://git.kernel.org/brgl/c/1900b5a41493e7050c68c1e62780d6fb9a209457

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
