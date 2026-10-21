Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592653;
	b=VMdHKrU5O9a0oZpjhhVDn+I8kDnTHE2rpwciY3cepIHZnByv1pGErKZ4u+UttAVlQuwE
	 hXs+sxu//6+M4Czue8qfOgjS1FZvZ8DyLgU3EtWb15PlahRsJgMTkhyZZP5QNSo36vtkI
	 uHKkTXZ2XKv1vBGT3Yy9dhUnOIoZ+NXCe831HozunSJ6JWsUWIA9pc6/EBH0JeH0fm8Rs
	 LVIBctDxxYanEpuFCJrDgCRa8eJ7wtkNSOj/0Z6IxGiDRXoB+5DVc8FjiK+nEIFAfufdy
	 bczptNUcTgR/ZW5wAFJQ3PRkWQKVtGFdldl9Q+gIKKtg9EtaHCJeh+PMp+5lmw0sqzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592653;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
	b=3w7U7t4JnLpPmv7CajmBEFxOj9UlLXUfLpEzyLYXxRc0LT8i40OatPY6P7WwgtsHQzQ+
	 mZ1nf7UWxeEn2vmUVKc0lPoDYKjfuqTBb9rC7kDu5jXiQ96D8/ejQk9C9z4fQp8vFNluz
	 94ncAEUtw7PoIRCv32S6noV6YI4A5WOlZZb74EnCk5HygmpMWp9i7HrgBBOVR+PULXhnm
	 MUnz10sabc5MTOfhurM/GxXDsEJg80yLbNdjvQA+MZr0EfxAqiaXKMEZd+E9fTviaTXeO
	 j6yTjlZtrCvX3CzMPCxfh+MEP5uUK/C+fzF/8iGQ4/f3ManL6NICqBf/XH2qNwlx9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAs1QUKt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6528C606A336
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6528C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BfZscyGr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WAs1QUKt
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF29T514885
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=; b=BfZscyGrg7TFIUnD
	e61YRUCkXaG1Eq+H3lByJAk960/DDpm4zo70/S+jxN8BfKh8uu/K/UYvjymVVGa8
	oYNiL3bLtnKb2Ex1qDLGnyUbA6DM56FdjMt2Kw40pI/wKOufWwk4ivfdqKYFxQA4
	w0ilK1mo1p+pGOSXbidI8M+o3+GoW9qbcAIiUe1jAp5F9//bi1A5PU2YAW8JCE0X
	k11Dxl17UXFenFAULPiwGxrKEpv9OKQMybKy2kOxep8lEkOVFfA+wmzDYjaW0/if
	mcXgqDy2avYqIOTw4rFk/2gbWn8u/1EBJs165Vm47uxyfoorjszrxr/4r9og+r9e
	Tklxrw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vr8p1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 14:24:12 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso567567241.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592651; x=1793197451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=WAs1QUKthDot+N2mEjCjt3p0X1EjJMKtjjcyWkyp5yNa8yDt5h4YQ6CsuqjIb6Gq/R
         cdriR//lwDwLVDHRvjmEwj1+5DEtWM4ioxi301HuwZVNmd2MEZ6qo3nhT5CGwQsjLyOv
         fb2v8+56O8LIrdZVL9/9hgIQI4jix423OdZ5CWMPPbdnvXgrwPBrXGOLhlfPQFLPZP8F
         lxegQZ+r7as7ImIpOEEcsrevG3l93Wk1IlIo85QauBzc7/3TpKRbfr5Hz13BV62jXg7V
         /lCzHXSFGwFjF9ZRV3s4cOmoMFpCuDXPNyEFbjblMardNzz3XvQdBOGV+rvSO3T66kIU
         XRgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592651; x=1793197451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=abISaULiRsqDdy56jiSPYUxDOSde6FWDJ/0vhfMVuQA=;
        b=TecT8GDyxSiHJmp8yysG2gKsiJXiGvpMjLckiZR2qevFkJzmgwDOW5937Ur0XT2PJi
         b85IXLec50NHKdokFaFuWaSSxijpnlIbOJLLcZ1VDxt1UJSban70MQ/nW492QQa+hJWV
         wtrmLZrVtoK3OfMdhFthVYb5jRG0puq7P78+0nyuUUv9Qio2tOAvxueaNwhnKSPPdolq
         XAGF0dfBlGCJNeNWQ8SKpA/IARRH5qvckd2p/FnkHgotasPKQ4PKi+YuaEyElydL8sLI
         u8JGHBpkCAaFXPeFuGc24fqcFSgp1mPyKPT8KIc7w4GOZ7g/PPLQ1q+JY0JSHw4canZu
         AE7A==
X-Forwarded-Encrypted: i=1; AKwUvBwmlZE5/QX+XQaOLDCuR3Xq6mLkqtB72KJxbtvpn4f0FktTX2yqp0P1GlLFSsTTHGRQaHnyR8mQvGYj@vger.kernel.org
X-Gm-Message-State: AFq9FYJGSaqPtkSIjIngjVBHl226TBJGO0k+PfSa0DjvESip0lFVDAZL
	BBjGmRMPBYgIzRYw7A3dt+nk0y9X64yz8kI0mQCqjSHNUrty8eokgEXr61bZpzSsENdggxjkhc8
	hw6KYZiYr5bYKYcGw8OzFzJTFsvnNug2c2Mt9sNsnyj7f9drxd3HAPYbIJlsJeMwuMZ+3mrzh
X-Gm-Gg: AYBFou12oYF5/jjGFaBTRp0drBbTppiFywDr9htvVsO39LOqKCuyLpUU9CQeqJjQQDt
	cskHLwyylkwFQNI/uzCmK2UxzNfXLLCFFLje5vx54zs32kDr94DwxxoGUUbwNYxE5m9cxQQrGCl
	8dvQntt1K34sROIskyZduOrKXWu83/FhyJsh4C0yJ7LXc+gIcdS+28S7OYag0muAXledEHdM0ty
	95B4N/mp2Lc29EtkOyZLKFxcTPrfj+jaoZhYbWE7/MCrkG+2tffh41u5sWO5K1bgE5ryaela/8y
	IynUjeB62jrQ5n75FpCDszJwoXT4qCDQocoIW4dTjpeaPudp6Izpz+UCs6S4Np03+pUoI+7oZkR
	e6H8C4nkCrg9M4DUpnlXieRR2ocGD
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882843137.26.1792592651306;
        Wed, 21 Oct 2026 07:24:11 -0700 (PDT)
X-Received: by 2002:a05:6102:3c82:b0:7c4:6246:6ed7 with SMTP id ada2fe7eead31-7cc926e0cc0mr882827137.26.1792592650774;
        Wed, 21 Oct 2026 07:24:10 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fb83ff0dsm103760055e9.7.2026.10.21.07.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:24:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:23:59 +0200
Subject: [PATCH v6 1/5] gpio: shared: factor out per-entry teardown helper
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
Message-Id: <20261021-gpio-shared-fwnode-lookup-v6-1-6af7d8eefd25@oss.qualcomm.com>
References: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
In-Reply-To: <20261021-gpio-shared-fwnode-lookup-v6-0-6af7d8eefd25@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2293;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tEMTba6j7OtG7ZvUjMGaZ+IWCP+KHeGpGKNY0A3P52U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2MsG5y2UNJTBlBqqyoLJP2yhTFZnAFAZ1/Yj9
 WAWUPBa+VeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatjLBgAKCRAFnS7L/zaE
 w7UdD/952bR21nlyJuf5dQAzdXPZyquoZ2HI9/zFQUmfKVwMNR9QmyxWpqmgfxpoE26sFczcbyR
 HWizCGYjdEnA1V/i2Fvdb8KCZQ/amEvTe4MQD7V5UiscoHIQdHcXD7ZhdhwrEgAkDtidZBX/KaN
 GwO9F4dthL0wpmRKe6+w8sTZYAAR8xAWBzXfH0OA58gHR2eHG0EnaspeAD3SWc6gmEueTvLkO7e
 pXkOVoKxdSRtx4xVpr65iHmyyMLAVAQBBNBrDxj7xyoX6LDFVLRrn18rBaZE09VpexKRG+3gFrS
 FrDv4nu2jHkdGds4hzEYKyZyan+uX12Tj8u08uiFuQKR9EgTxMvb/jfYtdRrA7QjX1USEnet73P
 vgeFX0yXdr/0gt8GlwsILsaaIjkqZq88uM0BJWQkrk2SizXgIdhYS6t2vnsP9dCuCdsvwH4dim5
 TSlO9tFGqOiYqkcxmKctdBv/+f7jPefD3WAIV/OtiiZL4YM8QlF81M+UCnXnPvM6WsCEai1TiHA
 Tiu7kiOngHZULeuyJnOq6rzKY6PopAhR2JLE9C//c//M9IxNWJ3SVzIByKLLFBBPqI0QpLQAKfa
 hF8Tc8fgedn4f5e1tOnw06haoLtR7FUsOCHB55NTx5SCyH9JKgJH98ww6CSgRpbj5LI48344wUV
 j5DuTuH7KEnKbcQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ZWEhn4tT3IffghYFhICz-bcqIG_M5SWr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX5qMCE4rnf5v0
 uZyVZsChRVvXdKmItnssEZXOpHs9MqRavcra5pz4RuX381Hn7O9u8YGkfKvfayM6RUixeYwSJ1L
 jxo79JqfXUAZMcEDE7OZPqsF8ET//G0=
X-Proofpoint-GUID: ZWEhn4tT3IffghYFhICz-bcqIG_M5SWr
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad8cb0c cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gXy2-9L5Abwvwq9I_uQA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX6VzFmdRbVESr
 kGoohgSdZYvKLEc0IFkTP7eb2LLmMr/QB4vJ+osMYDa4hS+e1BP3UVEbheF/c6OG4LybIIzlVPC
 w8MPYiZwOmrsixMjnDQ7WNx3CujdR3ckhgiLiHZHq9hOAgkpWGj96YrMZT71/wP759OgxuMJWXg
 v1viiyPGa2VAw/yUaMKSfLwtE2EfGYTMjvN37FnuA30J+wdDPOWh2GnY2cB2nR5ijcdE1XfdDSR
 qyMou5DbVG51aKusydWQz7GnBasjV5H22OKXAbK6UyC20OlTnt7p0rYkSoiM2m+YIyi6aX4KSCd
 s1QMtwFsiI1pGK6JMV0s1WAw7QUXYkJppJhQEfdCReqdTCaukX6DVi54nUqx8iu/D46O0msFoT6
 pORK+wFole6gIqPzBbxWRjLezzZeBm8UWeXI13XdqE1Hk7sX9ypoDBTQ/lzxeyTbLSti5jWqE/A
 m1TF9rzNZ0HsCQstqyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210057

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

