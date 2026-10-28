Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198692;
	b=1kCr+Nrm5v0k1JaBzSWV0XzLhZPsK6MXVkuB8qdXqW9Snv+isJzMG2qGT6KeRe42XNjP
	 H68p3VUB+MXsQBD4XGMPDnh1Oa0rPDeqqmUKPG+51iYMqPXDYe6eYmj/5OrlqWsKycsZG
	 eC9xeITzWMtfg0ZjqFHb8PKm6c8zvgRjfPCiM04S4Xz76aScB3PdsTqmFBQjcjTeVulb5
	 XGUNyGlwuEHXaE5+8PLbE0oqcqYJd+I5YxESvUtvGCOBM9RsmiAd5JYvM5JIBNWMcfU88
	 9R5Yh/pN5M01JBRaBivPmbwBydU8awBN1l6e3b9rsCz0BCsnZMZtsXMDaPDCbUo1sKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
	b=Ax8O4AimRZRFDji9bkCo+WdNCI9plcbwbjBxGRjPlmHOF3rfG20jzU2yKnN6NS4V4UXC
	 PB9YNA875yswHmmv+6Tg52gCJWMDSlh0PpppNasbjJ55QavOeiarXNRke48Jmq7WabrjV
	 hSyGGNyMz7IBFSZWUnyVaEBbPAwc+jB/Z94zl1xW7mmHvaOx0IjfRxcHvDmzNSwDMxWJl
	 m1mP94u3hDuTBFSHXvLLDYkOdqxZqh11hPK1CqQ5YDbjdEvDBiZvswr73i/WXEx17+Lut
	 7fbQYDONjel7YFAWWeg5OJP05LIQR6x3Q7UgdqtVw3M+5RKPFhFXSSoOK+8P69AScXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7552606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7552606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ME83Iq1S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Irrk7s0O
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe23j1538932
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=; b=ME83Iq1SZPJKQFjs
	pY23U1GAxnfRycuRqkTn+8/q+/+pPlwl96U6OXtQ4yHE+Us8CfdAhUfhupOx9NpW
	ExHwBzz6osq5lRUYI7kx+oQt7hSi994gE4WnfGk6fy8JCO8YJIhICN7by1lsx6W2
	4UJTBKfiaskGsvLz8xPqwrlCxlZEN313wS7mMcoSLiQ8Q7xTl0agpSWFkYeIItyg
	pRJLgW40k5RQvW+NAkaDQYChToiHHNX2o7cBzCCo6oVxT9b1H9VqWjaWXdxoBbJZ
	t0eyfd1TPtaQaov04zV9Ge9uc8eWx1FNPucps237Y/kY6nHHoRcL/+600UU+Klyd
	mXXvuw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7seux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 14:44:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c70349f65so24262976d6.3
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 07:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793198690; x=1793803490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=Irrk7s0O43cN5uVxr7GMDB1TmVfs5d42xWGWmlO+puEDYQ4mR2nKnK6meq+mRxDa+H
         PhPINEagHOQ8ToR/KzQvg8FRKJ416hRI/95jDYw9vGjCQxa5iALGnpDCsiRWpRA2iN6S
         6LVN8T8AfeYpPUTGTtQdL3017zZi5jQ04GUzk+6NGOXTYEH0s4vpZOvWBkyOvFRJ4mTX
         ByJATdcDiwF832HthDGbOhzkffNy96/DAo1QySDOMm3ErAGbCXRkON8hlstTS8AYU5ou
         8ENfVSRBCN0zLy5tKPMj4a6uaVm4V3YUicr1c0h2Hs43nEOgo5XP0xvehlXVUvEZblmB
         jjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793198690; x=1793803490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=331b+j9xLxw+jeFk3atAhhS2ETl4gL9Jv2XXMDL/JMc=;
        b=MnIkM2m3Q4LbPgVFUsaf3AszXjRzmd8YDvaoGueTP9OwkxgM6VCtuVn/YlVprDsBhI
         6TEcaOEgVzqehV8hTi5SMkZQ8e2hhHU2FUXAX8zPxCWCvFb8Dyflw+Bab1h3RbF+P+IF
         SMM5FYdJncXPA2+PM8xUjxBET3gsndPXr0qpxuYEGiSO4XQmKtC5ae/tiIvVeG9TZpZg
         jX6CiJFk8mv3hCS1elcrTiklMWx+qnMtd/x01z8Kju53fTIwhS/Orwky+8al++LDHLRG
         ZsC8oFqLIdhWNEIsQf0M5QxTXTFxQbLab0wYjtvDanj6Zl+qhFs9nLhaIJANRF8w3kUJ
         GuRg==
X-Forwarded-Encrypted: i=1; AKwUvByFHpCejesY0fNK89pqzTaMLZDphrFWInMsMc4XuCE/R11D5CGIgZkB8xsqca9mvPxwWjd1WdhEth2p@vger.kernel.org
X-Gm-Message-State: AFq9FYLGMn5sqmoxXdwq7lXJcWnkCd3ZgYAWVTdHQd0lNjBX/C/nWmPu
	rsm5mXPpexI3fBK0ft5ZitULm0HLG6ltK5nPiGv8Xtl9RXYZ9fGJw75BwuOjwTWliRizNHbPVKy
	Qa9DBUXzSszUUg7wL4dJJByBB2GZnt+tNJQH+EAzdj+sfjY31ONb8/e0s0yXHcRjC
X-Gm-Gg: AYBFou0DgFBP3UM04xtVXUZPFsmhnxrJtoQKGj+9y4wKfzwob+jO/fPiPuu0RaxBgk/
	aD645/0Um2vH8+lQwaozaOz7UNWzJZPcNgftiyKQGrgOmTyQh8Jga6cI/h+M9CveZmhMra/qo+B
	jNfcatDekWcZhPNe2zYEDfar4DScKfntibrzPk/mHlXWoP4d0WlSBRUyXFL9VP1JyC2HLJ37Uu3
	Px5ECSUPjaQwAkaGX1YuKYXMY6QzqUZGm0gc+ilt/qEqLtG9TfHScl9dEG6LILrjVxZj23TaYgr
	k97M7B7i/9ugbCzi929FmdyI5cPVZEBqF02rNc4S3vcHxE8z22ZhaxMh85s35U1wgWYEYgu2p0W
	LEZGmIN9eArP0nBRm+4c/gbMhS/m2E53jKiLGJDw3MbnEgFB9r+lgQKJC4z48cnOk8S/R78J+GB
	80wg==
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363984585a.68.1793198689868;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
X-Received: by 2002:a05:620a:26a1:b0:93e:c12c:fbc8 with SMTP id af79cd13be357-94408d361damr363980185a.68.1793198689301;
        Wed, 28 Oct 2026 07:44:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3705sm34436689f8f.45.2026.10.28.07.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:44:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:44:39 +0100
Subject: [PATCH v7 3/5] gpio: shared: unwind partial failures in
 gpiochip_setup_shared()
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
Message-Id: <20261028-gpio-shared-fwnode-lookup-v7-3-acb453b6fbd5@oss.qualcomm.com>
References: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
In-Reply-To: <20261028-gpio-shared-fwnode-lookup-v7-0-acb453b6fbd5@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2903;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YPpWiepHmt10IMBzkn/r5B4TQufGQN9PhXoJtFoPXFU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq4gpagBqL1CBEVbeJbb9EbwfKAPskFpgHc3fn1
 CdEpIoTJv2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauIKWgAKCRAFnS7L/zaE
 w0HgD/9mAnWUkPVyiu3djErWX+jIAxFSPUN92WPzgtOPD9qxvh8NSz0PYg4RX6SeqPMs04B0BoB
 K+HURvkXhE7bNk2MVNOBzqlkEc25PbAPqRAiH47/BedR9kCRiCAPRMSDTXVQMwIkcjqgeRJkp0K
 kWErMGx2Io5dPHHiIth5H5WmhKa1hQRJhXK72xRohd3fodZPQWHnlMlh+3+RceLgT1VfzVb4r1c
 VP0yWdbwpFdLuO8/0M+MP8LLZc+24BzBgd1InchcrDkcbaV28zuIN1t8yEp5MoE1rYTilcasBtU
 UikZauCch+lAkxTIau+c8JUAvUWw+n0NQ6IBA96/sZWdHzIY+Kcb9OyYa7aHMuGj8QcGuN4/eKg
 MA6tOoe4CkXCF+UVsq29rtxXo+zIEIfn8wEEKP2dhlSxqPV43idpNzSfNs6foRrT5yt178t+2jk
 6V0tVpz98IuCOqHg0KvvRoW5h9vr7ESCvqxakShrZA3WKzux8zZhXDZgM3vR83JvU+gm3DXrcSj
 IQSQOMEQH+rQBAJ3tGK1gtRNOtsDHhksxtpQZjgfHf3D8RtRTK/7rCIYgMFFGnu2gDkc+8gN4XE
 EW18koKCM67I+S7e/7r/o/WfKYPA5lsnY+dFx7PC7c+KGTYWQtdr10GjJQVtYDHrb28E3d14gda
 0f/bXnBxbky22/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae20a62 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=aEXDUd4ZCashyi2nXeEA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: dDlo57clgm2jLu8mOJI5F2-FyWZgPRhV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX/kpwwhEJBq0O
 7LpO8ddBLYeneN6eGpoZPgc31sehmtbKyD1kdKaZv2n306niPZ0/jwaZ26TMw4JqeaUI7rn5ZCb
 SATxJfkGiZcst/bske3hm3rF9WfTRQ0=
X-Proofpoint-ORIG-GUID: dDlo57clgm2jLu8mOJI5F2-FyWZgPRhV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1OCBTYWx0ZWRfX7jIwfYF/mf5U
 yLWyggcZIjy0LWpy+Qu+6rjqD5EkTn/TskVx4H4ao6XlTq75d2kl1HNQRt3AUeqj24XrPCOzHke
 Pw7ZwAktpVEOXTmlUCejrnijcs/qmlk/S3j5BIjOM72LISk3nUK0H/x3TbjDiZE1vS/hHD+NE+t
 k50fQkx/6g2g6TM7hkcD7TccyKldA6JXJVFR5RGU89YAImUikk2PtpciiCTMYJye4BApIXeNY3f
 cDCcqPcQ8NcftQQr/D7PwcmAq84nXhMv5XFGkJHHGJDBJwUaHMqoPuKz8icjkZFcL6y7yCTfXkz
 oNWJlJKxl3aOtmm7pgWXL4sy9ZZX4MdKm7uwIdGdpovrsd8StePpKZ2XyN8iWps9gbnjBVO9u0I
 F1zdU/eVyYFaqX0AdVDpQE8uw9FlW9UPXU6dlaOEWH8nNp9fIsA/yAHostG40JG/VOLPARVr6XA
 nPrHnI8WMhK8qPSRibg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280058

If gpio_shared_make_adev() fails for one of the references of a shared
GPIO entry, the auxiliary devices already registered for the preceding
references are never removed. Similarly, when setting up an entry fails,
the entries that were successfully set up before it keep their requested
descriptors and proxy devices, as the caller does not call
gpio_device_teardown_shared() when gpiochip_setup_shared() fails.

Make gpiochip_setup_shared() all-or-nothing. Have
gpio_shared_setup_entry() undo its own partial work: free the descriptor
and remove only the auxiliary devices of the references that precede the
failed one, so that no device is removed that was never registered. On
failure of an entry, tear down the previously completed entries in
reverse order using the same helper as the regular removal path.

Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 47b434db72f1ebd35ec36ebdb35f30809f4522f2..043d5daba7a73062151a089b3ee8ccdac726f221 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -589,13 +589,25 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 			 ref->con_id ?: "(none)");
 
 		ret = gpio_shared_make_adev(gdev, entry, ref);
-		if (ret) {
-			gpiod_free_commit(desc);
-			return ret;
-		}
+		if (ret)
+			goto err_out;
 	}
 
 	return 0;
+
+err_out:
+	gpiod_free_commit(desc);
+	list_for_each_entry_continue_reverse(ref, &entry->refs, list)
+		gpio_shared_remove_adev(&ref->adev);
+
+	return ret;
+}
+
+static bool gpio_shared_entry_needs_setup(struct gpio_device *gdev,
+					  struct gpio_shared_entry *entry)
+{
+	return device_match_fwnode(&gdev->dev, entry->fwnode) &&
+	       list_count_nodes(&entry->refs) > 1;
 }
 
 int gpiochip_setup_shared(struct gpio_chip *gc)
@@ -624,18 +636,23 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 	 * exposing shared pins. Find them and create the proxy devices.
 	 */
 	list_for_each_entry(entry, &gpio_shared_list, list) {
-		if (!device_match_fwnode(&gdev->dev, entry->fwnode))
-			continue;
-
-		if (list_count_nodes(&entry->refs) <= 1)
+		if (!gpio_shared_entry_needs_setup(gdev, entry))
 			continue;
 
 		ret = gpio_shared_setup_entry(gc, entry);
 		if (ret)
-			return ret;
+			goto err_unwind;
 	}
 
 	return 0;
+
+err_unwind:
+	list_for_each_entry_continue_reverse(entry, &gpio_shared_list, list) {
+		if (gpio_shared_entry_needs_setup(gdev, entry))
+			gpio_shared_teardown_entry(gdev, entry);
+	}
+
+	return ret;
 }
 
 void gpio_device_teardown_shared(struct gpio_device *gdev)

-- 
2.47.3

