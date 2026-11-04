Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788702;
	b=WC4zbrOHKCQTvb5+S4n/ZB96vnHZeoWFMQR5ptCGfgRergGz3FvfZu2fV5FOoraLg5aM
	 fP64eLa5QRpIXNurIRfF4CchSHz7tPN0uS8Dq1kaO1GWgH0EQS/7mo6MmONeu5+eGQZdd
	 ML2tO/UvzsXRbIbnvaFTf8uoJq2WEfNdO5K+H/pTGroMp507XzItx4tz15dqTyyiZJ3vI
	 S0NGKr1Xy4cRkUjGBhrvl9qvmwyFFLVCeVlVgGsOiSP6nWemf66j6YtGXnCdeI/n+wkoZ
	 o89uiBB2QLxPL6YNQl/S6bvXGaxwCOtcGys2C/lNsbpLrnTodYEHjAUM499MAv/4zNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
	b=D4MoOxgivFgphPL8AuFhZI6jStTkAT/JaoEuoH20jxAMF0FW8bv4YRVa2eWuOxwM56w4
	 z/iEeWQLnHGg8+B8sR8xb72yol96yUGlB9Lv1+yXnZjdujKsbbN1XS5M4VJDcjvPUgSMc
	 cBkmKzC4ZBWDx9V3AM92EFio/DCnoXWZ+34t12lsTJcWwV4QWxSJL0UmmUNUXctwkNXwS
	 lRybm15UV2rhWp6uk/HnN4q9gFB+AQ5/TyTMMkj8o8XmkqKPKQk7+JPL25zjBOF2qlHeQ
	 Vs1ARYVxiuaqmczpllkguRuWx7iKB71PFR9J9lC/hqbxOLdlEN76uG57feSWN1S6YUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFWCcGlL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXQlO9Ix;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2479B606EE82
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 10:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2479B606EE82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kFWCcGlL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DXQlO9Ix
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KXrB3875532
	for <linux-gpio@vger.kernel.org>; Wed, 4 Nov 2026 10:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=; b=kFWCcGlLKrgmTcPV
	lyTb+uihxB9GLLYLojwz8jsDGIFTWyysD1ul7OJ1cnfkmvyayJ4/W6XkVjHq8ZZb
	NY4jXSuraBOaEHIXxiaxroBDKCJdPmJMaYvkhWykGx55Zw4D+0yXxLWFuBoY16mJ
	Ba2oKQG/Ho/0PxJHBZ5YP0/JlLIQ06ju0CztdkOPnFSfnHlH2V+w0I8EjGNAbg7f
	Mhr2j1/fu8YReE3vTYouRA/THkGfmGkkQZHYgScrtPw0KYzsmq00+9u7gmFh02Nr
	fSbD3wgJw6anpPe5zntniAHt70e8yeTCdftFTDl/u5ipMn5sdmQl3c96xRe5aUJE
	5N4JTQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqwb09jwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 10:38:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9907de400a6so125603241.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 02:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793788700; x=1794393500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
        b=DXQlO9Ixf5MaxB4Nk5/UzinqSZGfjBhcIsx5+MwmoEphUppYoIv9YLBYsWwsSt9n4R
         R/RKpaocVo5ZvJ1I26KwxLnHF7ONgfIYW+XdP/MDMdp12QAWuhW/Kp1MXZjVl/Ay4d0T
         oq5C3m2j8YbHIBSQxTnJhWmv7eutzODEE0BUtQQ4EWAAkgwXaccKsk/q7qtdC7P7wmY6
         clV+F3ro+V+FYfTBXMKTYdQKQj+eslxmlFi23iUWCCZasAPrIOXvK+/JGa5/qBx7BbL/
         pPjagCvFQ0dyw4ULrz462nEP8wv+FUVdppyvEEF+c+Muz+uvk6i2qBbBTHbW2NjAYhLC
         LlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788700; x=1794393500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RYDMyWIvDWHXpulkX0r+TT2+36MfHzUYVRBJn+WEvo=;
        b=Z6ACrTYFPef4vgr6yJQ7VHNyE1N/ZKk90ANa7+0rlHrJC0/174miVjEfErTwRwMZQ2
         PcB36UUGI0xnolz3idh8U9bnRbCfvHA+mUstnE6SeR4su26TG2juaKmPkAcpxYgCy/4n
         epe/U3qBEwpP4+XLCa3G2Lu2+ovFaS/g+CdH0Q792VhZ1WyHZwsnWXXQpBFZP6SzaqrJ
         h4GBeo0GXB4OGSopt82WqqG3UfHEVOpqFe804zQ4hUlug/V3NSzAz8pOUECtR9kgG4a0
         RW4qMiDdIwy4qgTTwGRQrEbwwqItvb8RYvb4J4pVcxfK3CMZAcHAkG4zDKcZ6hhey6/E
         hiQg==
X-Forwarded-Encrypted: i=1; AKwUvBxNe1bsXGdK8ATlyFQy1gSo6BPv8MG7Pd7nXGuMlIshvmVt5ODPLHNoIHwVaBHIHfAMpdt6/jOwa62n@vger.kernel.org
X-Gm-Message-State: APuU4Z81PyT/uzr47pfymPcoD/SZBy4fQpZwxgEKYAuQ/F9gfiLKDAW/
	7cwlU8fYDt0KlQ+aw4wXYBjiXQrQmpCMerUPt2H9mAU7+iIx/+AaGBuCXLfnREA7vnCF0+wv0Ex
	qHxIolfRfR0TK+gL5RWRPMNCQ02m+zp3mQMbh5XKFxYqoFNEuqgkvjtKHUE3veXim3zelrYaK
X-Gm-Gg: AYBFou0sZqD7TztCT+F/kXRLaEilrBGUCTMFutwyCFaUkJLxSwwEeP+H+nE4s1al7Sf
	BPFNoRGUM52CQzSPVtqFrhERYLMYoDAggITy8twygaNdB0zwft3yED1U5y/KWdQdoM2yJ4jEZVb
	QHju8oA2JFeBafbdHK8skmVEn5eXPh65w1RH5/yE3d0PflymaqIOS0BIpnj93fI+9i2QJB3t/8A
	SfKKK1cSPUA+ioISTrL4yqAxlpIsziEA+AeIAcLGnVaEcbeNX58uhnZPMyYfJaXsOWxPsP7RNsV
	TddigUp4cbd6A0pAvWHFlQqcHaWE0Yag14g5TLFUskOFCf18hB7FVhM3TLh9vsJ/KLMV0oA0ekK
	xelg7+x/C23lHrqAUupZ1VKiXjR/EpuC8E7efg+MGMhvPvmx9uh7i/lz9Vp36XsXiqzJZ39DOM7
	OcYg==
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr5297517137.10.1793788700192;
        Wed, 04 Nov 2026 02:38:20 -0800 (PST)
X-Received: by 2002:a05:6102:4493:b0:7cb:bb33:8412 with SMTP id ada2fe7eead31-7d072552d95mr5297510137.10.1793788699703;
        Wed, 04 Nov 2026 02:38:19 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fecac17c1sm3084576f8f.10.2026.11.04.02.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:38:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 11:38:11 +0100
Subject: [PATCH v11 4/5] gpio: shared: detach the proxy device from struct
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
Message-Id: <20261104-gpio-shared-fwnode-lookup-v11-4-42b9963d26c7@oss.qualcomm.com>
References: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
In-Reply-To: <20261104-gpio-shared-fwnode-lookup-v11-0-42b9963d26c7@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6269;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oS8Wea8tAKoUySXn3SQwqrzDeA3aYvYl2VhOi30LNKw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6wsSacQXfDkiWcnPa+a2X3KgiQV3Pl9JSBe3N
 iyBGgseTw2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCausLEgAKCRAFnS7L/zaE
 w+Y7D/4jfK0XBdP+4N6/mdC3fjnp9eorlOhO52EI4OTp53v/HbZFkEIO96bbCQt+cFZrS7KLdbV
 MmGQLyMXOqLKtvWx2V8NCcVcqC0Ov5OQjfIVNDlzGfiJhp2g+5hX90S6/+B/LhpA5tBJ5wQ2t6t
 bcHKbc5NRu5kLvtOEo+mP+xaCvHZDr3P+cklEERpLtnkmX+PIAbsDTmA2UKHSbswQvkUt66zM7k
 DYsVDKoaMmylWPZVHzQjWWdBPiKPQzSuaodF3eQ1mTKyjpSDElROMXUs+m0flud7ZvZvEHVfTYR
 ypwZd+rQQpgy+UT6aBLmCr8vcxXSODcjuUuBAbOJKSz30etXUm3smbWzpOLoMPK4hpjhzcTIe9+
 U75fxQv6TLz5idLmPMGrdv9EwjcuygM5KLawRDsWv81lUKX7SDHzZhK5kNoXqa57kHJRbUDxW/g
 oMXBFCvirYLHiPazRxEdBgBI9Uys17Tjd5XoLaPeoKsKt4HJ+0HxUjjRonUNPPVubrEJPepK/4z
 BQPih01j+Bn1Vi/BZECn/7jt1Zu685VJG7SeK4ZTZqLRqglCGWlVezjuhQurYW4DnfzG0ZSGjgd
 sIaD+ODbjzjlPC8svJ45zBUvf34DwYVtgfs8fcyVKoEzbrV6zlKoUzUcfU2GjnFw9qwzRDPwR0q
 4oUFgj99LhJiUDw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX8okr4/ZB/oOV
 t9i+SQrEPKCNv5yF+G+KYAjG3nSmdNe0vrYHT1LvitQ0NWy8pWDqXP4lgyxCGfa7SEba0jqISx5
 yjQPkVO1rgzBsLQdy+WgsT8dKJquZrE=
X-Authority-Analysis: v=2.4 cv=OfINnRTY c=1 sm=1 tr=0 ts=6aeb0b1d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=nd_FmhSvACMRRlF81YkA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 0vA3aLkYrSdG_cLLUIEpkgT-7TApPfRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA0MiBTYWx0ZWRfX0quOe9l1e5wc
 daxk5YYgb2Ddwb85R2biBJH+gqUPLDW/GebONKdPgQonXWsx7GyDI2j1Mx0avE0V+VnXBavklkv
 q/bxzMNLrCj3hB/Ij7p2l77rJyIjYK5DS4hZh4a8j2EsLhGXTMcmLnNApEkEMuwTKLpimlKK0Dj
 VAXbLM0SEsJsl5hJjwxHtArCc7mRuQDNduftgsbY2WmJOJs0rWOPt6naLm1oSWtaKjZ4sxng3xx
 RWlNBvNC1u/XCXdg0qhf7JGsDSyMZRxO5g3SeBDhEiq5LmxYu0zlV2m7OPaVI4Ny8LPS1/dPS+Y
 gqoSD5vd4eXjUvai38yOE5BmMlwN7xqnHRO4yQP6deHVJeYgqcfL5urzGtKydAJUZ8jaaR5vEUe
 vOm16r9DIsxC2aPwcepN06nDpi9c5BoS9n+XnFt7gqtfh7/GJ9TOpjP1YlyLfjg2uxtyAWsLA/M
 AdGogiEiDpknqw4lPWA==
X-Proofpoint-ORIG-GUID: 0vA3aLkYrSdG_cLLUIEpkgT-7TApPfRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040042

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
 drivers/gpio/gpiolib-shared.c | 71 +++++++++++++++++++++++++++----------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 6b183864933870e54780715c4dd9179faf800d09..7270a861bb5d787d41b7e2f055d707415774256f 100644
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
@@ -617,7 +635,9 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
-			if (gdev->dev.parent == &ref->adev.dev) {
+			guard(mutex)(&ref->lock);
+
+			if (ref->proxy_dev && gdev->dev.parent == &ref->proxy_dev->dev) {
 				/*
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
@@ -752,7 +772,6 @@ static void gpio_shared_drop_ref(struct gpio_shared_ref *ref)
 	mutex_destroy(&ref->lock);
 	lockdep_unregister_key(&ref->lock_key);
 	kfree(ref->con_id);
-	ida_free(&gpio_shared_ida, ref->dev_id);
 	fwnode_handle_put(ref->fwnode);
 	kfree(ref);
 }

-- 
2.47.3

