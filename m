Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623838;
	b=cZDyga/P9F3rCXFVBtKAn3hL/RP+TXojcugSLxUYCp7PsrzxZkKkaWlA9PksatzdtAXH
	 QQ/sA4ofY3rCX7Ap9ByIOzvt0DLC7vPKlVULUn5nRccFvwN5IYEoiyrKatCKjANz+VHWS
	 ZlopFjFBdeLGrNDVnJv338rC3RgKcZiNdGrYYi7Op9iutLWZiSkMgxvOmp0Zqom/JyPAx
	 YYjBuKx7z+t8NpWkcayorGZbT/jdtoISLZcP96mNRf6RJQ6sgVuTVctNSYvCMoDwIObFq
	 1VA7V8yWGHLM7W9eHpYBrP+mEi+8JuOF2TgwtnLfZEM2vn80li4bjnmmJUflVXgX9/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sZbXoaJXA1fJG1twBrM8uROfW7h2ogSSalK44EWBomM=;
	b=mCsh/9/pb5OaqLLYm5XKMQB3DUjZRx2FypL7JQt6aRrwIREEEEi62Dk0lEHNBAUL0vv/
	 MN3/WD3FJDG+m2pzAX45CU4K5f6BR+NTA9ljIrPmxIyso2c0sAgQ8sHiag0+BpkKOrXBR
	 AiCe1KgFu19wDJ9Pw3QvWqtFHYIFLqLiHStuytWjV2DQkwjvBv+2tBGNYdlqYJZJ3Ld46
	 RIOaQIn9ZINBCTG67nyVN7rZktJcgm+cHoK5/aW21OrtO5Ibv7SHxqiLE9yoQLMy+wh1T
	 D3Ouj1Hewg7vKhvoHIsMmp514oyWevbLp9uzpYqukcW60/fx8wI3RRdeZEWfJmpqPHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8QNY6Jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaCHBOzC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB1760A3834
	for <linux-gpio@vger.kernel.org>; Mon,  2 Nov 2026 12:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB1760A3834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G8QNY6Jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaCHBOzC
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1xl2466158
	for <linux-gpio@vger.kernel.org>; Mon, 2 Nov 2026 12:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sZbXoaJXA1fJG1twBrM8uROfW7h2ogSSalK44EWBomM=; b=G8QNY6Jtl1aFfQPj
	EKs2FC523ilIvPg/ZdSgbR2DzyVM4AvrDn9c3Z8r1JLmRrKkcJ+/wswgo6DrzdYB
	R66C50VXJH1b1EcZqhEhTBQsRqTLvyolCv3txOALKRtD7JA11EjRm7vz6ec+lUvX
	z/0LfDdzrthK/g2JS6niloBmciDA1Y3+m69J/USYu+UwbxqwVNlyuUbICXDcF4cP
	mRdmyiGTrHG72M0ws64wCOwk+yk1ih9p2q1w6EYAcoX3qDdC/AFd+g9pWcrk/2OF
	BaneFq8j91/iJlhHYmBRimFq+0+UJEhIFnhxvUMjMPnapSAvOzsgmYLIp/RrdtGH
	wsCTFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhv3e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 12:50:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so326990185a.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Nov 2026 04:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793623836; x=1794228636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sZbXoaJXA1fJG1twBrM8uROfW7h2ogSSalK44EWBomM=;
        b=AaCHBOzCJtJPtyUTs+ibcBJQOh1mLWYS4AsBX2Yj0F3bLydRS1xgsUcY73MWKPjL2L
         NYOQbyYiCZRoPnLF4tIMZZCyjL5xXwf8c27WO7+NjJWCCLYSDw832EzYm4JXLqf3VUK/
         Xh1n7As2Zu5r1RGidg3wNatsafRb18Pwe6RhLxhmk+rO5JcfHKwh4ooW+qLwdnNUvY+m
         mD9JvDWbYGKUBo8nhbYnof+/JA2ftb+Xy3CIJDFv1GBB6uB+zmRr44L/GBzxsEbgaxJk
         hH2L5Msi352dxLtZjdYNpKJRMd5bFMIl0eR9ZGSUj0cBTtSotxQhimjdcR7qqQFjjHNW
         vQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623836; x=1794228636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZbXoaJXA1fJG1twBrM8uROfW7h2ogSSalK44EWBomM=;
        b=jccWr94NONveo4XzzyhvaOP8nkQ0O0jv50P7xKjECmmGooT/Lz3YbdWeZjlWfmZNFn
         byB2mUw9gKwKbM9bGG/1Z+vrffL0CTpKq8gOvWqUoDlcgG0tytz1TPu4+Emt4SOq4eHy
         x/aei0GHgo+y9H4LaB/br1PZA9kiEjNJDpM/LifOtvD806OX/0IRoWtLmCHslyrQfw7p
         fVFftNXQo51wceBk3esvy5qhdvKGyE5v9pnf3KAzCFCr46fwijNEJCPdGq4T8qNfogDT
         E5Jm705L3hDgqFIIgiFGoqRqKOkUmISSQYtvG49eceRKacMB0ncHI9iqJlBQcy6H5btT
         zIQw==
X-Forwarded-Encrypted: i=1; AKwUvBw+2e7xT01a6IY0lCcTkv7HYN1pT7S09d4xVQaaMatvbVlwKzrF6gO8uQ6D7mMTLDT6TUEblknc4UW8@vger.kernel.org
X-Gm-Message-State: AFq9FYJcRjIBwtJlhKpBlcCk7pS9oZJrrYxbGRHbiWqc+AxyaLhQxwZe
	8QuDlNlh2sPAB5Rj3WeNPHS/zMW5NHV5eYKuQQi4O0EEHqW7Z3SDQ0kwFhPSic27O69jG6QxQsV
	XSxvV6OGxXHPCis2z6XXgwAKn4sXei+ovA2CggV22C6657nTVQxLqFdlWSExXWN4a
X-Gm-Gg: AYBFou01r0J8HOkqNZ5UZqo604Gvpjmq0RvCV0QF9J+0Pc4xlq7D+a4dnfT0MU/e7+F
	MVWtlRVkfa+WhUGixBlBPeK9ktGk0wbmTB0W4RyKBGjhNJO+EGsNvdrjseEuhB5GLZUQv6zxWt2
	1nU3PlN3HX40cs3GIUhS/2HP1yB7b7ze6dZ0OrdVnnMf5BVlWdKWGOzRoPSIjKBOt+sF7VqDShP
	M123CvWJ8boNmPLFm5DMjS8VACJTtO9vytGZdqpVGHlktBM14SFj3UVAogRHfa/bTzEvHh4H6ls
	WmoHA4aSpIgbf/U+WBA/jICT6c0NtphYulMxTYkO0FcxLH5NsKXfYVmoqxi1u004Obk5B2pbiMo
	mEkBvBbUXR0ZGU7+Noz91vAn3PevOeV7eTJ4Pvwgy6vlfHY/a75ogHfNyOJRbJPLM+p+e5ULnbX
	m8Bw==
X-Received: by 2002:a05:620a:8386:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-944217b26f5mr1572168685a.76.1793623836191;
        Mon, 02 Nov 2026 04:50:36 -0800 (PST)
X-Received: by 2002:a05:620a:8386:b0:93e:c12c:fbd0 with SMTP id af79cd13be357-944217b26f5mr1572164985a.76.1793623835540;
        Mon, 02 Nov 2026 04:50:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm20464910f8f.51.2026.11.02.04.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:50:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 13:50:23 +0100
Subject: [PATCH v9 5/5] gpio: shared: convert to using software nodes for
 GPIO shared proxy lookup
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
Message-Id: <20261102-gpio-shared-fwnode-lookup-v9-5-a1d6cc501098@oss.qualcomm.com>
References: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
In-Reply-To: <20261102-gpio-shared-fwnode-lookup-v9-0-a1d6cc501098@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10146;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=eL2NW9lXqlxZSLrZNjAgfl+iWOpMIFP8Mv4zoO5EZZs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6IcRuQ+CTF4L64oL1QhZcqjQgeYPZGUR4VeDu
 yxex8LXJhqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauiHEQAKCRAFnS7L/zaE
 wza/D/9cCharDZxYK4PDP6819k/TBXn1HfcCj3wobPOrZmzoNIwjaOLicdwS18+ONmw/Dge4Pjw
 sRlvZeT8RvkJ3xrW13KWQ8vIw5gDFreNfR/nQzZklpN32L2kRXCYh7p9MxItcgZSogD29POXHx6
 mRpclI6uoVE3YVBVVUU4mUb5mtM9jzpqltRJ/VljetMEskYE3rmzCk9L2f0F3FN/uZT16CtPlkM
 8iYp96MOtoKnIF6je8mZPxDI2/sxFzNAsjdWuVbfFwIPQEsKCIZNFSJM46h+JGQI1drBeVAyo1B
 s5IU5SrSd93wUhcRTFj3aN5t+M1J7K8igFFkgQ1EnzUiM6uSfz4QU3U65ziJvMj9xdMq+xUMOD+
 EATS5DAVHURrkxbgylsAn0mEiQ0cfJsn3WMeo36gV9tPAYWn32EX8VCXuAfWU4gh8Fdm+MCboDr
 6DQrQ+0WAVWcMlPetRzpmYidwzHiUFXScQzf+B32oKD5xiZqE2EZiMa5ZhFGN3G6qN0RZJx2p6T
 fPgFGKkM4wj8+z/2Zs+JeUFAN9m0EmQLw6p4+vQrlEa0EZEFEfs92D5V5vXiZ8mzj7uENrd0YV1
 DyTnw77DEbSOtJr84yPb524gjKPJE+mFgKdvMjv/UH878cVs8TrO71OnUp2JnzpUcnYTOCGllv0
 /whLyliOnlLRfYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: YF-c2EQGw8COjOSEd2KbMcPl5fdr5JGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXwJyfX0H7Xii2
 OWfYhO7KFL1FVQClOerYvpARZgMBTopFM1BBe+KDJXQF5QAu8VOtMWFTW77fx3EO0QNV0//p9Yf
 oF9icpaPnpnODIK6+Iba7iMnjPVtxWvA18ujFtgZIYiX6xm5wtYa8DS6J9KtT6jH4+9n7DT5w1S
 2V9k2oN8EhlLYG9dLCPFKt69bxifn5mfhC8MvaEZZEl5sTyGT0rnk4U/r8SNP4oUSCKFVXnjaXR
 1ABJo4iOM/EBWAA3C5fXK2iEWzwsG3wJvCu6juzJi1ndrYmo6uWtCcB6GmtjV0pRA9NkDzGF7G/
 GTNKCxDicOkJI7WKJTqCRz8apzZ/dJG+iAM1BtPXSYTjBafNdI2iQFswHRr/wia/ccu4R78uMm5
 X++z9gzqOh7T9YdeM6PoP8itRwq9E+NBKZwdo/GlK5YnUD9kIn+sTjKkSoLaOCHVueg5pv6yEUz
 UsiXZssWfvhKR7UaY2w==
X-Proofpoint-GUID: YF-c2EQGw8COjOSEd2KbMcPl5fdr5JGK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MSBTYWx0ZWRfXwlBA0VIMRi3G
 rj+5yP9OhwQxQoa2zVN3tillLszEzWKAnXfP+/5Bkm1hPauUFcqrGW/r3hhhGLJXKbne7Us2GRn
 Wc6yL9INNwA19+6fJWzuU5v/N7TiGvI=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8871d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=3YDXMbTaxpWklVeNtl0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020051

Automated management of shared GPIOs only allows to request shared pins
when they're assigned to a real struct device. Firmware node, no-device
lookup currently isn't supported and can't be because we're using
platform lookup tables to point the callers to the shared proxy GPIO
controllers.

Rework the GPIO sharing by using dummy managed software nodes assigned
to the proxy devices which allow us - once the correct struct
gpio_shared_ref is found - to find the target GPIO device by its firmware
node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 133 ++++++++++++++++++++----------------------
 drivers/gpio/gpiolib-shared.h |  15 +++--
 drivers/gpio/gpiolib.c        |  20 +------
 3 files changed, 71 insertions(+), 97 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 9d73a02e998909746f5216f40dfe4d82f7be9e1c..57d8fd0bf2e1bc2997c1ed64b937100ce745136f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -35,11 +35,11 @@ struct gpio_shared_ref {
 	/* GPIO flags this consumer uses for the request. */
 	enum gpiod_flags flags;
 	char *con_id;
-	/* Protects the auxiliary device struct and the lookup table. */
+	/* Protects the auxiliary device struct and fwnode. */
 	struct mutex lock;
-	struct lock_class_key lock_key;
 	struct auxiliary_device *proxy_dev;
-	struct gpiod_lookup_table *lookup;
+	struct fwnode_handle *proxy_fwnode;
+	struct lock_class_key lock_key;
 	bool is_reset_gpio;
 };
 
@@ -303,56 +303,70 @@ static int gpio_shared_of_scan(void)
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+	struct auxiliary_device *proxy = to_auxiliary_dev(dev);
 
-	ida_free(&gpio_shared_ida, adev->id);
-	kfree(adev);
+	ida_free(&gpio_shared_ida, proxy->id);
+	kfree(proxy);
 }
 
 static int gpio_shared_make_proxy_dev(struct gpio_device *gdev,
 				      struct gpio_shared_entry *entry,
 				      struct gpio_shared_ref *ref)
 {
-	struct auxiliary_device *adev;
+	struct property_entry properties = { };
+	struct auxiliary_device *proxy;
+	struct device *dev;
 	int ret, id;
 
-	adev = kzalloc_obj(*adev);
-	if (!adev)
+	proxy = kzalloc_obj(*proxy);
+	if (!proxy)
 		return -ENOMEM;
 
 	id = ida_alloc(&gpio_shared_ida, GFP_KERNEL);
 	if (id < 0) {
-		kfree(adev);
-		return id;
+		ret = id;
+		goto err_free_proxy;
 	}
 
-	adev->id = id;
-	adev->name = "proxy";
-	adev->dev.parent = gdev->dev.parent;
-	adev->dev.platform_data = entry;
-	adev->dev.release = gpio_shared_proxy_dev_release;
+	dev = &proxy->dev;
+	proxy->id = id;
+	proxy->name = "proxy";
+	dev->parent = gdev->dev.parent;
+	dev->platform_data = entry;
+	dev->release = gpio_shared_proxy_dev_release;
 
-	ret = auxiliary_device_init(adev);
+	ret = auxiliary_device_init(proxy);
+	if (ret)
+		goto err_free_ida;
+
+	ret = device_create_managed_software_node(dev, &properties, NULL);
 	if (ret) {
-		ida_free(&gpio_shared_ida, id);
-		kfree(adev);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
-	ret = auxiliary_device_add(adev);
+	ret = auxiliary_device_add(proxy);
 	if (ret) {
-		auxiliary_device_uninit(adev);
+		auxiliary_device_uninit(proxy);
 		return ret;
 	}
 
 	pr_debug("Created an auxiliary GPIO proxy %s for GPIO device %s\n",
-		 dev_name(&adev->dev), gpio_device_get_label(gdev));
+		 dev_name(&proxy->dev), gpio_device_get_label(gdev));
 
 	scoped_guard(mutex, &ref->lock) {
-		ref->proxy_dev = adev;
+		ref->proxy_dev = proxy;
+		ref->proxy_fwnode = dev_fwnode(dev);
 	}
 
 	return 0;
+
+err_free_ida:
+	ida_free(&gpio_shared_ida, id);
+err_free_proxy:
+	kfree(proxy);
+
+	return ret;
 }
 
 #if IS_ENABLED(CONFIG_RESET_GPIO)
@@ -457,23 +471,19 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 }
 #endif /* CONFIG_RESET_GPIO */
 
-int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags)
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
 	struct gpio_shared_entry *entry;
 	struct gpio_shared_ref *ref;
-	const char *dev_id;
-
-	if (!consumer)
-		return -EOPNOTSUPP;
-
-	dev_id = dev_name(consumer);
 
 	list_for_each_entry(entry, &gpio_shared_list, list) {
 		list_for_each_entry(ref, &entry->refs, list) {
 			guard(mutex)(&ref->lock);
 
-			if (!ref->fwnode && device_is_compatible(consumer, "reset-gpio")) {
+			if (!ref->fwnode && consumer &&
+			    device_is_compatible(consumer, "reset-gpio")) {
 				if (!gpio_shared_dev_is_reset_gpio(consumer, entry, ref))
 					continue;
 			} else if (fwnode != ref->fwnode) {
@@ -484,42 +494,31 @@ int gpio_shared_add_proxy_lookup(struct device *consumer, struct fwnode_handle *
 			    (con_id && ref->con_id && strcmp(con_id, ref->con_id) != 0))
 				continue;
 
-			/* We've already done that on a previous request. */
-			if (ref->lookup)
-				return 0;
-
-			char *key __free(kfree) =
-				kasprintf(GFP_KERNEL,
-					  KBUILD_MODNAME ".proxy.%u",
-					  ref->proxy_dev->id);
-			if (!key)
-				return -ENOMEM;
-
-			struct gpiod_lookup_table *lookup __free(kfree) =
-				kzalloc_flex(*lookup, table, 2);
-			if (!lookup)
-				return -ENOMEM;
-
-			pr_debug("Adding machine lookup entry for a shared GPIO for consumer %s, with key '%s' and con_id '%s'\n",
-				 dev_id, key, ref->con_id ?: "none");
-
-			lookup->dev_id = kstrdup(dev_id, GFP_KERNEL);
-			if (!lookup->dev_id)
-				return -ENOMEM;
-
-			lookup->table[0] = GPIO_LOOKUP(no_free_ptr(key), 0,
-						       ref->con_id, lflags);
+			if (!ref->proxy_fwnode)
+				/*
+				 * There's a matching shared reference but the
+				 * associated auxiliary device has not been
+				 * created yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			ref->lookup = no_free_ptr(lookup);
-			gpiod_add_lookup_table(ref->lookup);
+			struct gpio_device *gdev __free(gpio_device_put) =
+					gpio_device_find_by_fwnode(ref->proxy_fwnode);
+			if (!gdev)
+				/*
+				 * There's a matching shared reference but the
+				 * associated GPIO controller has not been
+				 * registered yet.
+				 */
+				return ERR_PTR(-EPROBE_DEFER);
 
-			return 0;
+			return gpio_device_get_desc(gdev, 0);
 		}
 	}
 
 	/* We warn here because this can only happen if the programmer borked. */
 	WARN_ON(1);
-	return -ENOENT;
+	return ERR_PTR(-ENOENT);
 }
 
 static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
@@ -529,6 +528,7 @@ static void gpio_shared_remove_proxy_dev(struct gpio_shared_ref *ref)
 	scoped_guard(mutex, &ref->lock) {
 		proxy = ref->proxy_dev;
 		ref->proxy_dev = NULL;
+		ref->proxy_fwnode = NULL;
 	}
 
 	auxiliary_device_delete(proxy);
@@ -543,17 +543,8 @@ static void gpio_shared_teardown_entry(struct gpio_device *gdev,
 	scoped_guard(mutex, &entry->lock)
 		gpiod_free_commit(&gdev->descs[entry->offset]);
 
-	list_for_each_entry(ref, &entry->refs, list) {
-		if (ref->lookup) {
-			gpiod_remove_lookup_table(ref->lookup);
-			kfree(ref->lookup->table[0].key);
-			kfree(ref->lookup->dev_id);
-			kfree(ref->lookup);
-			ref->lookup = NULL;
-		}
-
+	list_for_each_entry(ref, &entry->refs, list)
 		gpio_shared_remove_proxy_dev(ref);
-	}
 }
 
 static int gpio_shared_setup_entry(struct gpio_chip *gc,
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 618756f6c6aafd087df267a4a32732ccc03af38e..27fd2a40c5cb77a19c258e3fbf429d3f6e7d4b32 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -14,9 +14,9 @@ struct fwnode_handle;
 
 int gpiochip_setup_shared(struct gpio_chip *gc);
 void gpio_device_teardown_shared(struct gpio_device *gdev);
-int gpio_shared_add_proxy_lookup(struct device *consumer,
-				 struct fwnode_handle *fwnode,
-				 const char *con_id, unsigned long lflags);
+struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id);
 
 #else
 
@@ -27,12 +27,11 @@ static inline int gpiochip_setup_shared(struct gpio_chip *gc)
 
 static inline void gpio_device_teardown_shared(struct gpio_device *gdev) { }
 
-static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
-					       struct fwnode_handle *fwnode,
-					       const char *con_id,
-					       unsigned long lflags)
+static inline struct gpio_desc *
+gpio_shared_get_proxy(struct device *consumer, struct fwnode_handle *fwnode,
+		      const char *con_id)
 {
-	return 0;
+	return NULL;
 }
 
 #endif /* CONFIG_GPIO_SHARED */
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..402de2e106f19fd110d67eeecd3c07794b7a5cdd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4841,24 +4841,8 @@ struct gpio_desc *gpiod_find_and_request(struct device *consumer,
 	scoped_guard(srcu, &gpio_devices_srcu) {
 		desc = gpiod_fwnode_lookup(fwnode, consumer, con_id, idx,
 					   &flags, &lookupflags);
-		if (!IS_ERR_OR_NULL(desc) &&
-		    test_bit(GPIOD_FLAG_SHARED, &desc->flags)) {
-			/*
-			 * We're dealing with a GPIO shared by multiple
-			 * consumers. This is the moment to add the machine
-			 * lookup table for the proxy device as previously
-			 * we only knew the consumer's fwnode.
-			 */
-			ret = gpio_shared_add_proxy_lookup(consumer, fwnode,
-							   con_id, lookupflags);
-			if (ret)
-				return ERR_PTR(ret);
-
-			/* Trigger platform lookup for shared GPIO proxy. */
-			desc = ERR_PTR(-ENOENT);
-			/* Trigger it even for fwnode-only gpiod_get(). */
-			platform_lookup_allowed = true;
-		}
+		if (!IS_ERR_OR_NULL(desc) && test_bit(GPIOD_FLAG_SHARED, &desc->flags))
+			desc = gpio_shared_get_proxy(consumer, fwnode, con_id);
 
 		if (gpiod_not_found(desc) && platform_lookup_allowed) {
 			/*

-- 
2.47.3

