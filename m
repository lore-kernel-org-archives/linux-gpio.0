Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623833;
	b=hfYnZy5I8E+w4/vl4/UO8ebl57jX1hv1cKZMiZhR46SUXt9g/rYdXhOzKbJMzPQAtZxZ
	 mrr5VmcGaD4S0gsfknJbendkuqPBGb/9myb0dy2VlGdjVquIfoPifb0t2TlUAwhF/2X8+
	 DdFDqp2zevSI7iku87ub++QeBvt7yrf6h1RRGmEnWt9cG5R9SkYjmOzPLL0IVgpkeP+r+
	 Nz7IH6ZY/UO9ujiKrDXjUHRTT7SIurYbli0x0OamblrVYMnDZWHO4c6IOcS2IYk0veNlX
	 7YMkBQ/M8uGkr0E2oT3o4qO+9tQBuFyY5hOeCY3Z2409YpzIvKFPGISTQ8l3MtFJqqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623833;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=jBu7mX5x8Lf37Dy6aPWB0d7skvWC+ho2/VgaK0/fZCC0YkmxxIlyfq3DGSFWymnP+7ny
	 tkpyXkqSoI+YSLfnRV5ewZyzqC2o2H66m1+k2c+A3VKfb0YgRNq1UKoOv+ozQYzbml6QD
	 MGr4IEwZPgcBHzy8ipr0uqTttHDS7zhP7UNDdcFnPLk89y1V41ALmXC1Ny3mvI7xq3q4O
	 K3hepSVBaAvK+tXeU2Qy1Su6iAxdWawydXOMpeJoejL1zQX6biVDQy6v59VqNeNeE4IpB
	 Jy3M3W+bTAmVprTNmldXsW0zhFAXVEp2tf+CLBR2K6r0aiFl/F07WGgzbayLPpTUghw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED0360A2604
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 12:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EED0360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DRgVKmrz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c8bX7V6f
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29ALab4039632
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 12:50:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=DRgVKmrzQ3nCUmKD
	8ij9enGNqQBGcCxPegiucxXLdYbHjRGNXgVlzuSOmFghzG7HqIgUovg7bcsDjnuJ
	hAHf8/3jvad/IirpMnd06YR9arcdikvrWk0cmgxAx50H6EEQYW2aJ/uwOckZNOoe
	ZgeiVEsapJMavUH3IBsA1wQSfVwvDWP9QD4uTy12L7LKOEfMIxXknoTHtkPahvhk
	uGdHFsH7Xm6SRmERLPFE43dFtZd2pHSIIq2LtDqZ4umshzTDnvg6SEDvs74ttUhI
	7T3sEZ2aWFL2Pj9R3CRGOgih2qiIrB0Bpzgx+r8J+hon1baIQEhg4f+BbNEgkzTw
	axXgdQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19646-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:50:31 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45382794so2629333137.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 04:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623831; x=1794228631; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=c8bX7V6fC0WRVlAxF2fF9xj26XK8EUECYssMopoe60RAu+snTVK4KpDUbk6kMLpcNf
         wjrs2KcGsRE5nFLT0MvQu55pboHI1qLJ8gsNQo/eioZpP6Pi2GrCjjbhLA2iLoeSJOJl
         NippbYPL5mIBaANd2pOkZ/Oac6jJt+tnYjhXPsWFXT1YjxSY+uMK5juRtGn03qnOkNRa
         U+m78mTojKPJ+ybnzKxV/F2FJXrAK1QFHPsygIWwagVqs2jJdLeTTC1JUYPqNbQVbam8
         sVWHTRIJMHRiXRgdpJfpZ/x8zctXq2u1GgXh3peLnYkOJ5yjBSop++XBvQ2nNyEYvVg6
         fpnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623831; x=1794228631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=a4LSmkX89SP9fMTAs6susjRZsgLsb+lP4MGr3QPnn8H0V+c7YvLaVkJad+b4EmDZwc
         rL2U311B0PyYsXchfn8UQUi9iHL4yMJ8OFtI0fNTdAbhCE8mJkc0tvKBgCgo4H96m5eF
         TI65p3dh6YL4r4nBNCEWJuLQ1iAxwQpbKSNjj79V9tw4fvRS/WHYpI9raR8us5oNEanM
         J11RP4BJNQmGbxYIw0aSXDHKRmqnsjIt4Z0M3sjbR1uqM6DaHEhalcCIDZvNpsdSEnyU
         h6ExcJml5QbKs4TVKrAfh+SQacIaeIMkbryn7V67fSMSgjR3mrG94JVQjvPOWFeiggKH
         sDsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjZlxkQdLgqaKR6/fmRdAdWM/+3n5qEh2tmY+ugTuOaWVWtk5iDnoEi50OZXOJvTNhiE0xDSam21yK@vger.kernel.org
X-Gm-Message-State: APuU4Z8Fm0sXhYDF8si7lpBA1RBY0Z1nnkB92mjl59MaqP9UznC3yp5a
	JivdFPjfNnfop9DHT473LZZ/hfxYCce/zlXrM+aj9J/be55ZeH/JUoAy+5jMHH9xjtnX6DT9Yqg
	QUaAwC59vu9OVs96FsHDKXkDG9HIkEbAR33RnDDH1v6fLTAYyvaMoPdkhtqGXbZCN
X-Gm-Gg: AYBFou33tDjwlwGwq47WDVuGjhwe+jOYqCPRGufdf2d+zQOelLBlOsUzpMk/CLXUftY
	9bQtVDgXtnkiGHlkbMGOkvGgH+iyUqNjwnKbSLgVzvNMTEtmRXdbOuYWCunEPcVaC3STMVICzBG
	zZD5WJgXKytBXKqntVVvea0CPAEAFWtqVQXq4IzMesEk/z1e2rZTeMwTCcdszy4z/GJM5k+3qyf
	FRlxldlPt7MO8hnW2zdlT4nF858mEh1oXm0ddmeZSMLQQHRVjo6eyR7vOADYciMI/+CF87OQWTM
	ne+EQibVOlKBplAcVOqawRPxrUdiFeRoNJwiVyylMP8FBqAA/riAxnGxDlk8KKwo0Erox+TdvmG
	f/vFFES4dYUbTEVhoiUR2QQd9G0AHCREimhSlRa2gxL49og20n0QGaUiR1TIlAMn14e7fJT/xqh
	NRPA==
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032166137.23.1793623830580;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
X-Received: by 2002:a05:6102:160e:b0:7cb:bbcc:e4e with SMTP id ada2fe7eead31-7d07271116bmr4032158137.23.1793623830044;
        Mon, 02 Nov 2026 04:50:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:29 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:20 +0100
Subject: [PATCH v9 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-2-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQbGDlWObuvqS+ty1xvhXyP+5fx4AA3JhIh
 q7ikzqGFP2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 w8BrD/46FTsLpK2zfYL3VWIQ2Nwkpwf0z0XrJzv0eU6MIDFY61NXMDRaBq3mruymrJQw1MKux6C
 8Ouf1xVYxWyiLMEh83AhXcbBj/Nyjlnd2mxTdhKgdzO2ZWwHS9mxVE1wejH6qSwjBlo5WBDXQCw
 RcGdXcyOHBNYiS/YpyjILgG90ZSqGFmWgBooF9VJXsKyDXvYWGIfHzGB136mid8rlfPnQs6Oh2v
 xaZhjc48m2nc7xbg2NXEAl9an4BbMq9twdNweXnNedJCQBmESHQfLZscN8JYxbJs5BlwU6C/4Dg
 4jDJxf1WooIxtpbsj5pCIX2IJsv+E9bUQ4NMmQ/nro3TR/11PlpAq2+WAlxs6DCIuRWFMtzSFUd
 jCO7IEdIIAo9BhEezEEPa/TIaXBoXEutBQcZAKmSwGdH/cYn8wVjD9ftsJ6mK8PXmNxGEAhKf2L
 ym/pjkgLeyndrz/2YegLfErZlyo5LOHY2K0n+kSTXF77fwA+4R/Ihh8d/E53l/Eru2BfAGfBXaJ
 LJHlr18Ab1BdbN9zuk1D9Fxb/0C1eWQ4CPxovC7SNsjebXhe7rqskOAdVnnUWHCBNvIC1lvwsAb
 sA6Osz9KASEo2enHoi7kEwJ715bQZ3KtH1DsJyHP4ZErhr2kJN3lCE0yCjGUZCL+1IAOuX1UFxF
 PZ93zSGhhEiVFRw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: p7v6VV2H05I6rFkbxIgx5zZeX4Nv3z9n
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae88717 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: p7v6VV2H05I6rFkbxIgx5zZeX4Nv3z9n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX8bo81xOo7y6K
 5Q0XgY9Dl+Y9OU3xLpdDzDhNzz0c6NxL7v3Xed94w97Z2m4mYKuCd3zCN8tF9icuZJdP34LsdGg
 HMXLK6b6M3ixKOJCz63JA/eT1ygWXgI4tIYOG7i5Vi7U/iFgLzWHHxeYGnu2O2VSyYr5iTWXnYx
 pbqdZSB5kWRnMbBhUG2d67CVDDi43Aij4SDnua7HdzdKEuT7lyPjSOqSUT5S/FqU7PUQNLk6nrp
 CxKjCwNCirZIMKZK8D9RER1GsUYImxOYByEHF07vGtLmglOfBXSld31QS70FDwKLzGH56EMUBd1
 miXieXB0ehlbx//23phrbINlgL3Y6aoXa9vmHusx8pFuB+/1laEkfv9h1ayXeUk9wJpCXXbB41s
 aCrZkfooaHX0tYs3Mpu2yOvOene4R43hZsLUFdz+qpazKfnfNxoFIjX0yBC3Cu24z7s3wLzM315
 ms9Gfe00yxAGFuWc+Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX3iK/nsijlVA1
 G0DLhkFf/dWH5O7HFsK/dHKJYBH+7TGM4fTXPa7BurlWsDzemoE8NXBDXKhpCDajCMmMwA+tN8W
 bdTRalUseK1aqwMU/uypQh/JqOjTtQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

Move the per-entry part of gpiochip_setup_shared() into
gpio_shared_setup_entry(). This is a preparation for making the setup
all-or-nothing, which requires handling the failure of a single entry
in isolation. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 112 ++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 49 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 64bb450f0a8461d214a45aa97e2474ff0d1857ce..c9500c2b904ca53dd1e3cfe1bdb921d767d18b3d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -538,12 +538,71 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	}
 }
 
+static int gpio_shared_setup_entry(struct gpio_chip *gc,
+				   struct gpio_shared_entry *entry)
+{
+	struct gpio_device *gdev = gc->gpiodev;
+	struct gpio_shared_ref *ref;
+	struct gpio_desc *desc;
+	int ret;
+
+	scoped_guard(mutex, &entry->lock) {
+#if IS_ENABLED(CONFIG_OF)
+		if (is_of_node(entry->fwnode) && gc->of_xlate) {
+			/*
+			 * This is the earliest that we can translate the
+			 * devicetree offset to the chip offset.
+			 */
+			struct of_phandle_args gpiospec = { };
+
+			gpiospec.np = to_of_node(entry->fwnode);
+			gpiospec.args_count = 2;
+			gpiospec.args[0] = entry->offset;
+
+			ret = gc->of_xlate(gc, &gpiospec, NULL);
+			if (ret < 0)
+				return ret;
+
+			entry->offset = ret;
+		}
+#endif /* CONFIG_OF */
+
+		desc = &gdev->descs[entry->offset];
+
+		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		/*
+		 * Shared GPIOs are not requested via the normal path. Make
+		 * them inaccessible to anyone even before we register the
+		 * chip.
+		 */
+		ret = gpiod_request_commit(desc, "shared");
+		if (ret)
+			return ret;
+
+		pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
+			 entry->offset, gpio_device_get_label(gdev));
+	}
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
+			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
+			 ref->con_id ?: "(none)");
+
+		ret = gpio_shared_make_adev(gdev, entry, ref);
+		if (ret) {
+			gpiod_free_commit(desc);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	struct gpio_desc *desc;
 	int ret;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
@@ -571,54 +630,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 		if (list_count_nodes(&entry->refs) <= 1)
 			continue;
 
-		scoped_guard(mutex, &entry->lock) {
-#if IS_ENABLED(CONFIG_OF)
-			if (is_of_node(entry->fwnode) && gc->of_xlate) {
-				/*
-				 * This is the earliest that we can tranlate the
-				 * devicetree offset to the chip offset.
-				 */
-				struct of_phandle_args gpiospec = { };
-
-				gpiospec.np = to_of_node(entry->fwnode);
-				gpiospec.args_count = 2;
-				gpiospec.args[0] = entry->offset;
-
-				ret = gc->of_xlate(gc, &gpiospec, NULL);
-				if (ret < 0)
-					return ret;
-
-				entry->offset = ret;
-			}
-#endif /* CONFIG_OF */
-
-			desc = &gdev->descs[entry->offset];
-
-			__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
-			/*
-			 * Shared GPIOs are not requested via the normal path. Make
-			 * them inaccessible to anyone even before we register the
-			 * chip.
-			 */
-			ret = gpiod_request_commit(desc, "shared");
-			if (ret)
-				return ret;
-
-			pr_debug("GPIO %u owned by %s is shared by multiple consumers\n",
-				 entry->offset, gpio_device_get_label(gdev));
-		}
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			pr_debug("Setting up a shared GPIO entry for %s (con_id: '%s')\n",
-				 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
-				 ref->con_id ?: "(none)");
-
-			ret = gpio_shared_make_adev(gdev, entry, ref);
-			if (ret) {
-				gpiod_free_commit(desc);
-				return ret;
-			}
-		}
+		ret = gpio_shared_setup_entry(gc, entry);
+		if (ret)
+			return ret;
 	}
 
 	return 0;

-- 
2.47.3

