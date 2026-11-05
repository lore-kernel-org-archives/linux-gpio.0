Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890086;
	b=NGeTTnw/9o/ZScYzaYgO2eMJ3xEWi2gV8wSO8Rg2WBF5o1+Nyu75BxX8MddCvK+3s/ww
	 lCiKWGZDhMYI8jfQWC3q8XW60XlTxWsnc5se4JImwmdJzR+NnlLI+bcuDmOkXb3ipJ2J7
	 s0ADfursjiYQ8UwrG89aRyUJ15TpNDUWCSEK+wBPD0vTGi4hGyDCbLGhFoH+7b2LiJY7C
	 6HUTbPdHWAe023py6YU8EZFdCaMK5txrA5meCt223qr3kn9npm75L1u/kakQr6LeZYRFj
	 J0aWNaqYt04PO6MjqJ/QmIk2jU9mz5FwgrpPn9lcRYz9PTqL1c+X1qPbD9ytbGhoS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
	b=BqTk/g2HMyA3wXgSbly7zVI7y405cHUpT6nusIuMjKgJkJaJ9OVT3tVHMDvQ5TAl/8Hv
	 Pz7ZVI2stturdLYQhn/LW8NP8igeADx8ExXDcwbfh4AHoC4Dv6UsZLvLUHbGNz2tN5hVo
	 WMrubDfDucWczQsKw328LSjFB2dtEXoO4IxZctw7hqKNMAg3/NcqKTja7FjCxDcryncov
	 q3tjZCyZTwlac47pR3ECsahxMNIbkI7vycq1bMstJ738/FGCMxbEwZQq343EggMAMBLku
	 sltONKeuPcBnZIBVplStl+2aXlZwCh4XPCLFVPOMoGUwrw/Erp6ITVUasjLKnBEp+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JsILPRvH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6TL+4hD;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00AD606A331
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 14:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E00AD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JsILPRvH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6TL+4hD
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQIn91631006
	for <linux-gpio@vger.kernel.org>; Thu, 5 Nov 2026 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XIUlQahuIgT2dggn3IBdwy
	TP4HkjjzBGnBjYhez4rP8=; b=JsILPRvHRooQS58yuPGOPxACkZkYcLhyFiCVWD
	F4ObpXr7YhxFiQUvFN0A7FBjVK/7O+NdIK2oytFZOEWTRlBOingOqx5lzH6mSM2P
	zuvFdgrj0Qd9FYLd2QLFauV0dq9WaGsELwZP7xXVjOvEyHBuI3AAFa/RwIwmtD1m
	V/mlzEjoAN05AtAXao64Z6jSWtCiFq8hv5XbfkgrWObCCp/EP26ule0LMbS/ZJKu
	2bPuwPkJvBeZwk1zResonU01ko1QIbQQtpLtg73McEdfbERd24pW0ad3mLc8Hsve
	0hJsIkXY0Etx/0SONzTaKt7VyAl1ckueoMtZMO4kluBaAeWw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaqabbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 14:48:04 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99859876e19so411188241.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 06:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793890084; x=1794494884; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
        b=Z6TL+4hDHS6qZz9Lqj1b5CU/aBVNX72hcDC4TSOcVCbOXfpBF3jcCfvBRtnLcRs6A6
         Sryty5mQNjZ3rE6IlKw70GhXrM/aBa5IYWKmSitqnNOqez6vtR6FbtFexssFTguO8m0Q
         OxboO6ff7rTS3tSim/I/lwcT04codb4JKY6f492260MO6vU4hVwp+rHTDqyH/YVJksYW
         er4PnnoqsGcQfxcocEX5XQfcWhpuH7cmqqj6atSTmZHd4UaaGgb15WU3QRAbgzV5o2qj
         bz8+h3RdYgYKnsA1z8N/muaP2+28MwzPCD6QOcGxG6+utW51vH9c6kemviTKl7JLT9st
         MU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890084; x=1794494884;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XIUlQahuIgT2dggn3IBdwyTP4HkjjzBGnBjYhez4rP8=;
        b=nK2kDKfKTfrg72QhVWR7cAVJyqZdHMAeJ4SI4ppBIoZyYhvgZHVtt9f2bJBuCpy5Lh
         FGo57Qr4V79cbaw/NLwN+62m8aC/cxlx7MYM/Cq4bFVX0pipOMhD5MgWTUKt47tzvTvB
         O83OqTsjqWF7KP9nowRnHyndXl7iWp/JJN9LzyYK2AcePXbPB4CfTMuxCUbgpI72SSbJ
         tbOEqiYbAoSeEnjdRC9MnUTEYRT6pKjeXHrjWg9paUWLq1mCdn2IsQYG/5NrLKsN5tn3
         feBwsCsNnBcASOV7dmHX5X8DFHbj2RkwN0oTMgGE63wYtWp6V1G+KcEo5yF2VQEpHD7J
         fp3g==
X-Gm-Message-State: APuU4Z/AddHG5Iif7rNTzZsOL4GCydCVso8FZp+7T1uEZcfNjZUaLma8
	8eFurEFW0O+2NWwI7O8Ghl15kGiro81axGJsxxJ9BLw5RuK1/sY9yT4mtnWM9G8D70uEJ/6mtip
	pJ+EEeIdbqkSzYQId4d7UaziYuRArEDeWh41P5v3KyzVJVeaynuII4hvTmNm4kR6E
X-Gm-Gg: AYBFou2gSdT+9pHmM0bHbeLhGk1YITvWwr+tZVf1Ul9ntPiutCnNkG0WqXF/hW/zq6y
	q1VayDrC/m2s3RqB0z9q2LFx+OQLp2UY74VFsl3dtQ3rJPCDoWX2cE8uI371ytre5AUBbFmUx9B
	QqglU9NkgbE7jbYDtABpGyjPb0rABuPavZt9g0LwbfFT3ClOs53eRW4oYCT4vd33Se2Njn2AkBH
	KYZg6XyIxRl6Gj0OxbLa4XA+d+miRW0DLYKuZW4+KePPJAJBVt/BoHeoGZBDFxNQUuotAJoFFWi
	cOH7rBkzOW7OO+nhS41hn95A+Orw3l+fXxWBufY7OFAD38yDfuhlOVLijmHSTy95DrxUtQ+ydpa
	SzoFcU9Xp68xW8W5EveYWlJpjXSMc+CprXrR/MH+MwQMFGHk/slaE91PiVp+bddFHa+c9Irne9z
	ah0g==
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr9621660137.2.1793890083812;
        Thu, 05 Nov 2026 06:48:03 -0800 (PST)
X-Received: by 2002:a05:6102:148c:b0:7c3:9464:efaa with SMTP id ada2fe7eead31-7d07223f482mr9621639137.2.1793890083224;
        Thu, 05 Nov 2026 06:48:03 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm11205756f8f.51.2026.11.05.06.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:48:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 15:47:59 +0100
Subject: [PATCH] gpio: cdev: fix waitqueue deadlock on chip deregistration
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
Message-Id: <20261105-gpio-cdev-srcu-deadlock-v1-1-6047117030ec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB6X7GoC/x3MQQqAIBBA0avErBvIQo2uEi1MpxqKDCUJwrsnL
 d/i/xciBaYIQ/VCoMSR/Vkg6grsZs6VkF0xtE2rhGgkrhd7tI4SxmBvdGTc4e2OotN67pVU2nR
 Q6ivQws9/HqecP/43eSBpAAAA
X-Change-ID: 20261105-gpio-cdev-srcu-deadlock-1377b86567a3
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Paul E. McKenney" <paulmck@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4206;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0fakC9EMET3jBy7No5GpBIe7f4Pl8vI+qRAGeN01JLY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7Jcg4Ok5sTBKUiSlkopmH63APNkd7sU4H2G05
 r5sbOkZND2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyXIAAKCRAFnS7L/zaE
 wy2UD/9FHgbARHQ555S5Rr5I1dbXyvIKKT+zVKpJ7wNIonEzr6i++NbZ0YUJ837PVwjFoSG9uII
 7tu80ivanzao805uILT/PysobDqX8UOMU2G8mUfkyyeDK3/pvxdIkAet70CkdMSQB8RO1aASKBi
 MTBg4LjR1zW+WAVzwC536rRo/r2wUMqkbzuSDLDtZccYUfh6wWD8TO9nl5XngqKiHWe3I4rbupY
 DdS06OZJ3ra1zBSvju9XpSBuWd2U6UjdwninFhtmEmL9QTaUQ5rMmh5t1fSiIJmFTbQ57SEpEft
 WZF9w/wNrv3wF1co2ehbAUgGjMsNcstFHNuTaK2WQN1BqboaRTgr3rOXmW423HkKQIrWTJj7BBZ
 zIyI/Q2rNHC3Yc/whT6ctfdBKxKwyhNlYhKt9euSNgrOdCDQsffJFtFxXMo+uOu9wO+J6EH4icu
 ++Vy3PNQHucmoxu7lyuumsAuEh7TMWnE660d6of49eh7polmB+fYgFQkp4leB58hZNu7rgjFJf/
 c+LmlfrCeHWdH0OdWhrfXYonoWcWiA9ZJ+bngT5W2MdUGQv86VB+fXYWgF5waMDcGtyjL/9rb9z
 9EbhWJ5P40NIPKwakCAnAeKuxJo4UvtPzEcA1pGFKHXY/0HyE+/JxLnqpzvxzHr0sWlMmD2Rn2y
 qX51I0+4zZiINkQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: z5QEZzM0yimCKqEESZx7ZQ3_GBp6nEpD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1OCBTYWx0ZWRfX+E6+sRAkFmah
 B9clY/owj+97Ly0R+4dxxqrVa4BnRNHb0DD4b+UFx2WsWUNC44LNfkZLE39Lm6QKnomn1/4GRr/
 lkJoTYvT22XSW0rF78lkOkDSqo3ZE1g=
X-Proofpoint-ORIG-GUID: z5QEZzM0yimCKqEESZx7ZQ3_GBp6nEpD
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec9724 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TEQn8LnYDw7bCQWhkO8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1OCBTYWx0ZWRfX0ws+iftCCOq4
 36wuaRCa39wwOu+pUifsaJ4bHL/8YyJKwaaZwXdOFl6UhfbonRQQZutdv02qJhc4NjT0SPvrd0H
 D+e0Rfqi5w4+VnFIZSqIV9t48d2ADODkAClkZAf8cp+bW7Pj2ZLsPqqVwB6oTKfhxeIfIgPuvdi
 IIf0zP3z9dXD8Q//QZb9/SRZomglNdSeTdPOaA7wqsLCLZ4YVOF1g8rlfWESt3vwSmg3nLfC82t
 rv6AzPPt8+qPGQznAxsSeThrYwGnaQYE3kLn74+Z/tQbQnQb5q2V1FTHAdfwYc8mY+5xwZoJg1g
 d54JQYT08KIPeVR3Gu+igL/ZaMaAsbThq2zq0gfQKWVmK6DIuSBHRBNAGlFlfDfQ5RB9xVNbOHU
 ZQs5y2jQ1X0hRnkfHZCkSvTRVUk2rgsV42hcO05DkrEhsZcMN27gWEsnvtzeGMQgoDwZonB24YX
 EXvJFD1sDuFzrmF0LeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050058

The three calls to wait_event_interruptible_locked() sleep while holding
gdev->srcu. In gpiochip_remove(), synchronize_srcu() runs before
gcdev_unregister(). The latter fires the waitqueue wakeup events from
the notifier callbacks, so a reader blocked on an empty FIFO never leaves
its SRCU section and the removal will block forever in the former.

Since rcu_access_pointer() is a plain READ_ONCE(), we don't really need
to take the SRCU read lock. We don't access the chip structure after
checking it. Remove the lock and instead make the waitqueue aware of the
possible chip deregistration. Keep the initial gdev->chip checks as
removing them may change the error codes visible to user-space, for
instance in cases of a non-blocking read on an empty fifo.

Ideally, we'd factor out the common code into a dedicated helper but
there doesn't seem to exist a clean way of passing a kfifo as argument
so let's open-code the three call sites.

Cc: stable@vger.kernel.org
Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
I've had it on my TODO list for a while. I vaguely remember someone
reporting it to me but can't find the reference anymore. Please feel
free to add a Reported-by: and Closes:.

Paul: I've Cc'ed you as you may want to take a look at my SRCU logic
here.
---
 drivers/gpio/gpiolib-cdev.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..62215d43b8ac757bbd5344bbcf8631feb2443a6b 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -1489,8 +1489,6 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 
-	guard(srcu)(&lr->gdev->srcu);
-
 	if (!rcu_access_pointer(lr->gdev->chip))
 		return -ENODEV;
 
@@ -1507,9 +1505,14 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(lr->wait,
-						!kfifo_is_empty(&lr->events));
+						!kfifo_is_empty(&lr->events) ||
+						!rcu_access_pointer(lr->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&lr->events))
+					return -ENODEV;
 			}
 
 			if (kfifo_out(&lr->events, &le, 1) != 1) {
@@ -1801,8 +1804,6 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t ge_size;
 	int ret;
 
-	guard(srcu)(&le->gdev->srcu);
-
 	if (!rcu_access_pointer(le->gdev->chip))
 		return -ENODEV;
 
@@ -1832,9 +1833,14 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(le->wait,
-						!kfifo_is_empty(&le->events));
+						!kfifo_is_empty(&le->events) ||
+						!rcu_access_pointer(le->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&le->events))
+					return -ENODEV;
 			}
 
 			if (kfifo_out(&le->events, &ge, 1) != 1) {
@@ -2579,8 +2585,6 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	int ret;
 	size_t event_size;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
 	if (!rcu_access_pointer(cdev->gdev->chip))
 		return -ENODEV;
 
@@ -2600,9 +2604,14 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 					return -EAGAIN;
 
 				ret = wait_event_interruptible_locked(cdev->wait,
-						!kfifo_is_empty(&cdev->events));
+						!kfifo_is_empty(&cdev->events) ||
+						!rcu_access_pointer(cdev->gdev->chip));
 				if (ret)
 					return ret;
+
+				/* Woken up by chip removal. */
+				if (kfifo_is_empty(&cdev->events))
+					return -ENODEV;
 			}
 #ifdef CONFIG_GPIO_CDEV_V1
 			/* must be after kfifo check so watch_abi_version is set */

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpio-cdev-srcu-deadlock-1377b86567a3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

