Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302979;
	b=fBmnkxUCU8fq7l4+9uXWlwe6/FOY1Svj0FQZBhW5xUg4k3nxrNzywOM3mmSrzoU3MKRk
	 6YwMysZGnH9iSGYbIx3WqDRSni20H1OU2chbasYubmP6M92oVR23WUUsmK8D4T7qVv7DR
	 9LBnENWH0bjCz1jFJCctonwQomDYcTDE6o92D4F5N2NerxnjMFlbySQoK55SPwjx1yTcH
	 0835P0bF6Iq8WUFCcUMtwybgdVSqhwDB1MRtVJ9DGQqeqMl4ALpaoQE6Sq1lDyMY6btv7
	 pFdybozksFj6IwHnvboM09v1RjRUYAMDyMp53XFocgu8N0tSRbzcr/OT8LjWdP2f67g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
	b=vdjzv/e43/lXfVzqM5+TvTdazsBOlHQu9kM5SLvn0SmmLkIXEBqD4rwXHJdDY1e7W36b
	 TMvkN1MIQEab/20uqlTYfSvjK+6zqPzz6Lpo2TaibexrveTbMyIdFeYnHQSLWFTY8FdXk
	 H9LPFToY4jWU9kOnMAtrTp/rBXKWcxbRXFA5BOefzaUFL4Op8ePV0nOodey493iRqsvpf
	 dxypZrbPY+thyVlyjVxWPRoX6hUGN9rBB7inM12tlLLHDi1XN07vMR1HhW65LyEk0phYh
	 MVHuCZ2vlUMHwIR1gVb3DxiARK74aXmJSOYkNgbGVrw45rFnVyVGx3W4Ai/YT+Lg3JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eELcwMWz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="akKAedr/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E44C606C651
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E44C606C651
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eELcwMWz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akKAedr/
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lAv22433946
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yscYkUexLWJfxvh+W/7HnX
	ySz2cjzUF/oCyCwV+MFns=; b=eELcwMWzeM+to2VgT1HQOigHgksKzMfnZN9Qhu
	CKvy254934GdSSfVJtwuEDgbwsfvmHwLK4b5ESZKMbcgJoMCp9T1Eacwz9ADFOYb
	tCLw484LbXB32XlcFmytva3xKYxDu+nfti4+r2vKSNr8Dpaue5W9tJJx3b8x+mZg
	5TLRh8BQxZLhaA8MoN20/T32bsY/kkiIqZztay9aHjNAbfqSM3bYRpmUBPzLvmmz
	3KFc9ZZN6EjA5gxtjt9lk1wmCYHHMEF3Hcq94+KqxMSNjwkm3u3Yp2We4sxJ9Wl6
	5q9a0nosvrDgFCcKQEiuifmJvMsWqA/8Q8cDNI2Fz4DnB4pg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hux848mvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:29:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so340339285a.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302977; x=1794907777; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
        b=akKAedr/rjcEFJfGCjQuWjKGQTPyAfCzzsGjXUiOGHsoGZT8y3EC3k6kMmvnbVYD5a
         q4K3RzhcrohhTz04liQAVgq9YoijGKYBwvj8wu/Sl/I0EYCNAvYPJO1pQ1Xa/M+Ltw6e
         l19t7dSjfZX4f/vil8jOJDgUsfR3v2XBlV41v8S15uGGuBzFB5U+M1C+/a00Oqraj0SO
         FxZOc7Vz7hSPsIaQvy1k40p4l6jikg3Vp87blMXiYo797d7He7uAwkEhm+r+Myeyjg4N
         iH2lXdrSkx4xgd4vRg9SkXINSWiiNTW8hK/YymxK+R9yHJln9RN7Hs81JWK8TxCEqiFH
         /A9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302977; x=1794907777;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yscYkUexLWJfxvh+W/7HnXySz2cjzUF/oCyCwV+MFns=;
        b=jMT651I+ldyjq80tyZxp4K3BM7RmKttuczmxBMYM7eNH1qHThRt8Qq5zAjl2h2VtB/
         E1R7zxVg88IrmABrkXYdXTbLK0HhCw5ILtMJEb4ONM+ul6wjAnXpzEFep6EaVrYIfXPo
         Vh7VNRd45t22oF+O59YmRCaf1mmwZ1SZPRBUFaWnoF8zHqz66ta0hk8subD66vfKWk0e
         TseQsnL+eT9KhKpdXJo8L08NFMeNdYPg04lVboPRUWWeARx0V15Dc69rUeJwt8mwAcNT
         p9EBQKCwjETvG/oGgdpY+5Y5QmJQaM46TfafKtZHP+Xa8mV1opMcC8+mOuaPTquAJk3e
         XnmA==
X-Gm-Message-State: APuU4Z9kFSUsZLiPETiq4KVAJArItxEGP0n+hCGFW8a7yrUcIBeECyqx
	TXnJ+4d331w/V9XDxQe5z/yMxWv481NS4OETEPjf5lbJB6JJLFeeTfCfGziKF1ZC+Ifwst1bZ9k
	ESya4/HJ0sUU5pUSkFsMAx6V8mKk1F4AxMy0g7SYAMabjQ2DIww9wqaEpM/SekzVn0PaGpE2c
X-Gm-Gg: AYBFou0U+0g7OJTdPk4W6PpF/B5ZfEhgvgBGgaHVQme02t5qFr5Vy/IOB5akUnl5XR9
	TD86udlTk5kHjZli0PIFcW6ecujotn/ABwxMc8I4+aIg8hgAJBojnxuTF2xoK3dIE9lja7roW0l
	MBloE8/ggrGzGNRwagX6gpmHXsXPMhu7RN76tmJcvsr++LJ0s77BKfJgbviurxs1y3w71zgjQxs
	MqFg9JZTRaD1PPoI1b0cMiE20t7R/Oug+XrzLcei8G1UkafNG5PneRTvjz+zAymJsQhe88aSF4F
	l2uW/NKNjaYZBp3yDsZvmcLQPSOmuyg5DuEvvw3Vs4kpXSm+phTLlvEnkLxuLlISWAXS6gmFWD1
	r5ARM9KSUYqws5RQgVE938F5bgvH+oGKddKmcheXpvlsQcr4ct3h0xZN5PivQN2o0GZcTO/YjHb
	2lLb1LJuNE7WMJB8OMmNh6oAZ+5YP81EuRmFEW8OGQwPKgGngT09HTlCU69zifayo=
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr320113785a.82.1794302977570;
        Tue, 10 Nov 2026 01:29:37 -0800 (PST)
X-Received: by 2002:a05:620a:c4d:b0:93e:c12c:4416 with SMTP id af79cd13be357-9479f42082dmr320111685a.82.1794302977112;
        Tue, 10 Nov 2026 01:29:37 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c05dsm3891597f8f.25.2026.11.10.01.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:29:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 10:29:34 +0100
Subject: [PATCH v2] gpiolib: keep the line state workqueue alive until
 device release
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
Message-Id: <20261110-gpio-line-state-wq-uaf-v2-1-ce6d8266656e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAP3j8moC/4WNSwqDQBBEryK9Tosz/qKr3CO4GLTVBnV0Wk2Ce
 PdMvEA2Ba+gXh0g5JgEyuAARzsL28mDvgVQ92bqCLnxDDrSmVJRgd3MFgeeCGU1K+Frwc20SHm
 cxFmaFsXdgB/Pjlp+X+Jn5blnWa37XD+7+rV/lbtChZqUzmoTJzpvHlYkXDYz1HYcQx9Qnef5B
 WR0QKzDAAAA
X-Change-ID: 20261109-gpio-line-state-wq-uaf-e7343655998a
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MWVJTIMmNEMqwOuajXFKHuQmIYtJhpU72NPWNNIzx9Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8uP/58d7genk90ttA0p2qWwt+OyBxzCbbUeKx
 4/FYeBXtVWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavLj/wAKCRAFnS7L/zaE
 w9PeD/4nw6H/XdZcD/cO0ilbNcICZxhjkddWj6elKnd1HRfMiqfgxE65SQ8TC9l5reJ8tSb61tj
 4u7LMifQgWIAx/ZgSVYkdiK1NyJe7Dui3/8yi8KUUrdSqg12/QfCHHvYpyyeUWCe6ZY+6tSe+Cp
 Hnv/YxEGfB7eGteTMBtucb8OPHgT2HomJQegxIfPlC/ZYO/E/1+jAFkFqM8xskJ5XonhYTr9TI8
 WP2QqZEo1RL4RbTNrO/XAZRk3n/sCaGTJ55FFQyDkH8R1n0D1QaeyMe0/PcBqCaHJJkZj9g80p5
 MsaoRoJU+eMM8TL3tPCIyrkbJMjXpa+N+/VES/a1i4gQrgjbN2pgw9c2RA68i4Q61s4YxRlbdof
 B3L87vHuSdQpHdVqICsFbdfUNaHBghHaqots9gCEfPsla8+HR1knKJr9AUoedZZnGOTwnZurn/b
 Z+l1/0Sf40EfDNLCDNvuUn9CUjnB5wmyGx8ZwiudyncbPQb0rHyYaMv0bkWBkR4H42u6ysc9/ld
 aXacVSAjKlkF/29nyF9yLC63qYhOjIFvWtQn2cGBTObsLcuMFoynYst2g7LVD7AYiDAMmfpEs5d
 YpbRafuRxOvuMzCGq/FBhqdZLpEOuGfMCRqNDl+Ruv+0ni4MwpbmEiZfotBts+BswjNeS6uweK3
 1ljRGfS4TEa3gZw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXzDH2w1RpPkty
 P+JjYUjRfz1Smgka310Ln0Slz+rUI5eESXtrNfrgYuXzrdTBmW9AX0ixHmNY4eVNZbyC+vgRAUO
 DOcGD5imyR/DhJuCApsusqu0D4z5nb1cs5y/g+TxyYPM0lQvrdSxICHrocmCjvpYcHobIcG7F77
 YXnvMoCs3LODczcN1FmDjsOqaOay8/z5Bus+K6oX+yyM56kDc5KjOszeyU3YUj4fMgU+hmyO4sg
 +0wzvSlM/54ymWcJ+cowUhTklj3UHdx2gF6izTIyD42b49hOkPEg/XydebOngmKE0ysw9ftq71w
 CuwPXmQ7vHI6taA5QFBCEybugrOpBEHdPqK0Riso07G5UDL8r86Udv0ccVyqjoMWnK7AC6bQ7el
 0nc0otzeEn+gHku11ctOCIuSAudrwN0/QfX68KLE2ljDO6Od2ppxVZakKsyh0WuKY7lQK6qhwcL
 MtOeNPDw7YB414/lB6A==
X-Proofpoint-GUID: 62oIbfl3agfS5oFuWkjE1hSy92Me9He7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXxEc03n6K/hiR
 D458my+aVozDkbhNHiqBtsz6ugJpcYXDegRNmSRdR7VquKoksep4pI5l5bPGxwKxXAwp/9iov/P
 q9IqeRt1d2FS5qULC9gxA0QJLSfqHgI=
X-Proofpoint-ORIG-GUID: 62oIbfl3agfS5oFuWkjE1hSy92Me9He7
X-Authority-Analysis: v=2.4 cv=JNSuIMKb c=1 sm=1 tr=0 ts=6af2e402 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KQQni2JmCJhbBse-3uIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100037

gpiod_line_state_notify() races with a concurrent gpiochip_remove() which
unconditionally destroys the line state workqueue causing
a use-after-free situation where queue_work() can schedule a work on a
freed workqueue.

Keep the line state workqueue alive until GPIO device release.

Cc: stable@vger.kernel.org
Fixes: 07c61d4da43f ("gpiolib: notify user-space about in-kernel line state changes")
Closes: https://sashiko.dev/#/bug/linux-d0e9e518-2348-4fe3-857d-f3d61a42f159
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Clear the workqueue pointer on cdev_device_add() failure in
  gpiolib_cdev_register() (sashiko)
- Link to v1: https://patch.msgid.link/20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com
---
 drivers/gpio/gpiolib-cdev.c | 2 +-
 drivers/gpio/gpiolib.c      | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..2a27ff7ff4f8247d87284e5d6419ada26d86abdc 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2758,6 +2758,7 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 	ret = cdev_device_add(&gdev->chrdev, &gdev->dev);
 	if (ret) {
 		destroy_workqueue(gdev->line_state_wq);
+		gdev->line_state_wq = NULL;
 		return ret;
 	}
 
@@ -2768,7 +2769,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 
 void gpiolib_cdev_unregister(struct gpio_device *gdev)
 {
-	destroy_workqueue(gdev->line_state_wq);
 	cdev_device_del(&gdev->chrdev, &gdev->dev);
 	blocking_notifier_call_chain(&gdev->device_notifier, 0, NULL);
 }
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..c954c7eec2bee3a8dd55b949ec9b92f31461b25d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -28,6 +28,7 @@
 #include <linux/srcu.h>
 #include <linux/string.h>
 #include <linux/string_choices.h>
+#include <linux/workqueue.h>
 
 #include <linux/gpio.h>
 #include <linux/gpio/driver.h>
@@ -898,6 +899,9 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	if (gdev->line_state_wq)
+		destroy_workqueue(gdev->line_state_wq);
+
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261109-gpio-line-state-wq-uaf-e7343655998a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

