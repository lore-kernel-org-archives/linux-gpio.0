Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623831;
	b=f5hRna/uZPpof1W3OqQ+jC92aW98cysq0XHpiwM9uzlK43S/YWRk68LHNfzvslaonawx
	 BIU6fHJl4X0V0b/UprB1iIw+sVGx0BZIDW5EPCm9UgZz2wfTMlml4TT9NE5K2D8A6Shiz
	 iL9lUSg78duvf2iQiXjsKF1K6et4TqzQNnG0Z7FZbzAen3Zfgq5Cg0XWiO1zCPse18C8L
	 Bn8dbMk5DviwHia4Kew3aa7Bpe/St0P+tefDWMeUsvmZGib/ZRmm8Q1JL1a4vTK9SAIhh
	 hRF7+wIZJjlLsYkL2qkqxfPbJEWgdpaC/c3rJTg7MgygSgiuKhH0YVDtEBiqhK7Yziw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=ByKC0QqDJqTDAC71FvpE4tUNjjqR9r517Ck1c9UaO7uCPIwpsFXr3O1vJUdENi0WBlG5
	 Hl1+GXkBzS9qks86fpm8Cntyan1ogAHuP0BDbIrfEKrt1q5nmDpD3seEWJPHAdwCcqKQD
	 H/364ZWBgenV/rNS39NGAEXrWeHe1iqiEmnze7jm+kRORoF3KI7H5ZJ7O6gO/tzuVldTQ
	 G/c3RIsikNBKVJHCTArrGvYp5FiqYAIiu0lisMMq6J1i7fesMFGjHYak2y4SxV4CfD4yt
	 1NS3u0GoKDALNHwj5ZEh9PpYTHn60p5k0c9rVB+2pwf88DnIMEwXuOyLkgenI1Q8t/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24AB60A261E
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 12:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A24AB60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aSyVet6W;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VPIpzAPx
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299xI63430281
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 12:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=aSyVet6Wknl1vVSH
	iQ9qWtebjFENHAeMBcSInxE15ffKi8WdamFBvH3XX1OpWp1TeD47ix6vxCfwnp0u
	sQR14us0veByjSJi18rqfxlDv3ctJn/gg2hK5XsWHChxlx5yrydPbAIeTVbvKmxV
	vK4vjhJGCGX1jK08yEGHbPkQ5YkStboR0xLvjzZuDALfAJqgUKebpe05HvpjrnHn
	D0lV9XKtb/IhxIQhK2l38wHA3DzQYV/pPxDNKIx+ChgsRISh1+KtqJ2oZ/1xCz7u
	u34/YTZg6u/omYVqg7bDBgj1UnZ4Uzn7BvYv1U5EZyRamX79PdoTefzctS8ezatg
	ARPRBg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesb6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:50:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988be118d98so574138241.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 04:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623829; x=1794228629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=VPIpzAPxWnHEYDhPoacfaJkUqd1ImMRRXfEprxkym1MUO2Us4oOlechBEdW3M0xZK4
         hZKOoryPvl6xlfATyubXF8nSCzrabEuSuN0h+/pcd5gTWz7Zyd9eP5IyPjVFcVJkbhys
         DzJX8rZDvsn4sudDv3kBCPV4cxWpp0dMxbAyyTYUnJu0plCnBajZmFabM8Bo73ym56PD
         6Jw3vNeZlu2LEgTgoby6HdlOFP9d9caXKWUEgM08LIQ1dh7O3S3seRVJtdqq3I0kXCGH
         NXd/2B2j1PrpWu3wkCp07aeOcKI3y2eVA4TMWRANWthWBTxxRYweiLzV2QiqxW9T5vTb
         8I0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623829; x=1794228629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=xtF9oJeX+/goOphgqGINMg0Blj3ARwHJOHy000gUaNTECrJH0PdsMFDWeSRjJq9ioj
         RtiT8pMl9UiAPa/OCVbKt62PDb5YRr7a3Db+Y9ImNhp4iCsnqcHJUXE8XHe3k0S6yaqT
         bKz7p6Zl0EEOqURq/22VnI8UPntlfkqywH4lI1uZkqgf2+jZWTTR5esbaQDQczUNDLNb
         LxXCz/0UGEJ3SQwupalZBfX5BT8nKNA1aNtMYpKVCVpm+VERNLK32g1FQ/t8rLAqfnBa
         OmSmggbMjNnuYzL6Q5cBpVAg566vR8LdMhTYuWOeWMrbiaYwlKk1pk1icdL+A+rCCu1B
         fM7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwN4nnbXuy4nGYoylM+R5I2Co3bBr0k09FvDvpNJbH/6b9eN9gpvOle7GF6XTQ5xhhqgpXKazAb0AEb@vger.kernel.org
X-Gm-Message-State: APuU4Z95LcAGlD255TyILY8gsfRFQNPo2r+UqMcZphAyKpc4K+HIQHOw
	uXHTG7gERPkT3IMW4nD2u5KgTyBKmpzYJFQH4iVPzbuTBbC800b6wrX3h+B7q41Npv8kj6RZT0H
	Tjme492FWzyAZspLJDHuqmcVh7Q2nNgrKyL9q6dMAZren7jwu1dGQhv01Arbba2bc
X-Gm-Gg: AYBFou2jnrDFwzwFf4hHGM/vZnPIVBDta/Vr4icSvvcmwFxIFkD305Zu9DBF+GKrDe/
	ii46sEYkWpNjQJRYGu0tvj5ZHtcMH40NAxIN3/bXfpMpL/CPlou2T1LK1w8iOlMo+AWg0z3fUeX
	ctGXd58ON47qPvASJSK0IJbPNFE/iGABgobch/OYnntDldTxXuB1KNpmBpTwe0EpFfiC4a5PmpF
	6r0yh0FL+6T222mMIguviRlVcXlOl2wxLKtKgEMfXTxeD6t6bmIg04kCaS/vYDFPy2q19J2J9jZ
	cwa6x+cwwds2DFBhDZ2dsw/2VnArqPbCXfpWIbo6IjG+91vcYbmyiTl2MuBQDmAo/9KfwYJbrya
	1jzerz8NUM2NxbQVlQ6ojduCGVtaQwBWgwnO8VdOz7OkYSniN/um1abTuJH4XwCZezT3K9bsD7/
	crUw==
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266938137.32.1793623828850;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
X-Received: by 2002:a05:6102:c48:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d0727a7372mr3266927137.32.1793623828345;
        Mon, 02 Nov 2026 04:50:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:19 +0100
Subject: [PATCH v9 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-1-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcQYP5BQLh2cvFSimCvqQmseme4CAWihk33m
 uO2LKVbeGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEAAKCRAFnS7L/zaE
 wzcID/95nJ8RjZY4PzUH2GKTv868dSvroebqFK3p7lP22SfEiXB1sqnnWrSCySvMXrrKimOlUIF
 piI9LNVrX1ZADPKSSn+MXByfOU7apU+Fx3DNrIkzhfxdbbqgca+bchuOn4XvQivDW16lKOLwGXr
 bTQmV3ENumiD6870UxTvbajqF67oWYk5xA06IWL7YpiUct9coJtl/jEiFAnf31N/jHB3JzIDhFw
 0sXR73SJ2eAqHE32V9bmbK0EgNBuUG3qU0A0pcCnkp97w9tGt2uyRb4BZVTUAxu2/v3DFdtwuGt
 63eRy4yDOFCRs/uQgGFsiFMSa9s7SwkK8NsIdoUAYamoWF1gDsIqD60fJht6FDDgzXMf+vUmTej
 qjlOBviUu0I4Wo/v7kNlcBxBVFIJB708ZOpE3kt2LkusC6mm4bDvMuzMNUDyEZ6q8NAGP9zYzj4
 +q8bm+k4a8IerZCk6TkmCdtP+V8emF05R7eNNcbISVSD23RpZoZUd8bkIn+C3kcYiBY7GJOhcFL
 wvbp5mhniCupdys6lQfPvkCYPrfv8ezaQgb7fPK7tmnYu4qWvBtccEdQzRMQLx5b1pR7pOC2rYn
 QUO/CI0uuIeGzxFhHk5PscrELQsuvmeMc6MU1xNCC3m1aDkiCrqceHXJGUfZLjAfWJ56nuVSBnb
 Q/xQTv9O1tcBcKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae88715 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX7A/s9HI2ItNf
 g5gEKVVPh4+hfDPAzAGYLKIwCjYiu3P+EX0isOg8p2UjpihpikTRdmMX/j8V732LTrhFKHga/3L
 mCuIU/Iu6UnMGLOa7nrKbqQAManHvLY5x4jvAb+364stRjrx0BqLJCN7eljrbCrhZXWN7clZ0tM
 h3iYmTk7LMDriSWlMe+9k+/l4+/PemYT40cFBk5UX3Ti34LvJ4ujFHXTGj6U2UeM5tIJCF2b0/n
 rx6vzWZAkDJhMKD8pealGTH6k2KUpln6BnseTGdC2hcm583GAHfhHloW6vM6jRroVE62Tst/R4s
 bJ/80JxgV6qL28T5yKbgYNDMLnmXHrzCQGnM867wx4ATSHxrVygQWgrISsxhgcYMKcHI6oO+5+P
 Nua8ho/oTnM/DmfH+8doOI241UqNNa4JJcmrqatS9XQAPv0DKNAOliVwmvrHZ5Y1L88L0FdFIfq
 dIpaKiH5gd/xOY6G1pA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfX4vJdxYI0Wc3j
 yFLXvlrnB/lO7wNb2NmQQB9dAizbS9ok/sjGzTsxYx+9FZp5Z7O8jbn9JZoUG+toR2odPg+ygQf
 550IK+Er89J4fNnQqfvVKqembDSyAVg=
X-Proofpoint-ORIG-GUID: gBodPa1ZwMxzXjz8aQtP8Bgiv6r1GdIw
X-Proofpoint-GUID: gBodPa1ZwMxzXjz8aQtP8Bgiv6r1GdIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020051

Move the body of the loop in gpio_device_teardown_shared() into
gpio_shared_teardown_entry(). This is a preparation for unwinding a
partially completed gpiochip_setup_shared(), which will need to tear
down individual entries. No functional change.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 37 ++++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d9330490b17fb3936b8758beb97a308a15..64bb450f0a8461d214a45aa97e2474ff0d1857ce 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -517,6 +517,27 @@ static void gpio_shared_remove_adev(struct auxiliary_device *adev)
 	auxiliary_device_uninit(adev);
 }
 
+static void gpio_shared_teardown_entry(struct gpio_device *gdev,
+				       struct gpio_shared_entry *entry)
+{
+	struct gpio_shared_ref *ref;
+
+	scoped_guard(mutex, &entry->lock)
+		gpiod_free_commit(&gdev->descs[entry->offset]);
+
+	list_for_each_entry(ref, &entry->refs, list) {
+		if (ref->lookup) {
+			gpiod_remove_lookup_table(ref->lookup);
+			kfree(ref->lookup->table[0].key);
+			kfree(ref->lookup->dev_id);
+			kfree(ref->lookup);
+			ref->lookup = NULL;
+		}
+
+		gpio_shared_remove_adev(&ref->adev);
+	}
+}
+
 int gpiochip_setup_shared(struct gpio_chip *gc)
 {
 	struct gpio_device *gdev = gc->gpiodev;
@@ -606,26 +627,12 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 void gpio_device_teardown_shared(struct gpio_device *gdev)
 {
 	struct gpio_shared_entry *entry;
-	struct gpio_shared_ref *ref;
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
 			continue;
 
-		scoped_guard(mutex, &entry->lock)
-			gpiod_free_commit(&gdev->descs[entry->offset]);
-
-		list_for_each_entry(ref, &entry->refs, list) {
-			if (ref->lookup) {
-				gpiod_remove_lookup_table(ref->lookup);
-				kfree(ref->lookup->table[0].key);
-				kfree(ref->lookup->dev_id);
-				kfree(ref->lookup);
-				ref->lookup = NULL;
-			}
-
-			gpio_shared_remove_adev(&ref->adev);
-		}
+		gpio_shared_teardown_entry(gdev, entry);
 	}
 }
 

-- 
2.47.3

