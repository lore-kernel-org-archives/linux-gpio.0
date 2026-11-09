Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220032;
	b=Xkmm2O0kuqPVRkZrseR9qUdZuG3A001BIPW1vVIL5qHkdfPL5QdJG1H2JTD+JDRjHEAK
	 Sb5Nl93o2Y9FJ3v4n33hGBgGH9wkvaqDPwuaw+7NWJNvtyEhrIJbUbVgVVhjhHCt6zx7y
	 4EvZ8YA/RwsFUy1WgX0bllqzQd/KS18YdU9xUvGcHYMwxtuVRE5SXcggGZ1BZSNec7m/p
	 FmZifmUKbFHB2vO1+qF7CBZcNBwH6I53AmSJaDPOSufXkAMOkPAZfsK9pFLxG5UKwshGf
	 +hbjQ8Z96sFLgXLNB6F7wxJ1qM5m06qCLwJ6Iv5uttE2Nm0u2N2QNa7ndvtIt5r10kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220032;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EVqF7yN6G/1zex48NwJMs4JSG7UiDgF1W9WYPytnZWk=;
	b=q0l2b/70BAxtmAX0Z+ZMJiEZz/6l2SbSCZ1g7aotZuu18R1Kie++PKdvqYZerBpIlH9Y
	 HkEBTpO3RgXkJosCVE4gfvMbaV7UmDU8aytAfOveEYIQbH03m3Uv5/d3S1k6IRYNe4iXo
	 eOvRd4guCqn+ykKwJuPVIJUmvFkb8QO1O8exgSEvjDV7yVnJlIKois8TpuC9aPvnOzoo0
	 6Kc5Zk8uvTVgx3Cat1qcSsCewkosEZR5Re4TiMyo5SQz+JKl9n+RrtnqYJUbtHvbKyNZQ
	 kaal8f6vM+Tsa/AiF3NigxSUd7ULLpIiXTBA/zOlv7MJ3ovn6Z5kV4s1Me6Nk5auoiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPI+jH8B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cBZkSLIs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDC606A322
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EDDC606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPI+jH8B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cBZkSLIs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99urDM3163798
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 10:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EVqF7yN6G/1zex48NwJMs4
	JSG7UiDgF1W9WYPytnZWk=; b=NPI+jH8BRZuCpgxPfoArgDiP7bCMD0sJE9MmtL
	z8aYHQJxO6+rD6+2gEg9qAPnexHoU2sQl1wQ3iXGi+kxwQ0Ta99CBpQssbFwQn2D
	eGJXqZo4dvcD5GsaXIikizPLqLEpNBK4S1utSBD+LQU1RxPM6y2cU7yDaiy6+pKH
	/A8hO5xACb+5zG/e6cMdTKxJvJSNXaE+eo5X4om5ARKLkHBcWzBcdGS2GcqUxq4n
	mM7tQeECeqsnI6+9pFvuFXFgYQj/TBlscVpnwBP2t8/lNtQMnwWV/IyjrKucPNwB
	NoiM10LAtuOPMy8sDGKPJOTvMkTY/BBTEBzhwSVkRmMpG34g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99npdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 10:27:10 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7bf2d734so15831326d6.3
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 02:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220030; x=1794824830; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EVqF7yN6G/1zex48NwJMs4JSG7UiDgF1W9WYPytnZWk=;
        b=cBZkSLIsrdT30FhWhYqQkiZtVgS3yIgYyfOuXmR21lb5HC9Cmqz3nHGSic2Z9W/GjK
         crJtxuSYEXD5yjWeUUQ6KPiHAr+RZS1ApBb8TytxQIWkr+zude91N8OyqiBr22OaxzrO
         NrKpKHpICUS71p5Xpg84RJZXO+WHd1rdp/kkMpw/RD1z+yCiNuDTV3Qj+cN7V7tchfZv
         vXcx4BHLljAhDyZPCQhgnP0lAJOWytkJdN4tiWiQkRrLuGihbrN4j3yNa7XBpg9SocTl
         /dycZD1+8xMThkXrFoTvTlBKnR6aZRu1F3he7bHRzI5RNGYmH2sFbCYHzxKp/WqKj8z1
         fJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220030; x=1794824830;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EVqF7yN6G/1zex48NwJMs4JSG7UiDgF1W9WYPytnZWk=;
        b=IdYi4mMI4JgwmeVqRjoaI4H97Yqr0AqmFtDMYRguhAVtSHh2D/qn9rSGCFdfTnBqcp
         aY/FT43JaqHlgbFs8KWfWVoj/Sk4b1zvHOGdJvJlxFSKTLHehZ1rB9jyuYE2jdhNTXWI
         Hz4jp2veAikHyqDgXI9VO16uJXnJ39LElA+N4GG0sXMC1So4OXI9Sen0ztlDjocoxIg6
         L4CFakJ1v+L8cg5WoVWGqAz87ievGismV4ACh6+fio8EOtqu1AGYIJpEuwcGRaIko0pR
         SXVCNro8T4+wz05ddLnkqZPS3nyyz727U8epCnWTEHl1TOs2Yqm3WiKO5w3Ry3ca9nWm
         z3Pw==
X-Gm-Message-State: APuU4Z/C2ksyFO0f54zYwE4yRtHkduhJVoek1waHEwdzogSc4wCl5DGC
	OK7++PXgXHehB+ZwyVjHx/tSCGMSnfomSchAB72VRU3pOD7Ze4Esa1Fyj7Y7OZvvkgBDECRC36z
	N/pcu7/ZT+gUZ1M4Gk3Rsk+IhxtJ8tgXZFiGo88VlJ9njmzJWAF62lY8CYKNSTQw5
X-Gm-Gg: AYBFou2UKQMKp33nb2/gcUBAwUqJ3qw8JxytcNsEjbxyTxe5ytl56YaHpYtzG9GG6mm
	Saxpl3KHGvKUitqrh4NzihOCK6xXuTWls1nyhSjEVo3iUF3j0a5XXgnmkfwY9lPK+bLcNKJqeJN
	1yCyKA/lWtdiadETziCM8s3F6iKj0nvN6QtISkE7+IzZdliqunn0O3jy85DKyFtCEU22moCekwg
	6DUWq5iGDBQ5ZWfAXtZFy6t5n6T6bYvRPn4KxpPq7aWwvvh/ICVP5jFx9xOY1r/sImPHSRDorqp
	SPg9woq489Ppox+Og5CTZyc9BOa1JR7qQnDwAudQVv1X8RkJCrghrGjxBnVoykA/fFm1+/PwIJJ
	PGGIFBOrYhm9pn0GuLjSMCiT1u+UPi/Nt0+sUZT8HwLI5vXL7UL2/LnJwGDvHaVnZrTmrzyjfhM
	4RxksNxHmfPrg1z9cXsatiKdWMYmLECY1F4DUr0iKnZ066qEVB5SwQiI/Y7Qm2gOM=
X-Received: by 2002:a05:620a:4087:b0:93f:34b0:4880 with SMTP id af79cd13be357-947841eb130mr558989885a.22.1794220029861;
        Mon, 09 Nov 2026 02:27:09 -0800 (PST)
X-Received: by 2002:a05:620a:4087:b0:93f:34b0:4880 with SMTP id af79cd13be357-947841eb130mr558988485a.22.1794220029468;
        Mon, 09 Nov 2026 02:27:09 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad4d1sm237381545e9.5.2026.11.09.02.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:27:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/5] gpiolib: improve concurrent access to the flags
 field of struct gpio_desc
Date: Mon, 09 Nov 2026 11:27:04 +0100
Message-Id: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPif8WoC/4WNQQqDMBBFryJZdySJRbCr3qO4SCcTHVBjMyot4
 t2beoFuPrwP//1dCSUmUbdiV4k2Fo5TBnspFPZu6gjYZ1ZW29oYfYVu5gieBCEMrhNwSxwZAbG
 pK2cQg9cqj+dEgd+n+NFm7lmWmD7nz2Z+7V/lZkAD2QrJh9o0T3ePIuVrdQPGcSxzqPY4ji877
 bAHwwAAAA==
X-Change-ID: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wBn3LR2/K6DWqnzwS6Fqakc7fXqzC6CyL5/wmD47UVs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8Z/7DxfuE8KBV0EGa/dclW8NxrhzXxSHbP/FS
 epRXi6YF/CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGf+wAKCRAFnS7L/zaE
 w7MgD/wP3c8P8b+nS+Zs7CW/IqFwVgsvyzhhBxOmQ09mTzrjQRinnRdl0UDu1EsAeRcEC4dJYP1
 HxUND+Pk6hRShGOCnQLSZ4FiSuiQKJ0xxCdH6XJkAz6eDEp93zasDvJLpqGsLPEt6UeQUZGDyiN
 GIx7FrkqbXKVFv7xPZyjOpgyAzhvyI9uYfMQ65qE3/379+putWWvp9nUQ6CXj3onfv+xv4eHOLf
 qLTdFWe4q+qx2x3i1YrFMU75R+mV9Ij6LIxDJ5vmZFPsFRtDP08e7d+IQgBcT/HWx75627KlWGs
 ds6W2SMD2uvL2tH5GR13b7LB4XYr/7ud894TpJdKUEwttngOAOC1OcOM5pWtLxqgIM3jzpOq6pD
 TubuAjzOonWAphTjMIYbzeCPtt9xmBMUZ6KhEQWGcM2AeYqyqdWk76hv5Ls6Y3H5EWjvusUG4rd
 f9S/NZa0cyBNz5ma2LArYdnEhbEAwv2qXtfELC6kLlTHCR4C/mBNBV2LYbV5Y7gnYsah+B60JKu
 Fv3IOWsHn2MeamD/Oe6+LF+c3lCvFUSMesmX4suJdgb3JQgZ93GroOVDrhijZXJuVH9HilHhW75
 UoZqUeQr8d03/ivgaC6iYqmoJoWTcDhw9ob1YOtU38aHfJYNPsIHRl24/HnHC3XWxuLma1sgPvc
 t6GjX8Fez8klXTA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: w2MgCeRezp1uVYJanIp2-zB8IGZ68lY5
X-Proofpoint-GUID: w2MgCeRezp1uVYJanIp2-zB8IGZ68lY5
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af19ffe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=D8W7ssISyP8QuMM01yIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX8XbiAVgoEv2j
 +yd4SZsUe2xD0pww323vvj8ArYz6wKGrsk70NI+ODAbVz3GbUOUbNIeOuOsEh/7Gr+BIVczeCog
 PvZ+sHq0PKd682E/w6gVc60YS+ylIXq98k4ASfjzhxqJeW2firSZz4bVOjCw8Qn8XyuwVJXevS5
 MQiTC7sEfGvY3brFU44wDU9cXTatpoG9tGRhNKQEtDdQALQYzyBxNVbrMAgD2ZXyW1L03XyFXPy
 xsSNH4ksl4BUP6V0yjR4kQWqXOfxX88D1kpB/nuILmKIaX5UV+M2pFQrxB+63hXHYF1DX8vOH+T
 pG3zTGhWE6PnosFmqy5qWdQ/F+tsfXqHVYIQ6ROLxZ7Q9E9VAZQ8ED1MGf2OWI4AKXsoT18KrUU
 sFW4Zoc6iy84FIiFcwb5Q/F1xyGSJzYI7qoM3Da4iWk3HvHVC5UKtlNfWZBQlQqd1ShS98TNcdk
 NYxEBI6O/pzBIT+Up3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfXzcFKKkvHyOsx
 FHFpKh05KXINQBTo+gf93ivfJTkrXK5KK4Kin5gQ3gr27lD1nlzp048yXPY96O1YM6nTd2nekvF
 /U1v3f/Pc6B6cPDjCHedZmqlHraG16M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090041

This is a follow-up to our discussion[1] about desc->flags and possible
races with users who don't/can't synchronize with other means.

It's an attempt to use try_cmpxchg() to update only the required flags
atomically where needed + minor fixes using atomic variants of bitops
where it makes sense.

[1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Drop the custom gpiod_update_flags() function and use the existing
  set_mask_bits() macro instead
- Add a patch clearing debounce_period_us before GPIOD_FLAG_REQUESTED as
  suggested by Kent
- Rename the functions updating flags in gpiolib-cdev.c
- Don't rename the flags variable
- Link to v1: https://patch.msgid.link/20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: clear debounce period before the "requested" flag
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines

 drivers/gpio/gpiolib-cdev.c   | 111 +++++++++++++++++++++++-------------------
 drivers/gpio/gpiolib-shared.c |   6 +--
 drivers/gpio/gpiolib.c        |  36 +++++++-------
 3 files changed, 83 insertions(+), 70 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

