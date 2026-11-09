Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234282;
	b=xtIcTpz7ogdvszBhVOyo8K5XZ6BD2DD0lqfia5rWz6EsMi7ifkl27cymVgtZSp64kOeu
	 CZIGGnztFU3W9/wLunsk49mPmtPOpCF+Tz8kN2NGBwQEGzFp1lro7+4uwX9nKrg4VsZYH
	 445Ze8vMBS2+lSST3ZQOvCeNXJ2H2FdPPZh0V8HtmbSs1xFPkxDwjvKjwD8GX2GVgZhZv
	 rDHNhMiC8Qb0edolNAXi0dF/APHYjN9vcBAgWyjLQ0+k37HhrcUNEOzlLZfTduYdlRe0z
	 Gv/PiRb/NwogUEHNwu75dC42DdHdbZC44fKAcxXBAZvZBQHRmXKW/BMlwIzAjHlrdKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
	b=wnliA2XyBHrXit+psvVKigjnqlkGfYtZ2ciWdFKrM7JfFJ0Gjcalh8kZLGibGxCRfLUW
	 q4X0HP3A3P9GESqToQZHYmKDxd/+0qOoOPGiqew1191rlQEzXXR/8IjfQOF+xyCbH7gVh
	 ltwEl1El9r7DsSMCGAZk06wjQd9azR7yL78l/KP9B9yhGncOAkamXlou5/SYZoEdWNBK2
	 UdWxU6AqCumZqhiWSsAcT50KoelXwmFxtR86yEBzhqecoMMnbURvDL4dm5c2VCO7jOUeS
	 1GyrAIBOVNzpnGcxyXRSOzAqY7jSSR0oGO0BJHUORZCl71F1KYqwrd3jrfjtjg71Obg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAtYvwPD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2NvHccn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC378606A33E
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 14:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC378606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OAtYvwPD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N2NvHccn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFBsm022887
	for <linux-gpio@vger.kernel.org>; Mon, 9 Nov 2026 14:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=in564Rx+eAadjErat7Dyhq
	NNJgi4ng8yNv6SQYm0xaA=; b=OAtYvwPD3T2zavexsMocHb9hbVcZQFG8+jTdPk
	siYFN50E4u1YkefYYejloooXfwj22UKWSiUDk8o7csVsqMilfda0gWCYbJIWntjG
	CroKpY9/u3SG4l5DLlEP1BhAE/XLEyOBH1XgvleDutwAEmDYhwgJ8TsoXN25hDd8
	6rgGcqCAiNyLVEgPzJhNVe6sI1O1E+nsBo2rzX1mZAt4UT9IOJbbXrpstiWpSrYA
	IKNxYIQtWVPrzmz/RStjLtGJIrVbxMtizZ7qTu5KpYvVKJdVS+zjeog926AmXdBe
	0pGQ8KNCnst+yJGeZEbwwkFyu5toYFuAmh9KSwsbAdKzr9Jw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgq28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 14:24:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2e2cd9c85so737145137.0
        for <linux-gpio@vger.kernel.org>; Mon, 09 Nov 2026 06:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794234280; x=1794839080; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
        b=N2NvHccnoKkr9uITp3DLRUoNF0pcM69WKvJbjgjfCvx/HmaswlVk3qjsZGQa3lywfz
         iYad+m9nojtGCJWKfswUyFxVVFW3BKgfkLUFy/FiCI68G7Z71dJ9s2c1wtEgucaNXOoR
         KRP6daqisWNKtZi6eN6ycDh4LnyDcWDhwGg6C7fDd89x9GMQ4/6Skx8TSxoFydSMjnB5
         EHbBZHHYtbYscga714DrsCnuX+o0oM3MzUumSK1na+DZEM/FeYr8fUb6fGZir9E6LLIh
         CqgQ65NhhxkeTBIvzyD2kmm3GT/L7rj2XzbJja6A3ZYqEQJlKKyFKtcUsE+Nv0BK4B/S
         I+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234280; x=1794839080;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=in564Rx+eAadjErat7DyhqNNJgi4ng8yNv6SQYm0xaA=;
        b=ABrDfaeRW+gKE8mmjw6kOyioTQloobetyA7z82yF5tne/UlYxmCyIkTYnDPX5hodXY
         T1lj8w9oXNRaekaV1QF81akGG52ous8sM3eqcu7tIdXyYef6L10W7E4P82vqIiUBidN9
         9/BL9QJmA/XEt35OCUSt+ywUQi9Lorm5/wEZpVL9noISy20bXmjaMaUGfVmv7YxPcBcq
         Rc/j6wnZb1XitYjLuTT9zU0rx0Xhtbt3zvoIlIcs1BFgoW8/zSotOT29wZO0yy6Ypkef
         yRDwFc6ajdFi0fsaoWxbenzxfyuqyE5llQumCXr/E4kLLV5/eAvllZ0MUsemX6B8NQIY
         aEHw==
X-Gm-Message-State: APuU4Z9pB+mevmnOr54vFYQtCDoaAOQykMs/kDYXGztWcDm2eMicMZdl
	ZIJgep+RAC3B6qRipAX0ssZL322nQhrTfShZoCoyae04LphHoaqxywAeLtw/FMBgzuwbqzyrxUq
	ws7O1bqYxUPP7l5a5joSncN7+LofZmKY0TxMxPrGW9ke16n3lP2kPoIW/g9ynuduv
X-Gm-Gg: AYBFou0cL13CUxpmgzE2XLQeKIz771B1yMwmr0hq/kj905LSBN9cfkhujxKZH0Yqvml
	bNBxfOF32lSCb7oAlpyJNxUyRek0SZzjBiczVTPc9Bo4MzEBYDrCRJgc7dGN05sFZJ0sV9n9rTj
	lxR58RnH3QFfF3cam+6moKOFamagvmgZGCion11kbMIjY9N5kz7519N3gTp8eyonpHoMVOdY0Gx
	abI2bWiGvh1NX4a2bAM3a4QUjIFatwrLxuhsbtduHhvyl4peru3/7M3WWj8G+rVt0HBpLuAqa7X
	u53NTjbtgiPEUB0wwCVrPANRRqHbM6Lx5HrXRFbfXWxAlJ3Q5Cy0yTQD+59SRmg/8lpcx9wnFHK
	Y9dYCl+eH0ervU6leHT/e49IjcWnUV2JRY8eNg7p+n1Jppiw1cv31+q6WLVWlB5TrDyW8djuRRw
	AIwJxp+Yziv/AnzCYXpVPwxH6+gtpU5UHOBRzPLoEZG/tc1iXGA/X3+umVMXasWS8=
X-Received: by 2002:a05:6102:580e:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d2db169f6bmr1317761137.12.1794234280051;
        Mon, 09 Nov 2026 06:24:40 -0800 (PST)
X-Received: by 2002:a05:6102:580e:b0:7cc:2cef:b330 with SMTP id ada2fe7eead31-7d2db169f6bmr1317755137.12.1794234279695;
        Mon, 09 Nov 2026 06:24:39 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f994fcsm11571143f8f.25.2026.11.09.06.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:24:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 15:24:32 +0100
Subject: [PATCH] gpiolib: keep the line state workqueue alive until device
 release
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
Message-Id: <20261109-gpio-line-state-wq-uaf-v1-1-2e126ca3427d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ/X8WoC/x3MywqAIBBA0V+JWTegve1XooXUVANhpfaA8N+Tl
 mdx7wuOLJODNnnB0sWONxMh0wSGRZuZkMdoyERWSSkUzjtvuLIhdF57wvvAU09IdV7kVVkq1Wi
 I8W5p4ucfd30IHz3TBFloAAAA
X-Change-ID: 20261109-gpio-line-state-wq-uaf-e7343655998a
To: Bartosz Golaszewski <brgl@kernel.org>, Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hbuvUSfXK8YGaz4BAiKiIRwnx3gmzKOymFIb3TMJ1zY=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGrx16TIf30+qUn7EeOBS704nhXBl8JzIFD72Yj2pOXjQrkoE
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJq8dekAAoJEAWdLsv/NoTDpLMP/ReC
 zsfu5IwMEnlAfkQHPLeMs83dqdmnZq9F1eHZP0Wm45jmoI//22sr4oXS8hTt19rYaxzn4agwNRR
 VVPFtUVhQNQ81wipl/HEGA3va9FMoWJuKXYj57wEIVKv4zjgcJ56OM2ev7sVtdQ8H3GxrPyWnRe
 S6g5DYJalatcdNNCu0zZl0xPQ6GKja8vAB6n5QPpN6OuqsQX4qAJe21lOuWS/TSJuyImpvh0yNv
 JQo+mA7bAcUjG5WgvpNwIAJSH6HRsU8H0Sor3OlQT0iOtsh4D2pu9eEzjqrsTd6le7E28pWZ42c
 EqvQWr3HZ43EdkJY18gty1k87rwiQCTEZabwWfaVrUJiLyhYMzEf5PdGZBfmR6M2SQHyesE7yzh
 u5crovPRL+4Rp22EYRMopcJOoWujyIrxuhp0qcgR8osZMOhQH5uTae81wD/5aNZ9ZgIh/Z4rCGB
 BMY8BYvgdBVvZf/S8MTvz+2/DKzSRNBYqgdAuETOeUAVaD1fQnYGvkfQEhdB8ZdkQV9WhcpGqj5
 YaF698eYzozZ5bQFwLX+Ivv+T1nuzMzKfxI9YB4T0Fne8h+KeQMxydegUdUdtvHN7G08pwtZg2p
 liYpR0UDjdW8mghNlmxTm3m2YqW5vVzitpyEdtwwz7mYLJUYvoyYHIysvaidPa7sHJCZPjoY857
 ZV8Gs
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX85sGt6FrihEO
 QfV+MOXmt7hsQmzPHLqoXVp9F9HY/qUwU/xBCpbUy2cfOKIaVvzbLWD45h5U3g1lxY2o78LkoVX
 qe7neRZagNzkAhmvUVXGjwlyYg0ang4=
X-Proofpoint-GUID: lffZjIJkv6-opZ0QzU2U0rU6NPSNHcc9
X-Proofpoint-ORIG-GUID: lffZjIJkv6-opZ0QzU2U0rU6NPSNHcc9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1NyBTYWx0ZWRfX4UcFl3W+Yyeq
 aQqAgdPSVlAhVVrBEP0vrEevCzXWSqWCZD9YD5aETudEUi/qefucGW8AT3KFq1SR2eVJxtIDmst
 U06C4SHNeY/ybsYNX8n98Td6abKROZxE7hKgwVJL4LfxmmuusdpCkMTCZhO1VjL5NsuwrqpO1WC
 LXaASoHk15L54Lu/JjBg01sZ/k5SmnLabIPPPquVXJ0hYActeFqv0v724oT5Cqw8ZAeTZD7UPE2
 QtuMgKgrKqdJlXHs4m8frr8oMcSa6D6zphKEn8q3UhT6gHyQR2yISU9hckV6964pU84RhPBu/Qf
 R0WLaaT+lAO/OOvy7CQ2cQENz3QiG0s8ncpOsJUv+3Dh+VJ0yzUxzg+uUmtA0+GeYv92dhpQ5ws
 Dj+Em0hlZhHmqgsE6v3SQ35AH4fqJjmMITl8Iof/fjf/G+P0GTzhuOOFOr0ii8sdYN3wqmVl9Y6
 HDcT5+nxPOY7BDqZKbQ==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1d7a8 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KQQni2JmCJhbBse-3uIA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090057

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
 drivers/gpio/gpiolib-cdev.c | 1 -
 drivers/gpio/gpiolib.c      | 4 ++++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f68e33cbd7d4cd5153e82ad77768cf52a90601d6..1dc170364c46a51092d21391c5a602bf9dee820c 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2768,7 +2768,6 @@ int gpiolib_cdev_register(struct gpio_chip *gc, dev_t devt)
 
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

