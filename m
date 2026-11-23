Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448814;
	b=19gWcC1V8vu4angS1XhW8bfHd8/wHRVcUroKyX50QMcqVTCzxTcBxZ7breNO9xkNYGib
	 X7CeHGT6hWfX/cCKMowH8GoLE/eixo+v2MuksI31uhxzVoi5UPpSUvse7OKxRrIYKu85z
	 rbup3NDXVH+1FIO593RIUyuNXF1TzbXWCFFX0WcmkMUD4atSbXMlCr8Oe/8/Oex8N7Vtn
	 Tsdwm6A61aLXxYyTQO8clMnEiQJ+5iuwk8smcK4JdxF03/nM22F05MGLeGcA9J/3hr4K9
	 SW11bKU8wQ9f8oH9Mrealle7PxD48IZ4QTESZ2FlNA2u8FuRQQcA+QhnPIR0cE3mx5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448814;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
	b=hvr/ezgf2pgZZ2N/WzfER5GEo7NvYbM4gWUPjpcZhVVRZ+uiWy2mLRahPwsQ4r7HtkUQ
	 QP3QX+6pfxmM6nNyPVUsybeYyae/TsCLzxhpluHe8jv6wzVeKh3CX9p/nD867GdCTjP1g
	 skyibWRLJsm64FLBBw45CJCvxdmyGZSF7qKSRwBYAzsmnLoJsaiTgl6ma7Mv4CQBKlJLP
	 xzRvrpxlzZHEsJLunqsdfbFq5H7bdALTXwONYMXMM4DqCrRUsDdCZzJj9TrpCJoiSlv8O
	 rQ4tzNc4LOMRnEyh7uS3Nf8VQazWoqFvM5QyxaCVsw2t+whpZmRS13uaRS0jfuEYiyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HPyu75W8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024AA606A33A
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024AA606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PqSY0Gh1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HPyu75W8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLSS21461855
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=; b=PqSY0Gh1fTy0p9/x
	thCR1UDcwGizzcDS4cNyR2czaiCliDa+oDfPVvpnWMobkotiE7JwsMPh1N7k17K4
	UIBCZdJi3RxRPSP6idQ7T9twRX6i4l9aHf0G4Gv9dc4CGp419YlccRgJKp3hXikF
	+xIyWDuWjnsWtbAhU7lpKq682R0cEdvBKMrnF4NQnHwjo2dismK+Nz/f/A1c1ZRW
	kmJzENg5X4dEYjIsFUj6bdDgMgN+JjGLveuea6/evWWdK0lLYqGn0PkEo/KQHD7e
	jc0uz96eC5vcpBhJ6lPHYzqnxstppijENZNyJdgR8MTW3jJGFosA/wuZ9AT5Tf60
	A8AZnQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a2463-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:46:52 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5edf86a8c00so952558e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795448812; x=1796053612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=HPyu75W8W6ktGhA0XCxgiGW8clN3FrkERcEWBdKDZD0N+hSZvFP9gESK0yL5LY2EaY
         KNVsZM5dDZ0MiympaetNrX01TSi4six6+LeSendUj//Dgrg/HoWhP2H4YSrQMJAelqes
         upBxIjJrIZIoWbLoRgPaPTtLe/DhsIXUMNjjBK/UU1Gx1N42o54zSVp8/wqF2j5aQpqC
         sJ+FL6B1LHGYgLiDg/WoKTMCQj2QgfKafcPAfYiac2xDNbgp4E654lt4hUU/c/6lhx3n
         qZlg7S3vxm2d7dkB5BRZugbGnI2lkuikmDnj3N3EmsrjnTSZ0JCEI0uDKv2GE5VGrQzl
         y8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448812; x=1796053612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xkOQ2XFhXP1w93Lk1RaLvx6R0LKZQuvMyuc73O0clc=;
        b=HPb7nuCzmRFpCG7LHJi7ieCgPXw7Hoc1Auuc8YFdoSod0W1h4aPVITwahYxvRq7nEL
         VjZFuIxh7XceYfnGXet9uuvRz6Sxb0sFmOeqZYtmvSfRSFon06Mq6ykVdOGoqY5a6wON
         CxzTME1bwcjNWE/Dt9WZLLllE4+JaVGwHgA33sQFJxcRN/wdIGo6vPhbjXQE8xW/MztA
         XCUP1K1kzptYTXnRVF7hOdHiimpQBKii5vJ5m93YvnQVgTmGzyYRD/gi7q4Eo6eNxWM5
         x8iMDPZiMuA/1YZDddgnxBZPS1vxetDY5JN42Exec1of9hCrNGgqzKZ0GHZoD/Kp0AsG
         KQPA==
X-Forwarded-Encrypted: i=1; AL+hErGIoxdhrivptECNi+oJ98hJ2B9MxF/AnZZAQRvlYstwKAQKaynnpy4XC/OFdwot+iCaQdtFd+wHjBRl@vger.kernel.org
X-Gm-Message-State: APuU4Z/JTNgSJA1VfzehregtaU+nAcNkeNVJzGNpqmxLcon4JuMGQnWp
	gYbQJob1smDVMQSsO9CH1eCOGS+SaXmVx7zkLZ1NN+Tb8ckmC7iUdX0sb/y9Otv152MfEamfnrJ
	3jsygA9/aecJSKuK8LPpsRoJENqv5z37Z3GHp7Ey4eBtr48lDrALaJkcmGlZX9nzr
X-Gm-Gg: AZFdTZd8bO+QjlJzhE+VpH+JIV01AMW4qslFuE6K2HYsJy7+ZPKkyEXZN6r11n7yZi7
	JruROPMya6GqQVczyF0ZyQRXKBmeesGyLTYQK/45HU4e859sUTS1j18F6w4Z7Zt7Nuv3URHy//3
	ZCn2wZgnIL2z1r2VDVpbt/sTiSlrc6Xiom+JHjSmR53SYaQCnfHI0zJahMwblsEZ57igKt5yWql
	Q1YAMpkUEXh/76sGl87y/fAQn+06InXWZ9JaihaRULj4jtxWRcsPoFCHXpRZji7UkvZGZd6j8Wa
	zvUKmGTkMF1JiOmXAOFGIqWjzTI4rdqsGNk8ilC1wb51f9fVcVJp0rPqRB9SC/uG0njWKIxpfuI
	hVig7+Ajal8FOSRLQNIFa14yHFz1GP+hoREpoZt0S+fcrV/Tsodzb/UMFYDBZfn3L1Miw2hSH6+
	8XojJoAyZZBqZOCNN0wURj6oYWRtkvE7c9d+KDuY/raQkB2wuPHOPohPlQhfv2mw==
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860600e0c.16.1795448808640;
        Mon, 23 Nov 2026 07:46:48 -0800 (PST)
X-Received: by 2002:a05:6122:46a7:b0:5ec:e522:70d9 with SMTP id 71dfb90a1353d-5ee8af2f1camr5860203e0c.16.1795448806310;
        Mon, 23 Nov 2026 07:46:46 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133705685e9.3.2026.11.23.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:46:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Date: Mon, 23 Nov 2026 16:46:43 +0100
Message-ID: <179544880105.88036.6302106975992553295.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
References: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX6exQFFIkp/qN
 mpIDHfLxA0j0nt0KJpJnfcKSip3fDlCd6kwh8E1cyzv5ytAD5SeEYl7sBNHb/6/nLM6Ndb8sLxS
 t1jRf3SmUq434YRfq/NcJHR1Qc0Nd78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MiBTYWx0ZWRfX77txyU1Tsghv
 HDPHXTK9H/6WH+AtvmhFvvQzb2+XrD2avPEOG9nqTxJ+8lIwUPVMFi7t/bUh4ihLIzFdXBkYJ6T
 cBfEihPy5nhdc6apYQ15swgTxf3lFd5GTEVvylHgQVql+kc7/xzEfymW5EYI2QTkk5o3uMLJNcD
 gkSeTGzdLxp67rG7+thMoPOLXDktPUaiTbu5KngZoEo3jegUyPEwLoow0NJfhPGjWUCzn6gHNct
 ZRiVPaLdj6msq7AE8enQnoVG7svlgTKnuMMg0Cu+GworpyTu9mhihD5tXH8iNslKeIPKDosFT40
 K0w/kUMEIc+MVNPkjdnI1cXeHkX9Kdw8P7lNtU6MOGCrNIqNcKWBc6EvqSrxyqZdhTpxfBGYt2T
 M2ycymux49ffRW6o62zXpFy8cTG7NgnUqFoLj5TMqEec2kfM6/N7nwdDWRC0Uq9Wh6BGK2UDvlK
 u4nc+XBYGeTM61fa0pg==
X-Proofpoint-ORIG-GUID: 5enr2rkzAzrCtHjtw7Yz08mpMjtwo-Gi
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b045fec cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=d7jqCbnQutjosXn8mJIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: 5enr2rkzAzrCtHjtw7Yz08mpMjtwo-Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230062


On Thu, 19 Nov 2026 18:09:07 +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: gpio: Add Cortina Systems CS7542 GPIO controller
      https://git.kernel.org/brgl/c/9413109c1005d207ec6cc3edad820d671c4d73a3
[2/2] gpio: Add Cortina Systems CS75xx GPIO driver
      https://git.kernel.org/brgl/c/26a9a31378673ae7da0f2dbc706e2c72628405be

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
