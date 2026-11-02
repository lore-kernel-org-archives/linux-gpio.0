Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623837;
	b=G11lJThCL/rJXLXFYToIZYp+JlyzQJtqbWyKqYhxWxtPTwVbcJqm46XV5XocSFBvGDbU
	 TJDP6+UjtiEg2BO/dLGP6twrpMHBrsmzH1bOys3k2hIfMO8Usmc7CIDZBveyBoLQzPgfT
	 MihQdscucqQBwEpU0PNzlQqaNIB/bjNq6ffp3q9S3o4KZjzPC+OALpA69OCHvoj801xUm
	 j622tsgt+kIJk0rclQRe16RdUc/CpVwczbGfgnGNx75VOsar+yzGCL+w6rGRs32s4E9ko
	 zE2nUxxB3yhbMcIJ9EjGdrLd0/69B12OyCpmXDHcFxAEcIUCh6AJ7B8l/lhPJ8oEZmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
	b=l7+yhMJiXCnFSYeUGRQjJQEdcQrBQRtPnbwXH9kGE8+DrR8qG0w/rjYH0ojAZ0igYh2J
	 wOxUu1wjOmNrIzcCbJOl2w40ukSTaHYjO8/p7ZP8erMVKlaarZpxeWgeY2HtMokDDcNLh
	 UA1N8bvsbopbd1HLhJe//XUbZtn5Dp3wVnJAtXQS8qNj/HJfMAYGbbL1iI5hYacR27Ekv
	 0GXw4DZquQPxMDKi6Aczkh/RAPXqgSBmslnc935o78xki9Hxbkr+UrlfHeY79pnAVUFGN
	 TCHPIZFkM7rWb8RzLi+QnN0BTxKFWjr3XI4Yp9DuApmsGoUPMA2dglt14tYH+RvLSYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXagzSFL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MckJ6UXs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB960A3825
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 12:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EDB960A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXagzSFL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MckJ6UXs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xp73402433
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 12:50:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=; b=MXagzSFL16RdDPZW
	LMoKn2MNbOJajyWxLVcs0kPhADPKDtj0L2ELDcRdFn1y3YpAOTVKPD6KX3WLfF2S
	EapAcTHOkKIf8oqPErQVFMTEm3z2/J20T1STfGkdE0cWtGcluponpGfbdjWXhOBw
	Kh0U9eInEIkY+ZD/j5tLGYgg/XrStfA3eJ+37SkmidRo/uql/1RvnNl0p6rgIGPk
	E3Y3+C6lN1nfp1fz0mRhQ6dvsTqS8JSGZbpjFiAfgrjGdFvrj1ts1cEkP+FLWJX8
	/cS4jRvbm4NI8T9Cop2jjNcDy/Pqh7OV1Cs0AYy9dzOaz/upcGNfgSm5ANH1yIjP
	qq5WOg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe95cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:50:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f6f4fe531so479981085a.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 04:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623834; x=1794228634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=MckJ6UXsxbOg1H7/368zFQt3xKhUMWHUqVOcISR3ixwLsMVP07/O7oRziiJL+vrtUj
         EvtHxEVp9v62s9UkNqWpDH3nOSX8i6ebt/LYWVGV/qZSS4PkJ2+2Enb0GHe+eKasH08m
         /uqeEu9rLtFJEbU5fOn9DmbbRkDTwgxXeoW0wnD+8FdZlk2sBmyihwqL6euRqNEqZ6C8
         m+Dxi7pK22cWe7BTo+w6yWDsT1542G/1xi7HP+D/eJQPZLHAggTk5iqCxsZWvMo9CrFN
         OqJwL3bSMi+88pndVO4uEe4WfbCee9xW1PhhFrncYe+WeedeeIa5p/Dp7tAHtniWTomQ
         tiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623834; x=1794228634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVsUHPoyhDSKww0+dFJuDm9UgxlWudWo2Y0gRhQ0Pis=;
        b=o9JzxO8AsSSDIgMqhP5E6kjAxAoJ+xPCpVeeB4JNoYwz9gIdqKBTv8ALqYF0L6ZKLI
         5VeA6Qm6+2hLunHR9KdsEeZjloY3TrVdudNK09KhU8a/E+Xz/tNFQYUtDrxWA57TLHXm
         NrjCYH+l+7m4RgRzsitC8C20c5Bof43t/W+L2bTSF5oisY4BRqFlqhe/F/tnI7jnRIGC
         0YAii5EEFxU/2xWKol9FIWsheQp8psEaxGQxeadL8PuSGbDlkhyThCvkDdIHw49haZWf
         0VyW9WNANx7hxVaZU2W80WQ4zXnThL/LMkpi7yGctCqObLRQqELp0/ovn6widoKhPmkF
         pERA==
X-Forwarded-Encrypted: i=1; AKwUvBzzZS3fFTaeMLz/cFwmyPmUvDo1nWzQog+TmcCNOUGuN1oNA/z/xFBun1WMQP/WXefkuMD5wG7UhPC1@vger.kernel.org
X-Gm-Message-State: AFq9FYLDd5c3Duscxt/R0FPgHUqzuW4GlLC0c5wqmYxh+rp8uF0EsXYu
	uZeB7Z5FXFQuK+FN9aLPjMVuJnt6Xie4sdeTPDx0vtuCOtAAk62I/6naFSe+Iogcn0YwCzU3NWF
	LjzlZW9a0ho2RGBYBF+mTcBgNZrFMbk3pnzm8KQ7kADfki5T6ux5bOSoUaKtww3P8
X-Gm-Gg: AYBFou0Ui1qvNH4+dvUR2sLRxbnt60yaJnMvO/mW/29eeZgTq/BFABMXcBMM4ctKkt+
	B4f1SYHzwqBuNKf0SYG2yasfGudEeO3YUBqpeIFE+HbQaLN6t24AQ0LEsIe/DGwYGm8CvUpCbXV
	ORmgX0XGaVxAMJqggZLP56xeFF6bIVS0fnpXnnRg3cUZ+KflmJFOqKZxD/FQ1HlOTvThnk9siwt
	I9NHV9Rwg3uIjBiFXWDvR9FkMlLBFyGOTX9JPwmSxVRKW+0GDcyfpM6dTMVx2yfLSLwf54ZEjLP
	iXfIJoB1fM8mmcxsMwXScxauWtkWAboEN6N5k4c3FPOpIqU5AeLseOQp9VacX9rY33Elx0oTvqW
	NZlsosVKtl/TxpGy5dq8ZpDEyLPou/VY/M0DUfuDKtPYm1PxZQK9O5d2ZRV/8yRYmGLktWUQIIX
	mvPA==
X-Received: by 2002:a05:620a:3705:b0:93f:19fe:e6ca with SMTP id af79cd13be357-94421745e9bmr1712750285a.43.1793623834402;
        Mon, 02 Nov 2026 04:50:34 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:93f:19fe:e6ca with SMTP id af79cd13be357-94421745e9bmr1712746485a.43.1793623833739;
        Mon, 02 Nov 2026 04:50:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:22 +0100
Subject: [PATCH v9 4/5] gpio: shared: detach the proxy device from struct
 gpio_shared_ref
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-4-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6235;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r6QbQj8Ax9PQvoHE2LMYLkSa8l18ETTwNCg83EIkJhI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcR2aAmLu3amjGoeJXIZIPPfPqQDE6LIOwWA
 btDZYsAjv2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEQAKCRAFnS7L/zaE
 w00rD/9xLjTw7C+3m68uzxaax+mBVyMZOuJu/IWPxLSCqWpCZ4K1eLJ86txLdpJ2fOgH1wsSW8p
 7Z4oZtH4Ib9GZsAx6UGW5cUQAcjRoQVVKwdCOUETR/R0u6YlzjQV3BmLZQfmfn3sFrETFu7An+v
 Tn59e3WNV462LwO4vij19gYzNVO768tJPkTeaULoT0ikXDPxt2CxmHAWF0/+dQey3KbYBnoYICD
 fWtu34Tw7XQT9NjRv/e3xiUFClnErrCkxWsAB/wwBMHkoKYSdfb/Ju9SbhprsFjt1R0w+kQPv6N
 sPuqxtfMk0YhiR1kFxzM1z9hk1iDxov3ie/O96W/9EZPc5ud3UOAdBfZGCzmy9nVFRjnyOlBF1F
 gY4xgWoWSObk7SMwT7U5qba/hGVPMwsCwv/93dir51OOjWtw/MBmM4WMgPUV9T5iOnMns0AMrek
 14MgFHgixi4TXA3fr8L1OkS5uOmzIG5+1Vc0Fm7iXIcygpJUfAGvPUJbIfq1un/rYBDqscoSgAZ
 hMNJLZH/hdJ47t0NjckgF656u6GPL/uU/8EDC31goGykqzZAXmY13jTqLlIC7S800JCJQlF/QWd
 btTQ1LegngdfbM92K9wDknZ1dOWYGg/at5Z+xpoKNnFhpA7bJTCyzHkGp7tHCuUdUc0FkbsDBsZ
 BVUMyjbxEJqXJ3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae8871b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXxUEWEB0WOAzR
 P5R9zrT4+Jh0JsSTO8TBjnFWq1fkzF55ea7s4G8TeY55sqm9HaEidybzMAkQieg/UlFFnzEzWQX
 VWUnj5GxF8TXKYTCU/LLQVzq88+pNkRuIz6wbw8CFYAt5A4UaNm6AewLqn/76GGaS2xeaXkHLGe
 pjtuuz4wAUXoFC/Asipq1Fp4dP8+mhopqE9/rTurgxFWU62eqRHLxwsToiLqDTJqR58Il5k2XN8
 2NzLxOqCwFfP+//VEepfTaO5Ei2VfmzB5BDs9URvNlb9GpPleuJLRNOPbvQNU/SkovfEoe5d3/j
 XgyJtTRKjaRsMxyImVq0ZoviYOOAr3earq20h6RNtX7DsMCC+FCmksL4zTBnkt8CR8O/6YECrqV
 6xKwY254sCFvRXm0v0R1EXkaAiEVUFYcb7HPpMlddgGPdMfsTtwrGN7Zld2hhDdUoiu2Fp63nu5
 Tl0/NX/TmlCcR5SsvPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX64lB9r/x8kw/
 1hcibC0beYvovR2v5mMAiPYRZFeGnKL2P+7HuTiSW19ZkYqOJvzr88rN/kO/p3yATmlth7ETtac
 NgKY8DQ3btYVSp1gLtSGq2pfkIl3i+k=
X-Proofpoint-ORIG-GUID: RS4Ay7avYqG3KW5hv4gpHljuR9_htc23
X-Proofpoint-GUID: RS4Ay7avYqG3KW5hv4gpHljuR9_htc23
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

Sashiko reported a pre-existing issue with the reference-counted
auxiliary device being embedded in struct gpio_shared_ref. We
unconditionally memset() the struct when setting up the GPIO shared
proxy parent while there may still be references to it held by users.

While in practice this would never happen and sashiko seems to have
confused the parent auxiliary device and the separately allocated struct
device embedded in struct gpio_device, it's still a bad pattern and
could lead to memory corruption if a user deliberately took reference to
the auxiliary device via one of the lookup functions and kept it over
the GPIO parent's teardown.

Move the auxiliary device struct out of the shared reference structure
and allocate its memory separately on proxy setup.

Since we're already touching that field: change the name to something
more meaningful: it's more important to point out this is the proxy
device instead of indicating its type in the name.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 69 +++++++++++++++++++++++++++----------------
 1 file changed, 43 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6b183864933870e54780715c4dd9179faf800d09..9d73a02e998909746f5216f40dfe4d82f7be9e1c 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,10 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	int dev_id;
 	/* Protects the auxiliary device struct and the lookup table. */
 	struct mutex lock;
 	struct lock_class_key lock_key;
-	struct auxiliary_device adev;
+	struct auxiliary_device *proxy_dev;
 	struct gpiod_lookup_table *lookup;
 	bool is_reset_gpio;
 };
@@ -94,10 +93,6 @@ static struct gpio_shared_ref *gpio_shared_make_ref(struct fwnode_handle *fwnode
 			return NULL;
 	}
 
-	ref->dev_id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
-	if (ref->dev_id < 0)
-		return NULL;
-
 	ref->flags = flags;
 	ref->con_id = no_free_ptr(con_id_cpy);
 	ref->fwnode = fwnode;
@@ -306,31 +301,43 @@ static int gpio_shared_of_scan(void)
 }
 #endif /* CONFIG_OF */
 
-static void gpio_shared_adev_release(struct device *dev)
+static void gpio_shared_proxy_dev_release(struct device *dev)
 {
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	ida_free(&gpio_shared_ida, adev->id);
+	kfree(adev);
 }
 
-static int gpio_shared_make_adev(struct gpio_device *gdev,
-				 struct gpio_shared_entry *entry,
-				 struct gpio_shared_ref *ref)
+static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
+				      struct gpio_shared_entry *entry,
+				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev = &ref->adev;
-	int ret;
+	struct auxiliary_device *adev;
+	int ret, id;
 
-	guard(mutex)(&ref->lock);
+	adev = kzalloc_obj(*adev);
+	if (!adev)
+		return -ENOMEM;
 
-	memset(adev, 0, sizeof(*adev));
+	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(adev);
+		return id;
+	}
 
-	adev->id = ref->dev_id;
+	adev->id = id;
 	adev->name = "proxy";
 	adev->dev.parent = gdev->dev.parent;
 	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_adev_release;
+	adev->dev.release = gpio_shared_proxy_dev_release;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		ida_free(&gpio_shared_ida, id);
+		kfree(adev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
@@ -341,6 +348,10 @@ static int gpio_shared_make_adev(struct gpio_device *gdev,
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
 		 dev_name(&adev->dev), gpio_device_get_label(gdev));
 
+	scoped_guard(mutex, &ref->lock) {
+		ref->proxy_dev = adev;
+	}
+
 	return 0;
 }
 
@@ -480,7 +491,7 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			char *key __free(kfree) =
 				kasprintf(GFP_KERNEL,
 					  KBUILD_MODNAME ".proxy.%u",
-					  ref->adev.id);
+					  ref->proxy_dev->id);
 			if (!key)
 				return -ENOMEM;
 
@@ -511,10 +522,17 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 	return -ENOENT;
 }
 
-static void gpio_shared_remove_adev(struct auxiliary_device *adev)
+static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 {
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
+	struct auxiliary_device *proxy;
+
+	scoped_guard(mutex, &ref->lock) {
+		proxy = ref->proxy_dev;
+		ref->proxy_dev = NULL;
+	}
+
+	auxiliary_device_delete(proxy);
+	auxiliary_device_uninit(proxy);
 }
 
 static void gpio_shared_teardown_entry(struct gpio_device *gdev,
@@ -534,7 +552,7 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 			ref->lookup = NULL;
 		}
 
-		gpio_shared_remove_adev(&ref->adev);
+		gpio_shared_remove_proxy_dev(ref);
 	}
 }
 
@@ -588,11 +606,11 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 fwnode_get_name(ref->fwnode) ?: "(no fwnode)",
 			 ref->con_id ?: "(none)");
 
-		ret = gpio_shared_make_adev(gdev, entry, ref);
+		ret = gpio_shared_make_proxy_dev(gdev, entry, ref);
 		if (ret) {
 			gpiod_free_commit(desc);
 			list_for_each_entry_continue_reverse(ref, &entry->refs, list)
-				gpio_shared_remove_adev(&ref->adev);
+				gpio_shared_remove_proxy_dev(ref);
 
 			return ret;
 		}
@@ -617,7 +635,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -752,7 +770,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

