Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708485;
	b=Il+Rpz8m3yTlNfDdvC8JW+APosPTxTOlFnbkUXKARrVxUbqwWdzQW7Cj6yXPyh5cVYry
	 YfPV2SNRgWyEoFd/aBUGGARV0Qj9K56/yFdhtb+/ZY6Utt07a6oawClwU5zC0jtjpxUMP
	 tElIcB83rbsM/y/jddPsWWKm50Kbj35d/AcoFylTsXm9CNIBjWo8H0P635EmUvE0kZQdt
	 xeWXtLEPzZHJ/208gQw3nH0SfEzvo/5NFAjO0F73lK9foNn0uzlG1On76sSopLnxYMjRc
	 ll3NcswSVVX+JURaJCLFUVSdFrJPGAGAy5duWTZgM2/jDcjpyLYKnOUJ7iF+yfSi1+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708485;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=P0z7qf8OWOuIP81Op2S6HIc/Fhqw5jai6yAVuzB8rta56zbXP/ratHWabr48JenhlKjs
	 MKY/5674UdvSwn1EFB0w1+4LNuGRWa3FqH1EMMRDAFV4pTSYWgs04/Efdtr4Wnb3zWmqu
	 KwHFXsMqL1rLaels53EDK06XdQMdl1zgqjRohrc6Yzt5dCpX2UKUEY+KW/oDKa1VvvIK0
	 rRmMYV+iCYCMpcIegVzxiBfhLXSfoQAQIviH+LmTpmPa16H5jk7od092xF7IxXqgFETwq
	 t4pH9UCjX1LoaV7u+HHeSaCTHZMlTH+SOFzjVNLv5VL8X/wD/8Rxx6m1tZomrb/Gy8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F4606A339
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 12:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 784F4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V6tUbbjP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NtqBXbxo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAnOM928151
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 12:21:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=V6tUbbjPa0AfuqVa
	adIczz3l2IH6zM8HBT0Yzrpxp5KLyf7sZ5pL8Z2/Pk5mInrMYezNfChEaQkdblbW
	CYeym450U/WrPB34oBnANuyvHDFrXB2+X5bYtVQ7GU3lLJawXJZdEsz8zgqV8w99
	9wAZt7yCDzxQW2GtcU5sznawXBgFZVhL7uT6cqEWScQsu18cg32nngvYnWEFWeY9
	jIsCTBH59cUPfcoZ8qj06N6cFA8tw3EKHuTMdBu3k1/Qd/liHj9WpLlmVgIKe7zs
	q9es2NIem1hP89xnXLkbq9AythA7CYbC+wL/rtZZZwSL9xTr5XuqXxDIvlJGAMdO
	JX7Z3g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekp63-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 12:21:23 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc3a482af7so3694778137.3
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 04:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708483; x=1794313283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=NtqBXbxoZSu8AelhZLuKmJKLzOWvvHojF0f79XTCuED2nNOC5yaVMYzc7xxN3r/WYi
         Ffb9PWgUxAw2stCDnMv9KskMbWzDBmWVb2av9Fqepeh2HCMbWp9OLUn/7kZlUbEkpRO+
         d+c4uaOGoaPn7XU7XUNyLem+Oyyq4CpgTp2YOT0nZKdDFZ6N8qd5rbOBSXxpz5EgV4Z4
         9Zkx6RzzEQk9Zqo6q7PIJoHgJZrJarFMD0ct9x2HBFloGwuMCnOMsN0D89M5PzjZRKAk
         Xl7mkNGJzadjWQ7DyuVCq/yX5YXV2VXxA9OlPkAuSgguRgWtdZME57QWLMCiNbkF2jfd
         OyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708483; x=1794313283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=bWyh0iMvDO4ZfxpHu3+5Prv9ZJI57nw2pJgWqQ9nWWeYdBXKTih8S0L4Us2b1CPRBg
         MOzKq9HfPj3NfZKhLTZbLgcEIYmT3pkm9KFdqU5phkvZuySrmtDXm3keWurdVwjjYWov
         x5/cbDOb0nP0O6yP3rjUEsNKVrAJ1k2+KnROGsx8ZfMG8PaclV7itg2D7xoEyN4It5wy
         N5Aso4ZmuwwKX/66015b75pISlFLdk/glvYdhse72WsJF6FuLAb6t9U9+wf6DBFn6K1A
         smXNhqM5/1L64vu/kL8Sn7khBGBJdzgpfbRznc6Q18uxxq9q2F0elzrF8hr9xgM+4O7W
         5b7g==
X-Forwarded-Encrypted: i=1; AKwUvBylPnFzOx1GqFTIFxdEKQbsAh1kGPaG1IUyW1y1j64wtTIBD6g1CtuR56GftrOFlG3JHskWfT9zW19n@vger.kernel.org
X-Gm-Message-State: APuU4Z/1tnDDxkF4+bExp36caERPQmWP/XkAgyF9H68FRwSLeWB7NHQu
	ykUwcFU+cjdmNqwbFb68a8sAs87E41ZSIr2s76WrYAij0m7MD2uHAnZN/LRRaYDOM7J9FKAvK3A
	rHosCspnfMCKJQx4wTIEw6QHClsoyrMMYK/3++2qVwtQOpSzubjUL7ZSaonmna3nm
X-Gm-Gg: AYBFou1hUqKS6vgdOHmAxC8ljLufvBmfFNEZRUcsr3mSFJg4R3aFzQCYsP+NkEib8GN
	QfTaiuum7Q0VE+2hiSJ8DfTmBgC4fkSR47x0sgZ0Epf5316B6PdxYWZSeQS9oJ37qLabDUxkCVL
	KBmGFdwfMDlLsrI+M43mnOU1JkBl/rtBO+BmICwJIzKP07JNGzErWm/ni9jPetx8KXvIt/9zIOR
	xYd8fyMeuwBk4ITXVd1MWkohWIbmEwgJ8mN6J8oN4YSIhnzhAQJJ8yKCNitkH8GwNpdK26wObJ+
	4t5t4l6Xrhmdp4c22TMM8mHR4QAawOBNHS6VocmW2je+nmj5dlN629+QzLQtYKopGW7p1kkVm+t
	BteT+AN79A5C3QJr3lvDAPL4DEkDL4faaaRnDH7v6meZAnY86+z6zGAVzOQaHVU3yW3SKqWyuYQ
	xwbA==
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468456137.16.1793708482687;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
X-Received: by 2002:a05:6102:fa0:b0:7c3:9982:67d7 with SMTP id ada2fe7eead31-7d072670942mr5468443137.16.1793708482196;
        Tue, 03 Nov 2026 04:21:22 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm24378293f8f.47.2026.11.03.04.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:21:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 13:21:14 +0100
Subject: [PATCH v10 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261103-gpio-shared-fwnode-lookup-v10-1-c0c592c8ab0a@oss.qualcomm.com>
References: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
In-Reply-To: <20261103-gpio-shared-fwnode-lookup-v10-0-c0c592c8ab0a@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6dG+6wdSPRH1rPuN+UD8TJRPtXlvt0JwY6x+y
 Fz1jdAAJvCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaunRvgAKCRAFnS7L/zaE
 w/HHD/42h6ZeqO/+2wIFbZAiCsVqWLIuntzfuCGlmnMpTszctbfmwz7DNx1LHuqo5oQHNaLUVpY
 HL44ss8ggWYUIwCFfLudAWeczX4H9yyPdCxwC31IJpxfaneSnkpCvq3VZxurOs6OwANjCNDqb0o
 gTDIZK8d13ZHI5Z9aJ6qEkERUvlZW/vHMBB4mns4cx/HtcDgS9H540W4c27/pxN9UkbjJVXWhyb
 xbRu/aN+5QTyGp08CflDDqBHaiuyJ76n4eg0Xkz+T83m1AKYtdLbaymp0D0eiIq1RZMgqD8Bclg
 2yJrwX+kViiHyxI06S9BUAVvY8v6GiEBos10PKjdVTKYJNEhwX1q+0kBPZ1vYJeYS9LYzkBIPkR
 yF9DKWRWdQcZJsEDK4kiaMX51kkksdtaHnW8ATgNzuK2JPC/mnxQsI1tpSbAk8l4shypfD63r9F
 wo7lW4dpO2ub+wGcZwQ6Ta2R8F3Y1ZSEe8OC42fYMj+FuSwIDSpdQ21UbTuJhn3Y5WrHQPKyUpf
 oDPpnRUDhd2n0wwR0rcgMlYnNp3zdDaqhhaPdc3aXa5HO4aMUY1/l6NNwfG3qoAX2xuey5HJbm5
 r55bMd+shLnejmlM9ZzOS4hGF69gSOzGkDtYDjTkglU9vXHdEtO/DVi/58XMCdccQZZoKAaq5jk
 hsoic5FijbZhhwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX+PTX+7AgQ7Vt
 zyqDq7UuWnSNDrtmTYVhH5f3SaJAFr62E7QVhdSR+n0eKMZV7M+Qg6qboWA3TVYXmyOoKuGti4L
 r2QySM+unaLfQgKDf4R7U4iRP2t5FfwSeAfQG7uCVdZ7h4ie3yRE1HEExaktpjZib4jGhZgde0d
 WXWskJtQdmGnX8dKW5U5wHaTIO6+BbQriSlBhVXmOXEO2KW60CxeHnUOOdIf7N1XsrRAPyZv6+j
 fxzZPIfmtUhnISgg7/SJqerPZdes0Y5ObCo9GSEuVhmD+4rCB4OxIzOoDS9e2t6gqO0UY7IPt4t
 j99kS+vkhS3ex1FLeg0xDxjyW9HaBWBhbX6kyY5pmZ1BP4cnM2EOHIyq6aOuP9NwzPJJV+yK1nH
 VqkYvj2upqnjEIB6zU/+DNWA0I0UYJB7o9jlpa7lwIwtzyr7ubzMG2qxOFOmiEsd45r3lF86Ujw
 Kz8a77QOpWqaQeMdLsA==
X-Proofpoint-ORIG-GUID: BFW9-n1gHAAbIXqq8E8gqfAryJoZnk6w
X-Proofpoint-GUID: BFW9-n1gHAAbIXqq8E8gqfAryJoZnk6w
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9d1c3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX38zi0aQOCXRh
 3y4tHOOh/E0ZXVRGZR+w06RL0XRhV/1hfpwOEEI14esSgYY639l1AhC7mLFiJecMGfyc3TiWvLp
 cPuGwgE4qkdHU86ShstZnaiBWvyXRT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

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

