Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793806624;
	b=dcNbUZkeBcOz9MYx9DXmkmE84Tn7N1JPoOBUgNeX/0ylKyhZlKAgoz78zi9LmiGQE9Q+
	 VMJG/YkHSbgdTh8u8kYKW5mpERjg9RFwIyxlMb/mdy4BYI6/zvd2151Wg86vDY98hS6Hv
	 kPN2jjzgfM1I7wWC+rYaf+34L5PYJhX8647ZD4d7moVzlV7wOYI5kf3nNcjXPNyiEGfdB
	 xaXXHundF7BOu7wABwDSDfCx9S3B9NN7KcpmaSu76HaGikiatUn37oVRpbKd8g6cWrPl9
	 xMxrim0SIgnY7qU61+8RK/Ko9MqPm7kq7zyD6Hxj0n+cO8roS3t8IT8ditIzjZJvfnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793806624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
	b=kaUEHF8alAROoLa/uLvnPGGOS0TmbPyuzokIpQJKC1ghKgwROpvX8YKuYYO3Wdo1fteM
	 R4gjNDFoTlgkHaqL/RpYKDxUWjayOc/qaVsU07jzUAk5rpOAa0KJ3pGBdy1ujo7zld5hH
	 ApoBOYdiK66z9S55v7Gf+uuzMygYVdctbouz0UOg2jcgPh+dpEPMduYEIAncc07RinJBX
	 kN1hg3jjMvbgui8c0AvOjaRMgvVKPC1RiHCY3Af1fwovYbj6FxgOZYrD9NsuRPJeMGaKI
	 mjcdy/ZsCwHtiQHMOwnSwV3748BNDUImW0YKRoE7nURTG9obYaESf0xQqQUVBl4hY9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNd6UMoM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=knr6WHXT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC272606EEA7
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC272606EEA7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNd6UMoM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=knr6WHXT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4C1Sh61764298
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 15:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qaKkZOLJT6rypFd2sX4FBn
	QNajzRPhE4C5UxTUP/QFw=; b=SNd6UMoMqmvr/CP7iQCyVCk6LSGAoORn7R2Nac
	y5Ma7d1tBYmLSheG6FjNLcZ6JNMFgKSv2CxFujtYmKUsp7zDtlswsUlLtju7k0eZ
	HZ6caqqd9KHrXqQi/PfBGalvqnu+4iCmjul8onMeMDEgkUnyUYBdsblgzLEDl+5r
	s9Om4VwGVKHuYZ4tOIQWbRDSqEU4YL0nDFWKGWQhnEHaPuDjQ91gN/1mhAKXstCa
	RnCA8YlXkEbregjKDf8D77VzBxgVJN8S5usaLm8AqEdWJURr76cduuWYzuIvRVlA
	VQVL5rj+BioH6I0pivUMm2cIJ3zsPhn7zk5L67eTQnpPqauw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn0u1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 15:37:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98304865f02so730566241.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793806622; x=1794411422; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
        b=knr6WHXTZbGcoLt+KCZmiBHx1w8LZhVWCZ6fJBkLcuBHEK5C1DWMHDMfW09aJ5mW8J
         /jzDAgqcW/HcjEtFK7QrGlW1Yz3n8yVDJ7Q+cIol94s9ShUuuKKeBPa+SJ41cTdxnm1G
         hCrI42Unnn0orog8Vv6Y6jQeY8oy90OCCWQ2qyXliu1QVHRU7p212kTEmTZJlebexSa7
         xAQQT1hT4J+NvlXnvFQ/rjExeCVsD/ffQlKOuoWgCXuFF2m6orcgjK8yuITbNFuRNfZN
         tl9OqTKw7S25zpkmGGUV1+YfPD4NljGy5lpLzcfVq5aKJUu9VBpV4eB8x4w3Woj9UiAw
         PgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806622; x=1794411422;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qaKkZOLJT6rypFd2sX4FBnQNajzRPhE4C5UxTUP/QFw=;
        b=B+2Aao1dSevSgGoUofUI9bhd029YeAY9eDFjdNj5I3i+fwBRQPahampKurgkMiwP5p
         wUxcxIyjTUuN028YoNOkZwimrd1waH0s/JNckN4q4ptdx519K4/KqzbInnrV7GRtXvlg
         Q9/c4PQ8prM/Wr7SEFYZc9s+sq3FAEJ/hntB1246PHsNqkX9A3hu3yJh8m0AfILkbfWT
         frfOsTgI6B7YDE0p8n5Vp+6zIJBCMdCAUpepTV1mEmQVG1+2ADWGEYv6nYdkz8W/AGh7
         6WivZSKO1BjUpK7q6EJhZl84q3KUduOGdqFERzTZBuFN/UwtBZdOjetT54XE5F4yGe2+
         cA0w==
X-Gm-Message-State: APuU4Z8e4axe7p7pAke8JRRlLBirvRujfhPwtRbWB6SEyrw7FKzA5APc
	7uUVyQwO0npjSP3TABAXUMXC0hz33kWJ7ya2+xsTwTocnWn3BsGg9mBnj3Nh2CS0fWLF5jrf4U9
	7RCQws4pQvy/N5XPwTTFzFXcSCwVs0NTVMEsb9czgyAC2/pCHxvp5e89SdDzkoLO9lYk1kA/n
X-Gm-Gg: AYBFou0upHQfOv6Ym7MUE81HyHcckCQ+P1xwhugPNAGbsXbNA3qk0O+REr4hAjIxovP
	2+C0Iu/cy7AxL1hTdUrWh+9G0OjIVo6agP/fSphCZnVbYbGhwfHPlZB6N9EOq/UYQlr5BhB8HXM
	Y4mnC6bkSjlamXU95MQOpM7KnbBAqkg3XLYlAVLRksE7nI4hDHFiOKAVwjvNNSr7mrWQgAQSlNl
	k5sAb3i9VnEIM2mUpcwq76B0AWVrqo2xwd5NLqkrXqyQdqqFn7exGb/LH9VOLHvMhrl5a6Sc3jH
	ofY7D7uaNEa3M3J3QQPyXvLFm4t4rRm6uFf4wRMSKdUErmTXE8MsaDTW413M4l7CU754/+mc2Vv
	ikT+u2zmdxdHP5kAmsFSFjKDw7IFvLAanwmB43EV1hvcKF8gdT1G3ODkZ5XH7+VWQTp67a92Iw+
	CgnA==
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr6925496137.1.1793806621673;
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
X-Received: by 2002:a05:6102:2d0e:b0:7cc:174b:f7d8 with SMTP id ada2fe7eead31-7d072247ab2mr6925480137.1.1793806621215;
        Wed, 04 Nov 2026 07:37:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm30388825e9.0.2026.11.04.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:37:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/5] gpiolib: improve concurrent access to the flags field
 of struct gpio_desc
Date: Wed, 04 Nov 2026 16:36:55 +0100
Message-Id: <20261104-gpio-desc-flags-atomic-v1-0-e23cedf619ba@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABdR62oC/x3MMQqAMAxA0atIZgOtiqBXEYeSpjWgVhoRQby7x
 fEN/z+gnIUVxuqBzJeopL3A1hXQ4vbIKL4YGtP01poO4yEJPSthWF1UdGfahJBo6FtniYI3UOI
 jc5D7H0/z+35cD7SOaAAAAA==
X-Change-ID: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=C0TsLY/WDXWzyDJzC88M19ROyZcPTlo0UPHlXxPXewg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq61EaCXVyTKKnSmhQSlczgLfJ3oZRSbDR4yhex
 xcs1pRzcVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCautRGgAKCRAFnS7L/zaE
 w7MRD/4t0JVWEudwhEu0Y4ohvGw7dr+eNtwsG+eNqd6FpScFT74Ri15eE68uj+pRdMt8QBP/Hnt
 U4f+MV1JHzJVwlUZDPyfUzU6Ti7qO0o7cZnJniRWcFoJCXe1OdEBOJqmw0yV6DKG8NbSWNia8zK
 nCV5toEPjBRNQv9VQ6kX5jfKJ1yZqT9jU/hi8syr7AsbUXipZdW0h9KcfkEB16p2YE/+EP//cb1
 low8gHRcD+VE32QwbXu6oJltiHJa4leTBjJhShY/l0xVKuBY+F1dsre1ogMKLl8mLhBYtnm3zdT
 G/fyFSd68/D2YcD+3JEQTxPRKutXXyV/iyvhDL7P/QyWATUzpBCV3HiTz+U/qgkmO1Rs6+VjrSS
 u7C7Qe4IlHRxVtDYpAn9EYQ5paYl0BXAbl1HepWqJWna75myjYI8afJvytbzVATm16pZ9ew9Gt2
 qqWqvnJ7S2jRBNiZifnOfs8xTRGkAnmr2KTkUHnJrjxrm5We0A+/jyqqBu3bbiIy21QDsHC8BUs
 Gcm8D8vXMtnq43EU1zw069DvDGEvw63j4nJp3Fcnhbanb0+IlC+Yw6lomezqwEN2qUgV+F5lX2B
 k43Bz6PwCtIyTmr4fkoT73GbepEsFcFXt04LBAoMJBkWuw1J980gOEpM0wbkevWdcZJg9sy9ygT
 leNfqdGYTwHKAnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfXz/oocpeSBmMT
 QYFFv6htBB9gHmcacSBl6U+eWdpBi1vWOmyHY/6ImvaMRY72xFI5rp9KOWCGyfWb2IpyEbF6lzH
 GMty1FuOhjLgo+gWZbS4xMPtnUJ6T9rEa03flelVnn4DKemi4IYDRpJcKCNKu4j5yUttLjq03fs
 vPknyb8zMBQcPGR6Grp1YqwSnsMyASstQdp0zZDI8qb0VGAweIsd2Xn+rpPfN8OqzxwCZXooDgp
 Uqx6XMpn/oavsqvtyXPUGiYjhqjqkhq319LeuX70DA7XeQBMad1ZLqxyts3LAJDqhWBANQr2gZw
 Jl2M9I3wCYll3GycwIKHTfYg/CSWzh8ULv/V2axlKeDyUhcKek9mQCcKfZO4v6bH4eR/RRMWVtU
 6YzIce7SM4oIfIW2iQHDG1v1Nqm2T3MlRPIA3/jZOn0XOcCAFga+uTBZpgYpxLpnft4yRbZwny5
 zht8De0aTepbrsQB1nA==
X-Proofpoint-GUID: XeaCuXsvsfAN5uzpId1jC1IVlBOi1Xa_
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb511e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bXYUuKcbincyNTxPRNEA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2MiBTYWx0ZWRfX8RfkmrawRN3a
 M/X+OrmwABRGjN1xJDP1QWyq4Y5B7ALG9CITbrOXMl4jODECRg+LRYOAQtFWk366pJwGBqtkzeW
 b5aGyqI0WmekCy8VBJWccda/jgD4rLU=
X-Proofpoint-ORIG-GUID: XeaCuXsvsfAN5uzpId1jC1IVlBOi1Xa_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040062

This is a follow-up to our discussion[1] about desc->flags and possible
races with users who don't/can't synchronize with other means.

It's an attempt to use try_cmpxchg() to update only the required flags
atomically where needed + minor fixes using atomic variants of bitops
where it makes sense.

[1] https://lore.kernel.org/all/20261015153714.GA105746@rigel/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (5):
      gpiolib: don't overwrite the entire flags field in gpiod_get_direction()
      gpio: shared: use atomic set_bit() for descriptor flags
      gpiolib: provide gpiod_update_flags()
      gpiolib: don't overwrite the entire flags field in gpiod_free_commit()
      gpio: cdev: don't overwrite the whole flags field when configuring lines

 drivers/gpio/gpiolib-cdev.c   | 118 +++++++++++++++++++++++-------------------
 drivers/gpio/gpiolib-shared.c |   6 +--
 drivers/gpio/gpiolib.c        |  29 +++++------
 drivers/gpio/gpiolib.h        |  21 ++++++++
 4 files changed, 103 insertions(+), 71 deletions(-)
---
base-commit: f1fa734d14164cddc063dbf2138c2feb38baab42
change-id: 20261104-gpio-desc-flags-atomic-cc963a1ccfd0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

