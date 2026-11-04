Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788699;
	b=GNfgVUCuUfGCZbsun670cDSkvz5j/8YyQhxUW41osi7dZuS4ylD8PbBuqhDR7ZGt+Zhe
	 ACASWn7LXTIjBvblpsa7DK4c6jkssBDAZooUdzW7lWHUDCQPORYI3E91A9HDZMEeKu7rK
	 QdKA6N7ENL7SrD2QqWTiHqCqIjnVy6acpGWiJ2HTiMxMWLJWflbIYR4hphDpvv810ynsJ
	 mAWR6hPXThF3oDxclqJp34z/XXksgG9F4MUBzH73CmvrynsqY0tAjZ3cK9oW+s30lDAtE
	 akbMjw/MIBfq0FRaxdFcnEktfVDZWhzb5Uymg+TecXF4Gy3Jed92x0ieDoKVEWjx4zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
	b=w1FAai/Vw+E9J4AfmWSeTySCBFWCoaY2yLkjgP9UOzAvFoLl0iJZyQ21EbQz87Qqo8GK
	 QLZwssgM5UcigjIvnVtyW7BDMp7QtqiEGvR9UN+T8of2weTrMMWYwxhAQhEglOeWQSFw6
	 sC3s9bmLHDb8MzTv0MR8ZoJ39kTnny5cTSrbiivZZW/y9AgxCWnP37wMliys/KM9M1aLh
	 RIZDvu7b2u3hv+Hd72KRCHXsAosZ+APNRJvh5dftZobD16HmJnAgtOyl+8k/YESeH3g3S
	 fUwP8XasneeJlkBWis2lgCnewXRZU4MB+FyNBLBTAZAd062hmFuSZz+LdGJW0kV2syw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYTExsHx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXWz0xJ0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E9B606A33B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 10:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95E9B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DYTExsHx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RXWz0xJ0
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A49bS392022269
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 10:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=; b=DYTExsHxFhX+Okqe
	vIr9Wh4bUVxtW2EZBEFGnVivX0WdT/QyyMRZgyxzLhpvyrMPuBiuyeQdT9UUQrZF
	U3zuU9cPnTufPtUuro+5YextSAYHrKH2FsfLsPUTFwdQrwEvKJNjBepzyZbsLY4v
	rfGRYS2pVeFMYL3ZmdMhFueooUkoT9Jv5MAPsZPi2PAKPemt74n3I+r+EBN/A0gC
	XxnbVSqakIK4AiA4RIK6QA58WzEZwu+FZnc7zsWmbCJ4tP+GQlMM2TQPXIkE5qUw
	XEUIg1JaXYC64hsbYayhn6aQ5zUXum0BG7zjxeAuADcfM9z30F7I9lm5c65X0AAw
	oHdlUg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284r7nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 10:38:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf45382794so464532137.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 02:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788697; x=1794393497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=RXWz0xJ0xJ4nBz15AZ7kv/3aTHaWJgF4hUk6PP5VlSaNhVQgdQvDFyMs4sfDH/3OJN
         OhEdtsDDEN4kIQzUGpmxGnkm1m96949W0rnIwdBVH2F8tE5bfY2rqxZQQBMAZYxfK9wL
         4RhgqEuKRoKrXJTk8ZEqQr9+aqZXVF+WcyZQTulPkc5Rc3Y38CO1wYboXTzHXMy8Mpmf
         WEP7Q7OLTu9G44QHDqyDlhLSviqm00YKSWStsXG8sRLhqLdqi6EuZBlkOTiJzr6wShFK
         K0t+S0GQ1a1Ddj3Qe6TmViKJ41ZkWoFQYfsqE6o5OHhaYGrfR/dLl9Xguqs7UXZ2duZK
         jFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788697; x=1794393497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WW579yyjewBHjnaNlEPvxsvhc95frZ7G4AgSP2CB+mI=;
        b=lCmbCYVSjGdwiE98a+qr8ER5DMmfPnY163UMWAYD6T3l80W4VvfUuC18BJJ+PJiOiw
         HNgCHqq4kqS9ueMNN41EnKx/m+S4NtHwbsiJEWeaCfMTCVKnpxH5YSug1YY/8UkNMgBs
         +UixVXXyn2pVQ6fFbmToo8F2r4O1uESDoVKgUTwnGl/ea/FR3c98Tu4yOK3lZC4RnpQn
         nwfW6fKBSWnFlccIsWfyTOorlhv1VSdDBFY6BpQTThTuvWE/FGx2bVI/jWwHIPL7hvGg
         5xuzValzVPMlAPlDkQ4L/eB1iaYTfa3eLH13OXiwH1g4QoosJy6qK/qxVTXbl2kk4svi
         JxnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL5gJMAvhcCI6lJv3KpnKlWsvD40dh5ARKT17ZSWlJmdRMiyG20wp6lJL4jFIQBzhhaXia2j6SSmXB@vger.kernel.org
X-Gm-Message-State: APuU4Z/c0P6Hv+j/VWPtGjGPsHLX4Ert47pJFrbTTZM8RkZpQwKTahyi
	CUo3qzaZeT03uMKmjwnwkfBJaPucYmTYgWOgcfG2d1rngiwHNLtUVINtxOoIl3FrnGkfSG6Lmnb
	mii+K8pILieG9aMfh6t8ZwhLATN/QWqtj0ZCSTxezFdX1q9LBLwAsq+goy9qrmK6r
X-Gm-Gg: AYBFou33nYfZoMaLgGDW2vFWPCa7dBGxK28DpSnP3Dc0YS9AA6kRoFNaOXcZlJZXQLN
	ZP8htNHV56TNfDdbo1U+R1hSFh7y7TDR5ULj6OQmj7JRrHEQh55Q86Hk9tA/9K+F3DEPAZTwJVd
	yNdDPShfd+9yPwdKAjsig0rr3hrkwU2jhY8ERM6siw5M7aaETKUyYF6Nf1/txJVvwmH6Rmzdm3J
	zZzax1EP+jys9TV3Y6Gc5dMSHGVIWvSDNzwwFdQO5U++V/S0SkUEQ+OxPHqUjjWG+x/1S29505G
	bnsNt+EIf+r2vgxLvq+km9ilAja4aeARU3dwh3m4s3reY6VIfcSs8ulP50ySeo6zK1PPPwq0DQx
	q/jGSf1vvaF4h25je/kI6WtIYcSod0kI7dOxSdUZydCSjTamFdXbmAoN+hYK9DVRdqeWKxFuvdQ
	XPBg==
X-Received: by 2002:a05:6102:15a2:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d07262d5d7mr6368691137.9.1793788696642;
        Wed, 04 Nov 2026 02:38:16 -0800 (PST)
X-Received: by 2002:a05:6102:15a2:b0:7ce:62a0:6a14 with SMTP id ada2fe7eead31-7d07262d5d7mr6368683137.9.1793788696164;
        Wed, 04 Nov 2026 02:38:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:09 +0100
Subject: [PATCH v11 2/5] gpio: shared: factor out per-entry setup helper
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-2-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4265;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pBmr6hTIjmoRjtYdJqbTh0DkvQI3gauruJ23Msg4kXE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSDJ5GwhCILUM4ANJvU71DdShaCIhqBl9Cf
 TmR77+Mf2mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 wy1YD/0bCNn8mJDmIlb4RpW3YAYwrv4RHpNhAXPbQJ0pqBve415Ehcsq8zRfV8gL3HyKDGbYKsn
 5lCeW4NGBQL/k2C+49sr6005Kf8+vhHCCGQcdxeKq6ukee10kRQxdIu45wLkkz7CDZg+f1jqP5j
 8eLkkOtGaGGS4ACBRyeV4dsawSZ5NIsKbXkTc9bU3d2JV77H4PrBDXBKG3x2MX+YHmX4f9s+jwN
 p7V6VgfRPIExzGSI2pRxZyoijN5I7kup/R2JA/xqDJg5mjZMpLHy5o+03uag//+I2zd4hJicq+f
 UopkoZX8TYITeAYfAuZQ5Nt2eb5H0vm1yfhwKZEyr9eYDk3sEgKB6fjl5qbB/AZqvVm+T6OhBVH
 QLMyictEjRl3VTYH0j/Nd//nnvYYmN+MH9Ut2XMsJ7ysYzZaDRD8ibArVmm50qbEavCAsOKRQre
 QbaLPCyTqbAsmK8njBoPP43hu6fL2vArc1G6J7fsf2zkxpKUfzojjjIatd/dCy3edY6s4GwlIQD
 0ykoDoO0aHxeaBSQqOJ9GUt2FfXl31I6ES0apdRN8HQnI6i3HcmCPofiA+6btE7o/ZWqP2rotDC
 C+tqERFXFHQgh9cuwd4iF92f2ymuS47SgUj5+ZzLGIGg/TdZl9FgOTwZO5gCNAaqIRxakHJ9P4a
 X5g8HMa2F7Cff5Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb0b19 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Fseb4n8Ag5KZzSNL8SAA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: 7CRve5mReJ_kKjvxeiPW_j669nNvidd2
X-Proofpoint-GUID: 7CRve5mReJ_kKjvxeiPW_j669nNvidd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX32VlODqwYGu0
 YZgZVH8ljVo0y2hqjkZpYljv9NT2l8vdqwwGHAnKe0LqzcOckQ1dqFy4WCk+1FZmDDHiBKiVsvu
 bZGR4QSS58iuRIhwsjhKr1/vRUTbU+d8Yk8dxs/D0IczR35H05wg4gTFqJtMV2JywD77Vc1X5LJ
 jVFSJvy92rhn3s43YqZxRg+b5zlRAZ6xlq3Oomx8z7mJGuYnf0xqPKU/RFMyOca8TO/S36Hlj2Q
 QaIbLN50dNVdEbLLjaflxm7tji2Hv6pJuNfRrMv1rVl2hf/6ni7L6leYRBZsho3Mile6/15uvj/
 r25ehcGFGBDJnef3PNRnUe7gxnpnARmH6UQs13GA2KBbibCtkqpwa1W+aUrX5flKAbjERrUZ9vW
 rW2xF48hC7hIKjo+Uz6XNvwVauR/u+YMndqqI0plXZrweIIYuFP9LCXZzOuqPww46c1qUyVzHWm
 K1t+FEOr94PO27VNjuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX0Bi0zNvM0bL6
 x2z+ta1JxqjaLFgVylfeotqkrtIPhwWuxZNNiJpN41SeGHAeDfP34XHBjJFY/Rnjjxi1h8YkdhI
 tvF26682aNdPccYPW/xNcmYmA8F0BZk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040042

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

